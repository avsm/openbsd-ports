# ex:ts=8 sw=4:
# $OpenBSD: Engine.pm,v 1.10 2010/10/28 08:54:22 espie Exp $
#
# Copyright (c) 2010 Marc Espie <espie@openbsd.org>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

use strict;
use warnings;

package DPB::Engine;

use DPB::Heuristics;
use DPB::Util;

sub new
{
	my ($class, $builder, $heuristics, $logger, $locker) = @_;
	my $o = bless {built => {}, tobuild => {},
	    buildable => $heuristics->new_queue,
	    later => {}, building => {},
	    installable => {}, builder => $builder,
	    all => {},
	    heuristics => $heuristics,
	    locker => $locker,
	    logger => $logger,
	    errors => [],
	    locks => [],
	    requeued => [],
	    ignored => []}, $class;
	$o->{log} = DPB::Util->make_hot($logger->open("engine"));
	$o->{stats} = DPB::Util->make_hot($logger->open("stats"));
	return $o;
}

sub has_errors
{
	my $self = shift;
	if (@{$self->{errors}} != 0 || @{$self->{locks}} != 0) {
		$self->{locker}->recheck_errors($self);
		return 1;
	}
	return 0;
}

sub log_no_ts
{
	my ($self, $kind, $v, $extra) = @_;
	$extra //= '';
	my $fh = $self->{log};
	print $fh "$$\@$self->{ts}: $kind: ", $v->fullpkgpath, "$extra\n";
}

sub log
{
	my $self = shift;
	$self->{ts} = time();
	$self->log_no_ts(@_);
}

sub count
{
	my ($self, $field) = @_;
	my $r = $self->{$field};
	if (ref($r) eq 'HASH') {
		return scalar keys %$r;
	} elsif (ref($r) eq 'ARRAY') {
		return scalar @$r;
	} else {
		return "?";
    	}
}

sub errors_string
{
	my ($self, $name) = @_;
	my @l = ();
	for my $e (@{$self->{$name}}) {
		my $s = $e->fullpkgpath;
		if (defined $e->{host} && !$e->{host}->is_localhost) {
			$s .= "(".$e->{host}->name.")";
		}
		push(@l, $s);
	}
	return join(' ', @l);
}

sub report
{
	my $self = shift;
	return join(" ",
	    "I=".$self->count("installable"),
	    "B=".$self->count("built"),
	    "Q=".$self->{buildable}->count,
	    "T=".$self->count("tobuild"),
	    "!=".$self->count("ignored"))."\n".
	    "L=".$self->errors_string('locks')."\n".
	    "E=".$self->errors_string('errors')."\n";
}

sub stats
{
	my $self = shift;
	my $fh = $self->{stats};
	$self->{statline} //= "";
	my $line = join(" ",
	    "I=".$self->count("installable"),
	    "B=".$self->count("built"),
	    "Q=".$self->{buildable}->count,
	    "T=".$self->count("tobuild"));
	if ($line ne $self->{statline}) {
		$self->{statline} = $line;
		print $fh $self->{ts}, " ", $line, "\n";
	}
}

sub important
{
	my $self = shift;
	$self->{lasterrors} //= 0;
	if (@{$self->{errors}} != $self->{lasterrors}) {
		$self->{lasterrors} = @{$self->{errors}};
		return "Error in ".join(' ', map {$_->fullpkgpath} @{$self->{errors}})."\n";
	}
}

sub adjust
{
	my ($self, $v, $kind) = @_;
	return 0 if !exists $v->{info}{$kind};
	my $not_yet = 0;
	for my $d (values %{$v->{info}{$kind}}) {
		$self->{heuristics}->mark_depend($d, $v);
		if ($self->{installable}{$d} ||
		    (defined $d->{info} &&
		    $d->fullpkgname eq $v->fullpkgname)) {
			delete $v->{info}{$kind}{$d};
		} else {
			$not_yet++;
		}
	}
	return $not_yet if $not_yet;
	delete $v->{info}{$kind};
	return 0;
}

sub adjust_extra
{
	my ($self, $v, $kind) = @_;
	return 0 if !exists $v->{info}{$kind};
	my $not_yet = 0;
	for my $d (values %{$v->{info}{$kind}}) {
		$self->{heuristics}->mark_depend($d, $v);
		if ((defined $d->{info} && !$self->{tobuild}{$d}) ||
		    (defined $d->fullpkgname &&
		    $d->fullpkgname eq $v->fullpkgname)) {
			delete $v->{info}{$kind}{$d};
		} else {
			$not_yet++;
		}
	}
	return $not_yet if $not_yet;
	delete $v->{info}{$kind};
	return 0;
}

sub check_buildable
{
	my $self = shift;
	$self->{ts} = time();
	my $changes;
	do {
		$changes = 0;
		for my $v (values %{$self->{tobuild}}) {
			if ($self->was_built($v)) {
				$changes++;
			} elsif (defined $v->{info}{IGNORE}) {
				delete $self->{tobuild}{$v};
				push(@{$self->{ignored}}, $v);
				$changes++;
			}
		}
		for my $v (values %{$self->{built}}) {
			if ($self->adjust($v, 'RDEPENDS') == 0) {
				delete $self->{built}{$v};
				$self->{installable}{$v} = $v;
				$self->log_no_ts('I', $v);
				$changes++;
			}
		}

		for my $v (values %{$self->{tobuild}}) {
			if ($self->was_built($v)) {
				$changes++;
				next;
			}
			my $has = $self->adjust($v, 'DEPENDS');
			$has += $self->adjust_extra($v, 'EXTRA');
			if ($has == 0) {
				$self->{buildable}->add($v);
				$self->log_no_ts('Q', $v);
				delete $self->{tobuild}{$v};
				$changes++;
			}
		}
	} while ($changes);
	$self->stats;
}

sub was_built
{
	my ($self, $v) = @_;
	if ($self->{builder}->check($v)) {
#		$self->{heuristics}->done($v);
		$self->{built}{$v}= $v;
		$self->log('B', $v);
		delete $self->{tobuild}{$v};
		return 1;
	} else {
		return 0;
	}
}
sub new_path
{
	my ($self, $v) = @_;
	$self->{all}{$v} = $v;
	if (!$self->was_built($v)) {
#		$self->{heuristics}->todo($v);
		$self->{tobuild}{$v} = $v;
		$self->log('T', $v);
	}
}

sub end_job
{
	my ($self, $core, $v) = @_;
	my $e = $core->mark_ready;
	if (!$self->was_built($v)) {
		$core->failure;
		if (!$e || $core->{status} == 65280) {
			$self->{buildable}->add($v);
			$self->{locker}->unlock($v);
			$self->log('N', $v);
		} else {
			unshift(@{$self->{errors}}, $v);
			$v->{host} = $core->host;
			$self->{locker}->simple_unlock($v);
			$self->log('E', $v);
		}
	} else {
		$self->{locker}->unlock($v);
		$self->{heuristics}->finish_special($v);
		$core->success;
	}
	$self->job_done($v);
}

sub requeue
{
	my ($self, $v) = @_;
	$self->{buildable}->add($v);
	$self->{heuristics}->finish_special($v);
}

sub rescan
{
	my ($self, $v) = @_;
	push(@{$self->{requeued}}, $v);
}

sub add_fatal
{
	my ($self, $v) = @_;
	push(@{$self->{errors}}, $v);
	$self->{locker}->lock($v);
}

sub job_done
{
	my ($self, $v) = @_;
	for my $candidate (values %{$self->{later}}) {
		if ($candidate->{pkgpath} eq $v->{pkgpath}) {
			delete $self->{later}{$candidate};
			$self->log('V', $candidate);
			$self->{buildable}->add($candidate);
		}
	}
	delete $self->{building}{$v->{pkgpath}};
	$self->{locker}->recheck_errors($self);
}

sub new_job
{
	my ($self, $core, $v, $lock) = @_;
	my $special = $self->{heuristics}->special_parameters($core->host, $v);
	$self->log('J', $v, " ".$core->hostname." ".$special);
	$self->{builder}->build($v, $core, $special,
	    $lock, sub {$self->end_job($core, $v)});
}

sub rebuild_info
{
	my ($self, $core) = @_;
	my @l = @{$self->{requeued}};
	$self->{requeued} = [];
	for my $v (@l) {
		delete $v->{info};
	}
	my @subdirs = map {$_->fullpkgpath} @l;
	$self->{grabber}->grab_subdirs($core, \@subdirs);
	$core->mark_ready;
}

sub start_new_job
{
	my $self = shift;
	my $core = $self->{builder}->get;
	if (@{$self->{requeued}} > 0) {
		$self->rebuild_info($core);
		return;
	}
	my $o = $self->{buildable}->sorted($core);
	while (my $v = $o->next) {
		$self->{buildable}->remove($v);
		if ($self->was_built($v)) {
			$self->{logger}->make_log_link($v);
			$self->job_done($v);
			next;
		}
		if ($self->{building}{$v->{pkgpath}}) {
			$self->{later}{$v} = $v;
			$self->log('^', $v);
		} elsif (my $lock = $self->{locker}->lock($v)) {
			$self->{building}{$v->{pkgpath}} = 1;
			$self->new_job($core, $v, $lock);
			return;
		} else {
			push(@{$self->{locks}}, $v);
			$self->log('L', $v);
		}
	}
	$core->mark_ready;
}

sub can_build
{
	my $self = shift;

	return $self->{buildable}->non_empty || @{$self->{requeued}} > 0;
}

sub dump_category
{
	my ($self, $k, $fh) = @_;
	$fh //= \*STDOUT;

	$k =~ m/^./;
	my $q = "\u$&: ";
	for my $v (sort {$a->fullpkgpath cmp $b->fullpkgpath}
	    values %{$self->{$k}}) {
		print $fh $q;
		$v->quick_dump($fh);
	}
}

sub dump
{
	my ($self, $fh) = @_;
	$fh //= \*STDOUT;
	for my $k (qw(built tobuild installable)) {
		$self->dump_category($k, $fh);
	}
	print $fh "\n";
}

1;

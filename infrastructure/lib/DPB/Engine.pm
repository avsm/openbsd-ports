# ex:ts=8 sw=4:
# $OpenBSD: Engine.pm,v 1.18 2011/05/27 10:27:50 espie Exp $
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

package DPB::SubEngine;
sub new
{
	my ($class, $engine) = @_;
	bless { engine => $engine, queue => $class->new_queue($engine),
		doing => {}}, $class;
}

sub count
{
	my $self = shift;
	return $self->{queue}->count;
}

sub add
{
	my ($self, $v) = @_;
	$self->{queue}->add($v);
}

sub remove
{
	my ($self, $v) = @_;
	$self->{queue}->remove($v);
}

sub sorted
{
	my ($self, $core) = @_;
	return $self->{queue}->sorted($core);
}

sub non_empty
{
	my $self = shift;
	return $self->{queue}->non_empty;
}

sub contains
{
	my ($self, $v) = @_;
	return $self->{queue}->contains($v);
}

sub log
{
	my ($self, @r) = @_;
	return $self->{engine}->log(@r);
}

package DPB::SubEngine::Build;
our @ISA = qw(DPB::SubEngine);
sub new
{
	my ($class, $engine, $builder) = @_;
	my $o = $class->SUPER::new($engine);
	$o->{builder} = $builder;
	$o->{later} = {};
	return $o;
}

sub new_queue
{
	my ($class, $engine) = @_;
	return $engine->{heuristics}->new_queue;
}

sub is_done
{
	my ($self, $v) = @_;
	if ($self->{builder}->check($v)) {
#		$self->{heuristics}->done($v);
		$self->{engine}{built}{$v}= $v;
		$self->log('B', $v);
		delete $self->{engine}{tobuild}{$v};
		return 1;
	} else {
		return 0;
	}
}

sub start
{
	my $self = shift;
	my $core = $self->{builder}->get;
	if (@{$self->{engine}{requeued}} > 0) {
		$self->{engine}->rebuild_info($core);
		return;
	}
	my $o = $self->sorted($core);
	while (my $v = $o->next) {
		$self->remove($v);
		if ($self->is_done($v)) {
			$self->{engine}{logger}->make_log_link($v);
			$self->done($v);
			next;
		}
		if ($self->{doing}{$v->{pkgpath}}) {
			$self->{later}{$v} = $v;
			$self->log('^', $v);
		} elsif (my $lock = $self->{engine}{locker}->lock($v)) {
			$self->{doing}{$v->{pkgpath}} = 1;
			my $special = $self->{engine}{heuristics}->
			    special_parameters($core->host, $v);
			$self->log('J', $v, " ".$core->hostname." ".$special);
			$self->{builder}->build($v, $core, $special,
			    $lock, sub {$self->end($core, $v)});
			return;
		} else {
			push(@{$self->{engine}{locks}}, $v);
			$self->log('L', $v);
		}
	}
	$core->mark_ready;
}

sub end
{
	my ($self, $core, $v) = @_;
	my $e = $core->mark_ready;
	if (!$self->is_done($v)) {
		$core->failure;
		if (!$e || $core->{status} == 65280) {
			$self->add($v);
			$self->{engine}{locker}->unlock($v);
			$self->log('N', $v);
		} else {
			unshift(@{$self->{errors}}, $v);
			$v->{host} = $core->host;
			$self->{engine}{locker}->simple_unlock($v);
			$self->log('E', $v);
		}
	} else {
		$self->{engine}{locker}->unlock($v);
		$self->{engine}{heuristics}->finish_special($v);
		$core->success;
	}
	$self->done($v);
}

sub done
{
	my ($self, $v) = @_;
	for my $candidate (values %{$self->{later}}) {
		if ($candidate->{pkgpath} eq $v->{pkgpath}) {
			delete $self->{later}{$candidate};
			$self->log('V', $candidate);
			$self->add($candidate);
		}
	}
	delete $self->{doing}{$v->{pkgpath}};
	$self->{engine}{locker}->recheck_errors($self);
}

package DPB::SubEngine::Fetch;
our @ISA = qw(DPB::SubEngine);
sub new_queue
{
	my ($class, $engine) = @_;
	return DPB::Heuristics::FetchQueue->new($engine->{heuristics});
}

sub is_done
{
	my ($self, $v) = @_;
	if ($v->check($self->{engine}{logger})) {
		$self->log('b', $v);
		return 1;
	} else {
		return 0;
    	}
}

sub start
{
	my $self = shift;
	my $core = DPB::Core::Fetcher->get;
	my $o = $self->sorted($core);
	while (my $v = $o->next) {
		$self->remove($v);
		if (my $lock = $self->{engine}{locker}->lock($v)) {
			$self->{doing}{$v} = $v;
			$self->log('j', $v);
			DPB::Fetch->fetch($self->{engine}{logger}, $v, $core, 
			    sub { $self->end($core, $v)});
			return;
	    	} else {
			push(@{$self->{engine}{locks}}, $v);
			$self->log('l', $v);
		}
	}
	$core->mark_ready;
}

sub end
{
	my ($self, $core, $v) = @_;
	my $e = $core->mark_ready;
	if ($self->is_done($v)) {
		$self->{engine}{locker}->unlock($v);
		delete $self->{doing}{$v};
		$core->success;
	} else {
		unshift(@{$self->{engine}{errors}}, $v);
		$v->{host} = $core->host;
		$self->log('e', $v);
		$core->failure;
	}
}

package DPB::Engine;

use DPB::Heuristics;
use DPB::Util;

sub new
{
	my ($class, $state) = @_;
	my $o = bless {built => {}, 
	    tobuild => {},
	    state => $state,
	    installable => {}, 
	    heuristics => $state->heuristics,
	    locker => $state->locker,
	    logger => $state->logger,
	    errors => [],
	    locks => [],
	    requeued => [],
	    ignored => []}, $class;
	$o->{buildable} = DPB::SubEngine::Build->new($o, $state->builder);
	if ($state->opt('f')) {
		$o->{tofetch} = DPB::SubEngine::Fetch->new($o);
	}
	$o->{log} = DPB::Util->make_hot($state->logger->open("engine"));
	$o->{stats} = DPB::Util->make_hot($state->logger->open("stats"));
	return $o;
}

sub recheck_errors
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
	print $fh "$$\@$self->{ts}: $kind: ", $v->logname, "$extra\n";
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
		my $s = $e->logname;
		if (defined $e->{host} && !$e->{host}->is_localhost) {
			$s .= "(".$e->{host}->name.")";
		}
		push(@l, $s);
	}
	return join(' ', @l);
}

sub fetchcount
{
	my ($self, $q, $t)= @_;
	return () unless defined $self->{tofetch};
	if ($q < 30) {
		$self->{tofetch}{queue}->set_h1;
	} else {
		if ($t > $q) {
			$self->{tofetch}{queue}->set_h2;
		} else {
			$self->{tofetch}{queue}->set_h3;
		}
	}
	return ("F=".$self->{tofetch}->count);
}

sub statline
{
	my $self = shift;
	my $q = $self->{buildable}->count;
	my $t = $self->count("tobuild");
	return join(" ",
	    "I=".$self->count("installable"),
	    "B=".$self->count("built"),
	    "Q=$q",
	    "T=$t",
	    $self->fetchcount($q, $t));
}

sub report
{
	my $self = shift;
	my $q = $self->{buildable}->count;
	my $t = $self->count("tobuild");
	return join(" ",
	    $self->statline,
	    "!=".$self->count("ignored"))."\n".
	    "L=".$self->errors_string('locks')."\n".
	    "E=".$self->errors_string('errors')."\n";
}

sub stats
{
	my $self = shift;
	my $fh = $self->{stats};
	$self->{statline} //= "";
	my $line = $self->statline;
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

sub adjust_distfiles
{
	my ($self, $v) = @_;
	my $has = 0;
	return $has unless defined $v->{info}{distfiles};
	for my $f (values %{$v->{info}{distfiles}}) {
		if ($self->{tofetch}->contains($f) || 
		    $self->{tofetch}{doing}{$f}) {
			$has++;
			next;
		}
		if ($self->{tofetch}->is_done($f)) {
			delete $v->{info}{distfiles}{$f};
			next;
		}
		$has++;
		$self->{tofetch}->add($f);
		$self->log('F', $f);
	}
	return $has;
}

my $output = {};

sub log_fetch
{
	my ($self, $v) = @_;
	my $k = $v->{info}{FETCH_MANUALLY}->string;
	my $fh = $self->{logger}->open('fetch/manually');
	print $fh $v->fullpkgpath, "\n", "-" x length($v->fullpkgpath), "\n";
	if (defined $output->{$k}) {
		print $fh "same as ", $output->{$k}->fullpkgpath, "\n\n";
	} else {
		print $fh "$k\n\n";
		$output->{$k} = $v;
	}
}

sub check_buildable
{
	my $self = shift;
	$self->{ts} = time();
	my $changes;
	do {
		$changes = 0;
		for my $v (values %{$self->{tobuild}}) {
			if ($self->{buildable}->is_done($v)) {
				$changes++;
			} else {
				if (defined $v->{info}{FETCH_MANUALLY}) {
					$self->log_fetch($v);
					delete $v->{info}{FETCH_MANUALLY};
					$changes++;
				}
				if (defined $v->{info}{IGNORE}) {
					delete $self->{tobuild}{$v};
					push(@{$self->{ignored}}, $v);
					$changes++;
				}
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
			if ($self->{buildable}->is_done($v)) {
				$changes++;
				next;
			}
			my $has = $self->adjust($v, 'DEPENDS');
			$has += $self->adjust_extra($v, 'EXTRA');

			my $has2 = $self->adjust_distfiles($v);
			# buying buildable directly is a priority,
			# but put the patch/dist/small stuff down the line
			# as otherwise we will tend to grab patch files first
			$v->{has} = 2 * ($has != 0) + ($has2 != 0);
			$has += $self->adjust_distfiles($v);
			if ($has + $has2 == 0) {
				$self->{buildable}->add($v);
				$self->log_no_ts('Q', $v);
				delete $self->{tobuild}{$v};
				$changes++;
			}
		}
	} while ($changes);
	$self->stats;
}

sub new_path
{
	my ($self, $v) = @_;
	if (!$self->{buildable}->is_done($v)) {
#		$self->{heuristics}->todo($v);
		$self->{tobuild}{$v} = $v;
		$self->log('T', $v);
	}
}

sub requeue
{
	my ($self, $v) = @_;
	$self->{buildable}->add($v);
	$self->{heuristics}->finish_special($v);
}

sub requeue_dist
{
	my ($self, $v) = @_;
	$self->{tofetch}->add($v);
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

sub rebuild_info
{
	my ($self, $core) = @_;
	my @l = @{$self->{requeued}};
	$self->{requeued} = [];
	my @subdirs = map {$_->fullpkgpath} @l;
	$self->{state}->grabber->grab_subdirs($core, \@subdirs);
	$core->mark_ready;
}

sub start_new_job
{
	my $self = shift;
	$self->{buildable}->start;
}

sub start_new_fetch
{
	my $self = shift;
	$self->{tofetch}->start;
}

sub can_build
{
	my $self = shift;

	return $self->{buildable}->non_empty || @{$self->{requeued}} > 0;
}

sub can_fetch
{
	my $self = shift;
	return $self->{tofetch}->non_empty;
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

sub dump_dependencies
{
	my $self = shift;

	my $cache = {};
	for my $v (DPB::PkgPath->seen) {
		next unless exists $v->{info};
		for my $k (qw(DEPENDS RDEPENDS EXTRA)) {
			next unless exists $v->{info}{$k};
			for my $d (values %{$v->{info}{$k}}) {
				$cache->{$d->fullpkgpath}++;
			}
		}
	}
	my $log = $self->{logger}->create("dependencies");
	for my $k (sort {$cache->{$b} <=> $cache->{$a}} keys %$cache) {
		print $log "$k $cache->{$k}\n";
	}
}

sub find_best
{
	my ($self, $file, $limit) = @_;

	my $list = [];
	if (open my $fh, '<', $file) {
		my $i = 0;
		while (<$fh>) {
			if (m/^(\S+)\s\d+$/) {
				push(@$list, $1);
				$i++;
			}
			last if $i > $limit;
		}
	}
	return $list;
}

1;

# ex:ts=8 sw=4:
# $OpenBSD: Signature.pm,v 1.2 2011/06/04 12:58:24 espie Exp $
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

use OpenBSD::LibSpec;
package DPB::Signature::Dir;
sub best
{
	my ($h, $lib) = @_;
	my $old = $h->{$lib->stem} //= $lib;
	return if $old eq $lib;
	return if $old->major > $lib->major;
	return if $old->major == $lib->major && $old->minor > $lib->minor;
	$h->{$lib->stem} = $lib;
}

sub new
{
	my $class = shift;
	bless {}, $class;
}

sub compare1
{
	my ($s1, $s2, $h1, $h2) = @_;
	my $r = '';
	while (my ($stem, $lib) = each %$s1) {
		next if $stem eq 'la';
		if (!defined $s2->{$stem}) {
			$r .= "Can't find ".$lib->to_string." on $h2\n";
		} elsif ($s2->{$stem}->to_string ne $lib->to_string) {
			$r .= "versions don't match: ".
			    $s2->{$stem}->to_string." on $h2 vs ".
			    $lib->to_string.  " on $h1\n";
		}
	}
	for my $k (keys %{$s1->{la}}) {
		if (!defined $s2->{la}{$k}) {
			$r .= "$h2 does not have $k.la (from $h1)\n";
		}
	}
	return $r;
}

sub print_out
{
	my ($self, $dir, $fh) = @_;
	for my $k (sort keys %$self) {
		next if $k eq 'la';
		next if !defined $self->{$k};
		print $fh "\t", $self->{$k}->to_string, "\n";
	}
	if (defined $self->{la}) {
		for my $v (sort keys %{$self->{la}}) {
			print $fh "\t$dir/$v.la\n";
		}
	}
}

sub compare
{
	my ($s1, $s2, $h1, $h2) = @_;
	return compare1($s1, $s2, $h1, $h2) . compare1($s2, $s1, $h2, $h1);
}

package DPB::Signature::Task;
our @ISA = qw(DPB::Task::Pipe);
sub new
{
	my ($class, $o, $base) = @_;

	my $repo = $o->{$base} = DPB::Signature::Dir->new;
	bless {repo => $repo, dir => "$base/lib"}, $class;
}

sub run
{
	my ($self, $core) = @_;
	if (defined $core->{shell}) {
		$core->{shell}->run("ls $self->{dir}");
	} else {
		exec {"/bin/ls"} ("ls", $self->{dir});
	}
}

sub process
{
	my ($self, $core) = @_;
	my $fh = $core->fh;
	my $repo = $self->{repo};
	while (<$fh>) {
		if ($_ =~ m/(.*).la/) {
			$repo->{la}->{$1} = 1;
		} else {
			my $lib = OpenBSD::Library->from_string("$self->{dir}/$_");
			next unless $lib->is_valid;
			$repo->best($lib);
		}
	}
}

package DPB::Signature;
sub new
{
	my $class = shift;
	bless {}, $class;
}

sub add_tasks
{
	my ($class, $job) = @_;
	$job->{signature} = $class->new;
	for my $base (OpenBSD::Paths->library_dirs) {
		$job->add_tasks(
		    DPB::Signature::Task->new($job->{signature}, $base));
	}
}

sub compare
{
	my ($s1, $s2) = @_;
	my $r = '';
	for my $dir (OpenBSD::Paths->library_dirs) {
		$r .= $s1->{$dir}->compare($s2->{$dir},
		    $s1->{host}, $s2->{host});
	}
	if ($r) {
		DPB::Reporter->myprint("Error between $s1->{host} and $s2->{host}: $r");
	}
	return $r;
}

my $ref;
sub matches
{
	my ($self, $core, $logger) = @_;
	$self->{host} = $core->hostname;
	if (!defined $ref) {
		$ref = $self;
		return 1;
	} else {
		my $r = $self->compare($ref);
		if ($r ne '') {
			my $log = $logger->open('signature');
			print $log "$r\n";
			return 0;
			close $log;
		} else {
			return 1;
		}
	}
}

sub print_out
{
	my ($self, $core, $logger) = @_;
	my $log = $logger->create($core->hostname.".sig");
	for my $dir (OpenBSD::Paths->library_dirs) {
		print $log "$dir: \n";
		$self->{$dir}->print_out("$dir/lib", $log);
	}
}

1;

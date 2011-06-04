# ex:ts=8 sw=4:
# $OpenBSD: Heuristics.pm,v 1.8 2011/06/04 12:58:24 espie Exp $
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

# this package is responsible for the initial weighing of pkgpaths, and handling
# consequences
package DPB::Heuristics;

# for now, we don't create a separate object, we assume everything here is
# "global"

my (%weight, %bad_weight, %wrkdir, %needed_by);

sub new
{
	my ($class, $state) = @_;
	bless {state => $state}, $class;
}

sub random
{
	my $self = shift;
	bless $self, "DPB::Heuristics::random";
}

sub set_logger
{
	my ($self, $logger) = @_;
	$self->{logger} = $logger;
}

# we set the "unknown" weight as median if we parsed a file.
my $default = 1;
my $has_build_info;

sub finished_parsing
{
	my $self = shift;
	if (defined $has_build_info && $has_build_info == 1) {
		while (my ($k, $v) = each %bad_weight) {
			$self->set_weight($k, $v);
		}
	}
	my @l = sort values %weight;
	$default = $l[@l/2];
}

sub intrinsic_weight
{
	my ($self, $v) = @_;
	$weight{$v} //= $default;
}

my $threshold;
sub set_threshold
{
	my ($self, $t) = @_;
	$threshold = $t;
}

sub add_size_info
{
	my ($self, $path, $sz) = @_;
	$wrkdir{$path->pkgpath_and_flavors} = $sz;
}

my $used_memory = {};
my $used_per_host = {};

sub special_parameters
{
	my ($self, $host, $v) = @_;
	my $t = $host->{prop}->{memory} // $threshold;
	my $p = $v->pkgpath_and_flavors;
	# we build in memory if we know this port and it's light enough
	if (defined $t && defined $wrkdir{$p}) {
		my $hostname = $host->name;
		$used_per_host->{$hostname} //= 0;
		if ($used_per_host->{$hostname} + $wrkdir{$p} <= $t) {
			$used_per_host->{$hostname} += $wrkdir{$p};
			$used_memory->{$p} = $hostname;
			return 1;
		}
	}
	return 0;
}

sub finish_special
{
	my ($self, $v) = @_;
	my $p = $v->pkgpath_and_flavors;
	if (defined $used_memory->{$p}) {
		my $hostname = $used_memory->{$p};
		$used_per_host->{$hostname} -= $wrkdir{$p};
	}
}

sub set_weight
{
	my ($self, $v, $w) = @_;
	$weight{$v} //= $w + 0;
}

my $cache;

sub mark_depend
{
	my ($self, $d, $v) = @_;
	if (!defined $needed_by{$d}{$v}) {
		$needed_by{$d}{$v} = $v;
		$cache = {};
	}
}

sub compute_measure
{
	my ($self, $v) = @_;
	my $dependencies = {$v => $v};
	my @todo = values %{$needed_by{$v}};
	while (my $k = pop (@todo)) {
		next if $dependencies->{$k};
		$dependencies->{$k} = $k;
		push(@todo, values %{$needed_by{$k}});
	}

	my $sum = 0;
	for my $k (values %$dependencies) {
		$sum += $self->intrinsic_weight($k);
	}
	return $sum;
}

sub measure
{
	my ($self, $v) = @_;
	$cache->{$v} //= $self->compute_measure($v);
}

sub compare
{
	my ($self, $a, $b) = @_;
	my $r = $self->measure($a) <=> $self->measure($b);
	return $r if $r != 0;
	# XXX if we don't know, we prefer paths "later in the game"
	# so if you abort dpb and restart it, it will start doing
	# things earlier.
	return $a->fullpkgpath cmp $b->fullpkgpath;
}

my $sf_per_host = {};
my $max_sf;

sub calibrate
{
	my ($self, $core) = @_;
	$sf_per_host->{$core->fullhostname} = $core->sf;
	$max_sf //= $core->sf;
	if ($core->sf > $max_sf) {
		$max_sf = $core->sf;
	}
}

sub add_build_info
{
	my ($self, $pkgpath, $host, $time, $sz) = @_;
	if (defined $sf_per_host->{$host}) {
		$time *= $sf_per_host->{$host};
		$time /= $max_sf;
		$self->set_weight($pkgpath, $time);
		$has_build_info = 2;
	} else {
		$bad_weight{$pkgpath} //= $time;
		$has_build_info //= 1;
	}
}

sub compare_weights
{
	my ($self, $a, $b) = @_;
	return $self->intrinsic_weight($a) <=> $self->intrinsic_weight($b);
}

sub new_queue
{
	my $self = shift;
	if (defined $has_build_info && $has_build_info && DPB::Core->has_sf) {
		return DPB::Heuristics::Queue::Part->new($self);
	} else {
		return DPB::Heuristics::Queue->new($self);
	}
}

# this specific stuff keeps track of the time we need to do stuff
my $todo = {};
my $total = 0;

sub todo
{
	my ($self, $path) = @_;
	my $p = $path->pkgpath_and_flavors;
	if (!defined $todo->{$p}) {
		$todo->{$p} = 1;
		$total += $self->intrinsic_weight($p);
	}
}

sub done
{
	my ($self, $path) = @_;
	my $p = $path->pkgpath_and_flavors;
	if (defined $todo->{$p}) {
		delete $todo->{$p};
		$total -= $self->intrinsic_weight($p);
	}
}

sub report
{
	my $time = time;
	return DPB::Util->time2string($time)." [$$]\n";
	# okay, I need to sit down and do the actual computation, sigh.
	my $all = DPB::Core->all_sf;
	my $sum_sf = 0;
	for my $sf (@$all) {
		$sum_sf += $sf;
	}

	return scalar(keys %$todo)." ".$total*$max_sf." $sum_sf\n".DPB::Util->time2string($time)." -> ".
		DPB::Util->time2string($time+$total*$max_sf*$max_sf/$sum_sf)." [$$]\n";
}

package DPB::Heuristics::SimpleSorter;
sub new
{
	my ($class, $o) = @_;
	bless $o->sorted_values, $class;
}

sub next
{
	my $self = shift;
	return pop @$self;
}

package DPB::Heuristics::Sorter;
sub new
{
	my ($class, $list) = @_;
	my $o = bless {list => $list, l => []}, $class;
	$o->next_bin;
	return $o;
}

sub next_bin
{
	my $self = shift;
	if (my $bin = pop @{$self->{list}}) {
		$self->{l} = $bin->sorted_values;
	} else {
		return;
	}
}

sub next
{
	my $self = shift;
	if (my $r = pop @{$self->{l}}) {
		return $r;
	} else {
		if ($self->next_bin) {
			return $self->next;
		} else {
			return;
		}
	}
}

package DPB::Heuristics::Bin;
sub new
{
	my ($class, $h) = @_;
	bless {o => {}, weight => 0, h => $h}, $class;
}

sub add
{
	my ($self, $v) = @_;
	$self->{o}{$v} = $v;
}

sub contains
{
	my ($self, $v) = @_;
	return exists $self->{o}{$v};
}

sub remove
{
	my ($self, $v) = @_;
	delete $self->{o}{$v};
}

sub weight
{
	my $self = shift;
	return $self->{weight};
}

sub count
{
	my $self = shift;
	return scalar keys %{$self->{o}};
}

sub non_empty
{
	my $self = shift;
	return scalar %{$self->{o}};
}

sub sorted_values
{
	my $self = shift;
	return [sort {$self->{h}->compare($a, $b)} values %{$self->{o}}];
}

package DPB::Heuristics::Bin::Heavy;
our @ISA = qw(DPB::Heuristics::Bin);
sub add
{
	my ($self, $v) = @_;
	$self->SUPER::add($v);
	$self->{weight} += $weight{$v};
}

sub remove
{
	my ($self, $v) = @_;
	$self->{weight} -= $weight{$v};
	$self->SUPER::remove($v);
}

package DPB::Heuristics::Queue;
our @ISA = qw(DPB::Heuristics::Bin);

sub sorted
{
	my $self = shift;
	return DPB::Heuristics::SimpleSorter->new($self);
}

package DPB::Heuristics::Queue::Part;
our @ISA = qw(DPB::Heuristics::Queue);

# 20 bins, binary....
sub find_bin
{
	my $w = shift;
	return 10 if !defined $w;
	if ($w > 65536) {
		if ($w > 1048576) { 9 } else { 8 }
	} elsif ($w > 256) {
		if ($w > 4096) {
			if ($w > 16384) { 7 } else { 6 }
		} elsif ($w > 1024) { 5 } else { 4 }
	} elsif ($w > 16) {
		if ($w > 64) { 3 } else { 2 }
	} elsif ($w > 4) { 1 } else { 0 }
}

sub add
{
	my ($self, $v) = @_;
	$self->SUPER::add($v);
	$v->{weight} = $weight{$v};
	$self->{bins}[find_bin($v->{weight})]->add($v);
}

sub remove
{
	my ($self, $v) = @_;
	$self->SUPER::remove($v);
	$self->{bins}[find_bin($v->{weight})]->remove($v);
}

sub sorted
{
	my ($self, $core) = @_;
	my $all = DPB::Core->all_sf;
	if ($core->sf > $all->[-1] - 1) {
		return $self->SUPER::sorted($core);
	} else {
		return DPB::Heuristics::Sorter->new($self->bin_part($core->sf,
		    $all));
	}
}

# simpler partitioning
sub bin_part
{
	my ($self, $wanted, $all_sf) = @_;

	# note that all_sf is sorted

	# compute totals
	my $sum_sf = 0;
	for my $i (@$all_sf) {
		$sum_sf += $i;
	}
	my @bins = @{$self->{bins}};
	my $sum_weight = 0.0;
	for my $bin (@bins) {
		$sum_weight += $bin->weight;
	}

	# setup for the main loop
	my $partial_weight = 0.0;
	my $partial_sf = 0.0;
	my $result = [];

	# go through speed factors until we've gone thru the one we want
	while (my $sf = shift @$all_sf) {
		# passed it -> give result
		last if $sf > $wanted+1;

		# compute threshold for total weight
		$partial_sf += $sf;
		my $thr = $sum_weight * $partial_sf / $sum_sf;
		# grab weights until we reach the desired amount
		while (my $bin = shift @bins) {
			$partial_weight += $bin->weight;
			push(@$result, $bin);
			last if $partial_weight > $thr;
		}
	}
	return $result;
}

sub new
{
	my ($class, $h) = @_;
	my $o = $class->SUPER::new($h);
	my $bins = $o->{bins} = [];
	for my $i (0 .. 9) {
		push(@$bins, DPB::Heuristics::Bin::Heavy->new($h));
	}
	push(@$bins, DPB::Heuristics::Bin->new($h));
	return $o;
}

package DPB::Heuristics::random;
our @ISA = qw(DPB::Heuristics);
my %any;

sub compare
{
	my ($self, $a, $b) = @_;
	return ($any{$a} //= rand) <=> ($any{$b} //= rand);
}

sub new_queue
{
	my $self = shift;
	return DPB::Heuristics::Queue->new($self);
}

package DPB::Heuristics::FetchQueue;
our @ISA = qw(DPB::Heuristics::Queue);
sub new
{
	my ($class, $h) = @_;
	$class->SUPER::new($h)->set_h1;
}

sub set_h1
{
	bless shift, "DPB::Heuristics::FetchQueue1";
}

sub set_h2
{
	bless shift, "DPB::Heuristics::FetchQueue2";
}

sub sorted
{
	my $self = shift;
	if ($self->{results}++ > 50 ||
	    defined $self->{sorted} && @{$self->{sorted}} < 10) {
		$self->{results} = 0;
		undef $self->{sorted};
	}
	return $self->{sorted} //= DPB::Heuristics::SimpleSorter->new($self);
}

package DPB::Heuristics::FetchQueue1;
our @ISA = qw(DPB::Heuristics::FetchQueue);

# heuristic 1: grab the smallest distfiles that can build directly
# so that we avoid queue starvation
sub sorted_values
{
	my $self = shift;
	my @l = grep {$_->{path}{has} == 0} values %{$self->{o}};
	if (!@l) {
		@l = grep {$_->{path}{has} < 2} values %{$self->{o}};
		if (!@l) {
			@l = values %{$self->{o}};
		}
	}
	return [sort {$b->{sz} <=> $a->{sz}} @l];
}

package DPB::Heuristics::FetchQueue2;
our @ISA = qw(DPB::Heuristics::FetchQueue);

# heuristic 2: assume we're running good enough, grab distfiles that allow
# build to proceed as usual
# we don't care so much about multiple distfiles
sub sorted_values
{
	my $self = shift;
	my @l = grep {$_->{path}{has} < 2} values %{$self->{o}};
	if (!@l) {
		@l = values %{$self->{o}};
	}
	my $h = $self->{h};
	return [sort
	    {$h->measure($a->{path}) <=> $h->measure($b->{path})}
	    @l];
}

1;

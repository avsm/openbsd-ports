# ex:ts=8 sw=4:
# $OpenBSD: Clock.pm,v 1.2 2011/06/04 12:58:24 espie Exp $
#
# Copyright (c) 2011 Marc Espie <espie@openbsd.org>
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

# everything needed to handle clock

use Time::HiRes qw(time);

# explicit stop/restart clock where needed
package DPB::Clock;

# users will register/unregister, they must have a
# stopped_clock($gap) method to adjust.
my $items = {};
sub register
{
	my ($class, $o) = @_;
	$items->{$o} = $o;
}

sub unregister
{
	my ($class, $o) = @_;
	delete $items->{$o};
}

my $stopped_clock;

sub stop
{
	$stopped_clock = time();
}

sub restart
{
	my $gap = time() - $stopped_clock;

	for my $o (values %$items) {
		$o->stopped_clock($gap);
	}
}

# tasks with a timer
package DPB::Task::Clocked;
our @ISA = qw(DPB::Task::Fork);

sub fork
{
	my ($self, $core) = @_;

	$self->{started} = time();
	DPB::Clock->register($self);
	return $self->SUPER::fork($core);
}

sub finalize
{
	my ($self, $core) = @_;
	$self->{ended} = time();
	DPB::Clock->unregister($self);
	return $self->SUPER::finalize($core);
}

sub elapsed
{
	my $self = shift;
	return $self->{ended} - $self->{started};
}

sub stopped_clock
{
	my ($self, $gap) = @_;
	$self->{started} += $gap;
}

# how to know if we're stuck: we watch some file size.
# if there's some expected value, then we can display a %

package DPB::Watch;
sub new
{
	my ($class, $filename, $expected, $offset, $time) = @_;
	my $o = bless {
		name => $filename,
		expected => $expected,
		offset => $offset,
		time => $time,
	}, $class;
	DPB::Clock->register($o);
	return $o;
}

sub check_change
{
	my ($self, $current) = @_;
	$self->{time} //= $current;
	my $sz = (stat $self->{name})[7];
	if (defined $sz && defined $self->{offset}) {
		$sz -= $self->{offset};
	}
	if ((defined $sz &&
	    (!defined $self->{sz} || $self->{sz} != $sz)) ||
		(!defined $sz && defined $self->{sz})) {
		$self->{sz} = $sz;
		$self->{time} = $current;
	}
	return $current - $self->{time};
}

sub change_message
{
	my ($self, $diff) = @_;
	my $progress = '';
	if (defined $self->{sz}) {
		if (defined $self->{expected} &&
		    $self->{sz} < 4 * $self->{expected}) {
			$progress = ' '.
			    int($self->{sz}*100/$self->{expected}). '%';
		} else {
			$progress = ' '.$self->{sz};
	    	}
	}
	my $unchanged = " unchanged for ";
	if ($diff > 7200) {
		$unchanged .= int($diff/3600)." hours";
	} elsif ($diff > 300) {
		$unchanged .= int($diff/60)." minutes";
	} elsif ($diff > 10) {
		$unchanged .= int($diff)." seconds";
	} else {
		$unchanged = "";
	}
	return $progress.$unchanged;
}

sub reset_offset
{
	my $self = shift;
	my $sz = (stat $self->{name})[7];
	if (defined $sz) {
		$self->{offset} = $sz;
	}
}

sub stopped_clock
{
	my ($self, $gap) = @_;
	$self->{time} += $gap if defined $self->{time};
}

sub DESTROY
{
	DPB::Clock->unregister(shift);
}
1;

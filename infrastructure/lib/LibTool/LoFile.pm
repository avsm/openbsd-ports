# $OpenBSD: LoFile.pm,v 1.1 2010/12/05 16:37:50 espie Exp $

# Copyright (c) 2007-2010 Steven Mestdagh <steven@openbsd.org>
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
use feature qw(say switch state);

package LoFile;
use parent qw(LaLoFile);
use File::Basename;
use Util;

# write a libtool object file
sub write
{
	my ($self, $filename) = @_;
	my $picobj = $self->stringize('picobj');
	my $nonpicobj = $self->stringize('nonpicobj');

	my $name = basename $filename;

	open(my $lo, '>', $filename) or die "Cannot write $filename: $!\n";
	say "creating $filename" if $main::verbose || $main::D;
	print $lo <<EOF
# $name - a libtool object file
# Generated by libtool $main::version
#
pic_object='$picobj'
non_pic_object='$nonpicobj'
EOF
;
}

sub compile
{
	my ($self, $compiler, $odir, $args) = @_;

	mkdir "$odir/$ltdir" if (! -d "$odir/$ltdir");
	if (defined $self->{picobj}) {
		my @cmd = @$compiler;
		push @cmd, @$args if (@$args);
		push @cmd, @main::picflags, '-o';
		my $o = ($odir eq '.') ? '' : "$odir/";
		$o .= $self->{picobj};
		push @cmd, $o;
		Exec->command(@cmd);
	}
	if (defined $self->{nonpicobj}) {
		my @cmd = @$compiler;
		push @cmd, @$args if (@$args);
		push @cmd, '-o';
		my $o = ($odir eq '.') ? '' : "$odir/";
		$o .= $self->{nonpicobj};
		push @cmd, $o;
		Exec->command(@cmd);
	}
}

1;

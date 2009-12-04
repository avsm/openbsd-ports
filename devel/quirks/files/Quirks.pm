#! /usr/bin/perl

# ex:ts=8 sw=4:
# $OpenBSD: Quirks.pm,v 1.1.1.1 2009/12/04 16:50:48 espie Exp $
#
# Copyright (c) 2009 Marc Espie <espie@openbsd.org>
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
use OpenBSD::PackageName;

package OpenBSD::Quirks;

sub new
{
	my ($class, $version) = @_;
	if ($version == 0) {
		return OpenBSD::Quirks0->new;
	} else {
		return undef;
	}
}

package OpenBSD::Quirks0;
use Config;
sub new
{
	my $class = shift;

	bless {}, $class;
}


# ->tweak_list(\@l, $state):
#	allows Quirks to do anything to the list of packages to install,
#	if something is needed. Usually, it won't do anything
sub tweak_list
{
}

# packages to remove
# stem => existing file   hash table
#	if file exists, then it's now in base and we can remove it.

my $perllib = $Config{archlib};
my $base_exceptions = {
	'p5-version' => "/usr/libdata/perl5/version.pm"
};

# ->is_base_system($handle, $state):
#	checks whether an existing handle is now part of the base system
#	and thus no longer needed.

sub is_base_system
{
	my ($self, $handle, $state) = @_;
	my $stem = OpenBSD::PackageName::splitstem($handle->pkgname);
	$state->say("Checking $stem");
	my $test = $base_exceptions->{$stem};
	if (defined $test && -e $test) {
		$state->say("Can remove!");
		return 1;
	} else {
		return 0;
	}
}

# ->search_object($handle, $state):
#	returns a search object for a given handle, in case (for instance)
#	of a stem name change.

sub search_object
{
	return undef;
}
1;

# ex:ts=8 sw=4:
# $OpenBSD: Grabber.pm,v 1.6 2010/10/30 10:35:09 espie Exp $
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


use DPB::Vars;
use DPB::Util;

package DPB::Grabber;
sub new
{
	my ($class, $ports, $make, $logger, $engine, $dpb, $endcode) = @_;
	my $o = bless { ports => $ports, make => $make,
		loglist => DPB::Util->make_hot($logger->open("vars")),
		logger => $logger,
		engine => $engine,
		dpb => $dpb,
		keep_going => 1,
		endcode => $endcode
	    }, $class;
	$engine->{grabber} = $o;
	return $o;
}

sub finish
{
	my ($self, $h) = @_;
	for my $v (values %$h) {
		if ($v->{broken}) {
			delete $v->{info};
			delete $v->{broken};
			$self->{engine}->add_fatal($v);
		} else {
			$self->{engine}->new_path($v);
		}
	}
	$self->{keepgoing} = &{$self->{endcode}};
}

sub ports
{
	my $self = shift;
	return $self->{ports};
}

sub make
{
	my $self = shift;
	return $self->{make};
}

sub logger
{
	my $self = shift;
	return $self->{logger};
}

sub grab_subdirs
{
	my ($self, $core, $list) = @_;
	DPB::Vars->grab_list($core, $self, $list,
	    $self->{loglist}, $self->{dpb},
	    sub {
		$self->finish(shift);
	});
}

sub grab_signature
{
	my ($self, $core, $pkgpath) = @_;
	return DPB::Vars->grab_signature($core, $self, $pkgpath);
}

sub complete_subdirs
{
	my ($self, $core) = @_;
	# more passes if necessary
	while ($self->{keep_going}) {
		my @subdirlist = ();
		for my $v (DPB::PkgPath->seen) {
			next if defined $v->{info};
			if (defined $v->{tried}) {
				$self->{engine}->add_fatal($v);
			} else {
				$v->add_to_subdirlist(\@subdirlist);
				$v->{tried} = 1;
			}
		}
		last if @subdirlist == 0;

		$self->grab_subdirs($core, \@subdirlist);
	}
}

1;

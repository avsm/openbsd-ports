#! /usr/bin/perl

# ex:ts=8 sw=4:
# $OpenBSD: Quirks.pm,v 1.61 2011/10/16 16:05:50 ajacoutot Exp $
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
	if ($version == 1) {
		return OpenBSD::Quirks1->new;
	} else {
		return undef;
	}
}

package OpenBSD::Quirks1;
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

my $p5a = $Config{archlib};
my $p5 = "/usr/libdata/perl5";
my $base_exceptions = {
# very old
	'pkgconfig' => "/usr/bin/pkg-config",
	'expat' => "/usr/lib/libexpat.a",
	'cwm' => "/usr/X11R6/bin/cwm",
	'mergemaster' => "/usr/sbin/sysmerge", 
# 4.5 stuff
	'p5-version' => "$p5/version.pm",
	'p5-Archive-Tar' => "$p5/Archive/Tar.pm",
	'p5-Compress-Zlib' => "$p5a/Compress/Zlib.pm",
	'p5-Compress-Raw-Zlib' => "$p5a/Compress/Raw/Zlib.pm",
	'p5-IO-Compress-Base' => "$p5a/IO/Compress/Base.pm",
	'p5-IO-Compress-Zlib' => "$p5a/IO/Compress/Zlib.pm",
	'p5-IO-Zlib' => "$p5/IO/Zlib.pm",
	'p5-ExtUtils-CBuilder' => "$p5/ExtUtils/CBuilder.pm",
	'p5-ExtUtils-ParseXS' => "$p5/ExtUtils/ParseXS.pm",
	'p5-Locale-Maketext-Simple' => "$p5/Locale/Maketext/Simple.pm",
	'p5-Module-Build' =>  "$p5/Module/Build.pm",
	'p5-Module-CoreList' => "$p5/Module/CoreList.pm",
	'p5-Module-Load' => "$p5/Module/Load.pm",
	'p5-Module-Loaded' => "$p5/Module/Loaded.pm",
	'p5-Module-Pluggable' => "$p5/Module/Pluggable.pm",
	'p5-Time-Piece' => "$p5a/Time/Piece.pm",
	'p5-Digest-SHA' => "$p5a/Digest/SHA.pm",
	'p5-Pod-Escapes' => "$p5/Escapes.pm",
	'p5-Pod-Simple' => "$p5/Pod/Simple.pm",
	'xcompmgr' => "/usr/X11R6/bin/xcompmgr",
# 4.6 stuff
	'tmux' => "/usr/bin/tmux",
# 4.7 stuff
	'p5-Parse-CPAN-Meta' => "$p5/Parse/CPAN/Meta.pm",
	'p5-parent' => "$p5/parent.pm",
	'dejavu-fonts' => "/usr/X11R6/lib/X11/fonts/TTF/DejaVuSans.ttf",
# 4.9
	'video' => "/usr/X11R6/bin/video",
	'nsd' => "/usr/sbin/nsd",
};

my $stem_extensions = {
# 4.4
	'teTeX_base-fmt' => 'texlive_base',
	'teTeX_base' => 'texlive_base',
	'teTeX_texmf' => ['texlive_texmf-full', 'texlive_texmf-minimal'],
	'teTeX_texmf-doc' => 'texlive_docs',
	'control-center2' => 'gnome-control-center',
	'gnome2-user-docs' => 'gnome-user-docs',
# 4.6snap
	'thunar-vcs-plugin' => 'thunar-vcs',
	'fam' => 'libgamin',
	'gstreamer-bz2' => 'gstreamer-plugins-bad',
	'gstreamer-faac' => 'gstreamer-plugins-bad',
	'gstreamer-faad' => 'gstreamer-plugins-bad',
	'gstreamer-gsm' => 'gstreamer-plugins-bad',
	'gstreamer-ladspa' => 'gstreamer-plugins-bad',
	'gstreamer-meta' => 'gstreamer-plugins-bad',
	'gstreamer-musepack' => 'gstreamer-plugins-bad',
	'gstreamer-sdl' => 'gstreamer-plugins-bad',
	'gstreamer-sndfile' => 'gstreamer-plugins-bad',
	'gstreamer-swf' => 'gstreamer-plugins-bad',
	'gstreamer-tremor' => 'gstreamer-plugins-bad',
	'gstreamer-x264' => 'gstreamer-plugins-bad',
	'gstreamer-xvid' => 'gstreamer-plugins-bad',
	'gstreamer-ogg' => 'gstreamer-plugins-base',
	'gstreamer-theora' => 'gstreamer-plugins-base',
	'gstreamer-vorbis' => 'gstreamer-plugins-base',
	'gstreamer-pango' => 'gstreamer-plugins-base',
	'gstreamer-jpeg' => 'gstreamer-plugins-good',
	'gstreamer-png' => 'gstreamer-plugins-good',
	'gstreamer-cairo' => 'gstreamer-plugins-good',
	'gstreamer-confelements' => 'gstreamer-plugins-good',
	'gstreamer-flac' => 'gstreamer-plugins-good',
	'gstreamer-shout' => 'gstreamer-plugins-good',
	'gstreamer-speex' => 'gstreamer-plugins-good',
	'gstreamer-taglib' => 'gstreamer-plugins-good',
	'gstreamer-wavpack' => 'gstreamer-plugins-good',
	'gstreamer-a52' => 'gstreamer-plugins-ugly',
	'gstreamer-mad' => 'gstreamer-plugins-ugly',
	'gstreamer-mpeg2' => 'gstreamer-plugins-ugly',
	'gstreamer-dvdread' => 'gstreamer-plugins-ugly',
	'lzma' => 'xz',
	'wily' => 'wily_9libs',
# 4.7
	'openh323' => 'h323plus',
	'pwlib' => 'ptlib',
	'e2fs-uuid' => 'e2fsprogs',
	'puppet' => 'ruby-puppet',
	'xmame+xmess' => ['sdlmame', 'sdlmess'],
	'xmame' => 'sdlmame',
	'xmess' => 'sdlmess',
# 4.8
	'hs-x11-extras' => 'hs-X11',
	'pymsn' => 'papyon',
	'wordpress-mu' => 'wordpress',
# 4.9
	'sybperl' => 'p5-sybperl',
	'Audio-MPD' => 'p5-Audio-MPD',
	'p5-IDNA-Punycode' => 'p5-Net-IDN-Encode',
	'py-CouchDB' => 'py-couchdb',
	'py-pymilter' => 'py-milter',
	'tesseract-de' => 'tesseract-deu',
	'tesseract-es' => 'tesseract-spa',
	'tesseract-fr' => 'tesseract-fra',
	'tesseract-it' => 'tesseract-ita',
	'tesseract-nl' => 'tesseract-nld',
	'tesseract-pt' => 'tesseract-por',
	'transmission-gui' => 'transmission-gtk',
	'terminal' => 'xfce4-terminal',
	'nmap-parser' => 'ruby-nmap-parser',
	'tracker-search' => 'meta-tracker',
	'gpsd-motif' => 'gpsd-x11',
	'uuid' => 'ossp-uuid',
	'p5-UUID' => 'p5-ossp-uuid',
# 5.0
	'gqview' => 'geeqie',
	'openoffice' => 'libreoffice',
	'openoffice-kde' => 'libreoffice-kde',
	'openoffice-java' => 'libreoffice-java',
	'openoffice-i18n-bg' => 'libreoffice-i18n-bg',
	'openoffice-i18n-ca' => 'libreoffice-i18n-ca',
	'openoffice-i18n-de' => 'libreoffice-i18n-de',
	'openoffice-i18n-es' => 'libreoffice-i18n-es',
	'openoffice-i18n-fa' => 'libreoffice-i18n-fa',
	'openoffice-i18n-fi' => 'libreoffice-i18n-fi',
	'openoffice-i18n-fr' => 'libreoffice-i18n-fr',
	'openoffice-i18n-hu' => 'libreoffice-i18n-hu',
	'openoffice-i18n-it' => 'libreoffice-i18n-it',
	'openoffice-i18n-ja' => 'libreoffice-i18n-ja',
	'openoffice-i18n-ko' => 'libreoffice-i18n-ko',
	'openoffice-i18n-lt' => 'libreoffice-i18n-lt',
	'openoffice-i18n-lv' => 'libreoffice-i18n-lv',
	'openoffice-i18n-nl' => 'libreoffice-i18n-nl',
	'openoffice-i18n-pl' => 'libreoffice-i18n-pl',
	'openoffice-i18n-pt-br' => 'libreoffice-i18n-pt-br',
	'openoffice-i18n-ru' => 'libreoffice-i18n-ru',
	'openoffice-i18n-sl' => 'libreoffice-i18n-sl',
	'openoffice-i18n-sv' => 'libreoffice-i18n-sv',
	'libxfce4menu' => 'garcon',
	'tidy' => 'tidyp',
	'p5-Mojo' => 'p5-Mojolicious',
	'groff-mdoc' => 'groff',
	'hudson' => 'jenkins',
	'py-BeautifulSoup' => 'py-beautifulsoup',
	'hs-network-bytestring' => 'hs-network',
	'hs-xhtml' => 'ghc',
	'tomboy' => 'gnote',
	'dovecot-sieve' => 'dovecot-pigeonhole',
	'wormux' => 'warmux',
	'tightvnc-viewer' => 'ssvnc-viewer',
	'mozilla-firefox' => 'firefox',
	'mozilla-thunderbird' => 'thunderbird',
	'php5-core' => 'php',
	'php5-bz2' => 'php-bz2',
	'php5-curl' => 'php-curl',
	'php5-dba' => 'php-dba',
	'php5-dbase' => 'php-dbase',
	'php5-fastcgi' => 'php-fastcgi',
	'php5-gd' => 'php-gd',
	'php5-gmp' => 'php-gmp',
	'php5-imap' => 'php-imap',
	'php5-ldap' => 'php-ldap',
	'php5-mbstring' => 'php',
	'php5-mcrypt' => 'php-mcrypt',
	'php5-mhash' => 'php-mhash',
	'php5-mysql' => 'php-mysql',
	'php5-mysqli' => 'php-mysqli',
	'php5-ncurses' => 'php-ncurses',
	'php5-odbc' => 'php-odbc',
	'php5-pdo_mysql' => 'php-pdo_mysql',
	'php5-pdo_pgsql' => 'php-pdo_pgsql',
	'php5-pdo_sqlite' => 'php-pdo_sqlite',
	'php5-pgsql' => 'php-pgsql',
	'php5-pspell' => 'php-pspell',
	'php5-shmop' => 'php-shmop',
	'php5-soap' => 'php-soap',
	'php5-snmp' => 'php-snmp',
	'php5-sqlite' => 'php-sqlite',
	'php5-sybase_ct' => 'php-sybase_ct',
	'php5-pdo_dblib' => 'php-pdo_dblib',
	'php5-mssql' => 'php-mssql',
	'php5-tidy' => 'php-tidy',
	'php5-xmlrpc' => 'php-xmlrpc',
	'php5-xsl' => 'php-xsl',
	'evolution-plugin-rss' => 'evolution-rss',
	'sazanami-ttf' => 'ja-sazanami-ttf',
	'mplus-ttf' => 'ja-mplus-ttf',
	'kanjistrokeorders-ttf' => 'ja-kanjistrokeorders-ttf',
	'baekmuk-fonts' => 'ko-baekmuk-fonts',
	'baekmuk-ttf' => 'ko-baekmuk-ttf',
	'hanterm-fonts' => 'ko-hanterm-fonts',
	'pscyr' => 'ru-pscyr',
	'wqy-zenhei-ttf' => 'zh-wqy-zenhei-ttf',
	'wqy-bitmapfont' => 'zh-wqy-bitmapfont',
	'ptsans' => 'ru-ptsans',
	'py-zeya' => 'zeya',
# 5.1
	'php5-mapscript' => 'php-mapscript'
};

# ->is_base_system($handle, $state):
#	checks whether an existing handle is now part of the base system
#	and thus no longer needed.

sub is_base_system
{
	my ($self, $handle, $state) = @_;

	my $stem = OpenBSD::PackageName::splitstem($handle->pkgname);
	if ($stem =~ m/^texlive_/) {
		require OpenBSD::Quirks::texlive;
		OpenBSD::Quirks::texlive::unfuck($handle, $state);
	}

	my $test = $base_exceptions->{$stem};
	if (defined $test) {
		if (-e $test) {
			$state->say("Removing ", $handle->pkgname, 
			    " (part of base system now)");
			return 1;
		} else {
			$state->say("Not removing ", $handle->pkgname,
			 ", ", $test, " not found");
		}
	} else {
		return 0;
	}
}

# ->tweak_search(\@s, $handle, $state):
#	tweaks the normal search for a given handle, in case (for instance)
#	of a stem name change.

sub tweak_search
{
	my ($self, $l, $handle, $state) = @_;

	if (@$l != 1 || !$l->[0]->can("add_stem")) {
		return;
	}
	my $stem = OpenBSD::PackageName::splitstem($handle->pkgname);
	my $extra = $stem_extensions->{$stem};
	if (defined $extra) {
		if (ref $extra) {
			for my $e (@$extra) {
				$l->[0]->add_stem($e);
			}
		} else {
			$l->[0]->add_stem($extra);
		}
	}
}

1;

# $OpenBSD: Makefile,v 1.4 2011/08/26 09:03:13 jasper Exp $

COMMENT =	simple YouTube interface for downloading videos

MODULES =	cpan
DISTNAME =	WWW-YouTube-Download-0.32
CATEGORIES =	www

MAINTAINER =	Mikolaj Kucharski <mikolaj@kucharski.name>

# Perl
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =	Yes
PERMIT_DISTFILES_CDROM =Yes
PERMIT_DISTFILES_FTP =	Yes

CPAN_AUTHOR =		XAICRON
CONFIGURE_STYLE =	modinst

MODCPAN_EXAMPLES =	Yes
MODCPAN_EXAMPLES_DIST =	eg

RUN_DEPENDS =	www/p5-libwww \
		www/p5-URI \
		converters/p5-JSON \
		www/p5-HTML-Parser

.include <bsd.port.mk>

# $OpenBSD: Makefile,v 1.32 2011/09/16 11:13:41 espie Exp $

COMMENT=		Foomatic PPD print filters

DISTNAME=		foomatic-filters-4.0.9
CATEGORIES=		print
REVISION=		1

HOMEPAGE=		http://www.linuxfoundation.org/en/OpenPrinting/Database/Foomatic

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB+=		c m

MASTER_SITES=		http://www.linuxprinting.org/download/foomatic/ \
			http://www.openprinting.org/download/foomatic/ \
			http://www.linuxprinting.org/download/foomatic/oldstuff/ \
			http://www.openprinting.org/download/foomatic/oldstuff/

BUILD_DEPENDS=		${MODGNU_AUTOMAKE_DEPENDS}

RUN_DEPENDS=		print/ghostscript/gnu \
			print/a2ps \
			print/gstoraster

AUTOMAKE_VERSION=1.10
AUTOCONF_VERSION=2.61

INSTALL_TARGET=		install-main install-cups

CONFIGURE_STYLE=	autoconf
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${X11BASE}/lib -L${LOCALBASE}/lib" \
			CUPS="${LOCALBASE}/libexec/cups" \
			CUPS_FILTERS="${LOCALBASE}/libexec/cups/filter" \
			CUPS_BACKENDS=${LOCALBASE}/libexec/cups/backend \
			PRINTCAP="/etc/printcap" \
			TEXTTOPS="${LOCALBASE}/libexec/cups/filter/texttops" \
			PPR="${LOCALBASE}/lib/ppr" \
			PPR_INTERFACES="${LOCALBASE}/lib/ppr/interfaces" \
			PPR_LIB="${LOCALBASE}/lib/ppr/lib" \
			A2PS="${LOCALBASE}/bin/a2ps" \
			ENSCRIPT="${LOCALBASE}/bin/enscript" \
			MPAGE="${LOCALBASE}/bin/mpage"

CONFIGURE_ARGS=		--enable-file-converter-check=no \
			--enable-dbus=no # only useful for colord which we don't have yet

MAKE_ENV=		${CONFIGURE_ENV}

FAKE_FLAGS=		ETCDIR="${PREFIX}/share/examples/foomatic"
USE_GROFF =		Yes

pre-configure:
	${SUBST_CMD} ${WRKSRC}/configure.ac \
		${WRKSRC}/foomaticrip.c ${WRKSRC}/filter.conf

.include <bsd.port.mk>

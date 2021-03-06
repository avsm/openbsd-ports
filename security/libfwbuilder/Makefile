# $OpenBSD: Makefile,v 1.20 2011/09/16 11:41:39 espie Exp $

COMMENT=	libraries for fwbuilder
DISTNAME=	libfwbuilder-4.1.3
REVISION=		0
CATEGORIES=	net security
SHARED_LIBS=	fwbuilder	16.0 \
		fwcompiler	16.0

HOMEPAGE=	http://www.fwbuilder.org/

MAINTAINER=	Vadim Zhukov <persgray@gmail.com>

# GPLv2+
PERMIT_PACKAGE_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes

WANTLIB=	crypto m netsnmp stdc++ xml2 xslt z

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=fwbuilder/}

MODULES=	x11/qt4 converters/libiconv
LIB_DEPENDS+=	textproc/libxslt \
		textproc/libxml \
		net/net-snmp

AUTOMAKE_VERSION =	1.10
AUTOCONF_VERSION =	2.63

USE_GMAKE =		Yes

CONFIGURE_STYLE =	gnu

BUILD_DEPENDS +=${MODGNU_AUTOCONF_DEPENDS} \
		${MODGNU_AUTOMAKE_DEPENDS}
# wants libtoolize but does not use libtool
BUILD_DEPENDS +=devel/libtool

CONFIGURE_ARGS +=	--with-docdir=${TRUEPREFIX}/share/doc/libfwbuilder \
			--with-templatedir=${TRUEPREFIX}/share/libfwbuilder \
			--with-qtdir=${MODQT_QTDIR} \
			--with-qmake=qmake4 \
			--without-distcc
MAKE_ENV +=		QMAKE=${MODQT_QTDIR}/bin/qmake \
			CXXFLAGS="${CXXFLAGS}" \
			CCACHE=/nonexistent

REGRESS_TARGET=	tests

MAKE_FLAGS=	LIBfwbuilder_VERSION=${LIBfwbuilder_VERSION} \
		LIBfwcompiler_VERSION=${LIBfwcompiler_VERSION}
DESTDIRNAME=	INSTALL_ROOT
 
post-patch:
	cd ${WRKSRC}; \
	    AUTOCONF_VERSION=${AUTOCONF_VERSION} \
	    AUTOMAKE_VERSION=${AUTOMAKE_VERSION} \
	    sh autogen.sh

.include <bsd.port.mk>

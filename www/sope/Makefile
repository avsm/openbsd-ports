# $OpenBSD: Makefile,v 1.18 2011/09/16 12:00:09 espie Exp $

COMMENT-main=		Skyrix Object Publishing Environment
COMMENT-mysql=		SOPE MySQL adaptor
COMMENT-postgres=	SOPE PostgreSQL adaptor

VERSION =		1.3.8
DISTNAME =		SOPE-${VERSION}b
PKGNAME-main =		sope-${VERSION}.1
PKGNAME-mysql =		sope-mysql-${VERSION}.1
PKGNAME-postgres =	sope-postgres-${VERSION}.1
REVISION =		0

SO_MAJOR=	0
SO_MINOR=	1
.for _lib in DOM EOControl GDLAccess NGExtensions NGLdap NGMime \
		NGObjWeb NGStreams NGXmlRpc SaxObjC SoOFS WEExtensions \
		WEPrototype WOExtensions WOXML XmlRpc SBJson
SHARED_LIBS+=   ${_lib} ${SO_MAJOR}.${SO_MINOR}
.endfor

CATEGORIES=	www
HOMEPAGE=	http://www.sogo.nu
MASTER_SITES=	${HOMEPAGE}/files/downloads/SOGo/Sources/
MAINTAINER=	Sebastian Reitenbach <sebastia@openbsd.org>

# LGPLv2 or later
PERMIT_PACKAGE_CDROM=   Yes
PERMIT_PACKAGE_FTP=     Yes
PERMIT_DISTFILES_CDROM= Yes
PERMIT_DISTFILES_FTP=   Yes

MULTI_PACKAGES=	-main -mysql -postgres

MODULES=	converters/libiconv x11/gnustep
MODGNUSTEP_NEEDS_GUI=	No

WANTLIB-main = 		gnustep-base m objc c pthread crypto ssl z lber ldap xml2 \
			${MODLIBICONV_WANTLIB}

WANTLIB-mysql = 	gnustep-base m objc GDLAccess EOControl \
			mysqlclient crypto ssl z
WANTLIB-postgres = 	gnustep-base m objc GDLAccess EOControl pq

LIB_DEPENDS-main=	x11/gnustep/base \
			databases/openldap \
			${MODLIBICONV_LIB_DEPENDS}
LIB_DEPENDS-mysql =	${BASE_PKGPATH}=${VERSION}.1 \
			databases/mysql
LIB_DEPENDS-postgres =	${BASE_PKGPATH}=${VERSION}.1 \
			databases/postgresql

WRKDIST=	${WRKDIR}/${DISTNAME}
CONFIGURE_STYLE=simple dest
CONFIGURE_ARGS+=--prefix=${PREFIX} \
		--gsmake=`gnustep-config --variable=GNUSTEP_MAKEFILES`
MAKE_ENV+=	OBJC_INCLUDE_PATH="${LOCALBASE}/include/postgresql;${LOCALBASE}/include" \
		LIBRARY_PATH="${LOCALBASE}/lib/postgresql;${LOCALBASE}/lib" \
		SBJson_INTERFACE_VERSION=${LIBSBJson_VERSION}
MAKE_FLAGS+=	MAJOR_VERSION=${SO_MAJOR} MINOR_VERSION=${SO_MINOR}
MAKE_FLAGS+=	SOPE_MAJOR_VERSION=4 SOPE_MINOR_VERSION=9
CONFIGURE_ENV+=	${MAKE_ENV}
NO_REGRESS=	Yes

post-extract:
	# those fhs.make files are not needed and may cause harm if they exist
	@find ${WRKSRC} -name fhs.make -exec rm {} \;

.include <bsd.port.mk>

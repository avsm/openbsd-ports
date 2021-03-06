# $OpenBSD: Makefile,v 1.27 2011/05/01 20:38:18 jasper Exp $

COMMENT=		HTTP and WebDAV client library, with C interface

DISTNAME=		neon-0.28.6
REVISION=		0
SHARED_LIBS=		neon	27.0 # .28.3
CATEGORIES=     	net www devel

HOMEPAGE=		http://www.webdav.org/neon/

MODULES=		devel/gettext

# LGPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		asn1 crypto expat gssapi krb5 ssl z

MASTER_SITES=		${HOMEPAGE}

USE_LIBTOOL=		Yes
USE_GROFF =		Yes
CONFIGURE_STYLE=	gnu
CONFIGURE_ENV+=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib" \
			ac_cv_path_CERTUTIL="" \
			ac_cv_path_PK12UTIL=""

FAKE_FLAGS=		docdir=${PREFIX}/share/doc/neon/

CONFIGURE_ARGS+=	${CONFIGURE_SHARED} \
			--with-ca-bundle=/etc/ssl/cert.pem \
			--with-ssl=openssl \
			--with-expat \
			--enable-nls

post-extract:
	${INSTALL} -m 555 ${FILESDIR}/krb5-config ${WRKDIR}/bin

# Prevent this from ending up in PLIST
pre-configure:
	rm ${WRKSRC}/macros/neon.m4.orig

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/neon/macros
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/neon
.for i in README NEWS BUGS TODO THANKS
	${INSTALL_DATA} ${WRKSRC}/$i ${PREFIX}/share/doc/neon
.endfor
	cd ${WRKSRC}/macros && \
		tar cf - . | (cd ${PREFIX}/share/neon/macros; tar xf -)

.include <bsd.port.mk>

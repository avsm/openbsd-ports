# $OpenBSD: Makefile,v 1.34 2011/09/16 11:13:39 espie Exp $

COMMENT=	AFP file and print services for AppleTalk/IP networks

DISTNAME=	netatalk-2.0.3
REVISION=	8
CATEGORIES=	net
HOMEPAGE=	http://netatalk.sourceforge.net/

MAINTAINER=	Arnaud Bergeron <abergeron@gmail.com>

# Mainly GPL, some parts BSD or similar
PERMIT_PACKAGE_CDROM=		Yes
PERMIT_PACKAGE_FTP=		Yes
PERMIT_DISTFILES_CDROM=		Yes
PERMIT_DISTFILES_FTP=		Yes


MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=netatalk/}

CONFIGURE_STYLE=	gnu
USE_LIBTOOL=		Yes
USE_GROFF =	Yes

WANTLIB=	c crypto rpcsvc db>=4
LIB_DEPENDS=	databases/db/v4

CONFIGURE_ARGS+=	--with-db4=${LOCALBASE}
CONFIGURE_ARGS+=	${CONFIGURE_SHARED} 
CONFIGURE_ARGS+=	--with-ssl=/usr
CONFIGURE_ARGS+=	--with-uams-path=${PREFIX}/lib/netatalk/uams
CONFIGURE_ARGS+=	--disable-overwrite
CONFIGURE_ARGS+=	--disable-cups

CONFIGURE_ENV+=		netatalk_cv_install_pam=no

post-patch:
	@cp /usr/include/netatalk/*.h ${WRKSRC}/sys/netatalk

post-build:
	@(cd ${WRKSRC}/distrib/initscripts; make rc.atalk.bsd)
	@(cd ${WRKSRC}/config; make afpd.conf)

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/netatalk
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/netatalk

.for i in AppleVolumes.default AppleVolumes.system \
	atalkd.conf papd.conf netatalk.conf afpd.conf
	${INSTALL_DATA} ${WRKSRC}/config/$i \
		${PREFIX}/share/examples/netatalk
.endfor

	${INSTALL_DATA} ${WRKSRC}/distrib/initscripts/rc.atalk.bsd \
		${PREFIX}/share/examples/netatalk

	${INSTALL_DATA} ${WRKSRC}/COPYRIGHT ${WRKSRC}/COPYING\
		${PREFIX}/share/doc/netatalk

.for i in FAQ README.hidden-items README.platforms README.logger \
	README.ids Netatalk-Manual.txt Netatalk-Manual.pdf
	${INSTALL_DATA} ${WRKSRC}/doc/$i ${PREFIX}/share/doc/netatalk
.endfor
 
.include <bsd.port.mk>

# $OpenBSD: Makefile,v 1.23.2.1 2000/09/15 04:47:02 marc Exp $

PKGNAME=	minicom-1.83.1
DISTNAME=	${PKGNAME}.src
CATEGORIES=	comms
NEED_VERSION=	1.230

MAINTAINER=     form@openbsd.org

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_SUNSITE} \
		http://www.pp.clinet.fi/~walker/mc-dev/  \
		http://www.clinet.fi/~walker/  \
		http://www.pp.clinet.fi/~walker/
MASTER_SITE_SUBDIR=     apps/serialcomm/dialout

BUILD_DEPENDS=	msgfmt::devel/gettext
RUN_DEPENDS=	kermit::comms/kermit lrz::comms/lrzsz

WRKDIST=	${WRKDIR}/${PKGNAME}/src

pre-build:
	@mv ${WRKBUILD}/xminicom ${WRKBUILD}/xminicom.orig
	@sed -e "s,@PREFIX@,${PREFIX},g" -e "s,@X11BASE@,${X11BASE},g" \
		${FILESDIR}/xminicom.in > ${WRKBUILD}/xminicom

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/minicom
	${INSTALL_DATA} ${WRKBUILD}/minicom.users ${PREFIX}/share/minicom

.include <bsd.port.mk>

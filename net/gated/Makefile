# $OpenBSD: Makefile,v 1.9.2.1 2000/09/15 05:09:08 marc Exp $
# Original from: Ejovi Nuwere <ejovi@ejovi.net>

DISTNAME=	gated-3-6
PKGNAME=	gated-3.6
CATEGORIES=	net
NEED_VERSION=	1.302

MASTER_SITES=	ftp://ftp.gated.merit.edu/net-research/gated/

HOMEPAGE=	http://www.gated.org/

MAINTAINER=	jakob@openbsd.org

PERMIT_PACKAGE_CDROM=	"commercial software"
PERMIT_PACKAGE_FTP=	"commercial software"
PERMIT_DISTFILES_CDROM=	"commercial software"
PERMIT_DISTFILES_FTP=	Yes

WRKDIST=		${WRKDIR}/gated-public-3_6

CONFIGURE_STYLE=	gnu
SEPARATE_BUILD=		Yes

post-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/src/gdc/gdc ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKBUILD}/src/ospf_monitor/ospf_monitor ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKBUILD}/src/ripquery/ripquery ${PREFIX}/bin

.include <bsd.port.mk>

# $OpenBSD: Makefile,v 1.9 2011/10/07 09:11:31 jasper Exp $

BROKEN-amd64=	build hangs due threading?

COMMENT=	.NET build tool inspired by Ant

V=		0.90
DISTNAME=	nant-${V}-src
PKGNAME=	${DISTNAME:S/-src//}
CATEGORIES=	devel lang
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=nant/}
REVISION=	0

HOMEPAGE=	http://nant.sourceforge.net/

MAINTAINER=	Ryan Boggs <rmboggs@gmail.com>

# GPLv2
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes

USE_GMAKE=	Yes
NO_REGRESS=	Yes

MODULES=	lang/mono

WRKSRC=		${WRKDIR}/${DISTNAME:S/-src//}
WRKDIST=	${WRKSRC}

FAKE_FLAGS=	prefix=${WRKINST}${TRUEPREFIX} \
		vprefix=${TRUEPREFIX}/share/NAnt \
		trueprefix=${TRUEPREFIX}

post-patch:
	@find ${WRKSRC}/src ${WRKSRC}/tests -name '*.build' \
		-exec perl -pi -e \
		's|warnaserror="true"|warnaserror="false"|g;' {} \;

.include <bsd.port.mk>

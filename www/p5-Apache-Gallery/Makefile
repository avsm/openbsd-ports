# $OpenBSD: Makefile,v 1.14 2011/06/02 13:41:41 ajacoutot Exp $


COMMENT=		mod_perl Apache gallery handler

MODULES=		cpan
DISTNAME=		Apache-Gallery-1.0RC3
REVISION=		2
CATEGORIES=		www
USE_GROFF =		Yes

HOMEPAGE=		http://www.apachegallery.dk/

# Artistic
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

RUN_DEPENDS=		www/p5-URI \
			graphics/p5-Image-Info \
			graphics/p5-Image-Size>=3.1.1 \
			textproc/p5-Text-Template \
			graphics/p5-Image-Imlib2 \
			www/mod_perl \
			www/p5-libapreq>=1.0

BUILD_DEPENDS=		${RUN_DEPENDS}
REGRESS_DEPENDS=	devel/p5-Test-Pod \
			devel/p5-Test-MockObject

TEMPLATESDIR=   ${PREFIX}/share/Apache-Gallery/templates
ICONSDIR=       ${PREFIX}/share/Apache-Gallery/icons
DOCSDIR=        ${PREFIX}/share/doc/Apache-Gallery

post-install:
	${INSTALL_DATA_DIR} ${TEMPLATESDIR}
.for i in new default
	${INSTALL_DATA_DIR} ${TEMPLATESDIR}/${i}
	${INSTALL_DATA} ${WRKSRC}/templates/${i}/*.tpl ${TEMPLATESDIR}/${i}
	${INSTALL_DATA} ${WRKSRC}/templates/${i}/gallery.css \
		${TEMPLATESDIR}/${i}
.endfor
	${INSTALL_DATA_DIR} ${ICONSDIR}
	${INSTALL_DATA} ${WRKSRC}/htdocs/*.png ${ICONSDIR}
	${INSTALL_DATA_DIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/{README,INSTALL} ${DOCSDIR}

.include <bsd.port.mk>

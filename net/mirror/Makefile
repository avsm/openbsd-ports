# $OpenBSD: Makefile,v 1.10.2.1 2000/09/15 05:09:30 marc Exp $

DISTNAME=	mirror-2.9
CATEGORIES=	net
NEED_VERSION=	1.210
MASTER_SITES=	ftp://src.doc.ic.ac.uk/computing/archiving/mirror/ \
		ftp://ftp.nmt.edu/ \
		ftp://ftp.plig.net/pub/OpenBSD/distfiles/

MAINTAINER=	ports@openbsd.org
HOMEPAGE=	http://sunsite.org.uk/packages/mirror/


PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WRKDIST=	${WRKDIR}
MAKE_FILE=	makefile
FAKE=		Yes

DOCDIR=		${PREFIX}/share/doc/mirror
DOCS=		copyright.html index.html mirror-faq.html mirror.html \
		mm.html quickstart.html mirror-on-dusk.gif Lake.class

do-configure:
	@-rm -f ${WRKSRC}/mirror.man
	@sed -e 's,@DOCDIR@,${DOCDIR},g' < ${FILESDIR}/mirror.man \
		>${WRKSRC}/mirror.man
	@sed -e 's,@PREFIX@,${PREFIX},g' < ${WRKSRC}/mirror.pl \
		> ${WRKSRC}/mirror
	@sed -e 's,@PREFIX@,${PREFIX},g' < ${WRKSRC}/mm.pl \
		> ${WRKSRC}/mirrormaster

pre-install:
	${INSTALL_DATA_DIR} ${PREFIX}/lib/mirror

post-install:
	@${INSTALL_DATA_DIR} ${DOCDIR}
	@cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCDIR}

.include <bsd.port.mk>

# $OpenBSD: Makefile,v 1.12 2011/03/31 08:32:26 jasper Exp $

COMMENT=		PDF backend for CUPS

DISTNAME=		cups-pdf-2.5.1
CATEGORIES=		print

HOMEPAGE=		http://www.cups-pdf.de/
MASTER_SITES=		${HOMEPAGE}src/
DISTFILES=		${DISTNAME:S/pdf-/pdf_/}.tar.gz

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

WANTLIB=		c

RUN_DEPENDS=		print/cups \
			print/ghostscript/gnu \
			mail/p5-MIME-Lite \
			mail/p5-MIME-tools

NO_REGRESS=		Yes

do-build:
	cd ${WRKDIR} && \
	${CC} ${CFLAGS} -o bin/cups-pdf ${WRKDIR}/${DISTNAME}/src/cups-pdf.c

pre-install:
	${SUBST_CMD} ${WRKBUILD}/extra/cups-pdf.conf

do-install:
	${INSTALL_PROGRAM_DIR} ${PREFIX}/libexec/cups/backend
	${INSTALL_DATA_DIR} ${PREFIX}/share/cups/model
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/cups
	${INSTALL_PROGRAM} ${WRKDIR}/bin/cups-pdf \
		${PREFIX}/libexec/cups/backend/cups-pdf
	${INSTALL_SCRIPT} ${WRKBUILD}/contrib/cups-pdf-dispatch-0.1/cups-pdf-dispatch \
		${PREFIX}/bin
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME}/extra/CUPS-PDF.ppd \
		${PREFIX}/share/cups/model/
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME}/extra/cups-pdf.conf \
		${PREFIX}/share/examples/cups/
	${INSTALL_DATA} ${WRKBUILD}/contrib/cups-pdf-dispatch-0.1/cups-pdf-dispatch.conf \
		${PREFIX}/share/examples/cups/
	${INSTALL_DATA} ${WRKBUILD}/contrib/cups-pdf-dispatch-0.1/examples/cups-pdf-dispatch-ldap.conf \
		${PREFIX}/share/examples/cups/

.include <bsd.port.mk>

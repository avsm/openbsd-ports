# $OpenBSD: Makefile,v 1.10 2010/11/19 07:23:09 espie Exp $

COMMENT=	Postfix log entry summarizer

DISTNAME=	pflogsumm-1.1.3
CATEGORIES=	mail

MASTER_SITES+=	http://jimsun.linxnet.com/downloads/

HOMEPAGE=	http://jimsun.linxnet.com/postfix_contrib.html

MAINTAINER=     Giovanni Bechis <giovanni@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

USE_GROFF =	Yes
NO_REGRESS=	Yes

RUN_DEPENDS=  devel/p5-Date-Calc>=5.3

do-build:
	(cd ${WRKSRC}; \
	rm -f pflogsumm.1; \
	pod2man pflogsumm.pl >pflogsumm.1)

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/pflogsumm.pl ${PREFIX}/bin/pflogsumm
	${INSTALL_MAN} ${WRKSRC}/pflogsumm.1 ${PREFIX}/man/man1

.include <bsd.port.mk>

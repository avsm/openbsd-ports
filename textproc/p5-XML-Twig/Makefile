# $OpenBSD: Makefile,v 1.15 2011/03/10 17:36:46 jasper Exp $

COMMENT=	perl module for parsing huge XML documents

DISTNAME=	XML-Twig-3.38
CATEGORIES=	textproc

HOMEPAGE=	http://www.xmltwig.com/xmltwig/

MAINTAINER=	Jasper Lievisse Adriaanse <jasper@openbsd.org>

# perl
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MODULES=	cpan
CPAN_AUTHOR=	MIROD

USE_GROFF =	Yes

RUN_DEPENDS=	textproc/p5-XML-Parser \
		www/p5-HTML-Tidy \
		www/p5-HTML-Tree
BUILD_DEPENDS=	${RUN_DEPENDS}

REGRESS_DEPENDS=converters/p5-Text-Iconv \
		converters/p5-Unicode-Map \
		converters/p5-Unicode-Map8 \
		converters/p5-Unicode-String \
		devel/p5-IO-stringy \
		devel/p5-Test-Pod \
		devel/p5-Tie-IxHash \
		textproc/p5-XML-SAX \
		textproc/p5-XML-Simple \
		textproc/p5-XML-XPath \
		www/p5-libwww

.include <bsd.port.mk>

# $OpenBSD: Makefile,v 1.2.2.1 2006/05/05 18:30:21 sturm Exp $

COMMENT=	"Nessus Attack Scripting Language"

DISTNAME=	libnasl-${VERSION}
PKGNAME=	${DISTNAME}p5

WANTLIB=  	c crypto pcap ssl util

BUILD_DEPENDS=  :bison-*:devel/bison

LIB_DEPENDS=    nessus.4,hosts_gatherer.4::security/nessus/libraries

.include <bsd.port.mk>

# $OpenBSD: Makefile,v 1.7 2010/11/15 23:22:08 espie Exp $

COMMENT=		cisco 3600/7200 platform emulator

DISTNAME=		dynamips-0.2.8-RC2
PKGNAME=		${DISTNAME:S/-RC/rc/}
REVISION=		2
CATEGORIES=		emulators

HOMEPAGE=		http://www.ipflow.utc.fr/index.php/Cisco_7200_Simulator
MASTER_SITES=		http://www.ipflow.utc.fr/dynamips/

MAINTAINER=		Stuart Henderson <sthen@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

LIB_DEPENDS=		devel/libelf
WANTLIB=		c elf pcap pthread

MAKE_ENV=		DYNAMIPS_ARCH=${DYNAMIPS_ARCH}

USE_GMAKE=		Yes
USE_GROFF=		Yes
NO_REGRESS=		Yes

.if ${MACHINE_ARCH} == "i386"
DYNAMIPS_ARCH=	"x86"
.elif ${MACHINE_ARCH} == "amd64"
DYNAMIPS_ARCH=	"amd64"
.else
DYNAMIPS_ARCH=	"nojit"
.endif

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/dynamips
.for i in ChangeLog README README.hypervisor TODO
	${INSTALL_DATA} ${WRKSRC}/$i ${PREFIX}/share/doc/dynamips
.endfor

.include <bsd.port.mk>

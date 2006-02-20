# $OpenBSD: Makefile,v 1.8.2.1 2006/02/20 22:02:36 sturm Exp $

NOT_FOR_ARCHS=	${NO_SHARED_ARCHS}

COMMENT=	"utility to create virtual hosts on a network"
DISTNAME=	honeyd-0.8b
PKGNAME=	${DISTNAME}p0
CATEGORIES=	net
MASTER_SITES=	${HOMEPAGE} \
		http://niels.xtdnet.nl/honeyd/

HOMEPAGE=	http://www.citi.umich.edu/u/provos/honeyd/

# BSD
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		c edit m ncurses pcap

USE_LIBTOOL=	Yes

BUILD_DEPENDS=	${LOCALBASE}/lib/libdnet.a::net/libdnet

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS+=--without-python

SCRIPTS=	proxy.pl router-telnet.pl smtp.pl test.sh web.sh
SCRIPTS-snmp=	README buildSNMPConfig.pl default.snmp fake-snmp.pl \
		linux-2.4.snmp.tpl windows2000.snmp.tpl

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/honeyd/scripts/snmp
.for f in ${SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/${f} ${PREFIX}/share/honeyd/scripts
.endfor
.for f in ${SCRIPTS-snmp}
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/snmp/${f} \
		${PREFIX}/share/honeyd/scripts/snmp
.endfor

.include <bsd.port.mk>

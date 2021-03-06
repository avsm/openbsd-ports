# $OpenBSD: Makefile,v 1.26 2011/03/23 09:48:07 jasper Exp $

COMMENT =		SMTP plugin for MUAs

DISTNAME =		msmtp-1.4.23
CATEGORIES =		mail

HOMEPAGE =		http://msmtp.sourceforge.net/

MAINTAINER =		Paul Irofti <pirofti@openbsd.org>

# GPLv3
PERMIT_PACKAGE_CDROM =		Yes
PERMIT_PACKAGE_FTP =		Yes
PERMIT_DISTFILES_CDROM =	Yes
PERMIT_DISTFILES_FTP =		Yes
WANTLIB =		c crypto ssl idn

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=msmtp/}
EXTRACT_SUFX =		.tar.bz2

LIB_DEPENDS =		devel/libidn

MODULES =		devel/gettext

SEPARATE_BUILD =	concurrent
CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS =	--with-libgsasl=no \
			--with-libidn=yes \
			--with-ssl=openssl
FAKE_FLAGS =		mandir="${PREFIX}/man" \
			infodir="${PREFIX}/info"
USE_GROFF =		Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/msmtp
	${INSTALL_DATA_DIR} ${PREFIX}/share/msmtp/msmtpqueue
	${INSTALL_DATA} ${WRKSRC}/doc/*.example ${PREFIX}/share/examples/msmtp
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/msmtp
	${INSTALL_DATA} ${WRKSRC}/doc/Mutt+msmtp.txt ${PREFIX}/share/doc/msmtp
	${INSTALL_DATA} ${WRKSRC}/doc/msmtp.html ${PREFIX}/share/doc/msmtp
	${INSTALL_DATA} ${WRKSRC}/scripts/msmtpqueue/{README,ChangeLog} \
			${PREFIX}/share/msmtp/msmtpqueue
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/set_sendmail/set_sendmail.sh \
		${PREFIX}/share/examples/msmtp
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/msmtpqueue/*.sh \
		${PREFIX}/share/examples/msmtp

.include <bsd.port.mk>

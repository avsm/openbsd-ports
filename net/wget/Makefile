# $OpenBSD: Makefile,v 1.36.2.1 2005/10/18 19:54:27 sturm Exp $

COMMENT=	"retrieve files from the 'net via HTTP and FTP"

DISTNAME=	wget-1.10.2
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GNU:=wget/}

HOMEPAGE=	http://www.gnu.org/software/wget/

MODULES=	devel/gettext

MAINTAINER=	Brad Smith <brad@openbsd.org>

# GPL
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

CONFIGURE_STYLE=gnu
CONFIGURE_ENV+=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		MAKEINFO="makeinfo --no-split"

pre-build:
	@perl -pi -e s#/usr/local/etc#${SYSCONFDIR}#g ${WRKSRC}/doc/wget.texi
	@perl -pi -e s#/usr/local#${PREFIX}#g ${WRKSRC}/doc/wget.texi
	@perl -pi -e s#/usr/local/etc#${SYSCONFDIR}#g ${WRKSRC}/doc/sample.wgetrc

.include <bsd.port.mk>

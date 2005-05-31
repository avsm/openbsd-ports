# $OpenBSD: Makefile,v 1.7.2.1 2005/05/31 19:31:37 sturm Exp $

NOT_FOR_ARCHS=	${NO_SHARED_ARCHS}

COMMENT=	"Sybase database driver for the DBI module"

DISTNAME=	DBD-Sybase-1.04
PKGNAME=	p5-${DISTNAME}p0
CATEGORIES=	databases perl5

MAINTAINER=	Xavier Santolaria <xsa@openbsd.org>

# GPL/Artistic License
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes
WANTLIB=		intl m

MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=DBD/}

MODULES=	devel/gettext

LIB_DEPENDS=	ct.2::databases/freetds
BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	:p5-DBI-*:databases/p5-DBI \

CONFIGURE_STYLE=perl
CONFIGURE_ENV+=	SYBASE=${LOCALBASE}

NO_REGRESS=	Yes

.include <bsd.port.mk>

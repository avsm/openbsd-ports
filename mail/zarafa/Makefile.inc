# $OpenBSD: Makefile.inc,v 1.13 2011/09/29 17:12:11 ajacoutot Exp $

# there is no point in building/running this on NO_SHARED_LIBS archs
SHARED_ONLY=	Yes

V?=		7.0.2
BUILD?=		29470
DISTNAME?=	zcp-${V}

CATEGORIES+=	mail/zarafa

HOMEPAGE?=	http://www.zarafa.nl/

MAINTAINER?=	Antoine Jacoutot <ajacoutot@openbsd.org>

# zarafa: AGPLv3 (GNU Affero Public License)
# libical: MPL/LGPLv2
# libvmime: GPLv2
PERMIT_PACKAGE_CDROM?=	Yes
PERMIT_PACKAGE_FTP?=	Yes
PERMIT_DISTFILES_CDROM?=Yes
PERMIT_DISTFILES_FTP?=	Yes

DIST_SUBDIR?=		zarafa
MASTER_SITES_ZARAFA=	http://download.zarafa.com/community/final/${V:C/^([0-9]+\.[0-9]+).*/\1/}/${V}-${BUILD}/sourcecode/
MASTER_SITES?=		${MASTER_SITES_ZARAFA}

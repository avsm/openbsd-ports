# $OpenBSD: Makefile,v 1.3.2.1 2000/09/15 04:49:06 marc Exp $
# Original from: Yannick Cote

DISTNAME=		lam-6.3.1
CATEGORIES=     	devel math net
FAKE=No

MAINTAINER=		yanick@openbsd.org
BROKEN=			"Waiting for the 6.3.3 version which will contain a decent build process."

MASTER_SITES=		http://www.mpi.nd.edu/downloads/lam/

GNU_CONFIGURE=		yes 
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--with-rsh="ssh -x"

.include <bsd.port.mk>

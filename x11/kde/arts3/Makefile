# $OpenBSD: Makefile,v 1.6.2.1 2002/08/16 23:00:34 brad Exp $

COMMENT=		"X11 toolkit, multimedia hub"
CATEGORIES=		x11 x11/kde
NEED_VERSION=		1.504
VERSION=		3.0
DISTNAME=		arts-1.0.0
PKGNAME=		${DISTNAME}p1

LIB_DEPENDS= 	audiofile::devel/libaudiofile
		
pre-build:
	@if pkg dependencies check kdelibs-\*; then \
		if pkg dependencies check ${DISTNAME}; then \
			:; \
		else \
			echo 1>&2 "Error: you must remove your old kdelibs first"; \
			exit 1; \
		fi; \
    	fi

.include <bsd.port.mk>

# $OpenBSD: Makefile,v 1.27 2011/10/12 06:24:28 espie Exp $

LANGS= ca cs cy da de el en_GB es et eu fi fr \
	hu it ja lv ms nb nl pl pt pt_BR ru sk sl sr sr@Latn \
	sv tr uk zh_CN zh_TW

# some extra vars to compact PLISTs
I=index.docbook
C=index.cache.bz2

FLAVOR?=fr
SUBST_VARS=I C
.for l in ${LANGS}
FLAVORS+=${l:L}
.  if ${FLAVOR:M${l:L}}
DISTFILES=koffice-l10n-$l-${VERSION}.tar.bz2
WRKDIST=${WRKDIR}/koffice-l10n-$l-${VERSION}
FULLPKGNAME=koffice-i18n-$l-${VERSION:S/-//g}
COMMENT= $l translations for KDE
PLIST=${PKGDIR}/PLIST-$l
DOC=share/doc/HTML/$l/
LOC=share/locale/$l/LC_MESSAGES/
.  endif
SUPDISTFILES+= koffice-l10n-$l-${VERSION}.tar.bz2
SUBST_VARS+=DOC LOC
.endfor

DISTNAME=		koffice-i18n-${VERSION}
CATEGORIES=		x11 x11/kde
VERSION=		1.6.2
MODGNU_CONFIG_GUESS_DIRS=	${WRKSRC}
MASTER_SITES=	${MASTER_SITE_KDE:=stable/koffice-${VERSION}/src/koffice-l10n/}

BUILD_DEPENDS = x11/kde/libs3
RUN_DEPENDS = x11/kde/libs3

PATCH_LIST=	patch-*
MODKDE_VERSION=
CONFIGURE_STYLE=gnu

MAKE_FLAGS+=MEINPROC=
CONFIGURE_ARGS+=-C

DESCR=${PKGDIR}/DESCR
MODKDE_NODEBUG=Yes

REVISION =	1

# kdgantt.mo is already in kde-i18n
post-install:
	@find ${PREFIX}/${LOC} -name kdgantt.mo | xargs -r rm -f

.include <bsd.port.mk>

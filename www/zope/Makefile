# $OpenBSD: Makefile,v 1.3.2.2 2002/04/18 13:41:19 matt Exp $

COMMENT=	"object-oriented web application server"

VERSION=	2.4.1
DISTNAME=	Zope-${VERSION}-src
PKGNAME=	zope-${VERSION}.3
CATEGORIES=     www
NEED_VERSION=	1.419

HOMEPAGE=	http://www.zope.org/

MAINTAINER=	Matt Behrens <matt@openbsd.org>

PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	http://www.zope.org/Products/Zope/${VERSION}/
EXTRACT_SUFX=	.tgz
EXTRACT_CASES=	*.tgz) gtar zxf ${FULLDISTDIR}/$$archive ;;

HOTFIX_DATE0=	2001-09-28
MASTER_SITES0=	http://www.zope.org/Products/Zope/Hotfix_${HOTFIX_DATE0}/
HOTFIX_DATE1=	2002-03-01
MASTER_SITES1=	http://www.zope.org/Products/Zope/Hotfix_${HOTFIX_DATE1}/
HOTFIX_DATE2=	2002-04-15
MASTER_SITES2=	http://www.zope.org/Products/Zope/Hotfix_${HOTFIX_DATE2}/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		Hotfix_${HOTFIX_DATE0}.tgz:0 \
		Hotfix_${HOTFIX_DATE1}.tgz:1 \
		Hotfix_${HOTFIX_DATE2}.tgz:2

BUILD_DEPENDS=	python2.1:python-2.1*-threads:lang/python \
		gtar::archivers/gtar
RUN_DEPENDS=	python2.1:python-2.1*-threads:lang/python

# Note that the configure script is really just for pcgi, but it's
# the only one in the package.

CONFIGURE_STYLE=gnu

WRKBUILD=			${WRKSRC}/pcgi
MODGNU_CONFIG_GUESS_DIRS=	${WRKBUILD}

ZOPEHOME=	${PREFIX}/lib/zope
PRODUCTSDIR=	${ZOPEHOME}/lib/python/Products

do-build:
	cd ${WRKSRC} && ZDIR=${ZOPEHOME} python w_pcgi.py
	sed -e "s%@@PREFIX@@%${PREFIX}%g" \
		-e "s%@@LOCALBASE@@%${LOCALBASE}%g" \
		< ${FILESDIR}/zope-instance > ${WRKSRC}/zope-instance

# All this should give us what closely resembles a zope.org binary
# installation and allow us to rely as much as possible on make
# plist to update to newer versions.

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/zope-instance ${PREFIX}/bin
	${INSTALL_PROGRAM_DIR} ${ZOPEHOME}
	cp -Rp ${WRKSRC}/* ${ZOPEHOME}
	chown -R 0:0 ${ZOPEHOME}
	cd ${ZOPEHOME}/lib && ln -s ../../python2.1
	rm -r ${ZOPEHOME}/*.txt ${ZOPEHOME}/doc ${ZOPEHOME}/lib/Components \
		${ZOPEHOME}/pcgi/Win32
	find ${ZOPEHOME} -name \*.orig -or -name \*.o -or -name .cvsignore \
		-or -name sedscript -or -name \*.old | xargs rm
	find ${ZOPEHOME}/lib/python -name config.c -or -name Makefile \
		-or -name Makefile.pre -or -name Makefile.pre.in | xargs rm
	rm ${ZOPEHOME}/lib/python/Setup ${ZOPEHOME}/pcgi/Makefile \
		${ZOPEHOME}/pcgi/config.log ${ZOPEHOME}/pcgi/config.status \
		${ZOPEHOME}/pcgi/config.cache ${ZOPEHOME}/zope-instance \
		${ZOPEHOME}/w*_pcgi.py*
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/zope/changenotes 
	${INSTALL_DATA} ${WRKSRC}/*.txt ${WRKSRC}/doc/*.txt \
		${PREFIX}/share/doc/zope
	${INSTALL_DATA} ${WRKSRC}/doc/changenotes/* \
		${PREFIX}/share/doc/zope/changenotes
	${INSTALL_DATA_DIR} ${PRODUCTSDIR}/Hotfix_${HOTFIX_DATE0}
	${INSTALL_DATA} \
		${WRKDIR}/lib/python/Products/Hotfix_${HOTFIX_DATE0}/* \
		${PRODUCTSDIR}/Hotfix_${HOTFIX_DATE0}
	${INSTALL_DATA_DIR} ${PRODUCTSDIR}/Hotfix_${HOTFIX_DATE1}
	${INSTALL_DATA} \
		${WRKDIR}/lib/python/Products/Hotfix_${HOTFIX_DATE1}/* \
		${PRODUCTSDIR}/Hotfix_${HOTFIX_DATE1}
	${INSTALL_DATA_DIR} ${PRODUCTSDIR}/Hotfix_${HOTFIX_DATE2}
	${INSTALL_DATA} \
		${WRKDIR}/lib/python/Products/Hotfix_${HOTFIX_DATE2}/* \
		${PRODUCTSDIR}/Hotfix_${HOTFIX_DATE2}

.include <bsd.port.mk>


# $OpenBSD: cpan.port.mk,v 1.10 2010/10/01 21:55:20 jasper Exp $

PKGNAME ?=	p5-${DISTNAME}
.if !defined(CPAN_AUTHOR)
MASTER_SITES ?=	${MASTER_SITE_PERL_CPAN:=${DISTNAME:C/-.*$//}/}
.else
MASTER_SITES ?=	${MASTER_SITE_PERL_CPAN:=../by-authors/id/${CPAN_AUTHOR:C/^(.).*/\1/}/${CPAN_AUTHOR:C/^(..).*/\1/}/${CPAN_AUTHOR}/}
.endif

CATEGORIES +=	perl5
CONFIGURE_STYLE +=	perl
MODULES +=	perl

REGRESS_DEPENDS +=	${RUN_DEPENDS}

.if !defined(SHARED_ONLY) || ${SHARED_ONLY:L} != "yes"
PKG_ARCH ?=	* 
.endif

.if defined(MAKE_ENV) && !empty(MAKE_ENV:MTEST_POD=*)
REGRESS_DEPENDS +=	::devel/p5-Test-Pod \
		 	::devel/p5-Test-Pod-Coverage
.endif

MODCPAN_POST_INSTALL = ${INSTALL_DATA_DIR} ${MODCPAN_EXAMPLES_DIR}; \
	${INSTALL_DATA} ${WRKSRC}/${MODCPAN_EXAMPLES_DIST}/* ${MODCPAN_EXAMPLES_DIR}

.if defined(MODCPAN_EXAMPLES) && ${MODCPAN_EXAMPLES:L} == "yes"
MODCPAN_EXAMPLES_DIR ?= ${PREFIX}/share/examples/p5-${DISTNAME:C/-([0-9]+\.[0-9]+).*$//g}
MODCPAN_EXAMPLES_DIST ?= examples
.  if !target(post-install)
post-install:
	${INSTALL_DATA_DIR} ${MODCPAN_EXAMPLES_DIR}
	${INSTALL_DATA} ${WRKSRC}/${MODCPAN_EXAMPLES_DIST}/* ${MODCPAN_EXAMPLES_DIR}
.  endif
.endif

CPAN_REPORT ?=	No

.if ${CPAN_REPORT:L} == "yes"
REGRESS_DEPENDS +=	::devel/p5-Test-Reporter
.  if ${CONFIGURE_STYLE:L:Mmodbuild}
REGRESS_FLAGS +=	verbose=1
.  else
REGRESS_FLAGS +=	TEST_VERBOSE=1
.  endif
REGRESS_STATUS_IGNORE =	-
.  if !defined(CPAN_REPORT_DB)
ERRORS +=	"Fatal: CPAN_REPORT_DB must point to a directory"
.  endif
.  if !defined(CPAN_REPORT_FROM) || empty(CPAN_REPORT_FROM)
ERRORS +=	"Fatal: CPAN_REPORT_FROM needs an email address"
.  endif

CPANTEST =	perl ${PORTSDIR}/infrastructure/build/cpanreport
CPANTEST_FLAGS =-f ${REGRESS_LOGFILE} -s ${CPAN_REPORT_FROM:Q} ${DISTNAME} \
			> ${CPAN_REPORT_DB}/${PKGNAME}
CPANTEST_PASS =	-g pass ${CPANTEST_FLAGS}
CPANTEST_FAIL =	-g fail ${CPANTEST_FLAGS}

post-regress:
	@mkdir -p ${CPAN_REPORT_DB}
	@if grep -q FAILED ${REGRESS_LOGFILE}; then \
		${CPANTEST} ${CPANTEST_FAIL}; \
		exit 1; \
	else ${CPANTEST} ${CPANTEST_PASS}; fi

.endif

#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4 sw=4 filetype=make:
# $OpenBSD: perl.port.mk,v 1.10 2004/06/23 03:20:17 msf Exp $
#	Based on bsd.port.mk, originally by Jordan K. Hubbard.
#	This file is in the public domain.

REGRESS_TARGET ?=	test
MODPERL_BUILD ?= Build

.if ${CONFIGURE_STYLE:L:Mmodbuild}
.  if !${PKGNAME:Mp5-Module-Build*}
BUILD_DEPENDS+=	::devel/p5-Module-Build
.  endif
MODPERL_configure= \
	arch=`/usr/bin/perl -e 'use Config; print $$Config{archname}, "\n";'`; \
    cd ${WRKSRC}; ${_SYSTRACE_CMD} ${SETENV} ${CONFIGURE_ENV} \
	/usr/bin/perl Build.PL \
		install_path=lib="${PREFIX}/libdata/perl5/site_perl" \
		install_path=arch="${PREFIX}/libdata/perl5/site_perl/$$arch" \
		install_path=libdoc="${PREFIX}/man/man3p" \
		install_path=bindoc="${PREFIX}/man/man1" \
		install_path=bin="${PREFIX}/bin" \
		install_path=script="${PREFIX}/bin" ${CONFIGURE_ARGS} 
.else
MODPERL_configure= \
	arch=`/usr/bin/perl -e 'use Config; print $$Config{archname}, "\n";'`; \
     cd ${WRKSRC}; ${_SYSTRACE_CMD} ${SETENV} ${CONFIGURE_ENV} \
     /usr/bin/perl Makefile.PL \
     	PREFIX='${PREFIX}' \
		INSTALLSITELIB='${PREFIX}/libdata/perl5/site_perl' \
		INSTALLSITEARCH="\$${INSTALLSITELIB}/$$arch" \
		INSTALLPRIVLIB='/usr/./libdata/perl5' \
		INSTALLARCHLIB="\$${INSTALLPRIVLIB}/$$arch" \
		INSTALLMAN1DIR='${PREFIX}/man/man1' \
		INSTALLMAN3DIR='${PREFIX}/man/man3p' \
		INSTALLBIN='$${PREFIX}/bin' \
		INSTALLSCRIPT='$${INSTALLBIN}' ${CONFIGURE_ARGS}
.endif

MODPERL_pre_fake= \
	${SUDO} mkdir -p ${WRKINST}`/usr/bin/perl -e 'use Config; print $$Config{installarchlib}, "\n";'`

.if ${CONFIGURE_STYLE:L:Mmodbuild}
.  if !target(do-build)
do-build: 
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} /usr/bin/perl \
		${MODPERL_BUILD} build
.  endif
.  if !target(do-regress)
do-regress:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} /usr/bin/perl \
		${MODPERL_BUILD} ${REGRESS_TARGET}

.  endif
.  if !target(do-install)
do-install:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} /usr/bin/perl \
		${MODPERL_BUILD} destdir=${WRKINST} ${FAKE_TARGET}
.  endif
.endif

P5SITE=libdata/perl5/site_perl
P5ARCH=${P5SITE}/${MACHINE_ARCH}-openbsd
SUBST_VARS+=P5ARCH P5SITE

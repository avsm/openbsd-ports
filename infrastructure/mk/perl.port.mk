#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4 sw=4 filetype=make:
# $OpenBSD: perl.port.mk,v 1.5 2003/07/28 17:17:05 sturm Exp $
#	Based on bsd.port.mk, originally by Jordan K. Hubbard.
#	This file is in the public domain.

REGRESS_TARGET ?=	test
MODPERL_configure= \
	arch=`/usr/bin/perl -e 'use Config; print $$Config{archname}, "\n";'`; \
     cd ${WRKSRC}; ${_SYSTRACE_CMD} ${SETENV} ${CONFIGURE_ENV} \
     /usr/bin/perl Makefile.PL \
     	PREFIX='$${${DESTDIRNAME}}${PREFIX}' \
		INSTALLSITELIB='$${${DESTDIRNAME}}${PREFIX}/libdata/perl5/site_perl' \
		INSTALLSITEARCH="\$${INSTALLSITELIB}/$$arch" \
		INSTALLPRIVLIB='$${${DESTDIRNAME}}/usr/./libdata/perl5' \
		INSTALLARCHLIB="\$${INSTALLPRIVLIB}/$$arch" \
		INSTALLMAN1DIR='$${${DESTDIRNAME}}${PREFIX}/man/man1' \
		INSTALLMAN3DIR='$${${DESTDIRNAME}}${PREFIX}/man/man3p' \
		INSTALLBIN='$${PREFIX}/bin' \
		INSTALLSCRIPT='$${INSTALLBIN}' ${CONFIGURE_ARGS}


MODPERL_pre_fake= \
	${SUDO} mkdir -p ${WRKINST}`/usr/bin/perl -e 'use Config; print $$Config{installarchlib}, "\n";'`

P5SITE=libdata/perl5/site_perl
P5ARCH=${P5SITE}/${MACHINE_ARCH}-openbsd
SUBST_VARS+=P5ARCH P5SITE

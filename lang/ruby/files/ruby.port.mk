# $OpenBSD: ruby.port.mk,v 1.5 2004/06/23 14:17:05 naddy Exp $

# ruby module

RUN_DEPENDS+=::lang/ruby
LIB_DEPENDS+=ruby.1.81::lang/ruby

# location of ruby libraries
MODRUBY_LIBDIR=		${LOCALBASE}/lib/ruby

# common directories for ruby extensions
# used to create docs and examples install path
MODRUBY_DOCDIR=		${PREFIX}/share/doc/ruby
MODRUBY_EXAMPLEDIR=	${PREFIX}/share/examples/ruby

CONFIGURE_STYLE?=	simple
CONFIGURE_SCRIPT?=	${LOCALBASE}/bin/ruby extconf.rb

REV=1.8
SUB=${MACHINE_ARCH:S/amd64/x86_64/}-openbsd${OSREV}
SUBST_VARS=SUB REV


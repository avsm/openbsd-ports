#-*- mode: Makefile; tab-width: 4; -*-
# ex:ts=4 sw=4 filetype=make:
#	from: @(#)bsd.subdir.mk	5.9 (Berkeley) 2/1/91
#	$OpenBSD: bsd.port.subdir.mk,v 1.80 2006/12/02 11:27:46 espie Exp $
#	FreeBSD Id: bsd.port.subdir.mk,v 1.20 1997/08/22 11:16:15 asami Exp
#
# The include file <bsd.port.subdir.mk> contains the default targets
# for building ports subdirectories. 
#
#
# +++ variables +++
#
# STRIP		The flag passed to the install program to cause the binary
#		to be stripped.  This is to be used when building your
#		own install script so that the entire system can be made
#		stripped/not-stripped using a single knob. [-s]
#
# ECHO_MSG	Used to print all the '===>' style prompts - override this
#		to turn them off [echo].
#
# OPSYS		Get the operating system type [`uname -s`]
#
# SUBDIR	A list of subdirectories that should be built as well.
#		Each of the targets will execute the same target in the
#		subdirectories.
#
#
# +++ targets +++
#
#	README.html:
#		Creating README.html for package.
#
#	afterinstall, all, beforeinstall, build, checksum, clean,
#	configure, depend, describe, extract, fetch, fetch-list,
#	install, package, readmes, deinstall, reinstall,
#	tags
#

# recent /usr/share/mk/* should include bsd.own.mk, guard for older versions
.if !defined(BSD_OWN_MK)
.  include <bsd.own.mk>
.endif

.if defined(verbose-show)
.MAIN: verbose-show
.elif defined(show)
.MAIN: show
.elif defined(clean)
.MAIN: clean
.else
.MAIN: all
.endif

.if !defined(DEBUG_FLAGS)
STRIP ?= -s
.endif

.if !defined(OPSYS)	# XXX !!
OPSYS = OpenBSD
.endif

.include "${PORTSDIR}/infrastructure/mk/pkgpath.mk"

ECHO_MSG ?= echo

# create a full list of SUBDIRS...
.if empty(PKGPATH)
_FULLSUBDIR := ${SUBDIR}
.else
_FULLSUBDIR := ${SUBDIR:S@^@${PKGPATH}/@g}
.endif

_SKIPPED =
.for i in ${SKIPDIR}
_SKIPPED :+= ${_FULLSUBDIR:M$i}
_FULLSUBDIR := ${_FULLSUBDIR:N$i}
.endfor

TEMPLATES ?= ${PORTSDIR}/infrastructure/templates
.if defined(PORTSTOP)
README = ${TEMPLATES}/README.top
.else
README = ${TEMPLATES}/README.category
.endif

_subdir_fragment = \
	: $${echo_msg:=${ECHO_MSG:Q}}; \
	: $${target:=${.TARGET}}; \
	for i in ${_SKIPPED}; do \
		eval $${echo_msg} "===\> $$i skipped"; \
	done; \
	for subdir in ${_FULLSUBDIR}; do \
		${_flavor_fragment}; \
		eval $${echo_msg} "===\> $$subdir"; \
		set +e; \
		if ! eval  $$toset ${MAKE} $$target; then \
			${REPORT_PROBLEM}; \
		fi; \
	done; set -e

.for __target in all fetch package fake extract patch configure \
	build distclean deinstall install update \
	reinstall checksum fetch-makefile \
	link-categories unlink-categories regress lib-depends-check \
	newlib-depends-check manpages-check license-check \
	print-package-signature 

${__target}:
	@${_subdir_fragment}
.endfor

.for __target in describe show verbose-show dump-vars \
	homepage-links print-plist print-plist-contents \
	print-plist-all
${__target}:
	@DESCRIBE_TARGET=Yes; export DESCRIBE_TARGET; ${_subdir_fragment}
.endfor

.for __target in all-dir-depends build-dir-depends run-dir-depends regress-dir-depends

${__target}: 
	@${_depfile_fragment}; echo_msg=:; ${_subdir_fragment}
.endfor

clean:
.if defined(clean) && ${clean:L:Mdepends}
	@{ target=all-dir-depends; echo_msg=:; \
	${_depfile_fragment}; ${_subdir_fragment}; }| tsort -r| \
	while read subdir; do \
		${_flavor_fragment}; \
		eval $$toset ${MAKE} _CLEANDEPENDS=No clean; \
	done
.else
	@${_subdir_fragment}
.endif
.if defined(clean) && ${clean:L:Mreadmes}
	rm -f ${README_TOPS}/${PKGPATH}/README.html
.endif

readmes:
	@DESCRIBE_TARGET=Yes; export DESCRIBE_TARGET; ${_subdir_fragment}
	@tmpdir=`mktemp -d ${TMPDIR}/readme.XXXXXX`; \
	trap 'rm -r $$tmpdir' 0 1 2 3 13 15; \
	cd ${.CURDIR} && ${MAKE} TMPDIR=$$tmpdir \
		${READMES_TOP}/${PKGPATH}/README.html

${READMES_TOP}/${PKGPATH}/README.html:
	@mkdir -p ${@D}
	@>${TMPDIR}/subdirs
.for d in ${_FULLSUBDIR}
	@subdir=$d; DESCRIBE_TARGET=yes; export DESCRIBE_TARGET; \
	${_flavor_fragment}; \
	name=`eval $$toset ${MAKE} _print-packagename`; \
	case $$name in \
		README) comment='';; \
		*) comment=`eval $$toset ${MAKE} show=_COMMENT|sed -e 's,^",,' -e 's,"$$,,' |${HTMLIFY}`;; \
	esac; \
	cd ${.CURDIR}; \
	echo "<dt><a href=\"${PKGDEPTH}$$dir/$$name.html\">$d</a><dd>$$comment" >>${TMPDIR}/subdirs
.endfor
	@sed -e 's%%CATEGORY%%'`echo ${.CURDIR} | sed -e 's.*/\([^/]*\)$$\1'`'g' \
		-e '/%%DESCR%%/r${.CURDIR}/pkg/DESCR' -e '//d' \
		-e '/%%SUBDIR%%/r${TMPDIR}/subdirs' -e '//d' \
		${README} > $@
	@rm ${TMPDIR}/subdirs

_print-packagename:
	@echo "README"

.PHONY: all fetch package fake extract configure \
	build describe distclean deinstall install update \
	reinstall checksum show verbose-show dump-vars fetch-makefile \
	link-categories unlink-categories regress lib-depends-check \
	newlib-depends-check \
	homepage-links manpages-check license-check \
	all-dir-depends build-dir-depends run-dir-depends regress-dir-depends \
	clean readmes _print-packagename print-package-signature

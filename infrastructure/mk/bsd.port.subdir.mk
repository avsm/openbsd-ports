#	from: @(#)bsd.subdir.mk	5.9 (Berkeley) 2/1/91
#	$OpenBSD: bsd.port.subdir.mk,v 1.46 2002/04/17 15:58:48 espie Exp $
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
#	install, package, readmes, realinstall, deinstall, reinstall,
#	tags
#

# recent /usr/share/mk/* should include bsd.own.mk, guard for older versions
.if !defined(BSD_OWN_MK)
.  include <bsd.own.mk>
.endif

.if defined(show)
.MAIN: show
.elif defined(clean)
.MAIN: clean
.else
.MAIN: all
.endif

.if !defined(DEBUG_FLAGS)
STRIP?=	-s
.endif

.if !defined(OPSYS)	# XXX !!
OPSYS=	OpenBSD
.endif

.if !defined(PKGPATH)
_PORTSDIR!=	cd ${PORTSDIR} && pwd -P
_CURDIR!=	cd ${.CURDIR} && pwd -P
.  if ${_PORTSDIR} == ${_CURDIR}
PKGPATH=
.  else
PKGPATH=${_CURDIR:S,${_PORTSDIR}/,,}
.  endif
.endif
.if empty(PKGPATH)
_SEP=
.else
_SEP=/
.endif

ECHO_MSG?=	echo

RECURSIVE_FETCH_LIST?=	No

REPORT_PROBLEM?=exit 1

# Need an actual list of all subdirs to complete SKIPPED
_ALL_SUBDIR:=${SUBDIR}
SKIPPED=
.if defined(DUDS)
.  for i in ${DUDS:S/:/,/}
SKIPPED+=${_ALL_SUBDIR:M$i}
SUBDIR:=${SUBDIR:N$i}
.  endfor
.endif

_SUBDIRUSE: .USE
.  for i in ${SKIPPED}
	@echo "===> ${PKGPATH}${_SEP}$i skipped"
.  endfor
	@for dir in ${SUBDIR}; do \
	    multi=''; flavor=''; sawflavor=false; toset=''; \
	    case "$$dir" in \
	    *[,:]*) \
		IFS=',:'; first=true; insert=''; for i in $$dir; do \
		    if $$first; then \
			dir=$$i; first=false; \
		    else \
			case X"$$i" in \
			X-*) \
			    multi="$$i";; \
			*) \
			    sawflavor=true; \
			    flavor="$$flavor$$insert$$i"; \
			    insert=' ';; \
			esac \
		    fi; \
		done; unset IFS; \
		case X$$multi in "X");; *) \
		    toset="$$toset SUBPACKAGE=\"$$multi\"";; \
		esac; \
	    esac; \
	    if $$sawflavor; then \
		toset="$$toset FLAVOR=\"$$flavor\""; \
		display=" ($$flavor)"; \
	    else \
	    	display=''; \
	    fi; \
	    if cd ${.CURDIR}/$${dir}.${MACHINE} 2>/dev/null; then \
		edir=$${dir}.${MACHINE}; \
	    elif cd ${.CURDIR}/$${dir} 2>/dev/null; then \
		edir=$${dir}; \
	    else \
		${ECHO_MSG} "===> ${PKGPATH}${_SEP}$${dir} non-existent"; \
		${REPORT_PROBLEM}; \
		continue; \
	    fi; \
	    ${ECHO_MSG} "===> ${PKGPATH}${_SEP}$${edir}$$display"; \
	    set +e; \
	    if eval  $$toset \
		PKGPATH=${PKGPATH}${_SEP}$$edir \
		RECURSIVE_FETCH_LIST=${RECURSIVE_FETCH_LIST} \
		${MAKE} ${.TARGET:realinstall=install}; \
	    then :; else ${REPORT_PROBLEM}; fi; \
	    set -e; \
	done

${SUBDIR}::
	@if test -d ${.TARGET}.${MACHINE}; then \
		cd ${.CURDIR}/${.TARGET}.${MACHINE}; \
	else \
		cd ${.CURDIR}/${.TARGET}; \
	fi; \
	${MAKE} all

.for __target in all fetch fetch-list package fake extract configure \
		 build clean depend describe distclean deinstall \
		 reinstall tags checksum mirror-distfiles list-distfiles \
		 show obj fetch-makefile all-packages cdrom-packages \
		 dir-depends package-dir-depends \
		 ftp-packages packageinstall link-categories \
		 unlink-categories regress lib-depends-check \
		 homepage-links manpages-check

.if !target(${__target})
${__target}: _SUBDIRUSE
.endif
.endfor

.if !target(install)
.if !target(beforeinstall)
beforeinstall:
.endif
.if !target(afterinstall)
afterinstall:
.endif
install: afterinstall
afterinstall: realinstall
realinstall: beforeinstall _SUBDIRUSE
.endif

.if !target(readmes)
readmes: readme _SUBDIRUSE
.endif

.if !target(readme)
readme:
	@rm -f README.html
	@make README.html
.endif

.if (${OPSYS} == "NetBSD")
PORTSDIR ?= /usr/opt
.else
PORTSDIR ?= /usr/ports
.endif
TEMPLATES ?= ${PORTSDIR}/infrastructure/templates
.if defined(PORTSTOP)
README=	${TEMPLATES}/README.top
.else
README=	${TEMPLATES}/README.category
.endif

README.html:
	@> $@.tmp
.for entry in ${SUBDIR}
	@echo -n '<dt><a href="'${entry}/README.html'">'"`cd ${entry} && make package-name 2>/dev/null||echo ${entry}`</a><dd>" >> $@.tmp
.if exists(${entry}/pkg/COMMENT)
	@cat ${entry}/pkg/COMMENT >> $@.tmp
.else
	@echo "(no description)" >> $@.tmp
.endif
.endfor
	@sort -t '>' +1 -2 $@.tmp > $@.tmp2
	@cat ${README} | \
		sed -e 's%%CATEGORY%%'`echo ${.CURDIR} | sed -e 's.*/\([^/]*\)$$\1'`'g' \
			-e '/%%DESCR%%/r${.CURDIR}/pkg/DESCR' -e '//d' \
			-e '/%%SUBDIR%%/r$@.tmp2' -e '//d' \
		> $@
	@rm -f $@.tmp $@.tmp2

.PHONY: all fetch fetch-list package extract configure build clean depend \
	describe distclean deinstall reinstall tags checksum mirror-distfiles \
	list-distfiles obj show readmes readme \
	beforeinstall afterinstall install realinstall fake \
	all-packages cdrom-packages ftp-packages packageinstall \
	link-categories unlink-categories dir-depends package-dir-depends \
	regress lib-depends-check homepage-links manpages-check

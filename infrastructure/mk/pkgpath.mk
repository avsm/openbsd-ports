# $OpenBSD: pkgpath.mk,v 1.36 2011/09/24 07:36:02 espie Exp $
# ex:ts=4 sw=4 filetype=make:
#	pkgpath.mk - 2003 Marc Espie
#	This file is in the public domain.

# definitions common to bsd.port.mk and bsd.port.subdir.mk

PORTSDIR_PATH ?= ${PORTSDIR}:${PORTSDIR}/mystuff
TMPDIR ?= /tmp
READMES_TOP ?= ${PORTSDIR}
DANGEROUS ?= No
LOCKDIR ?= ${TMPDIR}/portslocks


.if !defined(PKGPATH)
PKGPATH != PORTSDIR_PATH=${PORTSDIR_PATH} \
	perl ${PORTSDIR}/infrastructure/bin/getpkgpath ${.CURDIR}
.  if empty(PKGPATH)
ERRORS += "Fatal: can't figure out PKGPATH"
PKGPATH =${.CURDIR}
.  endif
.endif
.if empty(PKGPATH)
PKGDEPTH =
.else
PKGDEPTH = ${PKGPATH:C|[^./][^/]*|..|g}/
.endif

# Code to invoke to split dir,-multi,flavor

_pflavor_fragment = \
	unset FLAVOR SUBPACKAGE || true; \
	multi=''; flavor=''; space=''; sawflavor=$${_fullpath}; \
	reported=false; found_dir=false; \
	case "$$subdir" in \
	"") \
		echo 1>&2 ">> Broken dependency: empty directory $$extra_msg"; \
		reported=true;; \
	*,*) \
		esubdir=$$subdir,; IFS=,; first=true; \
		for i in $$esubdir; do \
			if $$first; then \
				dir=$$i; first=false; \
			else \
				case X"$$i" in \
					X-*) \
						multi="$$i";; \
					,) \
						sawflavor=true;; \
					*) \
						sawflavor=true; \
						flavor="$$flavor$$space$$i"; \
						space=' ';; \
				esac \
			fi; \
		done; \
		unset IFS;; \
	*) \
		dir=$$subdir;; \
	esac; \
	toset="PKGPATH=$$dir ARCH=${ARCH}"; \
	case X$$multi in "X");; *) \
		toset="$$toset SUBPACKAGE=\"$$multi\"";; \
	esac; \
	if $$sawflavor; then \
		toset="$$toset FLAVOR=\"$$flavor\""; \
	fi; \
	if ! $$reported; then \
		IFS=:; bases=${PORTSDIR_PATH}; \
		for base in $$bases; do \
			cd $$base 2>/dev/null || continue; \
			if [ -L $$dir ]; then \
				echo 1>&2 ">> Broken dependency: $$base/$$dir is a symbolic link $$extra_msg"; \
				reported=true; \
				break; \
			fi; \
			if cd $$dir 2>/dev/null; then \
				found_dir=true; \
				break; \
			fi; \
		done; unset IFS; \
	fi; \
	$$found_dir || $$reported || \
	    echo 1>&2 ">> Broken dependency: $$dir non existent $$extra_msg"; \
	$$found_dir

_flavor_fragment = _fullpath=false; ${_pflavor_fragment}

_depfile_fragment = \
	case X$${_DEPENDS_FILE} in \
		X) _DEPENDS_FILE=`mktemp /tmp/depends.XXXXXXXXX|| exit 1`; \
		export _DEPENDS_FILE; \
		trap "rm -f $${_DEPENDS_FILE}" 0 1 2 3 13 15;; \
	esac

HTMLIFY =	sed -e 's/&/\&amp;/g' -e 's/>/\&gt;/g' -e 's/</\&lt;/g'

_MAKE = cd ${.CURDIR} && exec ${MAKE}
_SUDOMAKE = cd ${.CURDIR} && exec ${SUDO} ${MAKE}
_MAKESYS = cd ${.CURDIR} && exec ${_SYSTRACE_CMD} ${MAKE}
_SUDOMAKESYS = cd ${.CURDIR} && exec ${SUDO} ${_SYSTRACE_CMD} ${MAKE}

REPORT_PROBLEM_LOGFILE ?=
.if !empty(REPORT_PROBLEM_LOGFILE)
REPORT_PROBLEM ?= echo "$$subdir ($@)">>${REPORT_PROBLEM_LOGFILE}
.else
REPORT_PROBLEM ?= exit 1
.endif

_recursive_targets = \
	all build checksum configure deinstall distclean extract fake fetch \
	fetch-all fetch-makefile full-all-depends full-build-depends \
	full-regress-depends full-run-depends \
	install install-all lib-depends-check \
	license-check link-categories manpages-check package patch \
	port-lib-depends-check prepare print-package-signature repackage \
	regress reinstall \
	unlink-categories update update-or-install update-or-install-all \
	describe dump-vars homepage-links print-plist print-plist-all \
	print-plist-all-with-depends print-plist-contents print-plist-libs \
	print-plist-with-depends show verbose-show show-size show-fake-size \
	check-register check-register-all

_dangerous_recursive_targets = \
	makesum plist update-patches update-plist

_recursive_depends_targets = \
	all-dir-depends build-dir-depends regress-dir-depends run-dir-depends


# $OpenBSD: pkgpath.mk,v 1.1 2003/08/02 09:53:27 espie Exp $
#	pkgpath.mk - 2003 Marc Espie
#	This file is in the public domain.

# definitions common to bsd.port.mk and bsd.port.subdir.mk

.if !defined(PKGPATH)
_PORTSDIR!=	cd ${PORTSDIR} && pwd -P
_CURDIR!=	cd ${.CURDIR} && pwd -P
PKGPATH=${_CURDIR:S,${_PORTSDIR}/,,}
.endif
.if empty(PKGPATH)
PKGDEPTH=
.else
PKGDEPTH=${PKGPATH:C|[^./][^/]*|..|g}/
.endif

# Code to invoke to split dir,-multi,flavor

_flavor_fragment= \
	multi=''; flavor=''; space=''; sawflavor=false; \
	case "$$dir" in \
	*,*) \
		IFS=,; first=true; for i in $$dir; do \
			if $$first; then \
				dir=$$i; first=false; \
			else \
				case X"$$i" in \
					X-*) \
						multi="$$i";; \
					*) \
						sawflavor=true; \
						flavor="$$flavor$$space$$i"; \
						space=' ';; \
				esac \
			fi; \
		done; unset IFS;; \
	esac; \
	toset="PKGPATH=$$dir"; \
	case X$$multi in "X");; *) \
		toset="$$toset SUBPACKAGE=\"$$multi\"";; \
	esac; \
	if $$sawflavor; then \
		toset="$$toset FLAVOR=\"$$flavor\""; \
	fi; \
	cd ${PORTSDIR}; \
	if [ -L $$dir ]; then \
		echo 1>&2 ">> Broken dependency: $$dir is a symbolic link"; \
		exit 1; \
	fi; \
	if cd $$dir 2>/dev/null || cd mystuff/$$dir 2>/dev/null; then \
		:; \
	else \
		echo 1>&2 ">> Broken dependency: $$dir non existent"; \
		exit 1; \
	fi

HTMLIFY=	sed -e 's/&/\&amp;/g' -e 's/>/\&gt;/g' -e 's/</\&lt;/g'


# $OpenBSD: mono.port.mk,v 1.3 2008/10/24 14:49:44 robert Exp $

CATEGORIES+=		lang/mono

MAKE_FLAGS+=		MONO_SHARED_DIR=/tmp

# A list of files where we have to remove the stupid hardcoded .[0-9] major
# version from library names. 
DLLMAP_FILES?=

post-configure:
	@for i in ${DLLMAP_FILES}; do \
		perl -pi -e "s,.so.[0-9],.so,g" ${WRKSRC}/$$i; done

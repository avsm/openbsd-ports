# $OpenBSD: Makefile,v 1.100 2011/10/23 09:51:56 stsp Exp $

COMMENT-main=		subversion revision control system
COMMENT-perl=		perl interface to subversion
COMMENT-python=		python interface to subversion
COMMENT-ruby=		ruby interface to subversion
COMMENT-ap2=		apache2 subversion modules

VERSION=		1.7.1
DISTNAME=		subversion-${VERSION}
PKGNAME-main=		${DISTNAME}
FULLPKGNAME-perl=	p5-SVN-${VERSION}
FULLPKGPATH-perl=	devel/subversion,-perl
FULLPKGNAME-python=	py-subversion-${VERSION}
FULLPKGPATH-python=	devel/subversion,-python
FULLPKGNAME-ruby=	ruby-subversion-${VERSION}
FULLPKGPATH-ruby=	devel/subversion,-ruby
FULLPKGNAME-ap2=	ap2-subversion-${VERSION}
FULLPKGPATH-ap2=	devel/subversion,-ap2

SO_VERSION=	1.3
SVN_LIBS=	svn_client-1 svn_delta-1 svn_diff-1 svn_fs-1 \
		svn_fs_base-1 svn_fs_fs-1 svn_fs_util-1 svn_ra-1 svn_ra_neon-1 \
		svn_ra_local-1 svn_ra_neon-1 svn_ra_svn-1 svn_repos-1 svn_subr-1 svn_wc-1
.for _lib in ${SVN_LIBS} svn_swig_perl-1 svn_swig_py-1 svn_swig_ruby-1
SHARED_LIBS+=	${_lib} ${SO_VERSION}
.endfor

CATEGORIES=	devel

HOMEPAGE=	http://subversion.apache.org

MAINTAINER=	Stefan Sperling <stsp@openbsd.org>

# BSD alike + Apache License 2.0
PERMIT_PACKAGE_CDROM=	Yes
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

MASTER_SITES=	${MASTER_SITE_APACHE:=subversion/}
EXTRACT_SUFX=	.tar.bz2

PSEUDO_FLAVORS=	no_bindings no_ap2
FLAVORS=	gnome_keyring
FLAVOR?=

MODULES=	devel/gettext lang/python
USE_GROFF =	Yes

WANTLIB=	expat db magic z


# autogen.sh checks for libtoolize
BUILD_DEPENDS=	${MODGNU_AUTOCONF_DEPENDS} \
		devel/libtool

MULTI_PACKAGES=	-main

MAINSPEC =	${PKGNAME}:devel/subversion,-main
LIB_DEPENDS-main = ${LIB_DEPENDS} \
		net/neon>=0.26.2 \
		devel/apr \
		devel/apr-util \
		security/cyrus-sasl2 \
		databases/sqlite3 \
		devel/libmagic

WANTLIB-main=	${WANTLIB} asn1 c crypto gssapi krb5 ssl \
		neon>=26 apr-1 aprutil-1 sasl2>=2 sqlite3
RUN_DEPENDS-main= ${MODGETTEXT_RUN_DEPENDS}

TOOLS_HOOK_SCRIPTS=	commit-access-control.cfg.example \
	commit-access-control.pl commit-email.rb \
	log-police.py svn2feed.py svnperms.conf.example \
	svnperms.py verify-po.py
# There's also 'mailer', but we handle it separately, see post-install

TOOLS_CLIENT_SIDE_SCRIPTS=	bash_completion change-svn-wc-format.py \
	server-version.py showchange.pl svn-graph.pl

.if !${FLAVOR:L:Mno_ap2}
MULTI_PACKAGES+=	-ap2
WANTLIB-ap2=		${WANTLIB} apr-1 aprutil-1 sqlite3
LIB_DEPENDS-ap2=	${MODGETTEXT_LIB_DEPENDS} ${MAINSPEC}
.  for _lib in svn_delta-1 svn_fs-1 svn_fs_base-1 svn_fs_fs-1 \
	svn_fs_util-1 svn_repos-1 svn_subr-1
WANTLIB-ap2 +=	${_lib}>=${SO_VERSION}
.  endfor
BUILD_DEPENDS+=		www/apache-httpd
RUN_DEPENDS-ap2=	www/apache-httpd
.endif

.if !${FLAVOR:L:Mno_bindings}
MULTI_PACKAGES+=-perl -python -ruby
SHARED_ONLY=	Yes

WANTLIB-perl=		${WANTLIB} apr-1 aprutil-1 sqlite3
RUN_DEPENDS-perl=	${MODGETTEXT_RUN_DEPENDS}
LIB_DEPENDS-perl=	${MODGETTEXT_LIB_DEPENDS} ${MAINSPEC}
.  for _lib in svn_diff-1 svn_ra-1 svn_delta-1 svn_subr-1 svn_fs-1 \
	svn_repos-1 svn_wc-1 svn_client-1
WANTLIB-perl +=	${_lib}>=${SO_VERSION}
.  endfor

WANTLIB-python=		${WANTLIB} apr-1 aprutil-1 asn1 crypto gssapi \
			krb5 neon sasl2 sqlite3 ssl ${MODPY_WANTLIB}
RUN_DEPENDS-python=	${MODPY_RUN_DEPENDS}
LIB_DEPENDS-python=	${MODPY_LIB_DEPENDS} ${MODGETTEXT_LIB_DEPENDS} \
			${MAINSPEC}
.  for _lib in ${SVN_LIBS}
WANTLIB-python +=	${_lib}>=${SO_VERSION}
.  endfor

WANTLIB-ruby=		${WANTLIB} apr-1 aprutil-1 asn1 crypto gssapi \
			krb5 m neon sasl2 sqlite3 ssl ${MODRUBY_WANTLIB}
RUN_DEPENDS-ruby=	${MODRUBY_RUN_DEPENDS}
LIB_DEPENDS-ruby=	${MODRUBY_LIB_DEPENDS} \
			${MODGETTEXT_LIB_DEPENDS} ${MAINSPEC}
.  for _lib in ${SVN_LIBS}
WANTLIB-ruby +=	${_lib}>=${SO_VERSION}
.  endfor

MODULES+=	lang/ruby
BUILD_DEPENDS+=	devel/swig>=1.3.36
.endif

.if ${FLAVOR:L:Mgnome_keyring}
SHARED_ONLY=	Yes
MODULES+=	converters/libiconv
LIB_DEPENDS-main += 	x11/dbus \
			devel/glib2 \
			x11/gnome/libgnome-keyring \
			devel/pcre \
			${MODGETTEXT_LIB_DEPENDS}
WANTLIB-main+=	apr-1 aprutil-1 gcrypt gpg-error \
		dbus-1>=7 glib-2.0 gnome-keyring>=6 pcre>=2
SHARED_LIBS+=	svn_auth_gnome_keyring-1 ${SO_VERSION}
# gnome-keyring depends on dbus depends on pthread, so svn won't be able
# to load libsvn_auth_gnome_keyring without the main executable being compiled
# and linked with -pthread. We want to avoid this as it causes problems with
# our current threading implementation (which has to force stdin/stdout to
# be non-blocking). As this affects -main it must be a FLAVOR.
WANTLIB-main+=	pthread
CFLAGS+=	-pthread
.endif

MAKE_FLAGS=	MAKE=${MAKE_PROGRAM}
USE_LIBTOOL=	Yes
AUTOCONF_VERSION=2.64
CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	PYTHON2=${MODPY_BIN} MKDIR="/bin/mkdir -p"
CONFIGURE_ARGS+=${CONFIGURE_SHARED} \
		--with-sasl=${LOCALBASE} \
		--without-jikes \
		--without-jdk \
		--with-libmagic=${LOCALBASE}
.if !${FLAVOR:L:Mno_bindings}
CONFIGURE_ARGS+=--with-swig
CONFIGURE_ENV+=	RUBY=ruby${MODRUBY_BINREV} RDOC=rdoc${MODRUBY_BINREV}
.else
CONFIGURE_ARGS+=--without-swig
.endif

.if !${FLAVOR:L:Mno_ap2}
CONFIGURE_ARGS+=--with-apxs=${LOCALBASE}/sbin/apxs2 \
		--disable-mod-activation
.else
CONFIGURE_ARGS+=--without-apxs
.endif

REGRESS_DEPENDS=${MODPY_RUN_DEPENDS}
SUBST_VARS+=	LOCALBASE SO_VERSION

pre-patch:
	@ln -s ${MODPY_BIN} ${WRKDIR}/bin/python

pre-configure:
	@${SUBST_CMD} ${WRKSRC}/Makefile.in ${WRKSRC}/configure.ac \
		${WRKSRC}/subversion/libsvn_subr/auth.c
	@cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} \
		AUTOCONF_VERSION=${AUTOCONF_VERSION} ./autogen.sh

.if ${FLAVOR:L:Mgnome_keyring}
CONFIGURE_ARGS+=--with-gnome-keyring
.endif

.if !${FLAVOR:L:Mno_bindings}
REGRESS_DEPENDS+=	${FULLPKGNAME-python}:devel/subversion,-python \
			${FULLPKGNAME-ruby}:devel/subversion,-ruby

pre-build:
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${MAKE_FLAGS} clean-swig
.endif

post-build:
.if !${FLAVOR:L:Mno_bindings}
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${MAKE_FLAGS} swig-py
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${MAKE_FLAGS} swig-pl
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${MAKE_FLAGS} swig-rb
.endif
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${MAKE_FLAGS} svnmucc
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${MAKE_FLAGS} svnauthz-validate
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${MAKE_FLAGS} svn-populate-node-origins-index

do-regress:
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_REGRESS_FLAGS} check FS_TYPE=bdb
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_REGRESS_FLAGS} check FS_TYPE=fsfs
.if !${FLAVOR:L:Mno_bindings}
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_REGRESS_FLAGS} TMPDIR=${WRKBUILD} check-swig-pl
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_REGRESS_FLAGS} check-swig-py
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_REGRESS_FLAGS} check-swig-rb
.endif

post-install:
.if !${FLAVOR:L:Mno_bindings}
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_FAKE_FLAGS} install-swig-py
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_FAKE_FLAGS} install-swig-pl
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_FAKE_FLAGS} install-swig-rb
.endif
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/
	${INSTALL_DATA} ${FILESDIR}/servers \
			${PREFIX}/share/examples/subversion/servers
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/client-side
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/server-side
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/hook-scripts
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/cgi
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/client-side/emacs
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/client-side/svn2cl
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/client-side/svn_load_dirs
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/hook-scripts/mailer
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/hook-scripts/mailer/tests
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/hook-scripts/enforcer
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/server-side/mod_dontdothat
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/xslt
	@cd ${WRKBUILD} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_FAKE_FLAGS} install-tools
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/backup
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/bdb
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/subversion/xslt
	${INSTALL_DATA} ${WRKBUILD}/tools/backup/hot-backup.py \
			${PREFIX}/share/examples/subversion/backup
	${INSTALL_DATA} ${WRKSRC}/tools/bdb/* \
		${PREFIX}/share/examples/subversion/bdb
	${INSTALL_DATA} ${WRKSRC}/tools/examples/* \
		${PREFIX}/share/examples/subversion
.for _script in ${TOOLS_CLIENT_SIDE_SCRIPTS}
	${INSTALL_DATA} ${WRKSRC}/tools/client-side/${_script} \
			${PREFIX}/share/examples/subversion/client-side
.endfor
	${INSTALL_DATA} ${WRKSRC}/tools/server-side/fsfs-reshard.py \
			${PREFIX}/share/examples/subversion/server-side
	${INSTALL_DATA} ${WRKSRC}/tools/server-side/svn-backup-dumps.py \
			${PREFIX}/share/examples/subversion/server-side
	${INSTALL_PROGRAM} ${WRKSRC}/tools/server-side/svn-populate-node-origins-index.c \
		${PREFIX}/share/examples/subversion/server-side
	${INSTALL_DATA} ${WRKSRC}/tools/xslt/* \
		${PREFIX}/share/examples/subversion/xslt
.for _hook_script in ${TOOLS_HOOK_SCRIPTS}
	${INSTALL_DATA} ${WRKSRC}/tools/hook-scripts/${_hook_script} \
			${PREFIX}/share/examples/subversion/hook-scripts/
.endfor
	${INSTALL_DATA} ${WRKSRC}/tools/hook-scripts/mailer/mailer.conf.example \
			${PREFIX}/share/examples/subversion/hook-scripts/mailer
	${INSTALL_DATA} ${WRKSRC}/tools/hook-scripts/mailer/mailer.conf.example \
			${PREFIX}/share/examples/subversion/hook-scripts/mailer
	${INSTALL_DATA} ${WRKSRC}/tools/hook-scripts/mailer/mailer.py \
			${PREFIX}/share/examples/subversion/hook-scripts/mailer
	${INSTALL_DATA} ${WRKSRC}/tools/hook-scripts/mailer/tests/* \
			${PREFIX}/share/examples/subversion/hook-scripts/mailer/tests
	find ${PREFIX}/share/examples/subversion -type f | xargs perl -pi \
		-e "s,.*/usr/bin/python.*,#!${MODPY_BIN},;" \
		-e "s,.*env python.*,#!${MODPY_BIN},;"
	find ${PREFIX}/share/examples/subversion -type f -name '*\.orig' \
		-exec rm -f {} \;

.include <bsd.port.mk>

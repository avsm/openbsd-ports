--- aclocal.m4.orig	Tue Jun 26 13:53:06 2001
+++ aclocal.m4	Tue Jun 26 13:53:59 2001
@@ -4628,19 +4628,7 @@
   ;;
 
 openbsd* )
-  if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
-    case "$host_cpu" in
-    i*86 )
-      changequote(,)dnl
-      lt_cv_deplibs_check_method='file_magic OpenBSD/i[3-9]86 demand paged shared library'
-      changequote([, ])dnl
-      lt_cv_file_magic_cmd=/usr/bin/file
-      lt_cv_file_magic_test_file=`echo /usr/lib/libc.so.*`
-      ;;
-    esac
-  else
-    lt_cv_deplibs_check_method=pass_all
-  fi
+  lt_cv_deplibs_check_method=pass_all
   ;;
 
 osf3* | osf4* | osf5*)

$OpenBSD: patch-inc_config.h,v 1.2 2001/07/29 19:29:48 brad Exp $
--- inc/config.h.orig	Tue Jul  2 10:32:27 1996
+++ inc/config.h	Sun Jul 29 15:24:46 2001
@@ -13,9 +13,9 @@
 /*efine HAS_SYSV_SIGNAL	1		/* sigs not blocked/reset?	*/
 
 #define	HAS_STDLIB_H	1		/* /usr/include/stdlib.h	*/
-/*efine	HAS_LIMITS_H	1		/* /usr/include/limits.h	*/
+#define HAS_LIMITS_H    1               /* /usr/include/limits.h        */
 #define	HAS_FCNTL_H	1		/* /usr/include/fcntl.h		*/
-/*efine	HAS_ERRNO_DECL	1		/* errno.h declares errno	*/
+#define HAS_ERRNO_DECL  1               /* errno.h declares errno       */
 
 #define	HAS_FSTAT 	1		/* fstat syscall		*/
 #define	HAS_FCHMOD 	1		/* fchmod syscall		*/
@@ -28,8 +28,8 @@
 /*efine	HAS_STRINGS_H	1		/* /usr/include/strings.h 	*/
 
 #define	HAS_UNISTD_H	1		/* /usr/include/unistd.h	*/
-#define	HAS_UTIME	1		/* POSIX utime(path, times)	*/
-/*efine	HAS_UTIMES	1		/* use utimes()	syscall instead	*/
+/*efine HAS_UTIME       1               /* POSIX utime(path, times)     */
+#define	HAS_UTIMES	1		/* use utimes()	syscall instead	*/
 #define	HAS_UTIME_H	1		/* UTIME header file		*/
 /*efine	HAS_UTIMBUF	1		/* struct utimbuf		*/
 /*efine	HAS_UTIMEUSEC   1		/* microseconds in utimbuf?	*/

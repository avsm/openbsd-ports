--- esd.h.orig	Sun Aug  6 04:42:18 2000
+++ esd.h	Sun Aug  6 04:43:12 2000
@@ -7,8 +7,15 @@
 #endif
 
 /* path and name of the default EsounD domain socket */
+#if 0
 #define ESD_UNIX_SOCKET_DIR	"/tmp/.esd"
 #define ESD_UNIX_SOCKET_NAME	ESD_UNIX_SOCKET_DIR ## "/" ## "socket"
+#else
+char *esd_unix_socket_dir(void);
+char *esd_unix_socket_name(void);
+#define	ESD_UNIX_SOCKET_DIR	esd_unix_socket_dir()
+#define	ESD_UNIX_SOCKET_NAME	esd_unix_socket_name()
+#endif
 
 /* length of the audio buffer size */
 #define ESD_BUF_SIZE (4 * 1024)

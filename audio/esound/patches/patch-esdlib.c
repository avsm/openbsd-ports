--- esdlib.c.orig	Sun Aug  6 04:49:10 2000
+++ esdlib.c	Sun Aug  6 04:51:37 2000
@@ -19,6 +19,8 @@
 #include <arpa/inet.h>
 #include <errno.h>
 #include <sys/wait.h>
+#include <pwd.h>
+#include <limits.h>
 
 #include <sys/un.h>
 
@@ -1421,4 +1423,34 @@
     */
 
     return close( esd );
+}
+
+char *
+esd_unix_socket_dir(void) {
+	static char *sockdir = NULL, sockdirbuf[PATH_MAX];
+	struct passwd *pw;
+
+	if (sockdir != NULL)
+		return (sockdir);
+	pw = getpwuid(getuid());
+	if (pw == NULL || pw->pw_dir == NULL) {
+		fprintf(stderr, "esd: could not find home directory\n");
+		exit(1);
+	}
+	snprintf(sockdirbuf, sizeof(sockdirbuf), "%s/.esd", pw->pw_dir);
+	endpwent();
+	sockdir = sockdirbuf;
+	return (sockdir);
+}
+
+char *
+esd_unix_socket_name(void) {
+	static char *sockname = NULL, socknamebuf[PATH_MAX];
+
+	if (sockname != NULL)
+		return (sockname);
+	snprintf(socknamebuf, sizeof(socknamebuf), "%s/socket",
+	    esd_unix_socket_dir());
+	sockname = socknamebuf;
+	return (sockname);
 }

--- delay.c.orig	Fri Dec 31 02:04:36 1999
+++ delay.c	Fri Dec 31 02:05:34 1999
@@ -17,6 +17,7 @@
 */
 
 #include <stdio.h>
+#include <stdlib.h>
 #include <time.h>
 #include <sys/time.h>
 #include <unistd.h>
@@ -351,7 +352,7 @@
 	if (cmd) {
 		execvp(cmd[0], cmd);
 		perror(argv[0]); /* If it worked, we won't get here. */
-		exit -1;
+		exit(-1);
 	}
 	
 	exit(0);

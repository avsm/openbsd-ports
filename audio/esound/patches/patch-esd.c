--- esd.c.orig	Sun Aug  6 04:43:42 2000
+++ esd.c	Sun Aug  6 04:47:49 2000
@@ -219,12 +219,12 @@
 	{	
 	  mkdir(ESD_UNIX_SOCKET_DIR,
 		S_IRUSR|S_IWUSR|S_IXUSR|
-		S_IRGRP|S_IWGRP|S_IXGRP|
-		S_IROTH|S_IWOTH|S_IXOTH);
+		S_IRGRP|S_IXGRP|
+		S_IROTH|S_IXOTH);
 	  chmod(ESD_UNIX_SOCKET_DIR,
 		S_IRUSR|S_IWUSR|S_IXUSR|
-		S_IRGRP|S_IWGRP|S_IXGRP|
-		S_IROTH|S_IWOTH|S_IXOTH);
+		S_IRGRP|S_IXGRP|
+		S_IROTH|S_IXOTH);
 	}
       if (access(ESD_UNIX_SOCKET_NAME, R_OK | W_OK) == -1)
 	{
@@ -317,9 +317,9 @@
       /* let anyone access esd's socket - but we have authentication so they */
       /* wont get far if they dont have the auth key */
       chmod(ESD_UNIX_SOCKET_NAME, 
-	    S_IRUSR|S_IWUSR|S_IXUSR|
-	    S_IRGRP|S_IWGRP|S_IXGRP|
-	    S_IROTH|S_IWOTH|S_IXOTH);
+	    S_IRUSR|S_IWUSR|
+	    S_IRGRP|
+	    S_IROTH);
     }
     if (listen(socket_listen,16)<0)
     {

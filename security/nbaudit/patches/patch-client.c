# patch from palante@subterrain.net

--- client.c.orig	Tue Jul 11 16:01:35 2000
+++ client.c	Tue Jul 11 16:03:20 2000
@@ -3612,8 +3612,9 @@ phase_3:				/* smb session setup/auth */
   done = 0;
   username[0] = '\0';
   while (!done) {
-    if (!userfd || !passfd)
-       uppair();
+    if (!userfd || !passfd) {
+			if (!uppair()) done++;
+		}
     else {
        if (fgets(password, sizeof(password), passfd) == NULL) {
           rewind(passfd);
@@ -3635,8 +3636,9 @@ phase_3:				/* smb session setup/auth */
        }
     }
 
-    if ((! *username) && (! *password))
-      uppair();				/* sleaze for NT */
+    if ((! *username) && (! *password)) {
+			if (!uppair()) done++;
+		}
 
 #ifdef VERBOSE
   natprintf("[*]--- Attempting to connect with Username: `%s' Password: `%s'\n",

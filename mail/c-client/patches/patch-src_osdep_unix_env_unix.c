$OpenBSD: patch-src_osdep_unix_env_unix.c,v 1.3.2.1 2002/01/16 23:52:07 brad Exp $
--- src/osdep/unix/env_unix.c.orig	Wed Oct 17 23:35:20 2001
+++ src/osdep/unix/env_unix.c	Sat Nov 17 19:06:47 2001
@@ -1001,7 +1001,8 @@ long dotlock_lock (char *file,DOTLOCK *b
       }
       close (pi[0]); close (pi[1]);
     }
-    if (lockEaccesError) {	/* punt silently if paranoid site */
+    if (strncmp(base->lock,"/var/mail/",10) && lockEaccesError) {
+	/* punt silently if paranoid site */
       sprintf (tmp,"Mailbox vulnerable - directory %.80s",base->lock);
       if (s = strrchr (tmp,'/')) *s = '\0';
       strcat (tmp," must have 1777 protection");

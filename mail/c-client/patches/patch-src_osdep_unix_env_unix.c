$OpenBSD: patch-src_osdep_unix_env_unix.c,v 1.6 2002/12/01 21:15:38 jakob Exp $
--- src/osdep/unix/env_unix.c.orig	Wed Oct 30 18:06:12 2002
+++ src/osdep/unix/env_unix.c	Mon Nov 25 20:06:58 2002
@@ -773,14 +773,12 @@ char *myhomedir ()
 static char *mymailboxdir ()
 {
   char *home = myhomedir ();
-  if (!myMailboxDir && home) {	/* initialize if first time */
     if (mailsubdir) {
       char tmp[MAILTMPLEN];
       sprintf (tmp,"%s/%s",home,mailsubdir);
       myMailboxDir = cpystr (tmp);/* use pre-defined subdirectory of home */
     }
     else myMailboxDir = cpystr (home);
-  }
   return myMailboxDir ? myMailboxDir : "";
 }
 
@@ -1036,7 +1034,8 @@ long dotlock_lock (char *file,DOTLOCK *b
       }
       close (pi[0]); close (pi[1]);
     }
-    if (lockEaccesError) {	/* punt silently if paranoid site */
+    if (strncmp(base->lock,"/var/mail/",10) && lockEaccesError) {
+	/* punt silently if paranoid site */
       sprintf (tmp,"Mailbox vulnerable - directory %.80s",base->lock);
       if (s = strrchr (tmp,'/')) *s = '\0';
       strcat (tmp," must have 1777 protection");

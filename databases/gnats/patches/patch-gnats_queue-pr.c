$OpenBSD: patch-gnats_queue-pr.c,v 1.3 2002/05/09 16:16:02 millert Exp $
--- gnats/queue-pr.c.orig	Wed Nov 25 07:15:20 1998
+++ gnats/queue-pr.c	Wed May  8 21:44:36 2002
@@ -226,13 +226,10 @@ drop_msg ()
 {
   int fd[2];
   char *tmpdir;
-  char *bug_file = (char *) xmalloc (PATH_MAX);
+  char bug_file[MAXPATHLEN];
   int r; /* XXX ssize_t */
   char *buf = (char *) xmalloc (MAXBSIZE);
   char *base, *new_name;
-#ifndef HAVE_MKTEMP
-  char name[L_tmpnam];
-#endif
 
   if (queue_file)
     {
@@ -247,18 +244,13 @@ drop_msg ()
   tmpdir = getenv ("TMPDIR");
   if (tmpdir == NULL)
     tmpdir = "/tmp"; /* FIXME */
-#ifdef HAVE_MKTEMP
-  sprintf (bug_file, "%s/gnatsXXXXXX", tmpdir);
-  mktemp (bug_file);
-#else
-  tmpnam (name);
-  strcpy (bug_file, name);
-#endif
+
+  snprintf (bug_file, sizeof(bug_file), "%s/gnatsXXXXXX", tmpdir);
   
-  fd[1] = open (bug_file, O_WRONLY|O_CREAT, 0664);
-  if (fd[1] < 0)
+  if ((fd[1] = mkstemp (bug_file)) < 0)
     punt (1, "%s: can't open queue file %s for writing: %s\n",
 	  program_name, bug_file, strerror (errno));
+  fchmod (fd[1], 0644);
   
   while ((r = read (fd[0], buf, MAXBSIZE)) > 0)
     if (write (fd[1], buf, r) < 0)

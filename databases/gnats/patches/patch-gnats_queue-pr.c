$OpenBSD: patch-gnats_queue-pr.c,v 1.4 2003/08/25 23:33:56 brad Exp $
--- gnats/queue-pr.c.orig	Wed Nov 25 07:15:20 1998
+++ gnats/queue-pr.c	Wed Jul  2 13:37:12 2003
@@ -78,9 +78,11 @@ fork_gnats (filename)
 
   int pid; /* pid_t */
   int status;
+  size_t len;
 
-  safe_env[0] = (char *) xmalloc (5 + strlen (gnats_user) + 1);
-  sprintf (safe_env[0], "USER=%s", gnats_user);
+  len = 5 + strlen (gnats_user) + 1;
+  safe_env[0] = (char *) xmalloc (len);
+  snprintf (safe_env[0], len, "USER=%s", gnats_user);
 
   errno = 0;
   pid = fork();
@@ -91,10 +93,11 @@ fork_gnats (filename)
     {
       char *gnats_bin;
       int fd;
+      size_t len = strlen (bindir) + 9;
 
-      gnats_bin = (char *) xmalloc (strlen (bindir) + 9);
-      strcpy (gnats_bin, bindir);
-      strcat (gnats_bin, "/file-pr");
+      gnats_bin = (char *) xmalloc (len);
+      strlcpy (gnats_bin, bindir, len);
+      strlcat (gnats_bin, "/file-pr", len);
 
       if (! flag_debug)
 	{
@@ -114,14 +117,14 @@ fork_gnats (filename)
       if (flag_debug)
 	{
 	  if (execle (gnats_bin, "file-pr", "-f", filename,
-		      "-D", "-d", gnats_root, NULL, safe_env) < 0)
+		      "-D", "-d", gnats_root, (char *)NULL, safe_env) < 0)
 	    punt (1, "%s: execle of gnats failed: %s\n", program_name,
 		  strerror (errno));
 	}
       else
 	{
 	  if (execle (gnats_bin, "file-pr", "-f", filename,
-		      "-d", gnats_root, NULL, safe_env) < 0)
+		      "-d", gnats_root, (char *)NULL, safe_env) < 0)
 	    punt (1, "%s: execle of gnats failed: %s\n", program_name,
 		  strerror (errno));
 	}
@@ -204,9 +207,10 @@ run_gnats ()
 	}
       else if (child_status == 2)
 	{
-	  char *name2 = xmalloc (strlen (files[i].name) + 2);
-	  strcpy (name2, ".");
-	  strcat (name2, files[i].name);
+	  size_t len = strlen (files[i].name) + 2;
+	  char *name2 = xmalloc (len);
+	  strlcpy (name2, ".", len);
+	  strlcat (name2, files[i].name, len);
 	  rename (files[i].name, name2);
 	  punt (0, "renamed `%s' to `%s' pending human intervention.\n",
 		files[i].name, name2);
@@ -226,13 +230,11 @@ drop_msg ()
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
+  size_t len;
 
   if (queue_file)
     {
@@ -247,18 +249,13 @@ drop_msg ()
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
@@ -283,8 +280,9 @@ drop_msg ()
 
   errno = 0;
   base = basename (bug_file);
-  new_name = (char *) xmalloc (strlen (queue_dir) + 1 + strlen (bug_file) + 1);
-  sprintf (new_name, "%s/%s", queue_dir, base);
+  len = strlen (queue_dir) + 1 + strlen (bug_file) + 1;
+  new_name = (char *) xmalloc (len);
+  snprintf (new_name, len, "%s/%s", queue_dir, base);
   if (rename (bug_file, new_name) < 0)
     {
       if (errno != EXDEV)
@@ -308,6 +306,7 @@ main (argc, argv)
      char **argv;
 {
   int optc;
+  size_t len;
 
   program_name = basename (argv[0]);
 
@@ -372,10 +371,9 @@ main (argc, argv)
 	       program_name);
       exit (1);
     }
-  queue_dir = (char *) xmalloc (strlen (gnats_root)
-				+ strlen ("/gnats-queue")
-				+ 1 /* null char */);
-  sprintf (queue_dir, "%s/gnats-queue", gnats_root);
+  len = strlen (gnats_root) + strlen ("/gnats-queue") + 1 /* null char */;
+  queue_dir = (char *) xmalloc (len);
+  snprintf (queue_dir, len, "%s/gnats-queue", gnats_root);
 
   if (queue_msg)
     drop_msg ();

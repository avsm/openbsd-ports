--- b.c.orig	Fri Jan 20 03:38:25 1995
+++ b.c	Wed Jan 17 11:26:36 2001
@@ -21,6 +21,9 @@
 #include <pwd.h>
 #endif
 #include <errno.h>
+#include <sys/file.h>
+#include <sys/types.h>
+#include <sys/stat.h>
 
 #include "config.h"
 #include "blocks.h"
@@ -201,6 +204,7 @@
  if(prop) b->o=prop->o;
  else b->o=pdefault;
  mset(b->marks,0,sizeof(b->marks));
+ b->filehandle = -1;	/* initialize filehandle &&& ob */
  b->rdonly=0;
  b->orphan=0;
  b->oldcur=0;
@@ -255,6 +259,10 @@
  {
  if(b && !--b->count)
   {
+  if (b->filehandle != -1) {
+    /* close filehandle, free lock &&& ob */
+    close (b->filehandle);
+    }
   if(b->changed) abrerr(b->name);
   if(b==errbuf) errbuf=0;
   if(b->undo) undorm(b->undo);
@@ -1630,7 +1638,7 @@
    if(x==1)
     {
     char *z;
-    s=getenv("HOME");
+    s=(char *)getenv("HOME");
     z=vsncpy(NULL,0,sz(s));
     z=vsncpy(z,sLEN(z),sz(n+x));
     vsrm(n);
@@ -1671,7 +1679,8 @@
  B *b;
  long skip,amnt;
  char *n;
- int nowrite=0;
+ struct stat sb;
+ int nowrite=0,fh=-1;
 
  if(!s || !s[0])
   {
@@ -1704,6 +1713,22 @@
   else fclose(fi);
   fi=fopen(n,"r");
   if(!fi) nowrite=0;
+  
+  /* check file mod, if no write flags set, 
+     joe in read only mode. &&& ob */
+
+  if (!nowrite) { 
+    nowrite = (!stat (n, &sb)) && (!(sb.st_mode & (S_IWUSR | S_IWGRP | S_IWOTH)));
+    }
+
+  /* lock the file if writable, or go into read only mode if
+     already locked,      */
+  
+  if ((fi) && (!nowrite)) { 
+    fh = dup( fileno(fi) ); 
+    nowrite = (flock (fh, LOCK_EX | LOCK_NB));
+    }
+
   }
  joesep(n);
 
@@ -1761,6 +1786,7 @@
  vsrm(n);
 
  b->er=error;
+ if( fh != -1 ) b->filehandle = fh;
  return b;
  }
 
@@ -1990,7 +2016,18 @@
  {
  long tim=time(0);
  B *b;
- FILE *f=fopen("DEADJOE","a");
+ FILE *f;
+ struct stat sb;
+ if ((lstat("DEADJOE", &sb) == 0) && (((sb.st_mode & S_IFLNK) && (sb.st_uid != getuid())) || (sb.st_nlink > 1))) 
+  {
+  printf("*** JOE was aborted ");
+  if (sig) printf("by signal %d, cannot save DEADJOE due to unsafe symlink\n",sig);
+  else printf("because the terminal closed, cannot save DEADJOE due to unsafe symlink\n");
+  if(sig) ttclsn();
+  _exit(1);
+  }
+ f=fopen("DEADJOE","a");
+ chmod("DEADJOE", S_IRUSR | S_IWUSR);
  fprintf(f,"\n*** Modified files in JOE when it aborted on %s",ctime(&tim));
  if(sig) fprintf(f,"*** JOE was aborted by signal %d\n",sig);
  else fprintf(f,"*** JOE was aborted because the terminal closed\n");

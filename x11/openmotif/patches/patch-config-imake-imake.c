--- config/imake/imake.c.orig	Tue May  2 12:18:40 2000
+++ config/imake/imake.c	Wed Aug  9 19:29:43 2000
@@ -371,11 +371,21 @@
 
 	Imakefile = FindImakefile(Imakefile);
 	CheckImakefileC(ImakefileC);
-	if (Makefile)
-		tmpMakefile = Makefile;
-	else {
+
+	if (Makefile) {
+                tmpMakefile = Makefile;
+                if ((tmpfd = fopen(tmpMakefile, "w+")) == NULL)
+                LogFatal("Cannot create temporary file %s.", tmpMakefile);
+	} else {
+	        int fd;
 		tmpMakefile = Strdup(tmpMakefile);
-		(void) mktemp(tmpMakefile);
+ 	        fd = mkstemp(tmpMakefile);
+ 	        if (fd == -1 || (tmpfd = fdopen(fd, "w+")) == NULL) {
+ 		   if (fd != -1) {
+ 		      unlink(tmpMakefile); close(fd);
+ 		   }
+ 		   LogFatal("Cannot create temporary file %s.", tmpMakefile);
+		}
 	}
 	AddMakeArg("-f");
 	AddMakeArg( tmpMakefile );
@@ -384,9 +394,6 @@
 	sprintf(makefileMacro, "MAKEFILE=%s", Imakefile);
 	AddMakeArg( makefileMacro );
 
-	if ((tmpfd = fopen(tmpMakefile, "w+")) == NULL)
-		LogFatal("Cannot create temporary file %s.", tmpMakefile);
-
 	cleanedImakefile = CleanCppInput(Imakefile);
 	cppit(cleanedImakefile, Template, ImakefileC, tmpfd, tmpMakefile);
 
@@ -1270,8 +1277,7 @@
 		    strcmp(ptoken, "undef")) {
 		    if (outFile == NULL) {
 			tmpImakefile = Strdup(tmpImakefile);
-			(void) mktemp(tmpImakefile);
-			outFile = fopen(tmpImakefile, "w");
+			outFile = mkstemp(tmpImakefile);
 			if (outFile == NULL)
 			    LogFatal("Cannot open %s for write.",
 				tmpImakefile);

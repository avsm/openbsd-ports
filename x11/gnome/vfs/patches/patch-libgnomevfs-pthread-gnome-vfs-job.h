# $OpenBSD: patch-libgnomevfs-pthread-gnome-vfs-job.h,v 1.1.1.1 2001/09/13 21:25:11 todd Exp $
# $NetBSD: patch-ab,v 1.3 2001/04/07 19:00:21 rh Exp $#

--- libgnomevfs-pthread/gnome-vfs-job.h.orig	Wed Mar  7 00:33:17 2001
+++ libgnomevfs-pthread/gnome-vfs-job.h	Thu Aug 30 16:05:18 2001
@@ -28,7 +28,11 @@
 
 #include "gnome-vfs.h"
 #include "gnome-vfs-private.h"
+#ifdef HAVE_SEMAPHORE_H
 #include <semaphore.h>
+#else
+#include <pthread.h>
+#endif
 
 typedef struct GnomeVFSJob GnomeVFSJob;
 
@@ -327,7 +331,11 @@ struct GnomeVFSJob {
 	gboolean failed;
 	
 	/* Global lock for accessing data.  */
+#ifdef HAVE_SEMAPHORE_H
 	sem_t access_lock;
+#else
+	pthread_mutex_t access_lock;
+#endif
 
 	/* This condition is signalled when the master thread gets a
            notification and wants to acknowledge it.  */

$OpenBSD: patch-src_c-client_auth_gss.c,v 1.2.2.1 2002/12/09 20:26:26 jakob Exp $

--- src/c-client/auth_gss.c.orig	Thu Nov 22 05:03:10 2001
+++ src/c-client/auth_gss.c	Sun Sep  8 20:49:46 2002
@@ -19,8 +19,14 @@
  */
 
 #define PROTOTYPE(x) x
+
+#ifdef HEIMDAL
+#include <gssapi.h>
+#include <krb5.h>
+#else
 #include <gssapi/gssapi_generic.h>
 #include <gssapi/gssapi_krb5.h>
+#endif
 
 long auth_gssapi_valid (void);
 long auth_gssapi_client (authchallenge_t challenger,authrespond_t responder,

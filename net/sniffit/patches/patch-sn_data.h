$OpenBSD: patch-sn_data.h,v 1.6 2004/02/29 19:22:13 pvalchev Exp $
--- sn_data.h.orig	1998-07-16 10:17:10.000000000 -0600
+++ sn_data.h	2004-02-29 12:20:46.000000000 -0700
@@ -43,6 +43,40 @@ char *NETDEV[]={"ed"};		
 int HEADSIZE[]={14}; 
 #endif
 
+#ifdef OPENBSD
+#if defined(__i386__) || defined(__amd64__)
+#define NETDEV_NR     33
+char *NETDEV[]={"ppp","cnw","dc","de","ec","ef","eg","el","ep","ex","fea","fpa","fx","ie","le","ne","ray","rl","sf","sis","sk","sm","ste","ti","tl","tx","vr","wb","we","wi","wx","xe","xl"};
+int HEADSIZE[]={4,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14};
+#elif defined(__sparc__)
+#define NETDEV_NR     6
+char *NETDEV[]={"ppp","be","hme","ie","le","qe"};
+int HEADSIZE[]={4,14,14,14,14,14};
+#elif defined(__m68k__)
+#define NETDEV_NR    9
+char *NETDEV[]={"ppp","ae","ed","es","le","mc","ne","qn","sn"};
+int HEADSIZE[]={4,14,14,14,14,14,14,14,14};
+#elif defined(__mips__)
+#define NETDEV_NR     6
+char *NETDEV[]={"ppp","ec","ep","le","ne","we"};
+int HEADSIZE[]={4,14,14,14,14,14};
+#elif defined(__powerpc__)
+#define NETDEV_NR    5
+char *NETDEV[]={"ppp","bm","de","fxp","gm"};
+int HEADSIZE[]={4,14,14,14,14};
+#elif defined(__alpha__)
+#define NETDEV_NR 23
+char *NETDEV[]={"ppp","dc","de","ne","fxp","fpa","bge","stge","rl","vr","gx","sis","en","tl","le","lmc","wb","sf","ste","ti","skc","sk","an"};
+int HEADSIZE[]={4,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14};
+#elif defined(__vax__)
+#define NETDEV_NR    2
+char *NETDEV[]={"le","ze"};
+int HEADSIZE[]={14,14};
+#else
+#error Unknown network devices for this OpenBSD architecture.
+#endif
+#endif
+
 #ifdef BSDI				/* ppp: 4 or 0 ? */
 /*
 #define NETDEV_NR      2

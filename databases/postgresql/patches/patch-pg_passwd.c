# $OpenBSD: patch-pg_passwd.c,v 1.1 2000/05/23 16:31:42 form Exp $

--- bin/pg_passwd/pg_passwd.c.orig	Mon Apr 17 07:45:18 2000
+++ bin/pg_passwd/pg_passwd.c	Sun May 14 00:09:40 2000
@@ -18,11 +18,15 @@
 
 #endif
 
+#ifndef _POSIX_SOURCE
+#define       _PASSWORD_LEN   128     /* max length, not containing NULL */
+#endif
+
 char	   *comname;
 static void usage(FILE *stream);
 static void read_pwd_file(char *filename);
 static void write_pwd_file(char *filename, char *bkname);
-static void encrypt_pwd(char key[9], char salt[3], char passwd[14]);
+static void encrypt_pwd(char key[9], char salt[3], char passwd[_PASSWORD_LEN+1]);
 static void prompt_for_username(char *username);
 static void prompt_for_password(char *prompt, char *password);
 
@@ -150,7 +154,7 @@
 
 		if (q != NULL)
 			*(q++) = '\0';
-		if (strlen(p) != 13)
+		if (strlen(p) > _PASSWORD_LEN)
 		{
 			fprintf(stderr, "WARNING: %s: line %d: illegal password length.\n",
 					filename, npwds + 1);
@@ -214,7 +218,7 @@
 }
 
 static void
-encrypt_pwd(char key[9], char salt[3], char passwd[14])
+encrypt_pwd(char key[9], char salt[3], char passwd[_PASSWORD_LEN+1])
 {
 	int			n;
 
@@ -246,9 +250,9 @@
 
 #ifdef NOT_USED
 static int
-check_pwd(char key[9], char passwd[14])
+check_pwd(char key[9], char passwd[_PASSWORD_LEN+1])
 {
-	char		shouldbe[14];
+	char            shouldbe[_PASSWORD_LEN+1];
 	char		salt[3];
 
 	salt[0] = passwd[0];
@@ -256,7 +260,7 @@
 	salt[2] = '\0';
 	encrypt_pwd(key, salt, shouldbe);
 
-	return strncmp(shouldbe, passwd, 13) == 0 ? 1 : 0;
+	return strncmp(shouldbe, passwd, _PASSWORD_LEN) == 0 ? 1 : 0;
 }
 
 #endif
@@ -332,7 +336,7 @@
 	char		salt[3];
 	char		key[9],
 				key2[9];
-	char		e_passwd[14];
+	char            e_passwd[_PASSWORD_LEN+1];
 	int			i;
 
 	comname = argv[0];

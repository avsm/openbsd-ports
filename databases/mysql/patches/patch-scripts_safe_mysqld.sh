$OpenBSD: patch-scripts_safe_mysqld.sh,v 1.11 2003/08/27 00:14:49 brad Exp $
--- scripts/safe_mysqld.sh.orig	2003-06-06 10:39:17.000000000 -0400
+++ scripts/safe_mysqld.sh	2003-08-26 19:17:34.000000000 -0400
@@ -74,34 +74,16 @@ parse_arguments() {
   done
 }
 
-MY_PWD=`pwd`
-# Check if we are starting this relative (for the binary release)
-if test -d $MY_PWD/data/mysql -a -f ./share/mysql/english/errmsg.sys -a \
- -x ./bin/mysqld
-then
-  MY_BASEDIR_VERSION=$MY_PWD		# Where bin, share and data are
-  ledir=$MY_BASEDIR_VERSION/bin		# Where mysqld is
-  DATADIR=$MY_BASEDIR_VERSION/data
-  if test -z "$defaults"
-  then
-    defaults="--defaults-extra-file=$MY_BASEDIR_VERSION/data/my.cnf"
-  fi
-# Check if this is a 'moved install directory'
-elif test -f ./var/mysql/db.frm -a -f ./share/mysql/english/errmsg.sys -a \
- -x ./libexec/mysqld
-then
-  MY_BASEDIR_VERSION=$MY_PWD		# Where libexec, share and var are
-  ledir=$MY_BASEDIR_VERSION/libexec	# Where mysqld is
-  DATADIR=$MY_BASEDIR_VERSION/var
-else
-  MY_BASEDIR_VERSION=@prefix@
-  DATADIR=@localstatedir@
-  ledir=@libexecdir@
-fi
+MY_BASEDIR_VERSION=@prefix@
+ledir=@libexecdir@
+DATADIR=@localstatedir@
 
 MYSQL_UNIX_PORT=${MYSQL_UNIX_PORT:-@MYSQL_UNIX_ADDR@}
 MYSQL_TCP_PORT=${MYSQL_TCP_PORT:-@MYSQL_TCP_PORT@}
-user=@MYSQLD_USER@
+user=_mysql
+group=_mysql
+
+socket_dir=`dirname $MYSQL_UNIX_PORT`
 
 # Use the mysqld-max binary by default if the user doesn't specify a binary
 if test -x $ledir/mysqld-max
@@ -232,10 +214,17 @@ fi
 echo "Starting $MYSQLD daemon with databases from $DATADIR"
 
 # Does this work on all systems?
-#if type ulimit | grep "shell builtin" > /dev/null
-#then
-#  ulimit -n 256 > /dev/null 2>&1		# Fix for BSD and FreeBSD systems
-#fi
+if type ulimit | grep "shell builtin" > /dev/null
+then
+  ulimit -n 256 > /dev/null 2>&1		# Fix for BSD and FreeBSD systems
+fi
+
+if test ! -d $socket_dir
+then
+   mkdir -p $socket_dir
+   chown $user:$group $socket_dir
+   chmod 711 $socket_dir
+fi
 
 echo "`date +'%y%m%d %H:%M:%S  mysqld started'`" >> $err_log
 while true
@@ -252,34 +241,6 @@ do
     break
   fi
 
-  if @IS_LINUX@
-  then
-    # Test if one process was hanging.
-    # This is only a fix for Linux (running as base 3 mysqld processes)
-    # but should work for the rest of the servers.
-    # The only thing is ps x => redhat 5 gives warnings when using ps -x.
-    # kill -9 is used or the process won't react on the kill.
-    numofproces=`ps xa | grep -v "grep" | grep -c $ledir/$MYSQLD`
-    echo -e "\nNumber of processes running now: $numofproces" | tee -a $err_log
-    I=1
-    while test "$I" -le "$numofproces"
-    do 
-      PROC=`ps xa | grep $ledir/$MYSQLD | grep -v "grep" | sed -n '$p'` 
-	for T in $PROC
-	do
-	  break
-	done
-	#    echo "TEST $I - $T **"
-	if kill -9 $T
-	then
-	  echo "$MYSQLD process hanging, pid $T - killed" | tee -a $err_log
-	else 
-	  break
-	fi
-	I=`expr $I + 1`
-    done
-  fi
-
   echo "`date +'%y%m%d %H:%M:%S'`  mysqld restarted" | tee -a $err_log
 done
 

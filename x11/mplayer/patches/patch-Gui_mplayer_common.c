$OpenBSD: patch-Gui_mplayer_common.c,v 1.1.2.1 2004/07/04 12:15:58 robert Exp $
--- Gui/mplayer/common.c.orig	Thu Mar 20 13:42:09 2003
+++ Gui/mplayer/common.c	Sat Jul  3 05:30:36 2004
@@ -32,35 +32,39 @@
 
 extern unsigned int GetTimerMS( void );
 
-inline void TranslateFilename( int c,char * tmp )
+inline void TranslateFilename( int c,char * tmp,size_t tmplen )
 {
  int i;
+ char * p;
+ 
  switch ( guiIntfStruct.StreamType )
   {
    case STREAMTYPE_STREAM:
-        strcpy( tmp,guiIntfStruct.Filename );
+        strlcpy(tmp, guiIntfStruct.Filename, tmplen);
         break;
    case STREAMTYPE_FILE:
           if ( ( guiIntfStruct.Filename )&&( guiIntfStruct.Filename[0] ) )
            {
-	    if ( strrchr( guiIntfStruct.Filename,'/' ) ) strcpy( tmp,strrchr( guiIntfStruct.Filename,'/' ) + 1 );
-	     else strcpy( tmp,guiIntfStruct.Filename );
+            if ( p = strrchr(guiIntfStruct.Filename, '/') )
+              strlcpy(tmp, p + 1, tmplen);
+            else
+              strlcpy(tmp, guiIntfStruct.Filename, tmplen);
             if ( tmp[strlen( tmp ) - 4] == '.' ) tmp[strlen( tmp ) - 4]=0;
             if ( tmp[strlen( tmp ) - 5] == '.' ) tmp[strlen( tmp ) - 5]=0;
-           } else strcpy( tmp,MSGTR_NoFileLoaded );
+           } else strlcpy( tmp,MSGTR_NoFileLoaded,tmplen );
           break;
 #ifdef USE_DVDREAD
    case STREAMTYPE_DVD:
-          if ( guiIntfStruct.DVD.current_chapter ) sprintf( tmp,MSGTR_Chapter,guiIntfStruct.DVD.current_chapter );
-            else strcat( tmp,MSGTR_NoChapter );
+          if ( guiIntfStruct.DVD.current_chapter ) snprintf(tmp,tmplen,MSGTR_Chapter,guiIntfStruct.DVD.current_chapter );
+            else strlcat( tmp,MSGTR_NoChapter,tmplen );
           break;
 #endif
 #ifdef HAVE_VCD
    case STREAMTYPE_VCD:
-        sprintf( tmp,MSGTR_VCDTrack,guiIntfStruct.Track );
+        snprintf( tmp,tmplen,MSGTR_VCDTrack,guiIntfStruct.Track );
 	break;
 #endif
-   default: strcpy( tmp,MSGTR_NoMediaOpened );
+   default: strlcpy( tmp,MSGTR_NoMediaOpened,tmplen );
   }
  if ( c )
   {
@@ -74,75 +78,94 @@
   }
 }
 
+/* Unsafe!  Pass only null-terminated strings as (char *)str. */
 char * Translate( char * str )
 {
  static char   trbuf[512];
         char   tmp[512];
         int    i,c;
         int    t;
+        int    strsize = 0;
  memset( trbuf,0,512 );
  memset( tmp,0,128 );
- for ( c=0,i=0;i < (int)strlen( str );i++ )
+ strsize = strlen(str);
+ for ( c=0,i=0;i < strsize;i++ )
   {
    if ( str[i] != '$' ) { trbuf[c++]=str[i]; trbuf[c]=0; }
     else
     {
      switch ( str[++i] )
       {
-       case 't': sprintf( tmp,"%02d",guiIntfStruct.Track ); strcat( trbuf,tmp ); break;
-       case 'o': TranslateFilename( 0,tmp ); strcat( trbuf,tmp ); break;
-       case 'f': TranslateFilename( 1,tmp ); strcat( trbuf,tmp ); break;
-       case 'F': TranslateFilename( 2,tmp ); strcat( trbuf,tmp ); break;
+       case 't': snprintf( tmp,sizeof( tmp ),"%02d",guiIntfStruct.Track );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'o': TranslateFilename( 0,tmp,sizeof( tmp ) );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'f': TranslateFilename( 1,tmp,sizeof( tmp ) );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'F': TranslateFilename( 2,tmp,sizeof( tmp ) );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
        case '6': t=guiIntfStruct.LengthInSec; goto calclengthhhmmss;
        case '1': t=guiIntfStruct.TimeSec;
 calclengthhhmmss:
-            sprintf( tmp,"%02d:%02d:%02d",t/3600,t/60%60,t%60 ); strcat( trbuf,tmp );
+            snprintf( tmp,sizeof( tmp ),"%02d:%02d:%02d",t/3600,t/60%60,t%60 );
+            strlcat( trbuf,tmp,sizeof( trbuf ) );
             break;
        case '7': t=guiIntfStruct.LengthInSec; goto calclengthmmmmss;
        case '2': t=guiIntfStruct.TimeSec;
 calclengthmmmmss:
-            sprintf( tmp,"%04d:%02d",t/60,t%60 ); strcat( trbuf,tmp );
+            snprintf( tmp,sizeof( tmp ),"%04d:%02d",t/60,t%60 );
+            strlcat( trbuf,tmp,sizeof( trbuf ) );
             break;
-       case '3': sprintf( tmp,"%02d",guiIntfStruct.TimeSec / 3600 ); strcat( trbuf,tmp ); break;
-       case '4': sprintf( tmp,"%02d",( ( guiIntfStruct.TimeSec / 60 ) % 60 ) ); strcat( trbuf,tmp ); break;
-       case '5': sprintf( tmp,"%02d",guiIntfStruct.TimeSec % 60 ); strcat( trbuf,tmp ); break;
-       case '8': sprintf( tmp,"%01d:%02d:%02d",guiIntfStruct.TimeSec / 3600,( guiIntfStruct.TimeSec / 60 ) % 60,guiIntfStruct.TimeSec % 60 ); strcat( trbuf,tmp ); break;
-       case 'v': sprintf( tmp,"%3.2f%%",guiIntfStruct.Volume ); strcat( trbuf,tmp ); break;
-       case 'V': sprintf( tmp,"%3.1f",guiIntfStruct.Volume ); strcat( trbuf,tmp ); break;
-       case 'b': sprintf( tmp,"%3.2f%%",guiIntfStruct.Balance ); strcat( trbuf,tmp ); break;
-       case 'B': sprintf( tmp,"%3.1f",guiIntfStruct.Balance ); strcat( trbuf,tmp ); break;
-       case 'd': sprintf( tmp,"%d",guiIntfStruct.FrameDrop ); strcat( trbuf,tmp ); break;
-       case 'x': sprintf( tmp,"%d",guiIntfStruct.MovieWidth ); strcat( trbuf,tmp ); break;
-       case 'y': sprintf( tmp,"%d",guiIntfStruct.MovieHeight ); strcat( trbuf,tmp ); break;
-       case 'C': sprintf( tmp,"%s", guiIntfStruct.sh_video? ((sh_video_t *)guiIntfStruct.sh_video)->codec->name : "");
-                 strcat( trbuf,tmp ); break;
-       case 's': if ( guiIntfStruct.Playing == 0 ) strcat( trbuf,"s" ); break;
-       case 'l': if ( guiIntfStruct.Playing == 1 ) strcat( trbuf,"p" ); break;
-       case 'e': if ( guiIntfStruct.Playing == 2 ) strcat( trbuf,"e" ); break;
+       case '3': snprintf( tmp,sizeof( tmp ),"%02d",guiIntfStruct.TimeSec / 3600 );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case '4': snprintf( tmp,sizeof( tmp ),"%02d",( ( guiIntfStruct.TimeSec / 60 ) % 60 ) );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case '5': snprintf( tmp,sizeof( tmp ),"%02d",guiIntfStruct.TimeSec % 60 );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case '8': snprintf( tmp,sizeof( tmp ),"%01d:%02d:%02d",guiIntfStruct.TimeSec / 3600,( guiIntfStruct.TimeSec / 60 ) % 60,guiIntfStruct.TimeSec % 60 ); strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'v': snprintf( tmp,sizeof( tmp ),"%3.2f%%",guiIntfStruct.Volume );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'V': snprintf( tmp,sizeof( tmp ),"%3.1f",guiIntfStruct.Volume );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'b': snprintf( tmp,sizeof( tmp ),"%3.2f%%",guiIntfStruct.Balance );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'B': snprintf( tmp,sizeof( tmp ),"%3.1f",guiIntfStruct.Balance );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'd': snprintf( tmp,sizeof( tmp ),"%d",guiIntfStruct.FrameDrop );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'x': snprintf( tmp,sizeof( tmp ),"%d",guiIntfStruct.MovieWidth );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'y': snprintf( tmp,sizeof( tmp ),"%d",guiIntfStruct.MovieHeight );
+		 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 'C': snprintf( tmp,sizeof( tmp ),"%s", guiIntfStruct.sh_video? ((sh_video_t *)guiIntfStruct.sh_video)->codec->name : "");
+                 strlcat( trbuf,tmp,sizeof( trbuf ) ); break;
+       case 's': if ( guiIntfStruct.Playing == 0 ) strlcat( trbuf,"s",sizeof( trbuf ) ); break;
+       case 'l': if ( guiIntfStruct.Playing == 1 ) strlcat( trbuf,"p",sizeof( trbuf ) ); break;
+       case 'e': if ( guiIntfStruct.Playing == 2 ) strlcat( trbuf,"e",sizeof( trbuf ) ); break;
        case 'a':
-            if ( muted ) { strcat( trbuf,"n" ); break; }
+            if ( muted ) { strlcat( trbuf,"n",sizeof( trbuf ) ); break; }
             switch ( guiIntfStruct.AudioType )
              {
-              case 0: strcat( trbuf,"n" ); break;
-              case 1: strcat( trbuf,"m" ); break;
-              case 2: strcat( trbuf,"t" ); break;
+              case 0: strlcat( trbuf,"n",sizeof( trbuf ) ); break;
+              case 1: strlcat( trbuf,"m",sizeof( trbuf ) ); break;
+              case 2: strlcat( trbuf,"t",sizeof( trbuf ) ); break;
              }
             break;
        case 'T':
            switch ( guiIntfStruct.StreamType )
             {
-             case STREAMTYPE_FILE:   strcat( trbuf,"f" ); break;
+             case STREAMTYPE_FILE:   strlcat( trbuf,"f",sizeof( trbuf ) ); break;
 #ifdef HAVE_VCD
-             case STREAMTYPE_VCD:    strcat( trbuf,"v" ); break;
+             case STREAMTYPE_VCD:    strlcat( trbuf,"v",sizeof( trbuf ) ); break;
 #endif
-             case STREAMTYPE_STREAM: strcat( trbuf,"u" ); break;
+             case STREAMTYPE_STREAM: strlcat( trbuf,"u",sizeof( trbuf ) ); break;
 #ifdef USE_DVDREAD
-             case STREAMTYPE_DVD:    strcat( trbuf,"d" ); break;
+             case STREAMTYPE_DVD:    strlcat( trbuf,"d",sizeof( trbuf ) ); break;
 #endif
-             default:                strcat( trbuf," " ); break;
+             default:                strlcat( trbuf," ",sizeof( trbuf ) ); break;
             }
            break;
-       case '$': strcat( trbuf,"$" ); break;
+       case '$': strlcat( trbuf,"$",sizeof( trbuf ) ); break;
        default: continue;
       }
      c=strlen( trbuf );

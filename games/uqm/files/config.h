/* This file contains some compile-time configuration options for *nix
 * systems.
 * src/config.h is generated from src/config.h.in by build.sh
 * For windows, you'll have to edit src/msvc++/config.h manually
 * if you want anything else than the defaults.
 */

#ifdef WIN32
	/* If we're compiling in windows, we want the other config.h */
#	include "msvc++/config.h"
#endif

#ifndef _CONFIG_H
#define _CONFIG_H

/* Directory where the UQM game data is located */
#define CONTENTDIR "@PREFIX@/share/uqm/content"

/* Directory where game data will be stored */
#define USERDIR "~/.uqm/"

/* Directory where supermelee teams will be stored */
#define MELEEDIR USERDIR "teams/"

/* Directory where save games will be stored */
#define SAVEDIR USERDIR "save/"

/* Directory where config files will be stored */
#define CONFIGDIR USERDIR

/* Defined if words are stored with the most significant byte first */
#@ENDIAN@ WORDS_BIGENDIAN

/* Defined if your system has strupr of its own */
#undef HAVE_STRUPR

/* Defined if your system has stricmp of its own */
#undef HAVE_STRICMP

/* Defined if your system has getopt.h */
#define HAVE_GETOPT_H

#endif  /* _CONFIG_H */


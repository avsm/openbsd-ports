/*	$OpenBSD: openbsd.h,v 1.3 1999/01/10 02:50:05 espie Exp $	*/
/* vi:ts=8: 
 */

/* This should go away when the math-emulator is fixed */
#define TARGET_CPU_DEFAULT TARGET_NO_FANCY_MATH_387 

/* This is tested by i386gas.h.  */
#define YES_UNDERSCORES

#include <i386/gstabs.h>

/* Get perform_* macros to build libgcc.a.  */
#include <i386/perform.h>

/* Get generic OpenBSD definitions.  */
#define OBSD_OLD_GAS
#include <openbsd.h>

/* run-time target specifications */
#define CPP_PREDEFINES "-D__unix__ -D__i386__ -D__OpenBSD__ -Asystem(unix) -Asystem(OpenBSD) -Acpu(i386) -Amachine(i386)"


/* layout of source language data types
 * ------------------------------------ */
/* this must agree with <machine/ansi.h> */
#undef SIZE_TYPE
#define SIZE_TYPE "unsigned int"

#undef PTRDIFF_TYPE
#define PTRDIFF_TYPE "int"

#undef WCHAR_TYPE
#define WCHAR_TYPE "int"

#undef WCHAR_TYPE_SIZE
#define WCHAR_TYPE_SIZE 32

/* assembler format: overall framework
 * -----------------------------------
 */
#undef ASM_APP_ON
#define ASM_APP_ON "#APP\n"

#undef ASM_APP_OFF
#define ASM_APP_OFF "#NO_APP\n"

/* The following macros were originally stolen from i386v4.h */
/* These have to be defined to get PIC code correct */

/* This is how to output an element of a case-vector that is relative.
   This is only used for PIC code.  See comments by the `casesi' insn in
   i386.md for an explanation of the expression this outputs. */
#undef ASM_OUTPUT_ADDR_DIFF_ELT
#define ASM_OUTPUT_ADDR_DIFF_ELT(FILE, BODY, VALUE, REL) \
  fprintf (FILE, "\t.long _GLOBAL_OFFSET_TABLE_+[.-%s%d]\n", LPREFIX, VALUE)

/* Indicate when jump tables go in the text section.  This is
   necessary when compiling PIC code.  */
#define JUMP_TABLES_IN_TEXT_SECTION  (flag_pic)

/* Don't default to pcc-struct-return, because gcc is the only compiler, and
   we want to retain compatibility with older gcc versions.  */
#define DEFAULT_PCC_STRUCT_RETURN 0

/* check for a recent version of gas */
#ifndef HAVE_GAS_MAX_SKIP_P2ALIGN
/* i386 openbsd still uses an older gas that doesn't insert nops by default
   when the .align directive demands to insert extra space in the text
   segment.  */
#undef ASM_OUTPUT_ALIGN
#define ASM_OUTPUT_ALIGN(FILE,LOG) \
  if ((LOG)!=0) fprintf ((FILE), "\t.align %d,0x90\n", (LOG))
#endif

/* Profiling routines, partially copied from i386/osfrose.h.  */

/* Redefine this to use %eax instead of %edx.  */
#undef FUNCTION_PROFILER
#define FUNCTION_PROFILER(FILE, LABELNO)  \
{									\
  if (flag_pic)								\
    {									\
      fprintf (FILE, "\tcall mcount@PLT\n");				\
    }									\
  else									\
    {									\
      fprintf (FILE, "\tcall mcount\n");				\
    }									\
}

/* aout-i386-openbsd does not handle dwarf2 unwinds and initialization info
   correctly. */
#define DWARF2_UNWIND_INFO 0

/* A C statement to output to the stdio stream FILE an assembler
   command to advance the location counter to a multiple of 1<<LOG
   bytes if it is within MAX_SKIP bytes.

   This is used to align code labels according to Intel recommendations.  */
#ifdef HAVE_GAS_MAX_SKIP_P2ALIGN
#define ASM_OUTPUT_MAX_SKIP_ALIGN(FILE,LOG,MAX_SKIP)			\
  do {									\
    if ((LOG)!=0)							\
      if ((MAX_SKIP)==0) fprintf ((FILE), "\t.p2align %d\n", (LOG));	\
      else fprintf ((FILE), "\t.p2align %d,,%d\n", (LOG), (MAX_SKIP));	\
  } while (0)
#endif


/* taken from unix.h */
/* Output code to add DELTA to the first argument, and then jump to FUNCTION.
   Used for C++ multiple inheritance.  */
/* egcs comes with a MI version of this code, but it is generally more
 * efficient to code a MD version */
#define ASM_OUTPUT_MI_THUNK(FILE, THUNK_FNDECL, DELTA, FUNCTION)	      \
do {									      \
  tree parm;								      \
									      \
  if (i386_regparm > 0)							      \
    parm = TYPE_ARG_TYPES (TREE_TYPE (function));			      \
  else									      \
    parm = NULL_TREE;							      \
  for (; parm; parm = TREE_CHAIN (parm))				      \
    if (TREE_VALUE (parm) == void_type_node)				      \
      break;								      \
  fprintf (FILE, "\taddl $%d,%s\n", DELTA,				      \
	   parm ? "%eax"						      \
	   : aggregate_value_p (TREE_TYPE (TREE_TYPE (FUNCTION))) ? "8(%esp)" \
	   : "4(%esp)");						      \
									      \
  if (flag_pic)								      \
    {									      \
      rtx xops[2];							      \
      xops[0] = pic_offset_table_rtx;					      \
      xops[1] = (rtx) gen_label_rtx ();					      \
									      \
      if (i386_regparm > 2)						      \
	abort ();							      \
      output_asm_insn ("push%L0 %0", xops);				      \
      output_asm_insn (AS1 (call,%P1), xops);				      \
      ASM_OUTPUT_INTERNAL_LABEL (FILE, "L", CODE_LABEL_NUMBER (xops[1]));     \
      output_asm_insn (AS1 (pop%L0,%0), xops);				      \
      output_asm_insn ("addl $_GLOBAL_OFFSET_TABLE_+[.-%P1],%0", xops);	      \
      fprintf (FILE, "\tmovl ");					      \
      assemble_name (FILE, XSTR (XEXP (DECL_RTL (FUNCTION), 0), 0));	      \
      fprintf (FILE, "@GOT(%%ebx),%%ecx\n\tpopl %%ebx\n\tjmp *%%ecx\n");      \
    }									      \
  else									      \
    {									      \
      fprintf (FILE, "\tjmp ");						      \
      assemble_name (FILE, XSTR (XEXP (DECL_RTL (FUNCTION), 0), 0));	      \
      fprintf (FILE, "\n");						      \
    }									      \
} while (0)

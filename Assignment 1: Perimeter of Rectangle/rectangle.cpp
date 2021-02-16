#include <stdio.h>
#include <stdint.h> //For C99 compatibility
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>   //For malloc
//At the time of this writing C99 is the newest available standard for C language.  Most modern C compilers conform to the C99 
//standard.  The GNU compiler, known as gcc, is C99 compliant.  If both languages, C and X86, are C99 compliant then object code 
//files from both compilers may be linked to form a single executable. 
//
//The standard prototypes for any functions that may be called later.  This main function calls exactly one function.
extern "C" double _first();
//
int main()
{
double answer = 0.0;
 printf("The main function manage-floats.c has begun\n");
 printf("The function floatio will now be called\n");
 answer = _first();
 printf("The function floatio has returned this value %8.5lf.  Have a nice day\n",answer);
 return 0;
}
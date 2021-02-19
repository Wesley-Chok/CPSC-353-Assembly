//Wesley Chok
//CPSC240-1 Test 1

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h> 

extern "C" double _first();
//
int main()
{
    printf("Welcome to the Electric Resistance Calculator programmed by Stokes Theorem.\n");
    double answer = 0.0;
    answer = _first();
    printf("The Electricity module received this number %8.5lf and will keep it.\n",answer);
    printf("Have a very nice evening.  Electricity will now return 0 to the operating system. Bye.");
    return 0;
}
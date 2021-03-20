#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h> 

#include <stdio.h>

extern "C" void display(double array[], long index);

void display(double array[], long index)
{
    for (long i = 0; i < index; ++i)
    {
        printf("%1.3f", array[i]);
        printf("%s"," ");
        printf("\n");
    }
}
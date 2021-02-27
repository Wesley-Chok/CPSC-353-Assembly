#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

using namespace std;
extern "C" bool isdigit(char []);

bool isdigit(char w[])
{
    if (isdigit(w[0]))
    {
        return 1;
    }
    else
    {
        return 0;
    }
    
}

#include "eliuds_eggs.h"
#include "math.h"

unsigned int egg_count(int decimal) {
    unsigned int count = 0;
    while(decimal >= 1) {
        if(decimal%2 == 1) {
            count += 1;
        }
        decimal = floor(decimal/2);
    }
    return count;
}
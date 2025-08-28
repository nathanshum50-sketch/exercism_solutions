#include "darts.h"
#include <stdio.h>
#include <math.h>

double score(coordinate_t xy) {
    if(pow(xy.x,2)+pow(xy.y,2)>100) {
        return 0;
    }
    else if(pow(xy.x,2)+pow(xy.y,2)>25) {
        return 1;
    }
    else if(pow(xy.x,2)+pow(xy.y,2)>1) {
        return 5;
    }
    else if(pow(xy.x,2)+pow(xy.y,2)<=1) {
        return 10;
    }
    return -1;
}
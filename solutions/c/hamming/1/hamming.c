#include "hamming.h"
#include <stdio.h>
#include "string.h"

int compute(const char *lhs, const char *rhs) {
    int distance = -1;
    if(strlen(lhs) == strlen(rhs)) {
        distance = 0;
        for(int i = 0; i < (int)strlen(lhs); i++) {
            if(lhs[i]!=rhs[i]) {
                distance += 1;
            }
        }
    }
    return distance;
}

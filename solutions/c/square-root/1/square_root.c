#include "square_root.h"

int square_root(int number) {
    if(number < 0) {
        return -1;
    }
    int result = 0;
    while(result*result < number) {
        result++;
    }
    if(number%result == 0) {
        return result;
    }
    else {
        return -1;
    }
}
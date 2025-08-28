#include "perfect_numbers.h"
#include <math.h>

kind classify_number(int number) {
    if(number >= 1) {
        int factors = 0;
        for(int i = 1; i <= (int)sqrt(number); i++) {
            if(number%i == 0) {
                factors += i;
                if(i != number/i) {
                    factors += number/i;
                }
            }
        }
        factors -= number;
        if(factors > number) {
            return ABUNDANT_NUMBER;
        }
        else if(factors < number) {
            return DEFICIENT_NUMBER;
        }
        else {
            return PERFECT_NUMBER;
        }
    }
    else {
        return ERROR;
    }
}
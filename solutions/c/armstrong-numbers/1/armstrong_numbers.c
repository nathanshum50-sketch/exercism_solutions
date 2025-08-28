#include "armstrong_numbers.h"
#include <stdlib.h>

static int digit(int number) {
    int digits = 0;
    int test = abs(number);
    while(test >= 1) {
        digits += 1;
        test /= 10;
    }
    return digits;
}

static int positive_power_of(int number, int power) {
    int exponent = number;
    for(int i = 1; i < power; i++) {
        exponent *= number;
    }
    return exponent;
}

bool is_armstrong_number(int candidate) {
    int digits = digit(candidate);
    if(digits == 0) {
        return true;
    }
    int test = candidate;
    int output = 0;
    for(int i = 0; i < digits; i++) {
        output += positive_power_of(test % 10, digits);
        test /= 10;
    }
    return candidate == output;
}
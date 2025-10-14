#include "all_your_base.h"

static int16_t power(int16_t base, int8_t exponent) {
    int16_t result = 1;
    for(int8_t i = 0; i < exponent ; i++) {
        result *= base;
    }
    return result;
}

size_t rebase(int8_t digits[], int16_t input_base, int16_t output_base, size_t input_length) {
    if(!digits||input_base<=1||output_base<=1||input_length<1) return 0;
    int16_t total = 0;
    for(size_t i=0; i < input_length; i++) {
        if(digits[input_length-i-1]>=input_base||digits[input_length-i-1]<0) return 0;
        total += digits[input_length-i-1]*power(input_base,i);
    }
    if(total==0) return 1;
    int8_t new[DIGITS_ARRAY_SIZE];
    size_t place = 0;
    while(total > 0) {
        new[place] = (int8_t)(total%output_base);
        total /= output_base;
        place += 1;
    }
    for(size_t j=0; j < place; j++) {
        digits[place-j-1] = new[j];
    }
    return place;
}
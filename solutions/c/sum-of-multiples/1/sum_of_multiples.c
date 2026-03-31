#include "sum_of_multiples.h"


unsigned int sum(const unsigned int *factors, const size_t number_of_factors,
                 const unsigned int limit) {
    if(!factors || number_of_factors == 0 || limit <= 1) {
        return 0;
    }
    unsigned int array[limit-1];
    size_t size_of_array = 0;
    for(size_t i = 0; i < number_of_factors; i++) {
        unsigned int factor = factors[i];
        if(factor == 0) {
            continue;
        }
        for(unsigned int j = 1; j*factor < limit; j++) {
            int l = 1;
            for(size_t k = 0 ; k < size_of_array; k++) {
                if(factor*j == array[k]) {
                    l = 0;
                    break;
                }
            }
            if(l==1) {
                array[size_of_array] = factor*j;
                size_of_array += 1;
            }
        }
    }
    unsigned int sum = 0;
    for(size_t m = 0; m < size_of_array; m++) {
        sum += array[m];
    }
    return sum;
                 }
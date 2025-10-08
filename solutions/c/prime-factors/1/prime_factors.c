#include "prime_factors.h"

size_t find_factors(uint64_t n, uint64_t factors[static MAXFACTORS]) {
    if(n <= 1) return 0;
    size_t index = 0;
    uint64_t divisor = 2;
    while(n > 1) {
        if(n%divisor==0) {
            factors[index] = divisor;
            n /= divisor;
            divisor = 2;
            index += 1;
        } else {
            divisor += 1;
        }
    }
    return index;
}

#include "sieve.h"

uint32_t sieve(uint32_t limit, uint32_t *primes, size_t max_primes) {
    if(limit <= 1||max_primes == 0) return 0;
    primes[0] = 2;
    uint32_t length = 1;
    for(uint32_t i = 3; i <= limit; i+=2) {
        bool non_divisor = true;
        for(uint32_t j = 0; j < length && primes[j]*primes[j] <= i; j++) {
            if(i%primes[j] == 0) {
                non_divisor = false;
                break;
            }
        }
        if(non_divisor) {
            if(length < max_primes) {
                primes[length] = i;
                length += 1;
            }
        }
        if(length >= max_primes) {
            break;
        }
    }
    return length;
}

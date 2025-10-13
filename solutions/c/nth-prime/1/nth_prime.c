#include "nth_prime.h"

uint32_t nth(uint32_t n) {
    if(n <= 0) return 0;
    uint32_t primes[n];
    primes[0] = 2;
    primes[1] = 3;
    for(uint32_t i=2; i < n; i++) {
        uint32_t start = primes[i-1]+2;
        while(true) {
            bool there = true;
            for(uint32_t j=0; j < i; j++) {
                if(start%primes[j]==0) {
                    start+=2;
                    there = false;
                    break;
                }
            }
            if(there) {
                primes[i] = start;
                break;
            }
        }
    }
    primes[n] = '\0';
    return primes[n-1];
}
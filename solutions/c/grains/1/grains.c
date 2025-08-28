#include "grains.h"
#include <stdio.h>
uint64_t square(uint8_t index) {
    scanf("%c", &index);
    uint64_t a = 1;
    if(index >= 1 && index <= 64) {
        for(unsigned int i = 1; i < index; a *= 2, i += 1);
    }
    else {
        a = 0;
    }
    return a;
}
uint64_t total() {
    uint64_t a = 1;
    for(unsigned int i = 0; i < 64; a *= 2, i += 1);
    return a - 1;
}
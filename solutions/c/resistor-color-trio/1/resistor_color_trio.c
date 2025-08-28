#include "resistor_color_trio.h"
#include <stdint.h>
#define OHMS_PER_KILOOHM 1000ULL
#define OHMS_PER_MEGAOHM 1000000ULL
#define OHMS_PER_GIGAOHM 1000000000ULL

static unsigned long long power_of_10_pos(int exp) {
    unsigned long long result = 1;
    for(int i = 0; i < exp; i++) {
        result *= 10;
    }
    return result;
}

resistor_value_t color_code(resistor_band_t colors[]) {
    resistor_value_t result = {0};
    unsigned long long value = 10ULL*colors[0] + colors[1];
    if(value == 0) {
        result.value = 0;
        result.unit = OHMS;
        return result;
    }
    int exponent = (int)colors[2];
    unsigned long long total_value = value * power_of_10_pos(exponent);
    if(total_value >= OHMS_PER_GIGAOHM) {
        result.value = (uint16_t)(total_value/OHMS_PER_GIGAOHM);
        result.unit = GIGAOHMS;
    }
    else if(total_value >= OHMS_PER_MEGAOHM) {
        result.value = (uint16_t)(total_value/OHMS_PER_MEGAOHM);
        result.unit = MEGAOHMS;
    }
    else if(total_value >= OHMS_PER_KILOOHM) {
        result.value = (uint16_t)(total_value/OHMS_PER_KILOOHM);
        result.unit = KILOOHMS;
    }
    else {
        result.value = (uint16_t)total_value;
        result.unit = OHMS;
    }
    return result;
}
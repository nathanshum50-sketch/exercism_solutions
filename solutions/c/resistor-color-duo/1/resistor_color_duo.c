#include "resistor_color_duo.h"
#include <stdio.h>
#include <math.h>

int color_code(resistor_band_t colors[]) {
    int encoding = 0;
    for(int i=0; i < 2; i++) {
        encoding += colors[i]*10*pow(10,-i);
    }
    return encoding;
}
#ifndef RESISTOR_COLOR_TRIO_H
#define RESISTOR_COLOR_TRIO_H
#include <stdint.h>

typedef enum {
    OHMS, KILOOHMS, MEGAOHMS, GIGAOHMS
} ohms_unit_t;

typedef enum {
    BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE
} resistor_band_t;

#pragma pack(push, 1)
typedef struct {
    uint16_t value;
    ohms_unit_t unit;
} resistor_value_t;
#pragma pack(pop)

resistor_value_t color_code(resistor_band_t colors[]);

#endif

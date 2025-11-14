#ifndef BEER_SONG_H
#define BEER_SONG_H
#define MIN(X,Y) ((X) < (Y) ? (X):(Y))
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

void recite(uint8_t start_bottles, uint8_t take_down, char **song);

#endif

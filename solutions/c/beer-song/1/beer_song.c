#include "beer_song.h"

void recite(uint8_t start_bottles, uint8_t take_down, char **song) {
    if(!song || take_down < 1 || take_down - start_bottles > 1) return;
    if(take_down - start_bottles == 1) {
        strcpy(song[start_bottles*3],"No more bottles of beer on the wall, no more bottles of beer.");
        strcpy(song[start_bottles*3+1],"Go to the store and buy some more, 99 bottles of beer on the wall.");
    }
    for(uint8_t i = 0; i < MIN(take_down,start_bottles); i++) {
        uint8_t figure = start_bottles - i;
        if(figure >= 2) {
            sprintf(song[i*3],"%u bottles of beer on the wall, %u bottles of beer.",figure,figure);
        } else {
            strcpy(song[i*3],"1 bottle of beer on the wall, 1 bottle of beer.");
        }
        if(figure >= 3) {
            sprintf(song[i*3+1],"Take one down and pass it around, %u bottles of beer on the wall.",figure-1);
        } else if(figure == 2) {
            strcpy(song[i*3+1],"Take one down and pass it around, 1 bottle of beer on the wall.");
        } else {
            strcpy(song[i*3+1],"Take it down and pass it around, no more bottles of beer on the wall.");
        }
        if(take_down - i > 1) strcpy(song[i*3+2],"");
    }
    return;
}
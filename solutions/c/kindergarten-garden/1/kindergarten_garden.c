#include "kindergarten_garden.h"
#include <string.h>

plants_t plants(const char* diagram, const char* student) {
    plants_t planted;
    const char* students[12] = {"Alice","Bob","Charlie","David","Eve","Fred","Ginny","Harriet","Ileana","Joseph","Kincaid","Larry"};
    int remains;
    for(int i=0; i < 12; i++) {
        if(strcmp(students[i],student)==0) {
            remains = i;
            break;
        }
    }
    int cups[2] = {remains*2,remains*2+1};
    int j = 0;
    int k = 0;
    int counter = 0;
    while(diagram[k]!='\0' && counter < 4) {
        if(diagram[k] == '\n') {
            j = 0;
            k++;
            continue;
        } else if(j == cups[0] || j == cups[1]) {
            char given = diagram[k];
            if(given == 'C') {
                planted.plants[counter] = CLOVER;
            } else if(given == 'G') {
                planted.plants[counter] = GRASS;
            } else if(given == 'R') {
                planted.plants[counter] = RADISHES;
            } else if(given == 'V') {
                planted.plants[counter] = VIOLETS;
            }
            counter++;
        }
        j++;
        k++;
    }
    return planted;
}
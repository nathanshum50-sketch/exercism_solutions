#include "isogram.h"
#include <ctype.h>
#include <stdlib.h>

static bool unique(char string[]) {
    for(int i = 0; i < MAX_LENGTH; i++) {
        if(string[i] != '\0') {
            for(int j = 0; j < i; j++) {
                if(string[i]==string[j]) {
                    return false;
                }
            }
        }
    }
    return true;
}

bool is_isogram(const char phrase[]) {
    if(phrase == NULL) {
        return false;
    }
    int c = 0;
    char set[MAX_LENGTH];
    for(int i = 0; i < MAX_LENGTH; i++) {
        set[i] = '\0';
    }
    while(phrase[c] != '\0') {
        if(phrase[c] >= 'a' && phrase[c] <= 'z') {
            set[c] = phrase[c];
        }
        else if(phrase[c] >= 'A' && phrase[c] <= 'Z') {
            set[c] = tolower(phrase[c]);
        }
        c++;
    }
    return unique(set);
}
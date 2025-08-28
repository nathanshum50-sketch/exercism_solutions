#include "pangram.h"
#include <ctype.h>
#include <string.h>
#include <stdbool.h>

bool incidence(const char* sentence, char character) {
    if (sentence == NULL) {
        return false;
    }
    for(size_t i = 0; sentence[i] != '\0'; i++) {
        if(tolower(character) == tolower(sentence[i])) {
            return true;
            break;
        }
    }
    return false;
}

bool is_pangram(const char *sentence) {
    if(sentence == NULL || strlen(sentence) < 26) {
        return false;
    }
    for(char c = 'a'; c <= 'z'; c++) {
        if(incidence(sentence, c) == false) {
            return false;
        }
    }
    return true;
}
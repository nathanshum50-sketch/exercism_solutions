#include "two_fer.h"
#include <stdio.h>
#include "string.h"

void two_fer(char *buffer, const char *name) {
    if(name!=NULL) {
        snprintf(buffer, 100, "One for %s, one for me.", name);
        return;
    }
    snprintf(buffer, 100, "One for you, one for me.");
}
#include "reverse_string.h"

char *reverse(const char *value) {
    if(!value) return "";
    size_t length = strlen(value);
    char *reverse = malloc(length+1);
    for(size_t i = 0; i < length; i++) {
        reverse[i] = value[length-i-1];
    }
    reverse[length] = '\0';
    return reverse;
}

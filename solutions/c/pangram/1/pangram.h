#ifndef PANGRAM_H
#define PANGRAM_H

#include <stdbool.h>

bool incidence(const char* sentence, char character);

bool is_pangram(const char *sentence);

#endif

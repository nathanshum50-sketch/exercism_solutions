#ifndef LUHN_H
#define LUHN_H
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>
char* remove_spaces(const char *num);
bool extra_numerical(char *num);
bool luhn(const char *num);
#endif

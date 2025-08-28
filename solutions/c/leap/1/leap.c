#include "leap.h"
#include <stdio.h>
bool leap_year(int year) {
    scanf("%d", &year);
    printf("%d", (year % 100 != 0 && year % 4 == 0) || (year % 400 == 0));
    return (year % 100 != 0 && year % 4 == 0) || (year % 400 == 0);
}
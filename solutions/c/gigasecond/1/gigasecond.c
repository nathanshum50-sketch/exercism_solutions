#include "gigasecond.h"
#include <stdio.h>
//use time.h convert input to struct temp add 10^9 to seconds in struct temp convert to output
void gigasecond(time_t input, char *output, size_t size) {
    if(size < sizeof("YYYY-mm-dd HH:MM:SS")) {
        return;
    }
    time_t new_time = input + 1000000000;
    struct tm *timeinfo = gmtime(&new_time);
    strftime(output,size,"%Y-%m-%d %H:%M:%S",timeinfo);
}
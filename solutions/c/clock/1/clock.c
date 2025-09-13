#include "clock.h"

clock_t clock_create(int hour, int minute) {
    clock_t time;
    hour = hour+minute/60;
    minute %= 60;
    if(minute < 0) {
        minute += 60;
        hour -= 1;
    }
    hour %= 24;
    if(hour < 0) {
        hour += 24;
    }
    snprintf(time.text,sizeof(time.text),"%02d:%02d",hour,minute);
    return time;
}

clock_t clock_add(clock_t clock, int minute_add) {
    int hour, minute;
    sscanf(clock.text,"%d:%d",&hour,&minute);
    minute += minute_add;
    hour += minute/60;
    minute %= 60;
    if(minute < 0) {
        minute += 60;
        hour -= 1;
    }
    hour %= 24;
    if(hour < 0) {
        hour += 24;
    }
    snprintf(clock.text,sizeof(clock.text),"%02d:%02d",hour,minute);
    return clock;
}

clock_t clock_subtract(clock_t clock, int minute_subtract) {
    int hour, minute;
    sscanf(clock.text,"%d:%d",&hour,&minute);
    minute -= minute_subtract;
    hour += minute/60;
    minute %= 60;
    if(minute < 0) {
        minute += 60;
        hour -= 1;
    }
    hour %= 24;
    if(hour < 0) {
        hour += 24;
    }
    snprintf(clock.text,sizeof(clock.text),"%02d:%02d",hour,minute);
    return clock;
}

bool clock_is_equal(clock_t a, clock_t b) {
    int hour, minute;
    sscanf(a.text,"%d:%d",&hour,&minute);
    a = clock_create(hour, minute);
    sscanf(b.text,"%d:%d",&hour,&minute);
    b = clock_create(hour, minute);
    sscanf(a.text,"%d:%d",&hour,&minute);
    int hour_b, minute_b;
    sscanf(b.text,"%d:%d",&hour_b,&minute_b);
    return hour == hour_b && minute == minute_b;
}
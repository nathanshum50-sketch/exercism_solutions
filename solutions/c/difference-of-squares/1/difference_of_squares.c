#include "difference_of_squares.h"
#include <stdio.h>

unsigned int sum_of_squares(unsigned int number) {
    unsigned int a = 0;
    for(unsigned int i = 1; i <= number; a+=i*i, i+=1);
    return a;
}

unsigned int square_of_sum(unsigned int number){
    unsigned int a = 0;
    for(unsigned int i = 1; i <= number; a+=i, i+=1);
    return a*a;
}

unsigned int number_sum(unsigned int number){
    unsigned int a = 0;
    for(unsigned int i = 1; i <= number; a+=i, i+=1);
    return a;
}

unsigned int difference_of_squares(unsigned int number){
    scanf("%u", &number);
    unsigned int a = 0;
    unsigned int sum = number_sum(number);
    for(unsigned int i = 1; i <= number; a += i*(sum - i), i+=1);
    return a;
    //return square_of_sum(number) - sum_of_squares(number);
}
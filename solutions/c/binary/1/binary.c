#include "binary.h"
#include "string.h"
#include "math.h"

int convert(const char *input) {
    int decimal = 0;
    int length = strlen(input);
    for(int i=0; i< length; i++) {
        if(input[i]!='1'&&input[i]!='0') {
            return -1;
        }
    }
    for(int i=0; i< length; i++) {
        if(input[i]=='1') {
            decimal += pow(2,length - i - 1);
        }
    }
    return decimal;
}
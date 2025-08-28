#include "luhn.h"

//remove spaces
char* remove_spaces(const char *num) {
    if(!num) {
        return NULL;
    }
    int length = strlen(num);
    char* output = malloc(strlen(num)+1);
    if(!output) {
        return NULL;
    }
    int j = 0;
    for(int i = 0; i < length; i++) {
        if(!isspace(num[i])) {
            output[j++] = num[i];
        }
    }
    output[j] = '\0';
    return output;
}
//return whether there are extranumerical characters
bool extra_numerical(char *num) {
    while(*num != '\0') {
        if(!isdigit(*num)) {
            return true;
        }
        num++;
    }
    return false;
}
//luhn
bool luhn(const char *num) {
    //preliminary checks
    if(!remove_spaces(num) || strlen(remove_spaces(num)) < 2 || extra_numerical(remove_spaces(num))) {
        return false;
    }
    //remove spaces
    char* num_treated = remove_spaces(num);
    //collect treated digits
    int sum = 0;
    int length = strlen(num_treated);
    for(int i = length-1; i >= 0; i--) {
        int margin = num_treated[i] - '0';
        if((length-i)%2==0) {
            margin *= 2;
        }
        if(margin > 9) {
            margin -= 9;
        }
        sum += margin;
    }
    //final test
    if(sum%10==0) {
        return true;
    }
    return false;
}
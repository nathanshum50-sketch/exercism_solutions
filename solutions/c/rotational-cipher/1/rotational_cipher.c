#include "rotational_cipher.h"

char *rotate(const char *text, int shift_key) {
    if(!text) return "";
    shift_key %= 26;
    if(shift_key < 0) shift_key += 26;
    int length = strlen(text);
    char *cipher_text = malloc(length+1);
    for(int i = 0; i < length; i++) {
        char value = text[i];
        if(isupper(value)) {
            value = (char)(65 + (((int)value - 65) + shift_key) % 26);
        }
        else if(islower(value)) {
            value = (char)(97 + (((int)value - 97) + shift_key) % 26);
        }
        cipher_text[i] = value;
    }
    cipher_text[length] = '\0';
    return cipher_text;
}
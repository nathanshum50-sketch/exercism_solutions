#include "protein_translation.h"
static int get_acid(const char* string, int position) {
    char* sub = malloc(sizeof(char)*4);
    for(int i = 0; i < 3 ; i++) {
        sub[i] = string[i+position];
    }
    sub[3] = '\0';
    char arr[18][4] = {"AUG","UUU","UUC","UUA","UUG","UCU","UCC","UCA","UCG","UAU","UAC","UGU","UGC","UGG","UAA","UAG","UGA"};
    for(int i = 0; i < 17; i++) {
        if(strcmp(sub,arr[i])==0) {
            switch(i) {
                case 0:
                    return 0;
                case 1:
                case 2:
                    return 1;
                case 3:
                case 4:
                    return 2;
                case 5:
                case 6:
                case 7:
                case 8:
                    return 3;
                case 9:
                case 10:
                    return 4;
                case 11:
                case 12:
                    return 5;
                case 13:
                    return 6;
                case 14:
                case 15:
                case 16:
                    return 7;
            }
        }
    }
    return 8;
}

protein_t protein(const char *const rna) {
    protein_t protein = { .valid = true, .count = 0 };
    if(!rna) return protein;
    size_t length = strlen(rna);
    for(size_t i = 0; i < length; i+= 3) {
        if(i+3 > length) {
            protein.valid = false;
            return protein;
        }
        int code = get_acid(rna,i);
        switch (code) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                protein.amino_acids[protein.count] = (amino_acid_t)code;
                protein.count += 1;
                break;
            case 7:
                return protein;
            default:
                protein.valid = false;
                return protein;
        }
    }
    return protein;
}
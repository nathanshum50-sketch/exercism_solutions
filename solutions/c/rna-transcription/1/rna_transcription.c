#include "rna_transcription.h"
#include "string.h"
#include <stdlib.h>
#include <ctype.h>

char *to_rna(const char *dna) {
    if(dna == NULL) {
        return NULL;
    }
    size_t length = strlen(dna);
    char *rna = (char*)malloc(length+1);
    if(rna == NULL) {
        return NULL;
    }
    for(size_t i=0;i<length;i++) {
        switch (toupper(dna[i])) {
            case 'A':
                rna[i] = 'U';
                break;
            case 'C':
                rna[i] = 'G';
                break;
            case 'G':
                rna[i] = 'C';
                break;
            case 'T':
                rna[i] = 'A';
                break;
            default:
                return NULL;
                break;
        }
    }
    rna[length] = '\0';
    return rna;
}
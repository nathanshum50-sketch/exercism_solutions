#include "nucleotide_count.h"

char *count(const char *dna_strand) {
    if(!dna_strand) return "A:0 C:0 G:0 T:0";
    int a_count = 0;
    int c_count = 0;
    int g_count = 0;
    int t_count = 0;
    char *empty = malloc(1);
    if(!empty) return NULL;
    for(int i = 0; dna_strand[i] != '\0' ; i++) {
        switch(dna_strand[i]) {
            case 'A':
                a_count++;
                break;
            case 'C':
                c_count++;
                break;
            case 'G':
                g_count++;
                break;
            case 'T':
                t_count++;
                break;
            default:
                empty[0] = '\0';
                return empty;
        }
    }
    char* display = malloc(sizeof(char)*20);
    if(!display) return NULL;
    snprintf(display, 20,"A:%d C:%d G:%d T:%d",a_count,c_count,g_count,t_count);
    return display;
}
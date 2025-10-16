#include "scrabble_score.h"

static unsigned int scoring(char letter) {
    int space = (int)letter;
    if(space >= 97 && space<=122) {
        letter = (char)(space - 32);
    } else if(space < 65 || space > 90) return 0;
    char* alphabet = "AEIOULNRSTDGBCMPFHVWYKJXQZ";
    for(int i=0; i < 26 ;i++) {
        if(letter == alphabet[i]) {
            switch(i) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                    return 1;
                case 10:
                case 11:
                    return 2;
                case 12:
                case 13:
                case 14:
                case 15:
                    return 3;
                case 16:
                case 17:
                case 18:
                case 19:
                case 20:
                    return 4;
                case 21:
                    return 5;
                case 22:
                case 23:
                    return 8;
                default:
                    return 10;
            }
        }
    }
    return 0;
}

unsigned int score(const char *word) {
    if(!word) return 0;
    unsigned int increment = 0,score = 0;
    while(word[increment] != '\0') {
        score += scoring(word[increment]);
        increment++;
    }
    return score;
}
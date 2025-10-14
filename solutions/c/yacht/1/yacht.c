#include "yacht.h"

static int summed(int arr[], int length) {
    if(!arr||length <= 0) return 0;
    int summed = 0;
    for(int i=0; i < length; i++) {
        summed += arr[i];
    }
    return summed;
}

int score(dice_t dice, category_t category) {
    int sorted[5];
    sorted[0] = dice.faces[0];
    for(int i=0; i < 5; i++) {
        if(dice.faces[i] < sorted[0]) {
            sorted[i] = sorted[0];
            sorted[0] = dice.faces[i];
        } else {
            sorted[i] = dice.faces[i];
        }
    }
    for(int j=1; j < 5; j++) {
        for(int i=j+1; i < 5; i++) {
            if(sorted[i] < sorted[j]) {
                int temp = sorted[i];
                sorted[i] = sorted[j];
                sorted[j] = temp;
            }
        }
    }
    int score = 0;
    switch((int)category) {
        case 6:
            if(sorted[0]==sorted[1]&&sorted[3]==sorted[4]&&(sorted[2]==sorted[0]||sorted[2]==sorted[3])&&sorted[0]!=sorted[4]) return summed(sorted,5);
            break;
        case 7:
            if(sorted[0]==sorted[3]||sorted[1]==sorted[4]) return sorted[2]*4;
            break;
        case 8:
            if(sorted[0]==1&&sorted[1]==2&&sorted[2]==3&&sorted[3]==4&&sorted[4]==5) return 30;
            break;
        case 9:
            if(sorted[0]==2&&sorted[1]==3&&sorted[2]==4&&sorted[3]==5&&sorted[4]==6) return 30;
            break;
        case 10:
            return summed(sorted,5);
            break;
        case 11:
            if(sorted[0]==sorted[4]) return 50;
            break;
        default:
            for(int i = 0; i < 5; i++) {
                if(sorted[i]==(int)category+1) {
                    score += (int)category+1;
                } else if(sorted[i] > (int)category+1) {
                    break;
                }
            }
            return score;
            break;
    }
    return 0;
}
#include "allergies.h"
#include "math.h"

bool is_allergic_to(allergen_t allergen, int score) {
    for(int i = 0; i < (int)allergen; i++) {
        score = score/2;
        if(score < 1) {
            return 0;
        }
    }
    return score%2;
}
allergen_list_t get_allergens(int score) {
    allergen_list_t allergens;
    allergens.count = 0;
    if(score == 0) {
        return allergens;
    }
    int max = MIN(ALLERGEN_COUNT-1,(int)(log2(score)));
    for(int i = 0; i <= max; i++) {
        if(score%2 == 1) {
            allergens.count += 1;
            allergens.allergens[(allergen_t)i] = true;
        }
        score = score/2;
    }
    return allergens;
}
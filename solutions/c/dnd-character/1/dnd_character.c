#include "dnd_character.h"
#include <stdlib.h>

int ability(void) {
    int random;
    int smallest = rand() % 6 + 1;
    int ability = smallest;
    for(int i = 0; i < 3; i ++) {
        random = rand() % 6 + 1;
        ability += smallest;
        if(smallest>random) {
            smallest = random;
        }
    }
    ability -= smallest;
    return ability;
}

int modifier(int score) {
    int modifier = (int)(score - 10)/2;
    if(score < 10 && score % 2 != 0) {
        modifier -= 1;
    }
    return modifier;
}

dnd_character_t make_dnd_character(void) {
    dnd_character_t character;
    character.strength = ability();
    character.dexterity = ability();
    character.constitution = ability();
    character.intelligence = ability();
    character.wisdom = ability();
    character.charisma = ability();
    character.hitpoints = 10 + modifier(character.constitution);
    return character;
}
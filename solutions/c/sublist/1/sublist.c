#include "sublist.h"

comparison_result_t check_lists(int *list_to_compare, int *base_list,
                                size_t list_to_compare_element_count,
                                size_t base_list_element_count) {
    if(base_list_element_count == 0) {
        if(list_to_compare_element_count == 0) {
            return EQUAL;
        } else {
            return SUPERLIST;
        }
    } else if(list_to_compare_element_count == 0) {
        return SUBLIST;
    }
    if(list_to_compare_element_count < base_list_element_count) {
        for(size_t i = 0; i < base_list_element_count; i++) {
            if(base_list[i]==list_to_compare[0]) {
                bool here = true;
                for(size_t j=1; j < list_to_compare_element_count; j++) {
                    if(list_to_compare[j]!=base_list[i+j]) {
                        here = false;
                        break;
                    }
                if(here) return SUBLIST;
                }
            }
            if(base_list_element_count-i<list_to_compare_element_count) return UNEQUAL;
        }
    } else if(list_to_compare_element_count > base_list_element_count) {
        for(size_t i = 0; i < list_to_compare_element_count; i++) {
            if(base_list[0]==list_to_compare[i]) {
                bool here = true;
                for(size_t j=1; j < base_list_element_count; j++) {
                    if(list_to_compare[i+j]!=base_list[j]) {
                        here = false;
                        break;
                    }
                if(here) return SUPERLIST;
                }
            }
            if(base_list_element_count>list_to_compare_element_count-i) return UNEQUAL;
        }
    } else {
        for(size_t i=0; i < base_list_element_count ; i++) {
            if(list_to_compare[i]!=base_list[i]) return UNEQUAL;
        }
        return EQUAL;
    }
    return UNEQUAL;
}
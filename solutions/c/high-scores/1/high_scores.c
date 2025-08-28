#include "high_scores.h"
#include <stdio.h>
#include <stddef.h>
#include <limits.h>
#define TOP_SCORES_ARRAY_SIZE (3)

/// Return the latest score.
int32_t latest(const int32_t *scores, size_t scores_len) {
    return scores[scores_len-1];
}

/// Return the highest score.
int32_t personal_best(const int32_t *scores, size_t scores_len) {
    int32_t high_score = 0;
    for(size_t i = 0; i < scores_len ; i++) {
        if(scores[i]>high_score) {
            high_score = scores[i];
        }
    }
    return high_score;
}

/// Write the highest scores to `output` (in non-ascending order).
/// Return the number of scores written.
size_t personal_top_three(const int32_t *scores, size_t scores_len,
                          int32_t *output) {
    int32_t output_a[TOP_SCORES_ARRAY_SIZE];
    size_t count = 0;
    for(size_t i = 0; i < TOP_SCORES_ARRAY_SIZE; i++) {
        output_a[i] = INT_MIN;
    }
    for(size_t i = 0; i < scores_len; i++) {
        if(scores[i]>output_a[0]) {
            output_a[2] = output_a[1];
            output_a[1] = output_a[0];
            output_a[0] = scores[i];
        }
        else if(scores[i]>output_a[1]) {
            output_a[2] = output_a[1];
            output_a[1] = scores[i];
        }
        else if(scores[i]>output_a[2]) {
            output_a[2] = scores[i];
        }
    }
    for(size_t i = 0; i < TOP_SCORES_ARRAY_SIZE; i++) {
        if(output_a[i] != INT_MIN) {
            output[i] = output_a[i];
            count++;
        }
    }
    return count;
                          }
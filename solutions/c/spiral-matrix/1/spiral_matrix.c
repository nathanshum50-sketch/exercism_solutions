#include "spiral_matrix.h"

spiral_matrix_t *spiral_matrix_create(int size) {
    spiral_matrix_t matrix;
    spiral_matrix_t *matrices = malloc(sizeof(matrix));
    if(size==0) {
        matrices -> matrix = NULL;
        return matrices;
    }
    matrix.size = size;
    matrix.matrix = malloc(size*sizeof(int*));
    for(int i=0; i < size; i++) {
        matrix.matrix[i] = malloc(size*sizeof(int));
    }
    int base = 0;
    int iteration = 0;
    while(base < size*size) {
        if(iteration%4==0) {
            for(int i=0; i < size-iteration/2; i++) {
                matrix.matrix[iteration/4][i+iteration/4] = i+base+1;
            }
        } else if(iteration%4 == 1) {
            for(int i=0; i < size-iteration/2-1; i++) {
                matrix.matrix[i+1+iteration/4][size-1-iteration/4] = i+base+1;
            }
        } else if(iteration%4 == 2) {
            for(int i=0; i < size-iteration/2; i++) {
                matrix.matrix[size-1-iteration/4][size-2-iteration/4-i] = i+base+1;
            }
        } else if(iteration%4 == 3) {
            for(int i=0; i < size-iteration/2-1; i++) {
                matrix.matrix[size-2-iteration/4-i][iteration/4] = i+base+1;
            }
        }
        if(iteration%2==0) {
            base += size - iteration/2;
        } else {
            base += size - iteration/2 - 1;
        }
        iteration++;
    }
    matrices[0] = matrix;
    return matrices;
}

void spiral_matrix_destroy(spiral_matrix_t *matrices) {
    free(matrices);
    matrices = NULL;
    return;
}
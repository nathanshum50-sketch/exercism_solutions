#include "triangle.h"

bool is_triangle(triangle_t sides) {
    if(sides.a >= 0 && sides.b >= 0 && sides.c >= 0) {
        if(sides.a + sides.b >= sides.c && sides.b + sides.c >= sides.a && sides.a + sides.c >= sides.b) {
            return true;
        }
    }
    return false;
}
bool is_equilateral(triangle_t sides) {
    if(is_triangle(sides) && sides.a == sides.b && sides.b == sides.c && sides.a > 0) {
        return true;
    }
    return false;
}
bool is_isosceles(triangle_t sides) {
    if(is_triangle(sides) && (sides.a == sides.b || sides.a == sides.c || sides.c == sides.b)) {
        return true;
    }
    return false;
}
bool is_scalene(triangle_t sides) {
    if(is_triangle(sides) && !is_isosceles(sides)) {
        return true;
    }
    return false;
}
#include "complex_numbers.h"

complex_t c_add(complex_t a, complex_t b)
{
    complex_t sum;
    sum.real = a.real + b.real;
    sum.imag = a.imag + b.imag;
    return sum;
}

complex_t c_sub(complex_t a, complex_t b)
{
    complex_t difference;
    difference.real = a.real - b.real;
    difference.imag = a.imag - b.imag;
    return difference;
}

complex_t c_mul(complex_t a, complex_t b)
{
    complex_t multiple;
    multiple.real = a.real * b.real - a.imag * b.imag;
    multiple.imag = a.imag * b.real + a.real * b.imag;
    return multiple;
}

complex_t c_div(complex_t a, complex_t b)
{
    complex_t dividend;
    dividend.real = (a.real * b.real + a.imag * b.imag) / (b.real * b.real + b.imag * b.imag);
    dividend.imag = (a.imag * b.real - a.real * b.imag) / (b.real * b.real + b.imag * b.imag);
    return dividend;
}

double c_abs(complex_t x)
{
    return sqrt(x.real*x.real + x.imag*x.imag);
}

complex_t c_conjugate(complex_t x)
{
    complex_t conj;
    conj.real = x.real;
    conj.imag = -x.imag;
    return conj;
}

double c_real(complex_t x)
{
    return x.real;
}

double c_imag(complex_t x)
{
    return x.imag;
}

complex_t c_exp(complex_t x)
{
    complex_t expo;
    expo.real = exp(x.real)*cos(x.imag);
    expo.imag = exp(x.real)*sin(x.imag);
    return expo;
}

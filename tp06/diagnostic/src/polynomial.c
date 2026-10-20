#include <math.h>
#include <stdio.h>

static double polynomial(double x) {
    double u = (x - 1.0) / x;
    double result = u;

    for (int exponent = 2; exponent <= 5; ++exponent) {
        result += pow(u, exponent) / exponent;
    }
    return result;
}

int main(void) {
    double x = 2.0;

    printf("x = %.1f ; y = %.6f\n", x, polynomial(x));
    return 0;
}

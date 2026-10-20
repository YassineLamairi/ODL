#include <stdio.h>

static const double PI = 3.141592653589793;

int main(void) {
    double radius = 5.0;
    double surface_area;
    double volume;
    surface_area = 4.0 * PI * radius * radius;

    volume = surface_area * radius / 3.0;
    printf("Rayon : %.2f cm\n", radius);
    printf("Aire : %.2f cm2\n", surface_area);
    printf("Volume : %.2f cm3\n", volume);
    return 0;
}

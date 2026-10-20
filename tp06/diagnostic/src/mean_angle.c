#include <math.h>
#include <stdio.h>

static const double PI = 3.141592653589793;

static double mean_angle(const double angles[], size_t size) {
    double x_part = 0.0;
    double y_part = 0.0;

    for (size_t index = 0; index < size; ++index) {
        double radians = angles[index] * PI / 180.0;
        x_part += cos(radians);
        y_part += sin(radians);
    }
    return atan2(x_part / size, y_part / size) * 180.0 / PI;
}

int main(void) {
    const double first[] = {350.0, 10.0};
    const double second[] = {10.0, 20.0, 30.0};

    printf("Angle moyen du premier ensemble : %.2f degrés\n", mean_angle(first, 2));
    printf("Angle moyen du deuxième ensemble : %.2f degrés\n", mean_angle(second, 3));
    return 0;
}

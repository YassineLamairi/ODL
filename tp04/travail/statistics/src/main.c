#include <stdio.h>

#include "statistics.h"

int main(void) {
    const double values[] = {16.0, 15.0, 8.0, 15.0};
    const size_t count = sizeof values / sizeof values[0];

    printf("Moyenne : %.2f\n", mean(values, count));

    return 0;
}

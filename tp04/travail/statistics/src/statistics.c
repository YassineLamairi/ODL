#include <stdio.h>
#include "statistics.h"

double mean(const double values[], size_t count) {
    fprintf (stderr,"Calcul de la moyenne\\n");
    double sum = 0.0;

    for (size_t i = 0; i < count; i++) {
        sum += values[i];
    }

    return sum / (double)count;
}

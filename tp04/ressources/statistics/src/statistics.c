#include "statistics.h"

double mean(const double values[], size_t count) {
    double sum = 0.0;

    for (size_t i = 0; i < count; i++) {
        sum += values[i];
    }

    return sum / (double)count;
}

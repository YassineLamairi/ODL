#include <inttypes.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

#ifndef SIZE
#define SIZE 10000
#endif

#if SIZE < 2
#error "SIZE doit être supérieur ou égal a 2"
#endif

static unsigned int values[SIZE];

static void fill_descending(void) {
    for (size_t index = 0; index < SIZE; ++index) {
        values[index] = (unsigned int)(SIZE - index);
    }
}

static void bubble_sort(void) {
    size_t end = SIZE;
    int swapped;

    do {
        swapped = 0;
        for (size_t index = 1; index < end; ++index) {
            if (values[index - 1] > values[index]) {
                unsigned int temporary = values[index - 1];
                values[index - 1] = values[index];
                values[index] = temporary;
                swapped = 1;
            }
        }
        --end;
    } while (swapped);
}

static int is_sorted(void) {
    for (size_t index = 1; index < SIZE; ++index) {
        if (values[index - 1] > values[index]) {
            return 0;
        }
    }
    return 1;
}

static uint64_t fingerprint(void) {
    uint64_t result = UINT64_C(1469598103934665603);

    for (size_t index = 0; index < SIZE; ++index) {
        result ^= values[index];
        result *= UINT64_C(1099511628211);
    }
    return result;
}

int main(void) {
    fill_descending();
    bubble_sort();

    if (!is_sorted()) {
        fputs("Echec du tri\n", stderr);
        return 1;
    }

    printf("Tri vérifié : %d éléments ; empreinte : %" PRIu64 "\n", SIZE, fingerprint());
    return 0;
}

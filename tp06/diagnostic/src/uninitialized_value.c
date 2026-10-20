#include <stdio.h>
#include <stdlib.h>

int main(void) {
    const size_t count = 4;
    int *values = malloc(count * sizeof *values);
    int total = 0;

    if (values == NULL) {
        return 1;
    }
    values[0] = 10;
    values[1] = 20;
    values[2] = 30;
    values[3] = 40;
    for (size_t index = 0; index < count; ++index) {
        total += values[index];
    }
    printf("Total : %d\n", total);
    free(values);
    return 0;
}

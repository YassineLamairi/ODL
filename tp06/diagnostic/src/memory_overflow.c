#include <stdio.h>
#include <stdlib.h>

static int *build_sequence(size_t count) {
    int *values = malloc(count * sizeof *values);

    if (values == NULL) {
        return NULL;
    }
    for (size_t index = 0; index < count; ++index) {
        values[index] = (int)index;
    }
    return values;
}

int main(void) {
    const size_t count = 100;
    int *values = build_sequence(count);

    if (values == NULL) {
        return 1;
    }
    printf("Première valeur : %d ; dernière valeur : %d\n", values[0], values[count - 1]);
    free(values);
    return 0;
}

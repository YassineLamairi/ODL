#include <stdio.h>

int main(void) {
    int years[10];

    for (int index = 0; index < 10; ++index) {
        years[index] = 2017 + index;
    }
    printf("Première année : %d\n", years[0]);
    printf("Dernière année : %d\n", years[9]);
    return 0;
}

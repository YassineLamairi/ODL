#include <stdio.h>

static int sum_to(int n) {
    int sum=0;

    for (int i = 1; i <= n; ++i) {
        sum += i;
    }
    return sum;
}

int main(void) {
    printf("Somme des entiers de 1 à 10 : %d\n", sum_to(10));
    return 0;
}

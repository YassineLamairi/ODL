#include <stdio.h>

static int within_range(int value, int minimum, int maximum) {
    return value >= minimum && value <= maximum;
}

static void check_reading(int reading) {
    int accepted = within_range(reading, 10, 20);
    printf("Mesure %d : %d\n", reading, accepted);
}

int main(void) {
    check_reading(15);
    check_reading(10);
    check_reading(20);
    return 0;
}

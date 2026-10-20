#include <stdio.h>

#ifndef BUILD_NUMBER
#define BUILD_NUMBER 1
#endif

int main(void) {
#ifdef VERBOSE
    fprintf(stderr, "Mode verbeux\n");
#endif

    printf("Construction %d\n", BUILD_NUMBER);
    return 0;
}

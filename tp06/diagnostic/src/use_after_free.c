#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static char *make_word(void) {
    char *word = malloc(6);

    if (word != NULL) {
        strcpy(word, "Guy");
    }
    return word;
}

int main(void) {
    char *word = make_word();

    if (word == NULL) {
        return 1;
    }
    printf("Mot : %s\n", word);
    free(word);
    return 0;
}

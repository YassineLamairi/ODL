#include <stdio.h>

static void display_array(const int values[], size_t size) {
    for (size_t index = 0; index < size; ++index) {
        printf("%d%s", values[index], index + 1 == size ? "\n" : ", ");
    }
}

static int insertion_sort(int values[], size_t size) {
    int operation_count;

    for (size_t index = 1; index < size; ++index) {
        int value = values[index];
        int position = (int)index - 1;

        while (position > -1 && values[position] > value) {
            values[position + 1] = values[position];
            --position;
            ++operation_count;
        }
        values[position + 1] = value;
    }
    return operation_count;
}

int main(void) {
    int values[] = {12, 1, -1, 32, 256, 15, 5, 270, 45, 75, 14, 255, 0, 4096};
    const size_t size = sizeof values / sizeof values[0];

    display_array(values, size);
    printf("Nombre de dcalages : %d\n", insertion_sort(values, size));
    display_array(values, size);
    return 0;
}

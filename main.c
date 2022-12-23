#include <stdio.h>
#include <stdlib.h>

void read_input(int *array, int size) {
    for (int i = 0; i < size; ++i) {
            scanf("%d", &array[i]);
    }
}

void make_new_array(int* old_array, int *new_array, int size) {
    for (int i = 0; i < size; i += 2) {
        new_array[i / 2] = old_array[i];
    }
    for (int i = 1; i < size; i += 2) {
        new_array[i / 2 + size / 2 + size % 2] = old_array[i];
    }
}

void print_array(int *array, int size) {
    for (int i = 0; i < size; i++) {
            printf("%d ", array[i]);
    }
}

int main() {
    int n;
    scanf("%d", &n);

    int old_array[n];
    int new_array[n];

    read_input(old_array, n);
    make_new_array(old_array, new_array, n);
    print_array(new_array, n);

    return 0;
}
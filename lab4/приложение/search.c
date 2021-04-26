#include <stddef.h>
#include "main.h"

void sort(unsigned *array, size_t size) {
    for (size_t i = 0; i < size - 1; i++) {
        for (size_t j = 0; j < size - 1 - i; j++) {
            if (array[j] > array[j + 1]) {
                unsigned save = array[j];
                array[j] = array[j + 1];
                array[j + 1] = save;
            }

        }
    }
}

unsigned findElement(const unsigned *array, size_t size) {
    unsigned result;
    size_t resSize = 0;
    size_t currentSize = 1;

    for (size_t i = 0; i < size - 1; i++) {
        if (array[i] != array[i + 1]) {
            if (currentSize >= resSize) {
                resSize = currentSize;
                result = array[i];
            }
            currentSize = 1;
        } else {
            currentSize++;
        }
    }

    //Проверка краевого случая
    if (currentSize >= resSize) {
        result = array[size - 1];
    }
    return result;
}

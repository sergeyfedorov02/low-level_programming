#include <stddef.h>
#include <stdio.h>
#include "main.h"

//Создаем массив
static unsigned array[] = {2, 5, 2, 3, 1, 1};

//Найдем размерность массива
static const size_t array_length = sizeof(array) / sizeof(array[0]);


int main() {

    // Выведем изначальный массив на экран
    printf("\nOriginal array\n");
    for (size_t i = 0; i < array_length; i++) {
        printf("%u ", array[i]);
    }

    //Сделаем сортировку
    sort(array, array_length);

    //Выведем отсортированный массив
    printf("\n\nSorted array\n");
    for (size_t i = 0; i < array_length; i++) {
        printf("%u ", array[i]);
    }

    //Найдем наиболее часто встречающееся значение
    printf("\n\nMost common meaning\n");
    unsigned element = findElement(array, array_length);
    printf("%u ", element);

}

# 1 "search.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "search.c"
# 1 "c:\\riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-w64-mingw32\\lib\\gcc\\riscv64-unknown-elf\\10.2.0\\include\\stddef.h" 1 3 4
# 143 "c:\\riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-w64-mingw32\\lib\\gcc\\riscv64-unknown-elf\\10.2.0\\include\\stddef.h" 3 4

# 143 "c:\\riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-w64-mingw32\\lib\\gcc\\riscv64-unknown-elf\\10.2.0\\include\\stddef.h" 3 4
typedef long int ptrdiff_t;
# 209 "c:\\riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-w64-mingw32\\lib\\gcc\\riscv64-unknown-elf\\10.2.0\\include\\stddef.h" 3 4
typedef long unsigned int size_t;
# 321 "c:\\riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-w64-mingw32\\lib\\gcc\\riscv64-unknown-elf\\10.2.0\\include\\stddef.h" 3 4
typedef int wchar_t;
# 415 "c:\\riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-w64-mingw32\\lib\\gcc\\riscv64-unknown-elf\\10.2.0\\include\\stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 426 "c:\\riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-w64-mingw32\\lib\\gcc\\riscv64-unknown-elf\\10.2.0\\include\\stddef.h" 3 4
} max_align_t;
# 2 "search.c" 2
# 1 "main.h" 1




# 4 "main.h"
void sort(unsigned *array, size_t size);
unsigned findElement(const unsigned *array, size_t size);
# 3 "search.c" 2

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


    if (currentSize >= resSize) {
        result = array[size - 1];
    }
    return result;
}

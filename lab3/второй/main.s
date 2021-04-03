# main.s
.text
main:
.globl main
 la a3, array_length #}
 lw a3, 0(a3) #} a3 = <длина массива>
 la a4, array # a4 = <адрес 0-го элемента массива>
 
 la a7, array_length # переменная для хранения значения текущего N-i 
 lw a7, 0(a7) #} a7 = <длина массива>
  
 addi sp, sp, -16 # выделение памяти в стеке
 sw ra, 12(sp) # записываем ra (адрес возврата)
 
 call second # вызываем нашу подпрограмму
 
 lw ra, 12(sp) # восстанавливаем ra
 addi sp, sp, 16 # освобождение памяти в стеке
 
 li a0, 0
 ret
 
.rodata # помещение в секцию неизменяемых данных
array_length:
 .word 9
.data # помещение в секцию изменяемых данных
array:
 .word 4, 2, 3, 2, 1, 5, 2, 1, 1
result:
 .word 0 # запишем значение result 
# setup.s
.text
start:
.globl start
 call main # вызываем подпрограмму main
finish:
 li a0, 10 # x10 = 10
 ecall # ecall при значении x10 = 10 => останов симулятора
 
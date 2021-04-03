# second.s
.text
second:
.globl second
 # la a3, array_length #}
 # lw a3, 0(a3) #} a3 = <длина массива>
 # la a4, array # a4 = <адрес 0-го элемента массива>
 li a2, 1 # a2 = 1 # переменная для внутреннего цикла
 li a1, 0 # a1 = 1 # переменная для внешнего цикла
 
 # la a7, array_length # переменная для хранения значения текущего N-i 
 # lw a7, 0(a7) #} a7 = <длина массива>
 addi a7, a7, 1 # a7 = a7 + 1 (длина массива + 1)
 
output_loop: # внешний цикл от 1 до N
 addi a1, a1, 1 # a1 += 1
 addi a7, a7, -1 # изменим значение N-i
 li a2, 1 # обновим a2 для нового внутреннего цикла

 bgeu a1, a3, loop_findElement # if( a1 >= a3 ) goto loop_findElement (внешний цикл закончился -> массив отсортирован)
 inner_loop: # внутренний цикл от 1 до N-i, где i - значение внешнего цикла

  bgeu a2, a7, output_loop # if( a2 >= a7 ) goto output_loop (внутренний цикл закончился -> идем на внешний цикл)
  
  # Получим значения x[i], где i = a5 и x[i-1], где i-1 = a6 
  # каждый элемент в отдельном байте, а чтобы получить индекс след. элемента, надо увеличить текущее значение на 4
  slli a5, a2, 2 # a5 = a2 << 2 = a2 * 4 
  add a5, a4, a5 # a5 = a4 + a5 = a4 + a2 * 4
  addi a6, a5, -4 # a6 = a5 + (-4) = a5 - 4
  lw t1, 0(a6) # t1 = array[i-1]
  lw t0, 0(a5) # t0 = array[i]
  
  # Делаем проверку для того, чтобы поменяться местами x[i] и x[i-1] элементы
  bltu t1, t0, noChange_loop # if (t1 < t0) goto noChange_loop
  sw t1, 0(a5) # array[i] = t1
  sw t0, 0(a6) # array[i-1] = t0
  
  noChange_loop: # эдементы местами менять не надо
   addi a2, a2, 1 # a2 += 1
  
  jal zero, inner_loop # goto inner_loop
  
loop_findElement: # массив отсортирован и теперь в нем можно найти наиболее часто встречающееся значение
 # Сначала сделаем t2 - индекс ячейки, где находится result
 # la a2, array_length # Присвоим a2 значение длины массива
 mv a2, a3 #} a2 = <длина массива>
 slli t2, a2, 2 # t2 = a2 << 2 = a2 * 4 (теперь сдвинемся на следующую ячейку, где лежит result)
 add t2, a4, t2 # t2 = a4 + t2 = a4 + a2 * 4 (t2 - это индекс result)
 
 li a2, 1 # обновим a2
 lw t0, 0(a4) # t0 = array[0]
 sw t0, 0(t2) # result = t0 (t0 == array[0])

# Введем несколько перменных для поиска result
li a1, 1 # Создадим counter (счетчик текущего количества повторений элемента)  
li a7, 1 # Создадим Rescounter (счетчик количества повторений элемента, находящегося в result)  
 
# Теперь напишем цикл, в котором пробежимся по массиву и найдем наиболее часто встречающееся значение
loop_searchCycle:
 bgeu a2, a3, loop_endCycle # if( a2 >= a3 ) goto loop_endCycle (обошли весь массив -> завершаем работу)
 
 # Получим значения x[i], где i = a5 и x[i-1], где i-1 = a6 
 slli a5, a2, 2 # a5 = a2 << 2 = a2 * 4 
 add a5, a4, a5 # a5 = a4 + a5 = a4 + a2 * 4
 addi a6, a5, -4 # a6 = a5 + (-4) = a5 - 4
 lw t1, 0(a6) # t1 = array[i-1]
 lw t0, 0(a5) # t0 = array[i]
 
 # Делаем проверку на то, начались ли элементы массива с другим значением
 bltu t1, t0, replaceRes_loop # if (t1 < t0) goto replaceRes_loop
  addi a1, a1, 1 # a1 += 1 (увеличиваем значение counter, тк значение не изменилось)
  addi a2, a2, 1 # a2 += 1
  jal zero, loop_searchCycle # goto loop_searchCycle
 
 replaceRes_loop: # Надо сделать проверку (conter > resCounter или нет)
  bltu a1, a7, noChangeRes_loop # if (a1 < a7, что означает counter < resCounter) goto noChangeRes_loop
   # Попадаем сюда, если a1 >= a7, что означает counter >= resCounter
   sw t1, 0(t2) # result = t1 (t1 == array[i-1])
   mv a7, a1 # resCounter = counter
   
  noChangeRes_loop: 
   li a1, 1 # counter = 1
   addi a2, a2, 1 # a2 += 1
   jal zero, loop_searchCycle # goto loop_searchCycle
   
loop_endCycle:
# Сделаем проверку краевого случая, когда наиболее часто встр. значение стоит в конце массива
 bltu a1, a7, loop_exit # if (a1 < a7, что означает counter < resCounter) goto loop_exit
  # Попадаем сюда, если a1 >= a7, что означает counter >= resCounter 
  sw t0, 0(t2) # result = t0 (t0 == array[i])  

loop_exit:
 ret
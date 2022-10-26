# Исходная задача

На языке LUA реализовать следующий функционал:
В ячейке А1 и А2 вводятся натуральные числа.

Написать алгоритм вычисления числа Фибоначчи. Каждое следующее число в своей ячейке. 
Ячейка А1 отвечает за количество значений, которое требуется вычислить.
Ячейка А2 отвечает за направление заполнения ячеек. Чётное значение - горизонтально. Нечётное значения - вертикальное заполнение ячеек. 

Начальная ячейка для вывода - Б2

# Решение
```
lua fibSeries.lua
```

## Примеры вывода

По строкам
```
-- Fibonacci calculator --


Enter integer value for cell A1: 
4
Enter integer value for cell A2: 
1

A1 = 4, Fibonacci series depth
A2 = 1, number type: odd

#       Fibonacci series
1       1.0
2       2.0
3       3.0
4       5.0

row mode filling

--- Resulting matrix ---

  A  B .. 
[ 4  0 ]
[ 1  1 ]
[ 0  2 ]
[ 0  3 ]
[ 0  5 ]
rows: 5, cols: 2
```

По столбцам
```
-- Fibonacci calculator --


Enter integer value for cell A1: 
4
Enter integer value for cell A2: 
2

A1 = 4, Fibonacci series depth
A2 = 2, number type: even

#       Fibonacci series
1       1.0
2       2.0
3       3.0
4       5.0

column mode filling

--- Resulting matrix ---

  A  B .. 
[ 4  0  0  0  0 ]
[ 2  1  2  3  5 ]
rows: 2, cols: 5
```

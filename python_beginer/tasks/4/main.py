import random
import functools
import itertools
from collections import OrderedDict


"""
1.1. Реализовать скрипт, в котором должна быть предусмотрена функция расчета заработной платы сотрудника. 
В расчете необходимо использовать формулу: (выработка в часах * ставка в час) + премия. 
Для выполнения расчета для конкретных значений необходимо запускать скрипт с параметрами.
"""


def meas_salary(**kwargs):
    name = kwargs.get('name', 'Ivan')
    hours = kwargs.get('hours', 160)
    cost_per_hours = kwargs.get('cph', 500)
    overhead = kwargs.get('over', 1000)

    return """Зарплата {} за период: {}""".format(
        name,
        (hours * cost_per_hours) + overhead
    )


"""
2. 2. Представлен список чисел. Необходимо вывести элементы исходного списка, значения которых больше предыдущего элемента.
Подсказка: элементы, удовлетворяющие условию, оформить в виде списка. Для формирования списка использовать генератор.
Пример исходного списка: [300, 2, 12, 44, 1, 1, 4, 10, 7, 1, 78, 123, 55].
Результат: [12, 44, 4, 10, 78, 123].
"""


def gen_sort_list(size=10):
    input_list = [random.randint(1, 1000) for _ in range(size)]
    print(input_list)
    return [input_list[each] for each in range(1, len(input_list)) if input_list[each] > input_list[each-1]]


"""
3. Для чисел в пределах от 20 до 240 найти числа, кратные 20 или 21. Необходимо решить задание в одну строку.
Подсказка: использовать функцию range() и генератор.
"""


def find_value():
    input_list = list(range(20, 241))
    return [each for each in input_list if not (each % 20) or not (each % 21)]


"""
4.Представлен список чисел. Определить элементы списка, не имеющие повторений.
Сформировать итоговый массив чисел, соответствующих требованию. 
Элементы вывести в порядке их следования в исходном списке. Для выполнения задания обязательно использовать генератор.
Пример исходного списка: [2, 2, 2, 7, 23, 1, 44, 44, 3, 2, 10, 7, 4, 11].
Результат: [23, 1, 3, 10, 4, 11]
"""


def gen_unique(size=10):
    input_list = [random.randint(1, 10) for _ in range(size)]
    print(input_list)
    return list(OrderedDict.fromkeys(input_list))


"""
5. Реализовать формирование списка, используя функцию range() и возможности генератора. В
 список должны войти четные числа от 100 до 1000 (включая границы). 
 Необходимо получить результат вычисления произведения всех элементов списка.
Подсказка: использовать функцию reduce().
"""


def list_reduce():
    input_list = list(range(100, 1001))
    print(input_list[0], "...", input_list[-1])
    return int(functools.reduce(lambda x1, x2: x1*x2, input_list))


"""
6. Реализовать два небольших скрипта:
а) итератор, генерирующий целые числа, начиная с указанного,
б) итератор, повторяющий элементы некоторого списка, определенного заранее.
Подсказка: использовать функцию count() и cycle() модуля itertools. Обратите внимание, 
что создаваемый цикл не должен быть бесконечным. Необходимо предусмотреть условие его завершения.
Например, в первом задании выводим целые числа, начиная с 3, а при достижении числа 10 завершаем цикл. 
Во втором также необходимо предусмотреть условие, при котором повторение элементов списка будет прекращено.
"""


def count_func(start=3):
    for each in itertools.count(start):
        yield each

        if each == 10:
            break


def cycle_func():
    input_list = [random.randint(1, 10) for _ in range(10)]
    print(input_list)
    count = 0
    for each in itertools.cycle(input_list):
        yield each

        count = count + 1
        if count == 10:
            break


"""
7.Реализовать генератор с помощью функции с ключевым словом yield, создающим очередное значение. 
При вызове функции должен создаваться объект-генератор. Функция должна вызываться следующим образом: for el in fact(n). 
Функция отвечает за получение факториала числа, а в цикле необходимо выводить только первые n чисел, начиная с 1! и до n!.
Подсказка: факториал числа n — произведение чисел от 1 до n. Например, факториал четырёх 4! = 1 * 2 * 3 * 4 = 24.
"""


def fact(n):
    val = 1
    for ind, n in enumerate(range(1, n+1)):
        val = val * n
        yield ind+1, val


def run_fact(n):
    for el in fact(n):
        print("""Факториал {} = {}""".format(*el))


def run():
    print(meas_salary())
    print(gen_sort_list())
    print(find_value())
    print(gen_unique())
    print(list_reduce())
    _ = [print(each) for each in count_func(3)]
    _ = [print(each) for each in cycle_func()]
    print(run_fact(10))

if __name__ == "__main__":
    run()

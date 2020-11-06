import time
from itertools import starmap
from random import randint

"""
1. Создать список и заполнить его элементами различных типов данных. 
Реализовать скрипт проверки типа данных каждого элемента. 
Использовать функцию type() для проверки типа. 
Элементы списка можно не запрашивать у пользователя, а указать явно, в программе.
"""


def check_type(val, type):
    return isinstance(val, type)


def vars_type():
    a = 1
    b = 1.0
    c = '1'
    d = {'a': 1}
    e = (1, 2)
    f = [1]
    g = set([1, 2])
    first = [a, b, c, d, e, f, g]
    second = [int, float, str, dict, tuple, list, set]
    # print(list(map(check_type(), zip([(a, int), (b, float), (c,str), (d, dict), (e, tuple), (f, list), (g, set)])))
    print(
        "Result: {}".format([(a, (type(a)), b) for a, b in zip(first, list(starmap(check_type, zip(first, second))))]))


"""
2. Для списка реализовать обмен значений соседних элементов, т.е. 
Значениями обмениваются элементы с индексами 0 и 1, 2 и 3 и т.д. 
При нечетном количестве элементов последний сохранить на своем месте. 
Для заполнения списка элементов необходимо использовать функцию input().
"""


def shift(values=None):
    """
    Смещение элементов
    :param values: list значений
    :return: перемешанный лист
    """
    if values is None:
        values = input('Input values with separate (,): ').split(',')
    if not len(values) % 2:
        return [item for each in range(1, len(values), 2) for item in [values[each], values[each - 1]]]
    else:
        buf = [item for each in range(1, len(values) - 1, 2) for item in [values[each], values[each - 1]]]
        buf.append(values[-1])
        return buf


"""
3. Пользователь вводит месяц в виде целого числа от 1 до 12. Сообщить к какому времени года относится месяц 
(зима, весна, лето, осень). Напишите решения через list и через dict.
"""


def define_season(mode=1):
    """
    Определяем время года по номеру месяца
    :param mode: 1 - через лист, None - через словарь
    :return: str время года
    """
    value = int(input("Введите номер месяца (1-12): "))

    if mode:
        season = ['зима', 'весна', 'лето', 'осень']
        return season[((value) // 3) - 4]
    else:
        season = {0: 'зима', 1: 'весна', 2: 'лето', 3: 'осень'}
        if value == 12:
            return season[((value) // 3) - 4]
        return season[((value) // 3)]


"""
4. Пользователь вводит строку из нескольких слов, разделённых пробелами. Вывести каждое слово с новой строки. 
Строки необходимо пронумеровать. Если в слово длинное, выводить только первые 10 букв в слове.
"""


def split_words(sentense):
    """
    Разделяет предложение на слова
    :param sentense: Строка
    :return: None
    """
    if sentense is None:
        sentense = input('Input sentense with separate (space): ').split(' ')
    else:
        sentense = sentense.split(' ')
    for ind, word in enumerate(sentense):
        print("{}: {}".format(ind, word))
        if ind == 10:
            break


"""
5. Реализовать структуру «Рейтинг», представляющую собой не возрастающий набор натуральных чисел. 
У пользователя необходимо запрашивать новый элемент рейтинга. 
Если в рейтинге существуют элементы с одинаковыми значениями, 
то новый элемент с тем же значением должен разместиться после них.

Подсказка. Например, набор натуральных чисел: 7, 5, 3, 3, 2.
Пользователь ввел число 3. Результат: 7, 5, 3, 3, 3, 2.
Пользователь ввел число 8. Результат: 8, 7, 5, 3, 3, 2.
Пользователь ввел число 1. Результат: 7, 5, 3, 3, 2, 1.
Набор натуральных чисел можно задать непосредственно в коде, например, my_list = [7, 5, 3, 3, 2].
"""


def generate_int(size=6):
    """
    Генерация цифр в диапазоне
    :return:
    """
    return [randint(1, 8) for _ in range(size)]


def rating():
    """
    Функция работы с рейтингом. Выводит неубывающую последовательность цифр
    :return:
    """
    out = generate_int()
    out.append((int(input("Input rating value: "))))
    print(sorted(out, reverse=True))


"""
6. * Реализовать структуру данных «Товары». Она должна представлять собой список кортежей. 
Каждый кортеж хранит информацию об отдельном товаре. В кортеже должно быть два элемента — номер товара и словарь 
с параметрами (характеристиками товара: название, цена, количество, единица измерения). 
Структуру нужно сформировать программно, т.е. запрашивать все данные у пользователя.
Пример готовой структуры:
[
(1, {“название”: “компьютер”, “цена”: 20000, “количество”: 5, “eд”: “шт.”}),
(2, {“название”: “принтер”, “цена”: 6000, “количество”: 2, “eд”: “шт.”}), 
(3, {“название”: “сканер”, “цена”: 2000, “количество”: 7, “eд”: “шт.”})
]

Необходимо собрать аналитику о товарах. Реализовать словарь, в котором каждый ключ — характеристика товара, 
например название, а значение — список значений-характеристик, например список названий товаров.
Пример:
{
“название”: [“компьютер”, “принтер”, “сканер”],
“цена”: [20000, 6000, 2000],
“количество”: [5, 2, 7],
“ед”: [“шт.”]
}

"""


class Store():
    """
    Класс магазина
    """

    def __init__(self, n_goods=3):
        """
        По умолчанию кол-во товаров 3
        :param n_goods: число товаров
        """
        self.goods = []
        self.analytic = {
            "название": [],
            "цена": [],
            "количество": [],
            "ед.": []
        }

        self._init_goods(n_goods)
        self._analysis()

    def _init_goods(self, n_goods):
        """
        Ввод товаров
        :param n_goods:
        :return:
        """
        print("Введите следующее кол-во товара: ", n_goods)
        for ind, _ in enumerate(range(n_goods)):
            self.name = input('Input the name of good: ')
            self.price = input('Input the price of good: ')
            self.qnt = input('Input the quantity of good: ')
            self.unit = input('Input the quantity of unit: ')
            self.goods.append((ind, {'название': self.name, 'цена': self.price,
                                     'количество': self.qnt, 'ед.': self.unit}))

    def _analysis(self):
        """
        Сбор аналитики
        :return:
        """
        for each in self.goods:
            for name in self.analytic.keys():
                self.analytic[name].append(each[1][name])

        self.analytic['ед.'] = set(self.analytic['ед.'])


def run():
    vars_type()
    print(shift())
    print(define_season())
    print(define_season(mode=0))
    split_words('Hello world')
    rating()
    store = Store(3)
    print(store.analytic)




if __name__ == "__main__":
    run()

import codecs
import os
import random
import re
import json



"""
1. Создать программно файл в текстовом формате, записать в него построчно данные, вводимые пользователем.
Об окончании ввода данных свидетельствует пустая строка.
"""


def create_txt_file():
    with codecs.open('task-1.txt', 'w', 'utf-8') as file:
        while True:
            input_str = input("Введите строку: ")
            if input_str == '':
                break
            file.write(input_str + os.linesep)


"""
2. Создать текстовый файл (не программно), 
сохранить в нем несколько строк, выполнить подсчет количества строк, количества слов в каждой строке.
"""


def read_file(path):
    with open(path, 'r') as file:
        data = file.readlines()
    return data


def text_describe(path='task-1.txt'):
    data = read_file(path)
    for ind, each in enumerate(data):
        if each == "":
            continue
        print('В строке {} находится {} слов'.format(ind+1, len(each.split(' '))))


"""
3.Создать текстовый файл (не программно), построчно записать фамилии сотрудников и величину их окладов. 
Определить, кто из сотрудников имеет оклад менее 20 тыс., вывести фамилии этих сотрудников. 
Выполнить подсчет средней величины дохода сотрудников.
"""


def salary_file(path='task-3.txt'):
    data = read_file(path)

    people_list = [each.strip('\n').split(": ") for each in data]
    people_less = [(each[0], int(each[1])) for each in people_list if int(each[1]) < 20000]
    print("Число сотрудников с зарплатой менее 20к: ", list(map(lambda x: x[0], people_less)))
    print('Средняя зарплата: ', sum([int(each[1]) for each in people_list])/len(people_list))


"""
4. Создать (не программно) текстовый файл со следующим содержимым:
One — 1
Two — 2
Three — 3
Four — 4
Необходимо написать программу, открывающую файл на чтение и считывающую построчно данные. 
При этом английские числительные должны заменяться на русские. 
Новый блок строк должен записываться в новый текстовый файл.
"""


def read_numerical_file(path='task-4.txt'):
    data = read_file(path)

    with codecs.open('task-4-new.txt', 'w') as file:
        buf = [each.split(' — ') for each in data]
        print(buf)
        key_words = {
                    'One': 'Один',
                    'Two': 'Два',
                    'Three': 'Три',
                    'Four': 'Четыре'
                }
        for ind, each in enumerate(buf):
            data[ind] = data[ind].replace(each[0], key_words[each[0]])
        data = ''.join(data)
        file.write(data)


"""
5. Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных пробелами. 
Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.
"""


def count_sum_from_file():
    path = 'task-5'
    values = [str(random.randint(0, 1000)) for _ in range(100)]
    print('Input sum: ', sum(list(map(lambda x: int(x), values))))
    output = ' '.join(values)

    with codecs.open(path, 'w') as file:
        file.write(output)

    with codecs.open(path, 'r') as file:
        values_in = file.read()
        values = [int(each) for each in values_in.split(' ')]

    print('Read output sum: ', sum(values))


"""
6. Необходимо создать (не программно) текстовый файл, где каждая строка описывает учебный предмет и наличие лекционных, 
практических и лабораторных занятий по этому предмету и их количество. 
Важно, чтобы для каждого предмета не обязательно были все типы занятий. 
Сформировать словарь, содержащий название предмета и общее количество занятий по нему. Вывести словарь на экран.
Примеры строк файла:
Информатика: 100(л) 50(пр) 20(лаб).
Физика: 30(л) — 10(лаб)
Физкультура: — 30(пр) —

Пример словаря:
{“Информатика”: 170, “Физика”: 40, “Физкультура”: 30}
"""


def parsing_dict(path='task-6'):
    pattern = re.compile(r'\d+')

    with codecs.open(path, 'r', 'utf-8') as file:
        output = dict()
        for each in file.readlines():
            key, value = each.split(':')
            output[key] = sum([int(each) for each in re.findall(pattern, value) if value])
    print(output)


"""
7. Создать (не программно) текстовый файл, в котором каждая строка должна содержать данные о фирме: 
название, форма собственности, выручка, издержки.
Пример строки файла: firm_1 ООО 10000 5000.
Необходимо построчно прочитать файл, вычислить прибыль каждой компании, а также среднюю прибыль. 
Если фирма получила убытки, в расчет средней прибыли ее не включать.
Далее реализовать список. Он должен содержать словарь с фирмами и их прибылями, а также словарь со средней прибылью. 
Если фирма получила убытки, также добавить ее в словарь (со значением убытков).
Пример списка: [{“firm_1”: 5000, “firm_2”: 3000, “firm_3”: 1000}, {“average_profit”: 2000}].
Итоговый список сохранить в виде json-объекта в соответствующий файл.
Пример json-объекта:
[{"firm_1": 5000, "firm_2": 3000, "firm_3": 1000}, {"average_profit": 2000}]

Подсказка: использовать менеджеры контекста.
"""


def parsing_firm_profit(path='task-7'):

    with codecs.open(path, 'r', 'utf-8') as file:
        output = []
        firm_dict = dict()
        index = []
        firm_profit = []

        for ind, each in enumerate(file.readlines()):
            values = each.split(' ')
            firm_dict[values[0]] = abs(int(values[2]) - int(values[3]))

            if int(values[2]) >= int(values[3]):
                firm_profit.append(abs(int(values[2]) - int(values[3])))
                index.append(ind - 1)
            else:
                pass
        avg_profit = sum(firm_profit)/len(index)
        output.append(firm_dict)
        output.append(dict([("average_profit", avg_profit)]))

        with open('data.json', 'w') as f:
            json.dump(output, f)

def run():
    #create_txt_file()
    text_describe()
    salary_file()
    read_numerical_file()
    count_sum_from_file()
    parsing_dict()
    parsing_firm_profit()

if __name__ == "__main__":
    run()


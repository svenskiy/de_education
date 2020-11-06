import codecs
import os


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


def run():
    #create_txt_file()
    text_describe()
    salary_file()
    read_numerical_file()


if __name__ == "__main__":
    run()


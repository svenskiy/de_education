import time


def run():
    """
    Запуск задач
    :return:
    """

    """
    Поработайте с переменными, создайте несколько, выведите на экран, 
    запросите у пользователя несколько чисел и строк и сохраните в переменные, выведите на экран.
    """
    f_name = input('Input you name: ')
    l_name = input('Input you lastname:')
    age = input('Input you age:')

    # Инизиализируем класс и выводим информацию
    if f_name and l_name and age:
        task = Task_1(firstame=f_name, lastname=l_name, age=age)
    else:
        task = Task_1()
    print(task)

    """
    2. Пользователь вводит время в секундах. Переведите время в часы, минуты и секунды и выведите 
    в формате чч:мм:сс. Используйте форматирование строк.
    """
    task.set_time()

    """
    3. Узнайте у пользователя число n. Найдите сумму чисел n + nn + nnn. Например, пользователь ввёл число 3. 
    Считаем 3 + 33 + 333 = 369.
    """
    task.n_func()

    """
    4. Пользователь вводит целое положительное число. Найдите самую большую цифру в числе. 
    Для решения используйте цикл while и арифметические операции.
    """
    task.find_max_digit_in_string()

    """
    5. Запросите у пользователя значения выручки и издержек фирмы. 
    Определите, с каким финансовым результатом работает фирма (прибыль — выручка больше издержек, 
    или убыток — издержки больше выручки). Выведите соответствующее сообщение. 
    Если фирма отработала с прибылью, вычислите рентабельность выручки (соотношение прибыли к выручке). 
    Далее запросите численность сотрудников фирмы и определите прибыль фирмы в расчете на одного сотрудника.
    """
    task.company_task()

    """
    6. Спортсмен занимается ежедневными пробежками. В первый день его результат составил a километров. 
    Каждый день спортсмен увеличивал результат на 10 % относительно предыдущего. 
    Требуется определить номер дня, на который общий результат спортсмена составить не менее b километров. 
    Программа должна принимать значения параметров a и b и выводить одно натуральное число — номер дня.
    Например: a = 2, b = 3.
    """
    task.run_planning()

class Task_1:
    """Класс, содержащий все необходимые пункты задания"""

    def __init__(self, **kwargs):
        self.firstname = kwargs.get('firstame', 'Vasiliy')
        self.lastname = kwargs.get('lastname', 'Petrov')
        self.age = kwargs.get('age', 18)

    def __str__(self):
        return "Firstname is {},\n Lastname is {},\n Age is {}\n".format(self.firstname, self.lastname, self.age)

    @staticmethod
    def set_time():
        input_time = int(input('Input time in second: '))
        input_time = time.strftime('%H:%M:%S', time.gmtime(input_time))
        print(input_time)

    @staticmethod
    def n_func():
        n_var = input("Input number: ")
        one_n = int(n_var)
        two_n = int(n_var * 2)
        three_n = int(n_var * 3)
        print("Result of {} + {} + {} is {}".format(one_n, two_n, three_n, sum([one_n,two_n, three_n])))

    @staticmethod
    def find_max_digit_in_string():
        """
        Функция поиска максимальной цифре в числе.
        Note: использование цикла while избыточное, все можно сделать в одно списковое включение
        :return:
        """
        var = input('Input some number (ex. 365): ')
        count = 0
        buf_list = []
        var_len = len(var)

        while count < var_len:

            buf_list.append(int(var[count]))
            count = count + 1
            if count == var_len:
                print(max(buf_list))

    @staticmethod
    def company_task():
        revenue = float(input("Введите выручку компании: "))
        costs = float(input("Ввыедите издержки компании: "))

        factor = revenue/costs

        if factor >= 1:
            print("Фирма работает с прибылью {}".format(factor))
            personal = int(input("Введите численость сотрудников: "))
            print("Прибыль на одного сотрудника: {}".format(revenue/personal))
        else:
            print("Фирма работает в убыток")

    @staticmethod
    def run_planning():
        a = float(input("Введите число киллометров, которые пробежали в первый день (а): "))
        b = float(input("Какое колличество киллометров вы хотите пробежать? (b): "))

        progression = [a]

        while max(progression) <= b:
            progression.append(progression[-1]*1.1)

        for ind, each in enumerate(progression):
            print("{}-й день: {}".format(ind+1, round(each, 2)))



if __name__ == "__main__":
    run()

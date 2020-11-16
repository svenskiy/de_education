"""
1. Реализовать класс Matrix (матрица). Обеспечить перегрузку конструктора класса
(метод __init__()), который должен принимать данные (список списков) для формирования матрицы.
Подсказка: матрица — система некоторых математических величин, расположенных в виде прямоугольной схемы.
Примеры матриц вы найдете в методичке.

Следующий шаг — реализовать перегрузку метода __str__() для вывода матрицы в привычном виде.
Далее реализовать перегрузку метода __add__() для реализации операции сложения двух объектов класса Matrix (двух матриц).
Результатом сложения должна быть новая матрица.
Подсказка: сложение элементов матриц выполнять поэлементно — первый элемент
первой строки первой матрицы складываем с первым элементом первой строки второй матрицы и т.д.
"""


class Matrix:
    def __init__(self, *args):
        self.matrix = args[0]

    def __str__(self):
        output = ""
        for row in self.matrix:
            output = output + "{}\n".format(row)
        return output

    def __add__(self, other):
        cols = len(self.matrix)
        rows = len(self.matrix[0])
        output = []
        for ind in range(cols):
            each = [(self.matrix[ind][row] + other.matrix[ind][row]) for row in range(rows)]
            output.append(each)

        return Matrix(output)


"""
2. Реализовать проект расчета суммарного расхода ткани на производство одежды.
 Основная сущность (класс) этого проекта — одежда, которая может иметь определенное название. 
 К типам одежды в этом проекте относятся пальто и костюм. У этих типов одежды существуют параметры: 
 размер (для пальто) и рост (для костюма). 
 Это могут быть обычные числа: V и H, соответственно.
Для определения расхода ткани по каждому типу одежды использовать формулы: 
для пальто (V/6.5 + 0.5), для костюма (2 * H + 0.3). 
роверить работу этих методов на реальных данных.
Реализовать общий подсчет расхода ткани. Проверить на практике полученные на этом уроке знания: 
реализовать абстрактные классы для основных классов проекта, проверить на практике работу декоратора @property.
"""


class Wear:
    def __init__(self, name, **kwargs):
        if name == 'пальто':
            self.v = kwargs.get('v', float(input('Введире размер: ')))
            self.h = None
        if name == 'костюм':
            self.h = kwargs.get('h', float(input('Введире рост: ')))
            self.v = None

    @property
    def meas_cost(self):
        if self.v:
            return (self.v / 6.5) + 0.5
        if self.h:
            return (2 * self.h) + 0.3


"""
3. Реализовать программу работы с органическими клетками. Необходимо создать класс Клетка. 
"""


class Cell:
    def __init__(self, cells):
        self.cells = int(cells)

    def __add__(self, other):
        """
        Сложение. Объединение двух клеток.
        При этом число ячеек общей клетки должно равняться сумме ячеек исходных двух клеток.
        :param other:
        :return: Cell
        """
        return Cell(self.cells + other.cells)

    def __sub__(self, other):
        """
        Вычитание. Участвуют две клетки.
        Операцию необходимо выполнять только если разность количества ячеек двух клеток больше нуля,
        иначе выводить соответствующее сообщение.
        :param other:
        :return: Cell
        """
        if self.cells < other.cells:
            print("Вторая клетка должна быть меньше")
            return None
        else:
            return Cell(self.cells - other.cells)

    def __mul__(self, other):
        """
        Умножение. Создается общая клетка из двух.
        Число ячеек общей клетки определяется как произведение количества ячеек этих двух клеток.
        :param other:
        :return: Cell
        """
        return Cell(self.cells * other.cells)

    def __truediv__(self, other):
        """
        Деление. Создается общая клетка из двух.
        Число ячеек общей клетки определяется как целочисленное деление количества ячеек этих двух клеток.
        :param other:
        :return:
        """
        if other.cells == 0:
            print('У второй клетки нет ячеек')
            return None
        else:
            return Cell(abs(self.cells // other.cells))


    @staticmethod
    def make_order(cell_obj, n):
        """
        В классе необходимо реализовать метод make_order(), принимающий экземпляр класса и количество ячеек в ряду.
        Данный метод позволяет организовать ячейки по рядам.
        :return:
        """
        cols = cell_obj.cells // n
        rows = n
        last = cell_obj.cells % n
        out = ""
        for _ in range(cols):
            out = out + "*" * rows + '\n'
        if last:
            out = out + "*" * last

        return out


def run():
    array_a = Matrix([[1, 1, 1], [1, 1, 1]])
    array_b = Matrix([[2, -1, -1], [0, 1, 2]])
    print(array_a, sep='\n')
    print(array_b, sep='\n')
    print(array_a + array_b)

    # palto = Wear('пальто')
    # suit = Wear('костюм')
    # print(palto.meas_cost)
    # print(suit.meas_cost)

    a_cell = Cell(10)
    b_cell = Cell(5)
    c_cell = a_cell + b_cell
    print(c_cell.cells)
    c_cell = c_cell - Cell(3)
    print(c_cell.cells)
    c_cell = c_cell * Cell(2)
    print(c_cell.cells)
    c_cell = c_cell / Cell(4)
    print(c_cell.cells)
    print(Cell.make_order(c_cell, 2))


if __name__ == "__main__":
    run()
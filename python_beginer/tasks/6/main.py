import random
from collections import OrderedDict
import time


"""
1. Создать класс TrafficLight (светофор) и определить у него один атрибут color (цвет) и метод running (запуск). 
Атрибут реализовать как приватный. 
В рамках метода реализовать переключение светофора в режимы: красный, желтый, зеленый. 
Продолжительность первого состояния (красный) составляет 7 секунд, второго (желтый) — 2 секунды, 
третьего (зеленый) — на ваше усмотрение. Переключение между режимами должно осуществляться только в
указанном порядке (красный, желтый, зеленый). Проверить работу примера, создав экземпляр и вызвав описанный метод.
"""


class TrafficLight():
    def __init__(self):
        self._color = OrderedDict({'краcный':7, 'желтый': 2, 'зеленый': random.randint(2, 6)})

    def running(self):
        for key, value in self._color.items():
            print(key)
            time.sleep(value)

def run():
    task_1 = TrafficLight()
    task_1.running()


if __name__ == "__main__":
    run()
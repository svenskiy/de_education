"""
OAuth 2.0 Client Secret is: 7b197969c1e24ec48e5fa69c2efe717e
Your Client ID:
7cd68f4075a54e28b2751024275f0563


REST API OAuth 1.0 Credentials:
Your Consumer Key:
7cd68f4075a54e28b2751024275f0563
Your Consumer Secret:
11960e03f1404566a65cd0879f13062d
"""

from fatsecret import Fatsecret

consumer_key = '7cd68f4075a54e28b2751024275f0563'
consumer_secret = '11960e03f1404566a65cd0879f13062d'
LIST_OF_ELEMENTS = ['calcium', 'calories', 'carbohydrate', 'cholesterol', 'fat', 'fiber', 'iron', 'monounsaturated_fat',
                   'polyunsaturated_fat', 'potassium', 'protein', 'saturated_fat', 'sodium', 'sugar', 'vitamin_a',
                    'vitamin_c','measurement_description', 'metric_serving_amount']


def get_info_cup_of(food_name):
    """Возвращает энергетические параметры выбранного блюда"""
    try:
        food_id = fs.foods_search(food_name)[0]['food_id']
        result = fs.food_get(food_id)
    except:
        print('Ошибка в названии')
        return 0

    result = result['servings']['serving'][0]
    elements_parsing(result)
    sum_of_nutritional(result)

def elements_parsing(food_dict):
    for key, value in food_dict.items():
        try:
            food_dict[key] = float(value)
        except:
            pass


def sum_of_nutritional(food):
    for name in LIST_OF_ELEMENTS[:-2]:
        union_nutritional[name] += food[name]
    union_nutritional['measurement_description'] += f"{food['measurement_description']},"
    union_nutritional['total_serving_amount(g)'] += food['metric_serving_amount']


fs = Fatsecret(consumer_key, consumer_secret)
foods = fs.foods_search("Tacos")

input_string = input("Введите ваше текущее меню (вводите через запятую, блюда на английском языке): ")
input_foods = input_string.split(',')

union_nutritional = {
    'calcium': 0,
    'calories': 0,
    'carbohydrate': 0,
    'cholesterol': 0,
    'fat': 0,
    'fiber': 0,
    'iron': 0,
    'monounsaturated_fat': 0,
    'polyunsaturated_fat': 0,
    'potassium': 0,
    'protein': 0,
    'saturated_fat': 0,
    'sodium': 0,
    'sugar': 0,
    'vitamin_a': 0,
    'vitamin_c': 0,
    'measurement_description': '',
    'total_serving_amount': 0,
}

for food in input_foods:
    get_info_cup_of(food_name=food)

for key, value in union_nutritional.items():
    print(f"Total {key} = {value}")
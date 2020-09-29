print("Hello_world")

def biggest(value):
    def func(value):
        print(max(value))

    return func


a = list(range(10))

@biggest
def sorting(value):
    return sorted(value)

sorting(a)
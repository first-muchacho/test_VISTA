'''Написать функцию, которая будет выводить количество шариков (синие + красные) на итерации n.'''


def amount_balls(n: int):
    blue = 1
    red = 0
    while n > 0:
        if red == 0:
            red = 5
            n -= 1
        else:
            blue = red + blue
            red *= 2
            n -= 1  
    return f'Сумма шариков на заданной итерации: {red + blue}'


print(amount_balls(int(input('Введите количество итераций: '))))

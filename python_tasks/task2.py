'''Задан словарь d, Необходимо написать код, который выведет список значений словаря, в убывающем порядке.'''


d = {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6}
d1 = {'a': 3, 'b': 6, 'c': 1, 'd': 5, 'e': 4, 'f': 2}


def reverse_dict_by_value(d: dict):
    '''если значения изначально отсортированы'''
    return list(d.values())[::-1]


def reverse_dict_by_value2(d: dict):
    '''если значения в случайном порядке'''
    val_list = [d[values] for values in d]
    sort_val = sorted(val_list, reverse=True)
    return ' '.join(map(str, sort_val))
    

print(*reverse_dict_by_value(d))
print(reverse_dict_by_value2(d1))

︠d42fa6d5-106b-4041-b464-9e1d08066b6cs︠
from itertools import product


def all_actions(space):
    pairs = list(product(space, repeat=2)) 
    all_operations = list(product(space, repeat=len(pairs))) 
    return pairs, all_operations


def is_associative(space, pairs, action): 
    for x in space:
        for y in space:
            for z in space:
                
                left_pair_1 = pairs.index((y, z))
                left_pair_2 = pairs.index((x, action[left_pair_1]))
                
                right_pair_1 = pairs.index((x, y))
                right_pair_2 = pairs.index((action[right_pair_1], z))
                
                
                if action[left_pair_2] != action[right_pair_2]:
                    return False, (x, y, z)  
    return True, None  


space = {0, 1}
pairs, all_operations = all_actions(space)
counter = 0

for op_index, operation in enumerate(all_operations):
    is_assoc, counter_example = is_associative(space, pairs, operation)
    if is_assoc:
        print(f"Операція {op_index + 1} асоціативна")
        counter += 1
    else:
        print(f"Операція {op_index + 1} не асоціативна, контрприклад: {counter_example}")
        
print(f'Кількість асоціативних дій для {len(space)}-елементної множини:', counter)
︡4d15f65d-6824-49ee-865c-bcb7863eb7eb︡{"stdout":"Операція 1 асоціативна\nОперація 2 асоціативна\nОперація 3 не асоціативна, контрприклад: (1, 0, 1)\nОперація 4 асоціативна\nОперація 5 не асоціативна, контрприклад: (1, 0, 1)\nОперація 6 асоціативна\nОперація 7 асоціативна\nОперація 8 асоціативна\nОперація 9 не асоціативна, контрприклад: (0, 0, 1)\nОперація 10 асоціативна\nОперація 11 не асоціативна, контрприклад: (0, 0, 0)\nОперація 12 не асоціативна, контрприклад: (0, 0, 0)\nОперація 13 не асоціативна, контрприклад: (0, 0, 0)\nОперація 14 не асоціативна, контрприклад: (0, 0, 0)\nОперація 15 не асоціативна, контрприклад: (0, 0, 1)\nОперація 16 асоціативна\n"}︡{"stdout":"Кількість асоціативних дій для 2-елементної множини: 8\n"}︡{"done":true}
︠be393b3a-8a5d-496f-a834-5214ba653b0fs︠

︡238ff8d2-552f-44b3-ac5a-0c87e314dca7︡{"done":true}










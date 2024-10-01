︠122c8f85-afee-44cc-80d8-e518b1e8523cs︠
from itertools import product, permutations

associative_operations = []

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
        associative_operations.append(operation)
        counter += 1

def is_isomorphic(space, action1, action2):
    for perm in permutations(space):
        bi = {}
        for i, x in enumerate(space):
            bi[x] = perm[i]
        
        is_isomorphism = True
        for idx, (x, y) in enumerate(pairs):
            left = bi[action1[idx]] 
            right = action2[pairs.index((bi[x], bi[y]))]  
            
            if left != right:
                is_isomorphism = False
                break
        
        if is_isomorphism:
            return True
    return False

isomorphic_classes = []

for f1 in associative_operations:
    is_in_class = False
    for iso_class in isomorphic_classes:
        f2 = iso_class[0]
        if is_isomorphic(space, f1, f2):
            iso_class[1] += 1
            is_in_class = True
            break
    
    if not is_in_class:
        isomorphic_classes.append([f1, 1])

print('Кількість класів ізоморфності:', len(isomorphic_classes))
print('Кількість дій у кожному класі:')
for iso_class in isomorphic_classes:
    print(f"Операція: {iso_class[0]}, кількість: {iso_class[1]}")
︡ccdbeccc-e7b6-4758-bf0c-5c727a4ebb51︡{"stdout":"Кількість класів ізоморфності: 5\n"}︡{"stdout":"Кількість дій у кожному класі:\n"}︡{"stdout":"Операція: (0, 0, 0, 0), кількість: 2\nОперація: (0, 0, 0, 1), кількість: 2\nОперація: (0, 0, 1, 1), кількість: 1\nОперація: (0, 1, 0, 1), кількість: 1\nОперація: (0, 1, 1, 0), кількість: 2\n"}︡{"done":true}










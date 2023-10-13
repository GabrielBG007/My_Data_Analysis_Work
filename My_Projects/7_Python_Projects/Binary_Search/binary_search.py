import random
import time

def naive_search (l,target):
    for i in range(len(l)):
        if l[i] == target:
            return i
    return -1

def binary_search (l,target, low=None, high=None):
    if low is None:
        low = 0
    if high is None:
        high= len(l) -1

    if high < low:
        return -1

    midpoint = (low + high) // 2

    if l[midpoint] == target:
        return midpoint

    elif target < l[midpoint]:
        return binary_search(l, target, low, midpoint -1)

    else :
        return binary_search(l, target, midpoint +1, high)


if __name__ == "__main__":
    l= [1,2,3,4,5,6,7,8,9,10]
    target = 4
    print(naive_search(l,target))
    print(binary_search(l,target))

# Ahora vamos a comprobar el tiempo que duran en trabajar ambas funciones

length = 10000

sorted_list = set()

while len(sorted_list) < length:
    sorted_list.add(random.randint(-3 * length, 3 * length))
sorted_list = sorted(list(sorted_list))

# Naive_search
start = time.time()
for target in sorted_list:
    naive_search(sorted_list,target)
end = time.time()
print("Time for naive_search: ", (end - start)/length, "seconds")

#Binary_search
start = time.time()
for target in sorted_list:
    binary_search(sorted_list,target)
end = time.time()
print("Time for binary_search: ", (end - start)/length, "seconds")







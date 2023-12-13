print("Hi")

# Variables

age= 20
age=30
price= 19.95
first_name = "Mosh"
is_online = False
print(age)

# Exercise

#name = input("What is your name? ")
#print("Hello " + name)

#birth_year = input("Enter your birth year: ")
#age = 2023 - int(birth_year)
#print(age)

# Exercise

#First = input("First: ")
#Second= input("Second: ")
#Sum = (float(First) + float(Second))
#print("Result=" + str(Sum))

#Strings

course = "Python for Beginners"
print(course.replace("for","4"))
print("Python" in course)

#Arithmetic Operators

print(10 ** 3)
x=3
x +=3
print(x)

#Operator Precedence

x= (10 + 3) *2
print(x)

#Comparison Operators

x= 3 > 2
print(x)

#>, <, >=, <=, ==, !=

#Logical Operators

price= 25
print(price > 10 and price < 30)

price= 5
print(price > 10 or price < 30)
print(not price > 10)

# If Statements

temperature= 9

if temperature > 30:
    print("It's a hot day")
    print("Drink plenty of water")
elif temperature > 20:
    print("It's a nice day")
elif temperature > 10:
    print("It's a bit cold")
else:
    print("It's cold")

#Exercise

#Weight= int(input("Weight: "))
#Units= input("(K)g or (L)bs: ")
#if Units in "L":
    #print("Weight in Kg: " + str(round(Weight/2.2,2)))
#elif Units in "l":
    #print("Weight in Kg: " + str(round(Weight/2.2,2)))
#elif Units in "K":
    #print("Weight in Lbs: " + str(round(Weight*2.2,2)))
#elif Units in "k":
    #print("Weight in Lbs: " + str(round(Weight*2.2,2)))

#While Loops

i=1
while i <= 100:
    print(i)
    i= i + 1

i=1
while i <= 10:
    print(i * "*")
    i= i + 1

#Lists

names= ["John", "Bob", "Mosh", "Sam", "Mary"]
names[0]= "Jon"
print(names)
print(names[0:3])

#List Methods

numbers= [1,2,3,4,5]
numbers.append(6)

numbers.insert(0,-1)
print(numbers)

numbers.remove(3)
print(numbers)
print(1 in numbers)
print(len(numbers))

#For loops

numbers= [1,2,3,4,5]
for item in numbers:
    print(item)

#The range() function

numbers = range(5)
for numbers in numbers:
    print(numbers)

for number in range(5):
    print(number)

for number in range(5,10):
    print(number)

for number in range(5,10,2):
    print(number)

#Tuples

numbers.count(3)















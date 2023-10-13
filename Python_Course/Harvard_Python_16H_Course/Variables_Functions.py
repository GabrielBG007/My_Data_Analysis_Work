#Functions, Variables

name = input("What's your name? ").strip().title()

#Split user's name into first name and last name

first, last = name.split(" ")
print(f"Hello, {last}")

#int


x= int(input("What's x? " ))
y = int(input("What's y? "))

print(x + y)

#float

x= float(input("What's x? " ))
y = float(input("What's y? "))
z= x / y

print(f"{z:.2f}")

# Functions
def main():
    name= input("What's your name? ")
    hello(name)

def hello(to="world"):
    print("hello,", to)

main()

def main():
    x= int(input("What's x? "))
    print("x squared is", square(x))

def square(n):
    return n * n

main()


def main():
    age = int(input("What's your age? "))
    print("Your age minus 2 is ", minus(age))

def minus(to):
    return to - 2

main()


# Conditionals

x= int(input("What's x? "))
y= int(input("What's y "))

















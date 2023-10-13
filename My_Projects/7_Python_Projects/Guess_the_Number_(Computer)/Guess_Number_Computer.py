import random

def guess(x):
    random_number = random.randint(1,x)
    guess= 0
    while guess != random_number:
        guess = int(input(f"Give a number between 1 and {x}: "))
        if guess > random_number:
            print("Try again. Too high")
        elif guess < random_number:
            print("Try again. Too low")
    print("You just won the lottery!!!")

guess(10)






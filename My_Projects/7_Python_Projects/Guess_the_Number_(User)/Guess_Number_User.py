import random

def computer_guess(x):
    low = 1
    high = x
    feedback= ""
    while feedback != "c":
        if low != high:
            guess = random.randint(low,high)
            feedback = input(f"Is {guess} too high (H),too low (L) or correct (C)").lower()
        else:
            guess=low
        if feedback == "h":
            high = guess -1
        if feedback == "l":
            low = guess + 1
    print("I GOT IT!!!")

computer_guess(20)



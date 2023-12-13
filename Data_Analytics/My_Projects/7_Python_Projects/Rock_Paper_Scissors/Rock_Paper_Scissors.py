import random

def play():
    user = input("Choose!!!\n 'p' for paper, 'r' for rock, 's' for scissors: ")
    computer = random.choice(["p","r","s"])
    if user == computer:
        return "It's a tie!"
    if is_win(user,computer):
        return "You win!"
    return "You loose!"


def is_win(player,opponent):
    if player == "r" and opponent == "p" or player == "s" and opponent == "p" or player == "p" and opponent == "r":
        return True

print(play())


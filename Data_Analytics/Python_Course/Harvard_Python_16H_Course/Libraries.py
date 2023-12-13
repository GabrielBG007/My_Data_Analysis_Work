# import random
#
# number= random.randint(1,10)
# print(number)
#
# import random
#
# cards= ["jack","queen","king"]
# random.shuffle(cards)
# for card in cards:
#     print(card)
#
#
#
# import statistics
#
# print(statistics.mean([100,90]))
#
# import sys
#
# if len(sys.argv) < 2:
#     sys.exit("Too few arguments")
# for arg in sys.argv[-1:]:
#     print("hello, my name is", arg)

# import cowsay
# import sys
#
# if len(sys.argv) == 2:
#     cowsay.trex("hello, " + sys.argv[1])

# APIs
# import json
# import requests
# import sys
#
# if len(sys.argv) != 2:
#     sys.exit()
#
# response = requests.get("https://itunes.apple.com/search?entity=song&limit=50&term=" + sys.argv[1])
#
# o = response.json()
# for result in o["results"]:
#     print(result["trackName"])

# Own library

def main():
    hello("world")
    goodbye("world")

def hello(name):
    print(f"hello, {name}")


def goodbye(name):
    print(f"goodbye, {name}")


if __name__ == "__main__":
    main()
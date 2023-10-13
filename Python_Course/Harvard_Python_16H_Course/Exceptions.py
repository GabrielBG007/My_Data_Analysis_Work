# def main():
#     x= get_int("What's x? ")
#     print(f"x is {x}")
#
# def get_int(prompt):
#     while True:
#         try:
#             return int(input(prompt))
#         except ValueError:
#             pass
# main()


import sys

from Libraries import hello

if len(sys.argv) == 2:
    hello(sys.argv[1])





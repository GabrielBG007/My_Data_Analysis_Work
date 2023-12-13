# Conditionals

#score= int(input("Score" ))

#if score >=90 :
    #print("Grade: A")
#elif score >= 80:
    #print("Grade: B")
#elif score >= 70:
    #print("Grade: C")
#elif score >= 60:
    #print("Grade: D")
#else:
    #print("Grade: F")

#Even or odd

#def main():
    #x= int(input("What's x? "))
    #if is_even(x):
        #print("Even")
    #else:
     #   print("Odd")

#def is_even(n):
 #   return n % 2 == 0

#main()

#match

name= input("What's your name? ")

match name:
    case "Harry"|"Harmione"|"Ron":
        print("Gryffindor")
    case "Draco":
        print("Slytherin")
    case _ :
        print("Who?")



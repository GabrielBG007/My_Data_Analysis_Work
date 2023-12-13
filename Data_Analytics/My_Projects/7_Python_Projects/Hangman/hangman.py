import random

from words import words

import random
from words import words
from hangman_visual import lives_visual_dict
import string


def get_valid_word(words):
    word = random.choice(words)
    while '-' in word or ' ' in word: #Si la palabra contiene un "-" o un " ", que siga buscando
        word = random.choice(words)

    return word.upper()


def hangman():
    word = get_valid_word(words)
    word_letters = set(word)  # Nos guarda las letras de la palabra, ya que el set no permite duplicados
    alphabet = set(string.ascii_uppercase) # Palabras del alfabeto
    used_letters = set()  # Nos va guardando las letras usadas

    lives = 7

    while len(word_letters) > 0 and lives > 0: #Siempre y cuando aún queden letras por adivinar y no hayan muerto:
        print('You have', lives, 'lives left and you have used these letters: ', ' '.join(used_letters))
        #' '.join(used_letters) nos separa las letras de dicha lista con un espacio entre medio
        word_list = [letter if letter in used_letters else '-' for letter in word] #Para separar las letras adivinadas entre comas
        print(lives_visual_dict[lives])
        print('Current word: ', ' '.join(word_list))
        user_letter = input('Guess a letter: ').upper()
        if user_letter in alphabet - used_letters: # Si la palabra está en el alfabeto pero no se ha usado anteriormente
            used_letters.add(user_letter) # Introducimos dicha palabra en el set de used_letters
            if user_letter in word_letters:
                word_letters.remove(user_letter) #Si adivinamos una letra de la palabra, la eliminamos del word_letters
                print('')
            else:
                lives = lives - 1
                print('\nYour letter,', user_letter, 'is not in the word.') # Si no adivina le quitamos una vida y le enviamos este mensaje
        elif user_letter in used_letters:
            print('\nYou have already used that letter. Guess another letter.')
        else:
            print('\nThat is not a valid letter.')

    if lives == 0:
        print(lives_visual_dict[lives])
        print('You died, sorry. The word was', word)
    else:
        print('YAY! You guessed the word', word, '!!')


if __name__ == '__main__': # La función hangman() solo se ejecutará en el file donde fue creado
    hangman()

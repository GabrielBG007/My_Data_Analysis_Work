from pprint import pprint

# Vamos a devolver todas las columnas y filas que no hayan sido rellenadas todavía y dichos huecos van  a ser reconocidos como -1
def find_next_empty(puzzle):
    for r in range(9):
        for c in range(9):
            if puzzle[r][c] == -1: # Indicamos la fila y después la columna de dicha fila
                return r, c

    return None, None

# Si el valor que queremos poner ya se encuentra en la fila, return False
def is_valid(puzzle, guess, row, col):
    row_vals = puzzle[row]
    if guess in row_vals:
        return False

#Si el valor que queremos poner se encuentra en la columna, return False
    col_vals = [puzzle[i][col] for i in range(9)] #[i] número de fila y [col] columna
    if guess in col_vals:
        return False

    row_start = (row // 3) * 3  #Nos olvidamos del "resto" de la división
    col_start = (col // 3) * 3

#Si el valor que queremos poner se encuentra entre la cuadrícula de 3 * 3, return False
    for r in range(row_start, row_start + 3):
        for c in range(col_start, col_start + 3):
            if puzzle[r][c] == guess:
                return False

    return True


def solve_sudoku(puzzle):

    row, col = find_next_empty(puzzle)

    if row is None: #None en esta caso significaría que la fila ya estaría ocupada (mirar función find_next_empty(puzzle)
        return True #Habremos ganado porque ya que no quedan más filas por rellenar

    for guess in range(1, 10):
        if is_valid(puzzle, guess, row, col): #Si el is_valid es True, nuestro guess es insertado en [row][col]
            puzzle[row][col] = guess
            if solve_sudoku(puzzle): #Si solve_sudoky es True, hemos ganado
                return True
        puzzle[row][col] = -1 #Si nuestro guess no sirve, se queda vacío
    return False #Si hemos intentado todas las combinaciones pero no resolvemos el puzzle, damos por hecho que no se puede resolver

# -1 son los cuadros vacíos
if __name__ == '__main__':
    example_board = [
        [3, 9, -1, -1, 5, -1, -1, -1, -1],
        [-1, -1, -1, 2, -1, -1, -1, -1, 5],
        [-1, -1, -1, 7, 1, 9, -1, 8, -1],

        [-1, 5, -1, -1, 6, 8, -1, -1, -1],
        [2, -1, 6, -1, -1, 3, -1, -1, -1],
        [-1, -1, -1, -1, -1, -1, -1, -1, 4],

        [5, -1, -1, -1, -1, -1, -1, -1, -1],
        [6, 7, -1, 1, -1, 5, -1, 4, -1],
        [1, -1, 9, -1, -1, -1, 2, -1, -1]
    ]
    print(solve_sudoku(example_board))
    pprint(example_board)
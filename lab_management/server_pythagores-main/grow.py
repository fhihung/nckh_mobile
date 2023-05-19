import destiny
import life
import reduce_num

#grow_num = reduce_num.solve(str(int(solve_destiny) + int(life_num)))
def solve_grow(day, month, year, name):
    destiny_num = destiny.solve_destiny(name)
    life_num = life.solve_life(day, month, year)
    grow_num = reduce_num.solve(str(int(life_num) + int(destiny_num)))
    return grow_num
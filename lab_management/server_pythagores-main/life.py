import reduce_num

def solve_life(day, month, year):
    day = reduce_num.solve(day)
    month = reduce_num.solve(month)
    year = reduce_num.solve(year)
    life = reduce_num.solve(str(int(day) + int(month) + int(year)))
    return life

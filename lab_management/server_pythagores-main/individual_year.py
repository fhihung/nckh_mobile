import reduce_notspecial
import reduce_foryear

def solve_individual_year(attitude_num, current_year):
    current_year = int(reduce_notspecial.solve(current_year))
    individual_year_num = reduce_foryear.solve(str(int(attitude_num) + current_year))
    return individual_year_num
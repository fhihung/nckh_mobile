import reduce_notspecial

def solve_individual_month(individual_year_num, current_month):
    current_month = int(reduce_notspecial.solve(current_month))
    individual_month_num = reduce_notspecial.solve(str(int(individual_year_num) + current_month))
    return individual_month_num
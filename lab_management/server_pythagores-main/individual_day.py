import reduce_notspecial

def solve_individual_day(individual_month_num, current_day):
    current_day = int(reduce_notspecial.solve(current_day))
    individual_day_num = reduce_notspecial.solve(str(int(individual_month_num) + current_day))
    print(individual_day_num)
    return individual_day_num
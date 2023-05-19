import reduce_num
import reduce_notspecial

def solve_attitude(day, month):
    day = int(reduce_notspecial.solve(day))
    month = int(reduce_notspecial.solve(month))
    attitude_num = reduce_num.solve(str(day + month))
    return attitude_num
    
#solve_attitude("17", "5")
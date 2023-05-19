import alpha_num
import reduce_num

def solve_destiny(name):
    # print(alpha_num.alpha_dict)
    name = name.upper().split()
    nod = 0 # num of destiny
    for word in name:
        sum_word = 0
        for w in word:
            sum_word += alpha_num.alpha_dict[w]
        sum_word = int(reduce_num.solve(str(sum_word)))
        nod += sum_word
    nod = reduce_num.solve(str(nod))
    return nod

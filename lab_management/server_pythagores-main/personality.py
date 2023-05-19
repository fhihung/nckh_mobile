from alpha_num import alpha_dict
import reduce_num

def solve_personality(name):
    consonants = 0
    name = name.upper()
    words = name.split()
    for word in words:
        for c in word:
            # tinh phu am
            if c not in "UEOAI":
                consonants += alpha_dict[c]
    consonants = reduce_num.solve(str(consonants))
    return str(consonants)
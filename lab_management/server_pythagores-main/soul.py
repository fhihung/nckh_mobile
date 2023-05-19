from alpha_num import alpha_dict
import reduce_num

def solve_soul(name):
    vowels = 0
    name = name.upper()
    words = name.split()
    for word in words:
        for c in word:
            # tinh nguyen am
            if c in "UEOAI":
                vowels += alpha_dict[c]
    vowels = reduce_num.solve(str(vowels))
    return vowels
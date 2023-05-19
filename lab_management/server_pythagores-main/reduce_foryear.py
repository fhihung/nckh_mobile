def sum_digits(n):
    """Tính tổng các chữ số của số nguyên n."""
    digit_sum = 0
    while n > 0:
        digit_sum += n % 10
        n //= 10
    return digit_sum

def solve(num):
    if int(num) == 11 or int(num) == 22:
        return num
    n = 0
    for i in num:
        n += int(i)
    if int(n) == 11 or int(n) == 22:
        return str(n)
    while n > 9:
        digit_sum = sum_digits(n)
        if int(digit_sum) == 11 or int(digit_sum) == 22:
            return digit_sum
        if digit_sum <= 9:
            return digit_sum
        n = digit_sum
    return str(n)
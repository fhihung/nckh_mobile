def sum_digits(n):
    """Tính tổng các chữ số của số nguyên n."""
    digit_sum = 0
    while n > 0:
        digit_sum += n % 10
        n //= 10
    return digit_sum

def solve(day):
    n = 0
    for i in day:
        n += int(i)
    while n > 9:
        digit_sum = sum_digits(n)
        if digit_sum <= 9:
            return digit_sum
        n = digit_sum
    return str(n)
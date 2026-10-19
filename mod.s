.text

# Part 1.2: int mod(int a, int b)
# b != 0; a / b must be representable as a signed 32-bit integer.
.global mod
mod:
    div r8, r4, r5            # Signed division truncates toward zero.
    mul r8, r8, r5
    sub r2, r4, r8            # Remainder = a - (a / b) * b.
    ret

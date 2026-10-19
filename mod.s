.text

# Part 1.2: int mod(int a, int b);
.global mod
mod:
    div r8, r4, r5            
    mul r8, r8, r5
    sub r2, r4, r8            
    ret

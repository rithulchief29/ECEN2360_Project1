.text

# Part 1.4: int factorial(int n), 0 <= n <= 12
.global factorial
factorial:
    bne r4, r0, .Lfactorial_recurse
    movi r2, 1
    ret
.Lfactorial_recurse:
    subi sp, sp, 8
    stw ra, 4(sp)
    stw r4, 0(sp)             # Preserve n across the recursive call.
    subi r4, r4, 1
    call factorial
    ldw r8, 0(sp)
    mul r2, r8, r2
    ldw ra, 4(sp)
    addi sp, sp, 8
    ret

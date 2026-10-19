.text

# Part 1.6
.global num2bits
num2bits:
    movi r2, 0
    movi r8, 0
    movi r9, 10
    movia r10, Bits7seg

.Lnum2bits_loop:
    divu r11, r4, r9
    mul r12, r11, r9
    sub r12, r4, r12
    add r12, r10, r12
    ldbu r12, 0(r12)
    sll r12, r12, r8
    or r2, r2, r12
    mov r4, r11
    addi r8, r8, 8
    bne r4, r0, .Lnum2bits_loop
    ret
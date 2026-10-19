.data
# DE10-Lite Computer patterns: bit 0 = a, ..., bit 6 = g; 1 lights a segment.
Bits7seg:
    .byte 0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f

.text
# Part 1.6: unsigned int num2bits(unsigned int n), 0 <= n <= 9999
.global num2bits
num2bits:
    movi r2, 0               # Packed result; unused leading bytes stay blank.
    movi r8, 0               # Bit offset of the next digit.
    movi r9, 10
    movia r10, Bits7seg
.Lnum2bits_loop:
    divu r11, r4, r9
    mul r12, r11, r9
    sub r12, r4, r12         # Next decimal digit = n % 10.
    add r12, r10, r12
    ldbu r12, 0(r12)
    sll r12, r12, r8
    or r2, r2, r12
    mov r4, r11
    addi r8, r8, 8
    bne r4, r0, .Lnum2bits_loop # Process zero once, too.
    ret

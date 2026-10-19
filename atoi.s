.text

.global atoi
atoi:
    movi r2, 0
    movi r8, 0               
    ldbu r9, 0(r4)
    movi r10, 45             
    bne r9, r10, .Latoi_loop
    movi r8, 1
    addi r4, r4, 1
.Latoi_loop:
    ldbu r9, 0(r4)
    subi r9, r9, 48
    movi r10, 9
    bltu r10, r9, .Latoi_done 
    muli r2, r2, 10
    add r2, r2, r9
    addi r4, r4, 1
    br .Latoi_loop
.Latoi_done:
    beq r8, r0, .Latoi_return
    sub r2, r0, r2
.Latoi_return:
    ret

.text

# Part 1.3: void delayNms(int n)
# IMPORTANT: calibrate this starting value on the target CPUlator environment.
# 100 is an UNCALIBRATED starting value, not a measured millisecond delay.
# For nominal 100 MHz hardware under the assignment's cycle assumptions,
# approximately 33332 iterations per millisecond is the starting estimate.
.equ DELAY_ITERATIONS_PER_MS, 100
.global delayNms
delayNms:
    ble r4, r0, .Ldelay_return
    mov r8, r4
.Ldelay_ms:
    movia r9, DELAY_ITERATIONS_PER_MS
.Ldelay_inner:
    subi r9, r9, 1
    bne r9, r0, .Ldelay_inner
    subi r8, r8, 1
    bne r8, r0, .Ldelay_ms
.Ldelay_return:
    ret

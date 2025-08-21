.data
N: .word 6
A: .word 48, 64, 56, 80, 96, 48
B: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0


.text
.globl main

main:
    # Prologue
    addi sp, sp, -4
    sw ra, 0(sp)
    
    la t0, A
    la t1, B 
    lw t2, N
    addi t2, t2, -1
    
    li t3, 0 # i = 0
    li t4, 0 # j = 0
    
loop:
    bge t3, t2, end_loop 
    slli t5, t3, 2
    add t6, t0, t5
    lw a0, 0(t6) 
    lw a1, 4(t6)
    
    jal ra, myFilter # Call myFilter
    beq a0, zero, skip
    lw t5, 0(t6)   # t5 = A[i]
    lw t6, 4(t6)   # t6 = A[i+1]
    add t5, t5, t6
    addi t5, t5, 2

    slli a0, t4, 2
    add a1, t1, a0
    sw t5, 0(a1)   # Store result in B[j]

    addi t4, t4, 1 
 
skip:
    addi t3, t3, 1 # i++
    j loop 
end_loop:
    # Epilogue
    lw ra, 0(sp)
    addi sp, sp, 4

    # Exit program
    li a7, 10
    ecall
myFilter:
    andi t0, a0, 15 
    bnez t0, return_zero
    ble a1, a0, return_zero
    li a0, 1
    ret

return_zero:
    li a0, 0
    ret
    
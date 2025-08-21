.data 
N: .word 4
A: .word 1, -2, 3, -4, 5, -6, 7, -8, 9, -10, 11, -12
B: .word 0, 0, 0, 0


.text 
.globl main

main:
    # prologue 
    addi sp, sp, -4
    sw ra, 0(sp)
    
    la t0, A # load A to t0
    la t1, B # load B to t1
    lw t2, N # load N to t2
    
    li t3, 0 # i = 0
    li t4, 0 # j = 0
    
# define the loop
loop: 
    beq t3, t2, end_loop 
    # arguments for res_triplets 
    mv a0, t0  # a0 = A
    mv a1, t4  # a1 = j 
    
    jal ra, res_triplet # call the function 
    # B[i]
    slli t5, t3, 2
    add t6, t1, t5
    sw a0, 0(t6)
    
    addi t3, t3, 1 # i++
    addi t4, t4, 3 # j+3
    
    j loop


end_loop:
    # Epilogue
    lw ra, 0(sp)
    addi sp, sp, 4
    
    # get the exit 
    li a7, 10
    ecall
res_triplet:
    # Prologue
    addi sp, sp, -16
    sw ra, 12(sp)
    sw s0, 8(sp)
    sw s1, 4(sp)
    
    mv s0, a0
    mv s1, a1
    
    # function body 
    slli t0, s1, 2
    add t1, s0, t0
    
    lw t2, 0(t1)
    lw t3, 4(t1)
    lw t4, 8(t1) 
     
    add t5, t2, t3
    add a0, t5, t4 
    
    jal ra, abs  # function call of abs value 
    lw s1, 4(sp)
    lw s0, 8(sp)
    lw ra, 12(sp)
    addi sp, sp, 16
    ret
abs:
    # if a0 >= 0, return a0
    bgez a0, abs_end
    # else, negate a0
    neg a0, a0
abs_end:
    ret
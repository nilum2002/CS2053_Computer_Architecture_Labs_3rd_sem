.data 
    A:  .word 0, 1, 2, 7, -88, 4, 5, 12, 11, -2, 6, 3 # the input array
    N: .word 12
    B: .zero 48  # 12*4 bytes array
    
.text 

main:
    la s0, A  # load the base address of A to the s0
    la s1, B  # load the address of B
    lw s2, N # laod the size of A (N) 

# create the main loop
loop:
    beq s2, zero, exit
    
    lw t0,0(s0)
    
    blez t0, next_ele
    
    # check the odd numbetr 
    andi t1,t0, 1
    bnez t1, next_ele
    
    sw t0, 0(s1)
    addi s1, s1, 4
    
    
    
    

next_ele:
    addi s0, s0, 4
    addi s2, s2,-1
    j loop
    
    
exit:
    # the termination code 
    li a7, 10
    ecall
    
    
    
    
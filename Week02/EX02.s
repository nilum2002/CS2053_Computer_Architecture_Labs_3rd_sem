

.data
    N:  .word 12
    A:  .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120
    B:  .word -5, 15, -25, 35, -45, 55, -65, 75, -85, 95, -105, 115
    C:  .zero 48  

.text
main:
  
    lw   s3, N          # s3 = Loop counter, initialized to N (12)
    la   s0, A          # s0 = Pointer for A (starts at A[0])
    la   s2, C          # s2 = Pointer for C (starts at C[0])

   
    la   s1, B          # Load base address of B
    addi s1, s1, 44    # s1 = Pointer for B, now points to B[11]


loop:
    # If the counter (s3) is zero, we are done.
    beq  s3, zero, exit

    # Load the operands
    lw   t0, 0(s0)      # t0 = A[i]
    lw   t1, 0(s1)      # t1 = B[N-i-1]

    # Perform the addition
    add  t2, t0, t1     # t2 = A[i] + B[N-i-1]

   
    bgez t2, is_positive
    
    
    neg  t2, t2

is_positive:
    
    sw   t2, 0(s2)      # C[i] = |sum|

  
    addi s0, s0, 4      # Move pointer for A forward
    addi s1, s1, -4     # Move pointer for B backward
    addi s2, s2, 4      # Move pointer for C forward
    addi s3, s3, -1     # Decrement loop counter

    # Repeat the loop
    j    loop

exit:
  
    li   a7, 10
    ecall

.data
    N:  .word 12
    V:  .zero 48      # Reserve 48 bytes (12 words) for the result vector V

.text
main:
    
    la   s0, V          # s0 = Base address of vector V
    lw   s1, N          # s1 = N (12)
    
    # Check if N is less than 2, as the main loop won't run.
    # If N=0, exit. If N=1, just store V[0] and exit.
    
 
    # We only store V[0] if N >= 1
    blez s1, exit       # If N is 0, nothing to do.
    sw   zero, 0(s0)    # Store 0 at V[0]

   
    # We only store V[1] if N >= 2
    li   t0, 1          # Temporary register t0 = 1
    ble  s1, t0, exit   # If N is 1, we are done.
    sw   t0, 4(s0)      # Store 1 at V[1] (offset of 4 bytes)
    
    
    # The loop will run N-2 times to calculate V[2] through V[11]
    addi s1, s1, -2    # s1 = Loop counter, now N-2 (10)
    
    lw   t0, 0(s0)      # t0 = V[0] (value is 0). This is our initial 'V[i-2]'
    lw   t1, 4(s0)      # t1 = V[1] (value is 1). This is our initial 'V[i-1]'
    
    addi s0, s0, 8     # Advance pointer s0 to the address of V[2]


loop:
    # If the counter is zero, we have calculated all numbers.
    beq  s1, zero, exit

    # Calculate the next Fibonacci number: V[i] = V[i-1] + V[i-2]
    add  t2, t0, t1     # t2 = new Fibonacci number

    # Store the new number in the vector V
    sw   t2, 0(s0)      # V[i] = t2

    # Update values for the next iteration:
    # The old V[i-1] becomes the new V[i-2]
    mv   t0, t1         # t0 = t1
    # The new result becomes the new V[i-1]
    mv   t1, t2         # t1 = t2

    # Advance pointer and decrement counter
    addi s0, s0, 4      # Move pointer to the next word in V
    addi s1, s1, -1     # Decrement loop counter

    # Repeat the loop
    j    loop

exit:
    # Standard program termination
    li   a7, 10
    ecall
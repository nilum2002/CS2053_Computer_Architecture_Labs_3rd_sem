.globl main
main:
        # load the immediate values into registers 
        li a0, 5 # load 5 to in to 
        li a4, 52106 # load the 52106 into register a4
        
        # add 10 to a0 and store in register al
        addi a1, a0, 10 # a1 = a0 + 10
        
        # take AND operation between a4 and 0b11101111100
        # and store in register a5
         andi a5, a4, 0b11101111100
         
         # end of the program 
         
         ret 
         
.global main
main:

        li a1, 5          # Load the number to check (you can change this)
        li t0, 2          # Load 2 into t0
        div t1, a1, t0    # t1 = a1 / 2
        mul t1, t1, t0    # t1 = (a1 / 2) * 2 ? now t1 is the even part
        sub t2, a1, t1    # t2 = a1 - even part ? remainder (a1 % 2)
        li t3, 1
        slt a0, t2, t3    # a0 = 1 if t2 < 1 ? this will be 1 for even
        xori a0, a0, 1    # Flip result ? 1 for odd, 0 for even
        
        ret 
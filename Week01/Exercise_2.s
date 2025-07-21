.global main
main:
    li t0, 5
    
    slli t1, t0, 2
    slli t2, t0, 1
    slli t3, t0, 0
    
    add a0, t1, t2
    add a0, a0, t3
    
    
    
    ret 
    
    
    
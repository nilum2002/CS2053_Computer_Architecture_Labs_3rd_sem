#include <stdio.h>



int compute_factorial_rec(int n);



int main(){
    /*
    int n ;
    scanf("%d", &n);
    */
    
    int n = 7;
    if (n < 0) {
        printf("%s\n", "Please enter a positive number");
    }
    else{
        int fac = compute_factorial_rec(n);
        printf("%d", fac);
    }
        
    return 0;
}

int compute_factorial_rec(int n){
    if (n == 0){
        return 1;
    }
    return n*compute_factorial_rec(n-1);
    
    
}
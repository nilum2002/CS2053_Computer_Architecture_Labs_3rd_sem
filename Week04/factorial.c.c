#include <stdio.h>

int compute_factorial(int n);


int main(int argc, char **argv)
{
    /*
    int n ;
    scanf("%d", &n);
    */
    int n = 7;
    int fac = compute_factorial(n);
    printf("%d",fac );
    return 0;
}

int compute_factorial(int n){
    
    int mul = 1;
    for(int i = 1 ; i <= n ; i++){
        mul = mul*i;
    }
    return mul;
    
}
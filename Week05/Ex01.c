#include <stdio.h>
     int factorial(int n) {
     if (n == 0 || n == 1) {
     return 1;
     }
     return n * factorial(n- 1);
 }
 int main() {
     int n = 10; // Try changing this value and compile with different optimization flags
     int result = factorial(n);
     printf("%d\n", result);
     return 0;
 }
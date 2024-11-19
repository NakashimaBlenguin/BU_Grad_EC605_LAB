#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc > 1) {
        printf("Hello EC605 from %s\n", argv[1]); 
    } else {
        printf("The Lannisters send their regards.\n"); 
    }
    return 0;
}


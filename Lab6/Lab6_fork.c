#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

void parent_process() {
    pid_t parent_pid = getpid();
    for (int i = 1000; i >= 0; i--) {
        if (i % 50 == 0) {
            printf("Parent pid %d %d\n", parent_pid, i);
        }
    }
}

void child_process() {
    pid_t child_pid = getpid();
    long long a = 0, b = 1, fib;
    while (a <= 1000000) {
        if (a % 2 != 0) {
            printf("Child pid %d %lld\n", child_pid, a);
        }
        fib = a + b;
        a = b;
        b = fib;
    }
}

int main() {
    pid_t pid = fork();

    if (pid < 0) {
        // Fork failed
        perror("Fork failed");
        return 1;
    } else if (pid == 0) {
        // Child process
        child_process();
    } else {
        // Parent process
        parent_process();
    }

    return 0;
}


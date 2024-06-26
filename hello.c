#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char buffer[100];

    printf("Enter your name: ");
    fgets(buffer, sizeof(buffer), stdin);
    // Remove the newline character from fgets
    buffer[strlen(buffer)-1] = '\0';
    printf("Hello, %s!\n", buffer);
    return 0;
}


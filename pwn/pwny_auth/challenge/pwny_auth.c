#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define PASSWORD_SIZE 32

char *password = "iHOtZ2MEvg4Boh1QjxNyBd2KBUZZbNp";

int main(int argc, char const *argv[])
{
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stdin, NULL, _IONBF, 0);

    short pin_code, auth;
    char input[32];
    printf("password: ");
    fgets(input, PASSWORD_SIZE, stdin);

    // https://stackoverflow.com/questions/2693776/removing-trailing-newline-character-from-fgets-input
    size_t ln = strlen(input) - 1;
    if (*input && input[ln] == '\n')
        input[ln] = '\0';

    // https://stackoverflow.com/questions/19479232/comparing-two-strings-problems-with-strcmp
    if (strcmp(input, password) == 0)
        auth = 1;
    else
        auth = 0;

    printf("pin code: ");
    scanf("%d", &pin_code);

    if (pin_code == 0x1337 && auth == 1)
    {
        printf("welcome admin, here is your lovely shell\n");
        system("/bin/sh");
    }
    else
    {
        printf("wrong password or pin code !!!!\n");
    }

    return 0;
}

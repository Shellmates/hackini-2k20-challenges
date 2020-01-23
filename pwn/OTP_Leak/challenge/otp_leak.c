#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define KEY_SIZE 32

char one_time_pad[KEY_SIZE];
char enc_flag[KEY_SIZE] =
    "\x2a\x27\x2c\x3d\x1f\x3e\x2f\x20\x57\x07\x28\x09\x05\x35\x00\x61"
    "\x1a\x1e\x23\x10\x24\x5f\x2b\x00\x14\x38\x2d\x0d\x61\x24\x7e\x4f";

void load_key()
{
    char *key_env = getenv("ONE_TIME_PAD");
    if (key_env == NULL)
    {
        printf("there are no key in your environment\n");
        printf("export ONE_TIME_PAD='your ONE_TIME_PAD key'\n");
        exit(-1);
    }
    else
    {
        strncpy(one_time_pad, key_env, KEY_SIZE);
    }
}

void check_key(char *user_input)
{
    if (strncmp(user_input, one_time_pad, KEY_SIZE) != 0)
    {
        printf("Your ONE_TIME_PAD key is wrong !!\n");
        printf(user_input);
        exit(-2);
    }
}

void print_flag()
{
    char flag[KEY_SIZE];
    for (int i = 0; i < KEY_SIZE; i++)
    {
        flag[i] = one_time_pad[i] ^ enc_flag[i];
    }
    flag[KEY_SIZE] = '\0';
    printf("FLAG: %s\n", flag);
}

int main(int argc, char const *argv[])
{
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stdin, NULL, _IONBF, 0);

    load_key();
    char user_input[KEY_SIZE];
    puts("do you realy have the ONE_TIME_PAD key ??");
    puts("type the 32-bytes ONE_TIME_PAD key: ");
    read(0, user_input, KEY_SIZE);
    check_key(user_input);
    print_flag();
    return 0;
}

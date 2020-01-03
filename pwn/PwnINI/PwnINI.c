#include <stdio.h>
#include <stdlib.h>
#define BUFFER_SIZE 200
#define SUCCESS_MSG "\e[01;92m                            \n ##                         \n#   # # ### ### ###  ##  ## \n #  # # #   #   ##   #   #  \n  # ### ### ### ### ##  ##  \n##                          \n\e[0m"
#define FAILURE_MSG "\e[01;91m                            \n###      #   #              \n#    ##      #  # # ### ### \n##  # #  #   #  # # #   ##  \n#   ###  ##  ## ### #   ### \n#                           \n\e[0m"
#define PWNINI_BANNER "\e[01;92m ____                          ______   __  __  ______     \n/\\  _`\\                       /\\__  _\\ /\\ \\/\\ \\/\\__  _\\    \n\\ \\ \\L\\ \\__  __  __    ___    \\/_/\\ \\/ \\ \\ `\\\\ \\/_/\\ \\/    \n \\ \\ ,__/\\ \\/\\ \\/\\ \\ /' _ `\\     \\ \\ \\  \\ \\ , ` \\ \\ \\ \\    \n  \\ \\ \\/\\ \\ \\_/ \\_/ \\/\\ \\/\\ \\     \\_\\ \\__\\ \\ \\`\\ \\ \\_\\ \\__ \n   \\ \\_\\ \\ \\___x___/'\\ \\_\\ \\_\\    /\\_____\\\\ \\_\\ \\_\\/\\_____\\\n    \\/_/  \\/__//__/   \\/_/\\/_/    \\/_____/ \\/_/\\/_/\\/_____/\n                                                           \n                                                           \n\e[00m"
#define PWNINI_PROMPT "Please enter your verification code : "

void disable_buffering()
{
	setvbuf(stdout, NULL, _IONBF, 0);
}

int check(char* buffer)
{
	if (atoll(buffer) == 0x2f23a4c9b563f8eeLL)
		return 0;
	else
		return 1;
}

void success()
{
	puts(SUCCESS_MSG);
}

void failure()
{
	puts(FAILURE_MSG);
}
void print_pwnini_banner()
{
	puts(PWNINI_BANNER);
	
	printf("Running on: ");
	system("date");
}

void print_prompt()
{
	printf(PWNINI_PROMPT);
}

int main()
{
	char buffer[BUFFER_SIZE];
	disable_buffering();
	print_pwnini_banner();
	int attempts = 3;
	while (attempts--)
	{
		print_prompt();
		scanf("%s", buffer);
		if (!check(buffer))
		{
			success();
			return 0;
		}
		else
		{
			failure();
		}
	}
	exit(1);
}

__attribute__((naked)) void fun()
{
	asm(".byte 0x48,0x8b,0x41,0x58,0xc3"); // not needed, to make their ROP easier
}

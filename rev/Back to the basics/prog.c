#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* key;
char* input;
void wrong()
{
	printf("Wrong!\n");
}

void correct()
{
	printf("Correct\nThe flag is : shellmates{%s}\n", input);
}

int main()
{
	input = getenv("zzKEY");
	if (input == NULL)
	{
		wrong();
		return 1;
	}
	key = strdup(input);
	size_t i = 0;
	while (1)
	{
		key[i] ^= 31;
		if (key[i] == 31)
		{
			key[i] ^= 31;
			break;
		}
		i++;
	}
	if (!strcmp(key, "lpykh~mz@|+q@~sl/@|w,|t@zqi@i+ml"))
	{
		correct();
		return 0;
	}
	else
	{
		wrong();
	}
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char input[28];

void wrong()
{
	printf("Wrong!\n");
}

void correct()
{
	printf("Correct\nThe flag is : \e[01;92;49mshellmates{%s}\e[0m\n", input);
}

int main()
{
	char* part1 = getenv("zzKEY");
	if (part1 == NULL || strlen(part1) != 14)
	{
		wrong();
		return 1;
	}
	strncpy(input, part1, 14);
	for (int i = 0; i < 14; i++)
		part1[i] += 4;
	if (strcmp(part1, "h5jjivir;c{e}w"))
	{
		wrong();
		return 1;
	}
	FILE* f = fopen("yyKEY", "r");
	if (f == NULL)
	{
		wrong();
		return 1;
	}
	char* part2 = malloc(14 * sizeof(char));
	fread(part2, 1, 14, f);
	fclose(f);
	strncpy(input+14, part2, 14);
	if (strcmp(part2, "_70_read_1nput"))
	{
		wrong();
		return 1;
	}
	correct();
	return 0;
}

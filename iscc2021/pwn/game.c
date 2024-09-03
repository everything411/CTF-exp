#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main(int argc, const char **argv, const char **envp)
{
  int v3; // eax
  int v5; // [rsp+Ch] [rbp-34h] BYREF
  char buf[36]; // [rsp+10h] [rbp-30h] BYREF
  unsigned int v7; // [rsp+34h] [rbp-Ch]
  unsigned int seed; // [rsp+38h] [rbp-8h]
  unsigned int v9; // [rsp+3Ch] [rbp-4h]

  v9 = 0;
  seed = 0;
  srand(seed);
  while ( (int)v9 <= 9 )
  {
    v3 = rand();
    srand(v3);
    printf("Guess Number:");
    v7 = rand() % 0x64u + 1;
    printf("%d\n", v7);

    ++v9;
  }
  return 0;
}

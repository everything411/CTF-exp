#include <string.h>
#include <stdio.h>
#include <ctype.h>
char what[] = "dNl.\03668\004D\022\034$\\Y=\013Zx\b\tvpy3\023\026 ~k#6E\007\021,\"JJO.HL|>\021\017j\0307B\036+\022\003ZG\000\000\000\000\000\000\000";
char secret[] = "B\n|_\"\006\033g7#\\F\n)\t0Q8_{Y\023\030\rP\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000";
int check2(char * a1)
{
  int v2; // [rsp+1Ch] [rbp-1Ch]
  int i; // [rsp+28h] [rbp-10h]
  unsigned int v4; // [rsp+2Ch] [rbp-Ch]
  v4 = 1;
  for ( i = 0; i < strlen(what); ++i )
  {
    v2 = *(char *)(a1 + i);
    v4 = (unsigned char)v4 & ((*(char *)(a1 + (i + 1) % strlen(what)) ^ v2) == what[i]);
  }
  return v4;
}
void test(char a)
{
    char s[68] = {[55]=a};
    int wlen = strlen(what);
    int slen = strlen(secret);
    s[0] = s[55] ^ what[55];
    for(int i = 1; i < wlen; i++)
    {
        s[i] = what[i - 1] ^ s[i - 1];
    }
    s[0] = s[55] ^ what[55];
    for(int i = 1; i < wlen; i++)
    {
        s[i] = what[i - 1] ^ s[i - 1];
    }
    if(check2(s))
    {
        printf("found %s!\n", s);
    }
    for (int i = 0; i < wlen; ++i )
    {
        s[i] ^= secret[i % slen];
        if(!isprint(s[i]))
        {
            return;
        }
    }
    printf("%c %c flag{%s}\n", a, s[55], s);
}

int main()
{
    // ISCC{mAy6e_t0d4Y_7H15_ls_tH3_10n8est_f14g_Y0_HaD_Ev3R_5e3n_!_}
    for(int i = 0; i < 256; i++)
    {
        test(i);
    }

    return 0;
}

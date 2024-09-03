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
int check(char * a1)
{
  int v2; // [rsp+1Ch] [rbp-1Ch]
  int i; // [rsp+28h] [rbp-10h]
  unsigned int v4; // [rsp+2Ch] [rbp-Ch]
  printf("%d\n", strlen(what));
  v4 = 1;
  for ( i = 0; i < strlen(what); ++i )
  {
    v2 = a1[i];
    v4 = v4 & ((a1[(i + 1) % strlen(what)] ^ v2) == what[i]);
    if(v4 == 0)
    {
        printf("error at %d index %d %d %d\n", i, (i + 1) % strlen(what), a1[i], a1[(i + 1) % strlen(what)]);
        printf("%d != %d\n", (a1[(i + 1) % strlen(what)] ^ v2), what[i]);
        for(int j = 0; j < 128; j++)
        {
            a1[(i + 1) % strlen(what)] = j;
            if(check2(a1))
            {
                printf("found!\n");
            }
        }
        break;
    }
  }
  return v4;
}

void test(unsigned char a)
{
    char s[68] = {a};
    int wlen = strlen(what);
    int slen = strlen(secret);
    for(int i = 0; i < wlen; i++)
    {
        s[(i + 1) % wlen] = what[i] ^ s[i];
    }
    if(check(s))
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
    printf("flag{%s}\n", s);
}
/*
void test2(unsigned char a, unsigned char b)
{
    unsigned char s[68] = {[0]=a, [55]=b};
    int wlen = strlen(what);
    int slen = strlen(secret);
    for(int i = 0; i < wlen - 2; i++)
    {
        s[(i + 1) % wlen] = what[i] ^ s[i];
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
    printf("flag{%s}\n", s);
    
}
*/
int main()
{
    // for(int i = 0; i < 256; i++)
    // {
    //     test(i);
    // }
    // for(int i = 0; i< 256; i++)
    // {
    //     for (int j=0;j<256;j++)
    //     {
    //         test2(i,j);
    //     }
    // }
    test('/');
    return 0;
}

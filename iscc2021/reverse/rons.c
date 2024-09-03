#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char *r_init(unsigned char *a1, unsigned char *a2, unsigned int a3)
{
    char *result;     // eax
    int v4[64];       // [esp+7h] [ebp-111h] BYREF
    unsigned char v5; // [esp+107h] [ebp-11h]
    int v6;           // [esp+108h] [ebp-10h]
    int i;            // [esp+10Ch] [ebp-Ch]

    v6 = 0;
    v4[0] = 0;
    v4[63] = 0;
    result = 0;
    memset((char *)v4 + 1, 0, 4 * ((((char *)v4 - ((char *)v4 + 1) + 256) & 0xFFFFFFFC) >> 2));
    v5 = 0;
    for (i = 0; i <= 255; ++i)
    {
        a1[i] = i;
        result = (char *)v4 + i;
        *((char *)v4 + i) = a2[i % a3];
    }
    for (i = 0; i <= 255; ++i)
    {
        v6 = (a1[i] + v6 + *((char *)v4 + i)) % 256;
        v5 = a1[i];
        a1[i] = a1[v6];
        result = (char *)v5;
        a1[v6] = v5;
    }
    return result;
}
unsigned int r_crypt(unsigned char *a1, unsigned char *a2, unsigned int a3)
{
    unsigned int result; // eax
    unsigned char v4;    // [esp+Fh] [ebp-15h]
    unsigned int i;      // [esp+14h] [ebp-10h]
    int v6;              // [esp+18h] [ebp-Ch]
    int v7;              // [esp+1Ch] [ebp-8h]

    v7 = 0;
    v6 = 0;
    for (i = 0;; ++i)
    {
        result = i;
        if (i >= a3)
            break;
        v7 = (v7 + 1) % 256;
        v6 = (v6 + a1[v7]) % 256;
        v4 = a1[v7];
        a1[v7] = a1[v6];
        a1[v6] = v4;
        a2[i] ^= a1[(unsigned char)(a1[v7] + a1[v6])];
    }
    return result;
}
int r_s(char *a1, char *Str)
{
    unsigned int v2;       // eax
    unsigned char v4[256]; // [esp+1Ch] [ebp-20Ch] BYREF
    char v5[256];          // [esp+11Ch] [ebp-10Ch] BYREF
    unsigned int v6;       // [esp+21Ch] [ebp-Ch]

    memset(v4, 0, sizeof(v4));
    memset(v5, 0, sizeof(v5));
    v6 = strlen(Str);
    v2 = strlen(a1);
    r_init(v4, (unsigned char *)a1, v2);
    return r_crypt(v4, (unsigned char *)Str, v6);
}
size_t mix(char *a1, char *Str)
{
    size_t result; // eax
    size_t l;      // [esp+10h] [ebp-18h]
    size_t k;      // [esp+14h] [ebp-14h]
    size_t i;      // [esp+18h] [ebp-10h]
    size_t j;      // [esp+1Ch] [ebp-Ch]

    if (strlen(Str) > 0x11)
    {
        for (i = 0; i < strlen(Str); ++i)
            Str[i] += 2;
    }
    else
    {
        for (j = 0; j < strlen(Str); ++j)
            ++Str[j];
    }
    for (k = 0; k < strlen(Str); ++k)
        Str[k] -= a1[(int)k % 8];
    for (l = 0;; ++l)
    {
        result = strlen(a1);
        if (l >= result)
            break;
        a1[l] += l;
    }
    return result;
}
size_t decode(char *a1, char *Str)
{
    size_t result; // eax
    size_t l;      // [esp+10h] [ebp-18h]
    size_t k;      // [esp+14h] [ebp-14h]
    size_t i;      // [esp+18h] [ebp-10h]
    size_t j;      // [esp+1Ch] [ebp-Ch]

    for (l = 0;; ++l)
    {
        result = strlen(a1);
        if (l >= result)
            break;
        a1[l] += l;
    }
    r_s(a1, Str);
    for (l = 0;; ++l)
    {
        result = strlen(a1);
        if (l >= result)
            break;
        a1[l] -= l;
    }
    for (k = 0; k < strlen(Str); ++k)
        Str[k] += a1[(int)k % 8];
    if (strlen(Str) > 0x11)
    {
        for (i = 0; i < strlen(Str); ++i)
            Str[i] -= 2;
    }
    else
    {
        for (j = 0; j < strlen(Str); ++j)
            --Str[j];
    }
    puts(Str);
    return result;
}
int main(int argc, const char **argv, const char **envp)
{
    size_t v4;     // ebx
    char v5[256];  // [esp+1Ch] [ebp-50Ch] BYREF
    char v6[512];  // [esp+11Ch] [ebp-40Ch] BYREF
    char Str[512]; // [esp+31Ch] [ebp-20Ch] BYREF
    size_t i;      // [esp+51Ch] [ebp-Ch]

    printf("flag\n");
    // scanf("%s", v6);
    memset(v5, 0, sizeof(v5));
    memcpy(v5, "ISCC2021", 8);
    memset(Str, 0, sizeof(Str));
    Str[0] = -24;
    Str[1] = 48;
    Str[2] = -24;
    Str[3] = 48;
    Str[4] = -55;
    Str[5] = 101;
    Str[6] = -87;
    Str[7] = -70;
    Str[8] = 119;
    Str[9] = -38;
    Str[10] = -12;
    Str[11] = 78;
    Str[12] = -29;
    Str[13] = -23;
    Str[14] = 96;
    Str[15] = 118;
    Str[16] = -63;
    decode(v5, Str);
    // mix(v5, v6);
    // r_s(v5, v6);
    /*
    for (i = 0;; ++i)
    {
        v4 = i;
        if (v4 >= strlen(Str))
            break;
        if (Str[i] != v6[i])
        {
            printf("err");
            return 0;
        }
    }
    */
    printf("right");
    return 0;
}

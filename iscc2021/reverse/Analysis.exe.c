#include <stdio.h>
#include <string.h>
int mix(char *a1, char *Str, int a3)
{
    char v3;    // dl
    int result; // eax
    char v5;    // [esp+14h] [ebp-24h]
    int n;      // [esp+18h] [ebp-20h]
    int m;      // [esp+1Ch] [ebp-1Ch]
    int l;      // [esp+20h] [ebp-18h]
    size_t k;   // [esp+24h] [ebp-14h]
    int j;      // [esp+28h] [ebp-10h]
    int i;      // [esp+2Ch] [ebp-Ch]

    for (i = 0; i < a3; ++i)
        a1[i] -= 64;
    for (j = 0; j < a3; ++j)
        a1[j] -= a1[j + 1];
    for (k = 0; k < strlen(Str); ++k)
        Str[k] %= 64;
    for (l = 0; l < a3; ++l)
        a1[l] += Str[l % 7];
    for (m = 0; a3 / 2 > m; ++m)
    {
        // swap (a1[m], a1[a3 - m - 1])
        v5 = a1[m];
        a1[m] = a1[a3 - m - 1];
        a1[a3 - m - 1] = v5;
    }
    for (n = 0; n < a3; ++n)
    {
        if ((Str[n % 7] & 1) != 0)
            v3 = a1[n] + 2;
        else
            v3 = a1[n] + 1;
        a1[n] = v3;
    }
    return 0;
}
void getflag()
{
    char Str[] = "REVERSE";
    char str[60] = {};
    str[0] = 'C';
    str[1] = '\xDF';
    str[2] = '\x14';
    str[3 + 0] = 3;
    str[3 + 1] = 13;
    str[3 + 2] = 44;
    str[3 + 3] = 9;
    str[3 + 4] = 1;
    str[3 + 5] = 23;
    str[3 + 6] = 23;
    str[3 + 7] = 8;
    str[3 + 8] = -4;
    str[3 + 9] = 43;
    str[3 + 10] = -6;
    str[3 + 11] = 20;
    str[3 + 12] = 23;
    str[3 + 13] = -7;
    str[3 + 14] = 37;
    str[3 + 15] = -11;
    str[3 + 16] = 34;
    str[3 + 17] = 61;
    str[3 + 18] = -50;
    str[3 + 19] = 24;
    str[3 + 20] = 22;
    str[3 + 21] = 10;
    int len = strlen(str);
    for (int k = 0; k < 7; ++k)
        Str[k] %= 64;
    for (int n = 0; n < len; ++n)
    {
        if ((Str[n % 7] & 1) != 0)
            str[n] = str[n] - 2;
        else
            str[n] = str[n] - 1;
    }
    for (int m = 0; len / 2 > m; ++m)
    {
        // swap (a1[m], a1[a3 - m - 1])
        int v5 = str[m];
        str[m] = str[len - m - 1];
        str[len - m - 1] = v5;
    }
    for (int l = 0; l < len; ++l)
        str[l] -= Str[l % 7];
    for (int j = len - 1; j >= 0; --j)
        str[j] += str[j + 1];
    for (int i = 0; i < len; ++i)
        str[i] += 64;
    puts(str);
}
int main(int argc, const char **argv, const char **envp)
{
    getflag();
    return 0;
}
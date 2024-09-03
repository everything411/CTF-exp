#include <stdio.h>
#include <string.h>
char unk_497C[] = {
    0xA3,
    0x1A,
    0xE3,
    0x69,
    0x2F,
    0xBB,
    0x1A,
    0x84,
    0x65,
    0xC2,
    0xAD,
    0xAD,
    0x9E,
    0x96,
    5,
    2,
    0x1F,
    0x8E,
    0x36,
    0x4F,
    0xE1,
    0xEB,
    0xAF,
    0xF0,
    0xEA,
    0xC4,
    0xA8,
    0x2D,
    0x42,
    0xC7,
    0x6E,
    0x3F,
    0xB0,
    0xD3,
    0xCC,
    0x78,
    0xF9,
    0x98,
    0x3F,
    0};
int sub_1288(int i)
{
    return raise(8);
}
unsigned int sub_11DC(unsigned int result, unsigned int a2)
{
    char v2;         // r2
    unsigned int v3; // r1
    unsigned int v4; // r3
    unsigned int v5; // r2
    int v6;          // zf

    if (a2 != 1)
    {
        if (a2)
        {
            if (result <= a2)
            {
                result = result == a2;
            }
            else if ((a2 & (a2 - 1)) != 0)
            {
                v2 = __builtin_clz(a2) - __builtin_clz(result);
                v3 = a2 << v2;
                v4 = 1 << v2;
                v5 = 0;
                while (1)
                {
                    if (result >= v3)
                    {
                        result -= v3;
                        v5 |= v4;
                    }
                    if (result >= v3 >> 1)
                    {
                        result -= v3 >> 1;
                        v5 |= v4 >> 1;
                    }
                    if (result >= v3 >> 2)
                    {
                        result -= v3 >> 2;
                        v5 |= v4 >> 2;
                    }
                    if (result >= v3 >> 3)
                    {
                        result -= v3 >> 3;
                        v5 |= v4 >> 3;
                    }
                    v6 = result == 0;
                    if (result)
                    {
                        v4 >>= 4;
                        v6 = v4 == 0;
                    }
                    if (v6)
                        break;
                    v3 >>= 4;
                }
                result = v5;
            }
            else
            {
                result >>= 31 - __builtin_clz(a2);
            }
        }
        else
        {
            if (result)
                result = -1;
            result = sub_1288(result);
        }
    }
    return result;
}
// buf, key, keylen
int sub_FFC(char *a1, char *a2, int a3)
{
    int i;         // r6
    int v7;        // r1
    int v8;        // r0
    int v9;        // r1
    int v10;       // r3
    char v12[260]; // [sp+0h] [bp-120h] BYREF

    memset(v12, 0, 0x100u);
    for (i = 0; i != 256; ++i)
    {
        a1[i] = i;
        sub_11DC(i, a3);
        v12[i] = a2[v7];
    }
    v8 = 0;
    v9 = 0;
    while (v8 != 256)
    {
        v10 = a1[v8];
        v9 = (v9 + v10 + (unsigned char)v12[v8]) % 256;
        a1[v8++] = a1[v9];
        a1[v9] = v10;
    }
    return 0;
}
// key, flag, flaglen=39
int sub_1088(char *result, char *a2, int a3)
{
    int v3; // r3
    int v4; // r4
    int v5; // r5

    v3 = 0;
    v4 = 0;
    while (a3)
    {
        --a3;
        v4 = (v4 + 1) % 256;
        v5 = (unsigned char)result[v4];
        v3 = (v3 + v5) % 256;
        result[v4] = result[v3];
        result[v3] = v5;
        *a2++ ^= result[(unsigned char)(v5 + result[v4])];
    }
    return result;
}

int sub_10D4(char *result, int a2, char *a3, int a4)
{
    int i;   // r4
    int v5;  // r6
    char v6; // r5
    char v7; // lr
    char v8; // r12
    int j;   // lr
    int k;   // r6

    for (i = 0; i < a2; i += 3)
    {
        v6 = result[i + 2];
        v7 = result[i + 1];
        v8 = result[i] ^ v6;
        result[i] = v8;
        result[i + 2] = v6 ^ v7;
        result[i + 1] = v7 ^ v8;
    }
    for (j = 0; j < a2; j += a4)
    {
        for (k = 0; (a4 & ~(a4 >> 31)) != k && j + k < a2; ++k)
            result[k] ^= a3[k];
        result += a4;
    }
    return result;
}
int main()
{
    const char *v3;            // r4
    size_t v4;                 // r5
    char v6[256] = "12345678"; // [sp+0h] [bp-220h] BYREF
    char v7[260];              // [sp+100h] [bp-120h] BYREF

    v3 = "aaaa";
    if (strlen(v3) != 39)
        return 0;
    memset(v7, 0, 0x100u);

    v4 = strlen(v6); // 8
    sub_FFC(v7, v6, v4);

    sub_1088(v7, v3, 39);
    sub_10D4(v3, 39, v6, v4);
    return memcmp(v3, &unk_497C, 0x27u) == 0;
}
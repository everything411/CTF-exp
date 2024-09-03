#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char map[32] =
{
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  4,
  0,
  0,
  0,
  0,
  0,
  3,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0
}; // idb
char row[32] =
{
  0,
  0,
  0,
  1,
  1,
  0,
  0,
  0,
  2,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  1,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0
}; // idb
char col[20] = { 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1 }; // idb
char completed_0; // weak
char input[112]; // idb

char docheck()
{
  unsigned char *v0; // rax
  long long v1; // rdx
  long long v2; // rsi
  long long v3; // rsi
  long long v4; // rsi
  long long v5; // rsi
  long long v6; // rax
  long long v7; // rdx
  long long v8; // rdx
  long long v9; // rdx
  long long v10; // rdx
  char *v11; // rax
  long long v12; // rdx
  char v13; // cl
  char v14; // cl
  char v15; // cl
  char v16; // cl
  long long v17; // rdx
  long long v18; // rsi
  char result; // al
  char v20; // al
  char v21; // al
  char v22; // al
  char v23; // al
  char v24; // al
  int v25; // [rsp+0h] [rbp-10h]
  short v26; // [rsp+4h] [rbp-Ch]
  int v27; // [rsp+8h] [rbp-8h]
  short v28; // [rsp+Ch] [rbp-4h]

  v0 = &map[4];
  v1 = 0LL;
  while ( 1 )
  {
    v28 = 0;
    v27 = 0;
    v2 = *(v0 - 4);
    if ( *((char *)&v27 + v2) )
      break;
    *((char *)&v27 + v2) = 1;
    v3 = *(v0 - 3);
    if ( *((char *)&v27 + v3) )
      break;
    *((char *)&v27 + v3) = 1;
    v4 = *(v0 - 2);
    if ( *((char *)&v27 + v4) )
      break;
    *((char *)&v27 + v4) = 1;
    v5 = *(v0 - 1);
    if ( *((char *)&v27 + v5) )
      break;
    *((char *)&v27 + v5) = 1;
    if ( *((char *)&v27 + *v0) )
      break;
    ++v1;
    v0 += 5;
    if ( v1 >= 5 )
    {
      v6 = 0LL;
      while ( 1 )
      {
        v26 = 0;
        v25 = 0;
        v7 = (unsigned char)map[v6];
        if ( *((char *)&v25 + v7) )
          break;
        *((char *)&v25 + v7) = 1;
        v8 = (unsigned char)map[v6 + 5];
        if ( *((char *)&v25 + v8) )
          break;
        *((char *)&v25 + v8) = 1;
        v9 = (unsigned char)map[v6 + 10];
        if ( *((char *)&v25 + v9) )
          break;
        *((char *)&v25 + v9) = 1;
        v10 = (unsigned char)map[v6 + 15];
        if ( *((char *)&v25 + v10) )
          break;
        *((char *)&v25 + v10) = 1;
        if ( *((char *)&v25 + (unsigned char)map[v6 + 20]) )
          break;
        if ( ++v6 >= 5 )
        {
          v11 = &map[4];
          v12 = 0LL;
          while ( 1 )
          {
            v13 = row[4 * v12];
            if ( v13 == 2 )
            {
              if ( *(v11 - 4) > *(v11 - 3) )
                return 0;
            }
            else if ( v13 == 1 && *(v11 - 4) < *(v11 - 3) )
            {
              return 0;
            }
            v14 = row[4 * v12 + 1];
            if ( v14 == 1 )
            {
              if ( *(v11 - 3) < *(v11 - 2) )
                return 0;
            }
            else if ( v14 == 2 && *(v11 - 3) > *(v11 - 2) )
            {
              return 0;
            }
            v15 = row[4 * v12 + 2];
            if ( v15 == 2 )
            {
              if ( *(v11 - 2) > *(v11 - 1) )
                return 0;
            }
            else if ( v15 == 1 && *(v11 - 2) < *(v11 - 1) )
            {
              return 0;
            }
            v16 = row[4 * v12 + 3];
            if ( v16 == 2 )
            {
              if ( *(v11 - 1) > *v11 )
                return 0;
            }
            else if ( v16 == 1 && *(v11 - 1) < *v11 )
            {
              return 0;
            }
            ++v12;
            v11 += 5;
            if ( v12 >= 5 )
            {
              v17 = 4LL;
              v18 = 0LL;
              while ( 1 )
              {
                v20 = col[v17 - 4];
                if ( v20 == 2 )
                {
                  if ( map[v17 - 4] < map[v17 + 1] )
                    return 0;
                }
                else if ( v20 == 1 && map[v17 - 4] > map[v17 + 1] )
                {
                  return 0;
                }
                v21 = col[v17 - 3];
                if ( v21 == 1 )
                {
                  if ( map[v17 - 3] > map[v17 + 2] )
                    return 0;
                }
                else if ( v21 == 2 && map[v17 - 3] < map[v17 + 2] )
                {
                  return 0;
                }
                v22 = col[v17 - 2];
                if ( v22 == 2 )
                {
                  if ( map[v17 - 2] < map[v17 + 3] )
                    return 0;
                }
                else if ( v22 == 1 && map[v17 - 2] > map[v17 + 3] )
                {
                  return 0;
                }
                v23 = col[v17 - 1];
                if ( v23 == 2 )
                {
                  if ( map[v17 - 1] < map[v17 + 4] )
                    return 0;
                }
                else if ( v23 == 1 && map[v17 - 1] > map[v17 + 4] )
                {
                  return 0;
                }
                v24 = col[v17];
                if ( v24 == 2 )
                {
                  if ( map[v17] < map[v17 + 5] )
                    return 0;
                }
                else if ( v24 == 1 && map[v17] > map[v17 + 5] )
                {
                  return 0;
                }
                ++v18;
                v17 += 5LL;
                result = 1;
                if ( v18 >= 4 )
                  return result;
              }
            }
          }
        }
      }
      return 0;
    }
  }
  return 0;
}

//----- (0000000000401420) ----------------------------------------------------
char  fill_number(long long a1)
{
  long long v1; // rax
  long long i; // rcx
  char v3; // dl
  char v4; // dl
  char v5; // dl
  char v6; // dl
  char v7; // dl

  v1 = 4LL;
  for ( i = 0LL; i < 5; ++i )
  {
    v3 = *(char *)(a1 + v1 - 4);
    if ( map[v1 - 4] )
    {
      if ( v3 != 48 )
        return 0;
    }
    else
    {
      map[v1 - 4] = v3 - 48;
    }
    v4 = *(char *)(a1 + v1 - 3);
    if ( map[v1 - 3] )
    {
      if ( v4 != 48 )
        return 0;
    }
    else
    {
      map[v1 - 3] = v4 - 48;
    }
    v5 = *(char *)(a1 + v1 - 2);
    if ( map[v1 - 2] )
    {
      if ( v5 != 48 )
        return 0;
    }
    else
    {
      map[v1 - 2] = v5 - 48;
    }
    v6 = *(char *)(a1 + v1 - 1);
    if ( map[v1 - 1] )
    {
      if ( v6 != 48 )
        return 0;
    }
    else
    {
      map[v1 - 1] = v6 - 48;
    }
    v7 = *(char *)(a1 + v1);
    if ( map[v1] )
    {
      if ( v7 != 48 )
        return 0;
    }
    else
    {
      map[v1] = v7 - 48;
    }
    v1 += 5LL;
  }
  return 1;
}

//----- (00000000004014F0) ----------------------------------------------------
long long  valid(const char *a1)
{
  unsigned int v1; // ebp
  size_t v2; // rax
  unsigned long long v3; // rcx
  unsigned char v4; // dl

  LOBYTE(v1) = 1;
  if ( *a1 )
  {
    if ( (unsigned char)(*a1 - 48) > 5u )
    {
LABEL_6:
      v1 = 0;
    }
    else
    {
      v2 = strlen(a1);
      v3 = 1LL;
      while ( v3 < v2 )
      {
        v4 = a1[v3++] - 48;
        if ( v4 >= 6u )
          goto LABEL_6;
      }
    }
  }
  return v1;
}


int  main(int argc, const char **argv, const char **envp)
{
  size_t v3; // rax
  unsigned long long v4; // rcx
  unsigned char v5; // dl

  scanf("%s", input, envp);
  if ( (unsigned int)strlen(input) == 25 )
  {
    if ( input[0] )
    {
      if ( (unsigned char)(input[0] - '0') > 5u )
        return 0;
      v3 = strlen(input);
      v4 = 1LL;
      while ( v4 < v3 )
      {
        v5 = input[v4++] - '0';
        if ( v5 > 5u )
          return 0;
      }
    }
    if ( fill_number((long long)input) && docheck() )
      printf("CISCN{MD5(%s)}", input);
  }
  return 0;
}
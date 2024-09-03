#include <stdio.h>
#include <string.h>
#include <unistd.h>
void pwninit()
{
    setbuf(stdin, NULL);
    setbuf(stdout, NULL);
    setbuf(stderr, NULL);
    alarm(0x100);
    puts("welcome");
}
void vul()
{
    char str[256];
    memset(str, 0, sizeof(str));
    while (1)
    {
        printf("input:");
        fgets(str, 256, stdin);
        if (!strncmp(str, "exit", 4))
        {
            break;
        }
        printf(str);
    }
}

int main(int argc, char const *argv[])
{
    pwninit();
    vul();
    return 0;
}

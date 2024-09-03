#include <stdio.h>
void vul()
{
    char str[128];
    fgets(str, 128, stdin);
    printf(str);
}
void leak()
{
    char str[128];
    printf("%p %p %p %p %p %p %p %p\n");
}
int main(int argc, char const *argv[])
{
    printf("%p %p %p %p %p %p %p %p\n", (void *)0, (void *)1, (void *)2, (void *)3, (void *)4, (void *)5, (void *)6, (void *)7);
    leak();
    vul();
    return 0;
}

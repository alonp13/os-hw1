#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include <sys/types.h>

void print(const char * text)
{
    int i;
    for(i = 0 ; i < 20 ; i++)
    {
        printf("hello from %s\n",text);
        usleep(1000000);
    }
}

int main()
{
    pid_t pid = fork();
    if(pid==0)
    {
        pid_t pid = fork();
        if(pid==0)
        {
        
            print("grand-child");
        }
        else
        {
            print("child");
        }
        
    }
    else
    {
        print("parent");
    }
    return 0;
}
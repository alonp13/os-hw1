#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sched.h>

#define STACK_SIZE 1024*1024

void print(const char *name)
{
    for(int i=0; i<20; i++)
    {
        printf("Hello from %s \n", name);
        usleep(1000000);
    }
}

int func(void *arg)
{
    print(arg);
    return 0;
}

int main()
{
    void* ptr_child_stack = malloc (STACK_SIZE);
    if(ptr_child_stack == NULL)
    {
        printf("ERROR: unable to allocate memory. \n ");
        exit(EXIT_FAILURE);
    }
    int pid1 = clone(func,ptr_child_stack+STACK_SIZE,CLONE_PARENT,"child_thread1");
    int pid2 = clone(func,ptr_child_stack+STACK_SIZE,CLONE_PARENT,"child_thread2");
     if(pid1<0 || pid2<0)
     {
         printf("ERROR: unable to create thread process.\n");
         exit(EXIT_FAILURE);
     }
     print("parent");
    return 0;
}
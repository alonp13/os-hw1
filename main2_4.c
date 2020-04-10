#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <stddef.h>

void print(const char *name)
{
    for(int i=0; i<20; i++)
    {
    usleep(100000);
    printf("Hello from %s \n", name);
    }
}

int main() 
{ 
    int pid, pid1, pid2; 
    pid = fork(); 

    if (pid == 0) { 
         char * args [] = {"./main2_1", NULL};
        execvp(args[0],args); 
    } 
  
    else { 
        pid1 = fork(); 
        if (pid1 == 0) {  
            char * args [] = {"./main2_2", NULL};
        execvp(args[0],args); 
        sleep(3);
        } 
        else { 
            pid2 = fork(); 
            if (pid2 == 0) { 
                         char * args [] = {"./main2_3", NULL};
        execvp(args[0],args);  
                        sleep(4); 

            } 
            else { 
                sleep(4); 
                print("parent");
            } 
        } 
    } 
    return 0;
} 
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <syslog.h>
#include <sys/types.h>

int main()
{
    pid_t pid = fork();
    
    if(pid==0)
    {
        chdir("/");
        setsid();
        printf("Initialize daemon thread");

        close(STDIN_FILENO);
        close(STDOUT_FILENO);
        close(STDERR_FILENO);

        openlog("myDaemon", LOG_PID,LOG_DAEMON);
        syslog(LOG_NOTICE, "Daemon -start");
        usleep(3000000);
        syslog(LOG_NOTICE, "Daemon -middle");
        usleep(3000000);
        syslog(LOG_NOTICE, "Daemon -done");

    }
    else
    {
        printf("Daemon PID %d \n", pid);
    }
    return 0;
    
}
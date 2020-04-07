#include<stdio.h>
#include <dlfcn.h>

int main()
{
    void (*imported_hello)();

    void *myso = dlopen("./libhelloAriel.so", RTLD_NOW);
    imported_hello = dlsym(myso, "hello");
    imported_hello();
    dlclose(myso);
    return 0;
}
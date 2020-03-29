# -*- MakeFile -*-


CC=gcc
AR=ar
FLAGS = -Wall -g


all: main1_1 hello_Ariel.o main1_1.o

hello_Ariel.o: hello_Ariel.c hello_Ariel.h
	$(CC) $(FLAGS) -c hello_Ariel.c

main1_1.o: main1_1.c hello_Ariel.h
	$(CC) $(FLAGS) -c main1_1.c

main1_1: main1_1.o hello_Ariel.o
	$(CC) $(FLAGS) main1_1.o hello_Ariel.o -o main1_1

.PHONY: clean all

clean:
	rm -f *.o *.a main1_1
# -*- MakeFile -*-


CC=gcc
AR=ar
FLAGS = -Wall -g
OBJECTS = main1_1.o hello_Ariel.o

all: main1_3 main1_2 main1_1 libhelloAriel.so

hello_Ariel.o: hello_Ariel.c hello_Ariel.h
	$(CC) $(FLAGS) -c hello_Ariel.c

main1_1.o: main1_1.c hello_Ariel.h
	$(CC) $(FLAGS) -c main1_1.c

main1_2.o: main1_1.c hello_Ariel.h
	$(CC) $(FLAGS) -c main1_1.c -o main1_2.o

main1_3.o: main1_3.c
	$(CC) $(FLAGS) -c main1_3.c -o main1_3.o

main1_1: $(OBJECTS)
	$(CC) $(FLAGS) $(OBJECTS) -o main1_1

main1_2: main1_2.o libhelloAriel.so
	$(CC) $(FLAGS) -o main1_2 main1_2.o ./libhelloAriel.so

main1_3: main1_3.o
	gcc main1_3.o -ldl -o main1_3

libhelloAriel.so: hello_Ariel.o
	$(CC) $(FLAGS) -shared hello_Ariel.o -o libhelloAriel.so

.PHONY: clean all

clean:
	rm -f *.o *.a *.so main1_1 main1_2 main1_3
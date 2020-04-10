# -*- MakeFile -*-


CC=gcc
AR=ar
FLAGS = -Wall -g
OBJECTS = main1_1.o hello_Ariel.o

all: main2_1 main2_2 main2_3 main2_4 main1_3 main1_2 main1_1 libhelloAriel.so

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
	$(CC) $(FLAGS) main1_3.o -ldl -o main1_3

main2_1: main2_1.c
	$(CC) $(FLAGS) main2_1.c -o main2_1

main2_2: main2_2.c
	$(CC) $(FLAGS) main2_2.c -o main2_2

main2_3: main2_3.c
	$(CC) $(FLAGS) main2_3.c -o main2_3

main2_4: main2_4.c
	$(CC) $(FLAGS) main2_4.c -o main2_4
 
libhelloAriel.so: hello_Ariel.o
	$(CC) $(FLAGS) -shared hello_Ariel.o -o libhelloAriel.so

.PHONY: clean all

clean:
	rm -f *.o *.a *.so main1_1 main1_2 main1_3 main2_1 main2_2 main2_3 main2_4
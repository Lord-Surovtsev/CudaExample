#all: program

#program: cudacode.o 
#    g++ -o program -L/usr/local/cuda/lib64 -lcuda -lcudart main.cpp  cudacode.o 

#cudacode.o: nvcc -c -arch=sm_20 cudacode.cu 

#clean: rm -rf *o program

GCC = g++

NVCC = nvcc

CFLAGS = -c -Wall

CUDA_PATH ?= "/usr/local/cuda-6.0"

NVCC := $(CUDA_PATH)/bin/nvcc -ccbin $(GCC)

CUDAFLAGS = -gencode arch=compute_20,code=sm_20

all: program


program: main.o
	$(NVCC) main.o -L/usr/local/cuda/lib64 -lcuda -lcudart -o program

main.o:  main.cpp
	$(NVCC) $(CUDAFLAGS) main.cpp

clean:
	rm -rf *.o program

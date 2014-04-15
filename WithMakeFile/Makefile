#all: program

#program: cudacode.o 
#    g++ -o program -L/usr/local/cuda/lib64 -lcuda -lcudart main.cpp  cudacode.o 

#cudacode.o: nvcc -c -arch=sm_20 cudacode.cu 

#clean: rm -rf *o program

GCC = g++

NVCC = nvcc

#GCC_FLAGS = -c -Wall

CUDA_PATH ?= "/usr/local/cuda-5.5"

NVCC := $(CUDA_PATH)/bin/nvcc -ccbin $(GCC)

CUDA_FLAGS = -gencode arch=compute_30,code=sm_30

CUDA_INCLUDES = /usr/local/cuda-5.5/lib64

all: program


program: cudacode.o main.o
	$(NVCC) cudacode.o main.o -o program

main.o:  main.cpp
	$(GCC) -c main.cpp -o main.o

cudacode.o: cudacode.cu
	$(NVCC) -I$(CUDA_INCLUDES) $(CUDA_FLAGS) -c cudacode.cu -o cudacode.o

clean:
	rm -rf *.o *.co program

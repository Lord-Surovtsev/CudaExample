//#include <cuda>

//#include <cuda.h>
//#include <cuda_runtime.h>
//#include <cuda_runtime_api.h>

#include "stdio.h"

__global__
void testKernel(float* d_data)
{
	int myId = threadIdx.x;
	d_data[myId] = 10;
}

void CallKernel(int a, int b)
{
	int threads = 32;

	dim3 gridSize(1, 1, 1);
	dim3 blockSize(threads, 1, 1);

	float* h_data;
	float* d_data;
	int dataLen = threads;

	h_data = (float *)malloc(sizeof(float) * dataLen);

	for (int i = 0; i < dataLen; i++)
	{
		h_data[i] = i;
	}

	cudaMalloc((void**)&d_data, sizeof(float) * dataLen);
	cudaMemcpy(d_data, h_data, sizeof(float) * dataLen, cudaMemcpyHostToDevice);

	puts("starting kernel");
	testKernel<<<gridSize, blockSize>>>(d_data);
	puts("kernel finished");

	cudaMemcpy(h_data, d_data, sizeof(float) * dataLen, cudaMemcpyDeviceToHost);

	puts("data:");
	for (int i = 0; i < dataLen; i++)
	{
		printf(" %f\n", h_data[i]);
	}
	puts("end");

	free(h_data);
	cudaFree(d_data);
	cudaError_t error = cudaGetLastError();
  	if(error != cudaSuccess)
   	{
    	// print the CUDA error message and exit
    	printf("CUDA error: %s\n", cudaGetErrorString(error));
    	exit(-1);
  	}
}

/*
int main(int argc, char* argv[])
{
	int a = 1;
	int b = 2;
	CallKernel(a, b);
}
*/
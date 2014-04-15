/*
#include <iostream>
using namespace std;

__global__
void kernelFunction()
{

    return;
}

//extern "C"
void CudaMain()
{
    int threads = 32;
    dim3 gridSize(1, 1, 1);
    dim3 blockSize(threads, 1, 1);

    kernelFunction<<<gridSize, blockSize>>>();
}
*/

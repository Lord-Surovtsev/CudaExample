#include <iostream>
using namespace std;

//#include "cudacode.cu"

void CallKernel(int a, int b);

int main(int argv, char* argc[])
{
	cout << "starting" << endl;\
	int a = 1;
	int b = 2;
    CallKernel(a, b);
	return 0;
}
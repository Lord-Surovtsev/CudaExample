#include <iostream>
using namespace std;

void CallKernel();

int main(int argc, char* argv[])
{
    cout << "starting" << endl;
    CallKernel();
    cout << "finished" << endl;
    return 0;
}

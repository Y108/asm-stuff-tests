#include <iostream>
#include <cstdint>
#include <malloc.h>

extern "C" uint64_t Fibnum(int64_t iterations);
extern "C" uint64_t* Fibarray(int64_t iterations);

int main() {
	uint64_t* myptr = Fibarray(10);

	for (int64_t i = 0; i < 10; ++i)
	{
		std::cout << myptr[i] << std::endl;
	}	

	std::cout << "\nTenth Fibonacci number: " << Fibnum(10) << std::endl;
	
	free(myptr);

	return 0;
}

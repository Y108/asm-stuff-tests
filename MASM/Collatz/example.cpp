#include <iostream>
#include <cstdint>
#include <malloc.h>

extern "C" uint64_t* Collarray(uint64_t startval);

int main() {

	uint64_t* arrPTR = Collarray(300);

  //Function return nullptr when input <= 1.
  //Therefore a check is needed / Can't dereference nullptr
  
	if (arrPTR != nullptr) {
		while (*arrPTR != 0) {
			std::cout << *arrPTR << '\n';
			++arrPTR;
		}
	}

	free(arrPTR);

	return 0;
}

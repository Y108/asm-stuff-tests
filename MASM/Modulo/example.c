#include <stdio.h>
#include <stdint.h>

extern "C" int32_t Modulo(int32_t dividend, int32_t divisor);

int main() {

	printf("%d\n", Modulo(-3,4));

	return 0;
}

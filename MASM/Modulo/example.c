#include <stdio.h>
#include <stdint.h>

extern "C" int32_t Modulo(int32_t dividend, int32_t divisor);

int main() {
	
	printf("13 mod 7  =  %d\n", Modulo(13, 7));
	printf("-3 mod 4  =  %d\n", Modulo(-3,4));
	printf("32 mod -5 = %d\n", Modulo(32, -5));
	printf("-8 mod -3 = %d\n", Modulo(-8, -3));

	return 0;
}

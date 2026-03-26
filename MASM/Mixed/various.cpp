#include <iostream>
#include <cstdint>


extern "C" double _COS(double value);
extern "C" uint64_t _FACT(uint64_t value);
extern "C" int64_t _POW(int64_t base, uint64_t exponent);
extern "C" uint64_t _DOUBLEFACT(uint64_t value);
extern "C" uint64_t _nCr(uint64_t n, uint64_t r);
extern "C" double _DIV(uint64_t);
extern "C" double _POWSD(double base, uint64_t exponent);
extern "C" uint64_t _SUM(uint64_t value);

int main(){
	std::cout << _nCr(12,4);
	return 0;
}

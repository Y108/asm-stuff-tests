#include <iostream>

void replaceSpaceWithNull(const char *str) {

    if (str != nullptr) {
        asm(
            "loop_:\n"
            "movb (%0), %%al\n"
            "cmpb $0, %%al\n"
            "jz end_\n"
            "cmpb $32, %%al\n"
            "jz replace_\n"
            "inc %0\n"
            "jmp loop_\n"

            "replace_:\n"
            "movb $0, (%0)\n"
            "inc %0\n"
            "jmp loop_\n"

            "end_:\n"

          :
          : "r" (str)
          : "al","cc"
        );
    }
}

int main() {

    char mystr[] = "a b c";
    char* myptr = mystr;

    replaceSpaceWithNull(myptr);

    std::cout << *myptr << '\n';
    std::cout << *(myptr + 2) << '\n';
    std::cout << *(myptr + 4) << '\n';

    return 0;
}

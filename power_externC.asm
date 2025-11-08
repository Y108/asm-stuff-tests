.code

public pow

pow proc ; int64_t pow(int64_t base, int64_t exponent)

	cmp rdx, 0
	je endLoop

	mov rax, rcx
	mov r8, rdx
	dec r8

loopMultiply:

	dec r8
	imul rcx
	cmp r8,0
	je endLoop
	jmp loopMultiply

endLoop:

	ret

pow endp
end

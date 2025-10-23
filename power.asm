.code

public pow

pow proc

	mov rax, rcx
	mov r8, rdx
	dec r8

_loop:

	dec r8
	imul rcx
	cmp r8,0
	je _end
	jmp _loop

_end:

	ret

pow endp
end

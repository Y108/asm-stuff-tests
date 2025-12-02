includelib msvcrt.lib

EXTERN malloc:PROC
EXTERN realloc:PROC

.data

size_ctr dq ?

numstr db "%d" , 0

collStartSz dq 200 * 8
collCtr dq 200

.code

Collarray PROC
	; void* Collarray (uint64_t startnum)
	; rax = uint64_t* to number array

	push rbx
	push r11
	sub rsp, 32

	cmp rcx, 1
	jle clearColl

	mov rbx, rcx
	
	mov rcx, [collStartSz]
	call malloc

	mov r11, 0

collLoop:
	mov [rax + r11 * 8], rbx

	cmp rbx, 1
	je endColl

	mov rcx, rbx
	and rcx, 1

	dec [collCtr]
	cmp [collCtr], 0
	je reMalloc

	cmp rcx, 0
	je evenNum
	jmp oddNum

evenNum:
	shr rbx, 1 

	inc r11
	jmp collLoop

oddNum:
	imul rbx, 3
	inc rbx

	inc r11
	jmp collLoop

reMalloc:
	add [collStartSz], 50 * 8
	add [collCtr], 50

	mov rcx, rax
	mov rdx, [collStartSz]

	call realloc
	jmp collLoop

clearColl:
	xor rax, rax
	jmp preExit

endColl:
	mov rcx, 0
	mov [rax + r11 * 8 + 8], rcx 

preExit:
	add rsp, 32
	pop r11
	pop rbx

	ret
Collarray ENDP

END

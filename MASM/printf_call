includelib legacy_stdio_definitions.lib

EXTERN printf: PROC

.data

formatstr db "This is the number %2d !", 10, 0

mynum dq 1

.code

main proc
	
	sub rsp, 32

myloop:

	lea rcx, formatstr
	mov rdx, mynum

	call printf

	inc mynum
	cmp mynum, 20
	jng myloop

	add rsp, 32

	xor rax, rax
	ret

main endp

end

; prints the string with numbers 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20

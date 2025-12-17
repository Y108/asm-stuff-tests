.code

; First function parameter -> rcx
; Used as loop counter at the same time
; Loop stops when rcx = 0

Factorial PROC
	mov rax, 1
multLoop:
    imul rax, rcx
	loop multLoop
	ret
Factorial ENDP

END

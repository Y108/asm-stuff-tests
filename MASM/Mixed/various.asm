.data

__num_PI REAL8 3.141592653589793 ; PI
__num_E REAL8  2.718281828459045 ; Euler's number
.code 

_FACT PROC
	cmp rcx, 0
	jle smallloop

	mov rax, 1
mulloop:
	imul rax, rcx
	loop mulloop
	ret
smallloop:
	mov rax, 1
	ret
_FACT ENDP

_DOUBLEFACT PROC
	mov rax, 1

	cmp rcx, 1
	jl df_exit

df_loop:
	imul rax, rcx
	sub rcx, 2
	cmp rcx, 1
	je df_exit
	cmp rcx, 0
	je df_exit
	jmp df_loop
df_exit:

	ret
_DOUBLEFACT ENDP

_POW PROC
	xor rcx, rdx
	xor rdx, rcx
	xor rcx, rdx
	mov rax, 1
powloop:
    imul rax, rdx
	loop powloop
	ret
_POW ENDP

_nCr PROC
	; rcx = n, rdx = r
	; 
	; |n|
	; |r|
	;
	; n!/ (n-r)! * r!
	; rxx!/ r8! *  rdx!

	mov r8, rcx
	sub r8, rdx

	sub rsp, 32
	call _FACT
	add rsp, 32
	mov rcx, rax

	xor rcx, rdx
	xor rdx, rcx	; rcx <-> rdx
	xor rcx, rdx

	sub rsp, 32
	call _FACT
	add rsp, 32
	mov rcx, rax

	xor rcx, r8
	xor r8, rcx		; rdx <-> r8
	xor rcx, r8

	sub rsp, 32
	call _FACT
	add rsp, 32
	mov rcx, rax

	imul rcx, r8

	xor rdx, rax
	xor rax, rdx
	xor rdx, rax

	xor rdx, rdx

	idiv rcx

	ret
_nCr ENDP
	
_POWSD PROC
	cmp rdx, 0
	jle powsdexit
	mov rcx, rdx
	movsd xmm1, xmm0
	dec rcx

powsdloop:
	mulsd xmm0, xmm1
	loop powsdloop
	ret

powsdexit:
	mov rdx, 1
	cvtsi2sd xmm0, rdx
	ret

_POWSD ENDP

_COS PROC
	; Sine of a integer

	mov rdx, 2
	mov r8, -1

	ucomisd xmm0, __num_PI
	jbe precosloop

	movsd xmm1, xmm0

	divsd xmm0, __num_PI
	cvtsd2si r8, xmm0
	cvtsi2sd xmm0, r8
	mulsd xmm0, __num_PI
	subsd xmm1, xmm0
	movsd xmm0, xmm1


precosloop:

	ret
_COS ENDP


END

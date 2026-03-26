.data

__num_PI REAL8 3.141592653589793 ; PI
__num_E REAL8  2.718281828459045 ; Euler's number
.code 

_FACT PROC

	; factorial of a positive number
	; uint64_t _FACT(uint64_t value)
	;
	; (value)!

	mov				rax, 1			; move 1 to output

	cmp				rcx, 0			; check if value is lower or equal to zero
	jle				zerofact		; if zero, jump to end / return one

mulloop:
	imul				rax, rcx		; multiply rax by counter
	loop				mulloop			; loop until counter is zero

zerofact:
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

	; binomial coefficient 
	; uint64_t _nCr(uint64_t n, uint64_t r
	;
	; n! / (r! * (n-r)!)

	mov				r8, rcx
	sub				r8, rdx

	sub				rsp, 32
	call			_FACT			; call factorial function
	mov				rcx, rax

	xor				rcx, rdx
	xor				rdx, rcx		; swap rdx and rcx
	xor				rcx, rdx


	call			_FACT
	mov				rcx, rax

	xor				rcx, r8
	xor				r8, rcx
	xor				rcx, r8

	call			_FACT
	add				rsp, 32
	mov				rcx, rax

	imul			rcx, r8

	xor				rdx, rax
	xor				rax, rdx
	xor				rdx, rax

	xor				rdx, rdx

	idiv			rcx

	ret

_nCr ENDP

_SUM PROC

	; Gauß formula for sums
	; uint64_t _SUM(uint64_t value)
	;
	; (value * (value + 1)) / 2 

	mov				rdx, rcx		; move input value to rdx     
	inc				rdx				; increase rdx by 1

	imul			rcx, rdx		; multiply value by (value+1)
	shr				rcx, 1			; divide product by 2

	mov				rax, rcx		; move to output

	ret

_SUM ENDP
	
_POWSD PROC

	; powers with positive integer exponents
	; double _POWSD(double base, int exponent)
	;
	; base ^ exponent 

	cmp				rdx, 0			; check if exponent is zero
	jle				powsdexit		; jump to exit if true
	mov				rcx, rdx		; move exponent to loop counter
	movsd			xmm1, xmm0		; move base to xmm1 as factor
	dec				rcx

powsdloop:
	mulsd			xmm0, xmm1		; multiply base by factor
	loop			powsdloop		; loop until counter is zero
	ret

powsdexit:
	mov				rdx, 1			; return one if exponent is zero
	cvtsi2sd		xmm0, rdx		; convert integer value as double to output
	ret

_POWSD ENDP

_COS PROC
	; Cosine of an integer

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

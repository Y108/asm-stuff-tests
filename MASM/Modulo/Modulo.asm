.code
Modulo PROC
; ecx mod edx -> eax

	cmp ecx, 0
	je zeroLabel
	jl NEG_DIVISOR
	jg POS_DIVISOR

POS_DIVISOR:
	cmp edx, 0
	je zeroLabel
	jg posposMod
	jl posnegMod

NEG_DIVISOR:
	cmp edx, 0
	je zeroLabel
	jg negposMod
	jl negnegMod

posposMod:
	mov eax, ecx
	mov ecx, edx
	xor edx, edx

	div ecx
	jmp endLabel

posnegMod:
	addLoop1:
		add ecx, edx
		cmp ecx, 0
		jg addLoop1

	mov edx, ecx
	jmp endLabel

negnegMod:
	imul ecx, -1
	imul edx, -1

	mov eax, ecx
	mov ecx, edx
	xor edx, edx
	div ecx

	imul edx, -1
	jmp endLabel

negposMod:
	addLoop2:
		add ecx, edx
		cmp ecx, 0
		jl addLoop2

	mov edx, ecx
	jmp endLabel

zeroLabel:
	xor edx, edx

endLabel:
	mov eax, edx
	ret

Modulo ENDP
END

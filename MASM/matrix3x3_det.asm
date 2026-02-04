.data

Matrix3x3 STRUCT

matrix qword 9 dup(?)

Matrix3x3 ENDS

myMatrix Matrix3x3<{1,0,0,0,1,0,0,0,1}>

.code

det proc ;int64_t det(int64_t* matrixArray)

	xor rax,rax

	mov  rdx, [rcx]
	imul rdx, [rcx+32]
	imul rdx, [rcx+64]

	add rax, rdx

	mov  rdx, [rcx+8]
	imul rdx, [rcx+40]
	imul rdx, [rcx+48]

	add rax, rdx

	mov  rdx, [rcx+16]
	imul rdx, [rcx+24]
	imul rdx, [rcx+56]

	add rax, rdx

	mov  rdx, [rcx+48]
	imul rdx, [rcx+32]
	imul rdx, [rcx+16]

	sub rax, rdx

	mov  rdx, [rcx+56]
	imul rdx, [rcx+40]
	imul rdx, [rcx]

	sub rax, rdx

	mov  rdx, [rcx+64]
	imul rdx, [rcx+24]
	imul rdx, [rcx+8]

	sub rax, rdx

	ret

det endp

main proc
	
	lea rcx, myMatrix.matrix

	call det

	ret

main endp

end

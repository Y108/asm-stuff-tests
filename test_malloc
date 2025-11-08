.data

HEAP_START STRUCT
		FreeBlockSize QWORD ?
		FreeBlockPtr  QWORD ?
HEAP_START ENDS

H_Header HEAP_START<1024,0>

HEAP_MEMORY DQ 128 DUP(?)

.code

initHeap proc ; void initHeap()

	lea rax, HEAP_MEMORY
	mov H_Header.FreeBlockPtr, rax

	ret

initHeap endp

alloc proc	; int64_t* alloc(int64_t anzBytes)
	
	cmp H_Header.FreeBlockSize, rcx
	jl alloc_fail

	mov rax, H_Header.FreeBlockPtr
	
	sub H_Header.FreeBlockSize, rcx
	add H_Header.FreeBlockPtr , rcx

	jmp alloc_exit

alloc_fail:

	xor rax, rax
	jmp alloc_exit

alloc_exit:

	ret

alloc endp

deallocAll proc ; void deallocAll()

	mov H_Header.FreeBlockSize, 1024

	lea rax, HEAP_MEMORY
	mov H_Header.FreeBlockPtr , rax

	ret

deallocAll endp

main proc
	
	call initHeap

	mov rcx, 32

	call alloc

	call deallocAll

	mov rcx, 32

	call alloc

	ret

main endp

END

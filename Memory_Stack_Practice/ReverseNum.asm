; Stack Program Example (Reverse an array of numbers using stack calls)

section .data
	numbers	dq	121, 122, 123, 124, 125
	len		dq	5
	
section .text
	global _start
	
_start:
	mov	rcx, qword[len]
	mov	rbx, numbers
	mov	r12, 0
	mov	rax, 0
	
pushLoop:
	push	qword[rbx+r12*8]
	inc	r12
	loop	pushLoop
	
	; -----
	; All the numbers are on stack (in reverse order).
	; Loop to get them back off. Put them back into
	; the original list...
	; -----
	
	mov	rcx, qword[len]
	mov	rbx, numbers
	mov	r12, 0
	
popLoop:
	pop	rax
	mov	qword[rbx+r12*8], rax
	inc	r12
	loop	popLoop
	
	;-----
	; Terminate Program

end:
	mov	rax, 60
	mov	rdi, 0
	syscall
	

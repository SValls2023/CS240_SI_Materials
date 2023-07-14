; Code-along program where it calculates the average/sum of the list using a function
; average(arr&, len, sum&, ave&);

section .data
	array	dq	10, 20, 30, 40, 50, 60
	len	dq	6
	sum	dq	0
	ave	dq	0

section .text
global _start
_start:
	mov	rdi, array
	mov	rsi, qword[len]
	mov	rdx, sum
	mov	rcx, ave
	call 	average
	
end_prog:
	mov 	rax, 60
	mov 	rdi, 0
	syscall


;***********************************************************************

global average
average:
	push 	r12 				; prologue
	mov	rax, 0
	mov	r10, 0
	
sumLoop:
	add	rax, qword[rdi+r10*8]
	inc	r10
	cmp	r10, rsi
	jne	sumLoop
	
	mov	rdx, 0
	div	rsi
	mov	qword[rcx], rax
	
	pop 	r12 				; epilogue
	ret	

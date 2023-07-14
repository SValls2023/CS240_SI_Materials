; Exercise where a loop is utilized to calculate the first 10 terms of the fibonacci sequence
; Based on Chapter 7, Problem 9 of x86-64 Assembly Language Programming with Ubuntu: http://www.egr.unlv.edu/~ed/assembly64.pdf

section .data
	
section .text
	global _start

_start:
	mov ax, 1
	mov bx, 1
	mov dx, 0
	
fib_loop
	mov ax, bx	; ax = bx, ax = Fn-1
	add ax, dx	; ax += dx, Fn = Fn-1 + Fn-2
	mov dx, bx	; dx = bx, dx = Next Fn-2
	mov bx, ax	; bx = ax, bx = Current Fn value (The next loop makes it Fn-1)
	cmp ax, 34	; end program if ax = 34
	je end_if
	jmp fib_loop
	
end_if:
	mov rax, 60
	mov rdi, 0
	syscall

; Code-along macro exercise that multiplies all elements in array by 2

%macro mulBy2 2
	;mov	eax, dword[%1]
	mov	ecx, dword[%2]
	mov	esi, 0
	
%%loopArray:
	mov	eax, dword[%1 + esi * 4]
	mov	ebx, 2
	mul	ebx
	mov	dword[%1 + esi * 4], eax
	inc	esi
	loop	%%loopArray
	
%endmacro

section .data

	array	dd	98, 77, 51, 32, 103, 27
	length	dd	6

section .text
global _start

_start:
	
	mulBy2	array, length

last:
	mov 	rax, 60 
	mov 	rdi, 0		
	syscall







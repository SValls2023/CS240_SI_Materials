; Code-along exercise in which the total average of all elements of an array are calculated

; Argument 1: array
; Argument 2: length
; Argument 3: avg

%macro	arrayAvg	3
	mov ecx, dword[%2]
	mov esi, 0
%%avgLoop:
	add eax, dword[%1 + esi * 4]
	inc esi
	loop %%avgLoop
	
	mov edx, 0
	div dword[%2]
	mov dword[%3], eax
	
%endmacro

section .data

	array	dd	125, 975, 82, 308, 50
	length	dd	5

section .bss
	avg	resd	1


section .text

	global _start
	
_start:

	arrayAvg	array, length, avg
	
end:
	mov rax, 60
	mov rdi, 0
	syscall


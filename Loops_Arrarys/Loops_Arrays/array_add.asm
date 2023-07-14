; Program to help students get started on utilizing loops in assebmly
; as well as array traversal

; array_add.asm
; int list[6] = [8, 6, 4, 2, 1, 0]
; int sum = 0

section .data
        list	dd	8, 6, 4, 2, 1, 0	;num1 = 0004 93E0h
        sum	dd	0

section .text
        global _start

_start:
 	mov rsi, 0
 	mov rcx, 6
 	
	lp: 
	mov eax, dword [list+rsi*4]
	add dword[sum], eax
 	inc rsi
 	loop lp
 	
        mov     rax, 60			;terminate excuting process
        mov     rdi, 0				;exit status
        syscall				;calling system services                                              

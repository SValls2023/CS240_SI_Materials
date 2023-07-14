; Exercise/Demo of assembly language loops

; sum_loop.asm
; int lpcount = 15 (The number of times we plan to loop)
; int sum = 0 (Sum of loop: 15 + 14 + 13 + 12...)

section .data
        lpcount dq 15
        sum dq 0

section .text
        global _start

_start:
        mov rcx, qword[lpcount]
        
sum_loop:
	add qword [sum], rcx
	loop sum_loop

        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services

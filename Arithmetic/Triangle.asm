; Triangle Area = (base * height) / 2

section .data
        half 		dw 2
        base 		dw 13 
        height		dw 50
        area		dw 0                              

section .text
        global _start

_start:
	mov     ax, word[base]   				  ;ax = 13               
	mul     word[height]					  ;ax = ax * 50 = 650
	mov	dx, 0						  ;dx = 0 (Always place 0 in dx before dividing)
	div	word[half]					  ;ax = ax/2 = 325	dx = 0 (No remainder)
	
	mov word[area], ax                      		  ;area = ax = 325

        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services

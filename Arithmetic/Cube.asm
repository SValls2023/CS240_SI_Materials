; Cube Surface Area = 6(edge)^2

section .data
        six 	dw 6
        edge 	dw 10 
        area	dw 0                              

section .text
        global _start

_start:
	mov     ax, word[six]   				  ;ax = 6                
	mul     word[edge]					  ;ax = ax * 10 = 60
	mul 	ax  						  ;ax = ax * ax = 60 * 60 = 3600
	
	mov word[area], ax                      		  ;area = ax = 360

        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services

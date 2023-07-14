; Trapezoid Area = ((base + base2) / 2) * height

section .data
        base     dw      20                              
        base2    dw      30                                
        height   dw      10    
        divisor  dw	  2                                  

section .text
        global _start

_start:
	mov     ax, word[base]                   
	add	ax, word[base2]
	mov	dx, 0
	div	word[divisor]
	
	mul	word[height]                           

        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services

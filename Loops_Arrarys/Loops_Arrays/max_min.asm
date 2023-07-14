; Advanced program for students to combine concepts of loops
; as well as implementing comparisons (if/else statements) in assebmly

; max_min.asm
; int list[6] = [-1000, -500, -250, -750, -1500, -1250]
; int min = 0;
; int max = 0;
; int loopCount = 6 (Number of elements in list[])

section .data
        list		dw	-1000, -500, -250, -750, -1500, -1250	
        min		dw	0
        max		dw	0
        loopcount	dw	6

section .text
        global _start

_start:

	mov ax, word[list]
	mov word[max], ax
	mov esi, 0
	mov cx, word[loopcount]
	
	find_max:
		mov ax, word[list + esi]
		cmp ax, word[max]
		jg new_max
		dec cx
		cmp cx, 0
		je next
		add esi, 2
		jmp find_max
	
	new_max:
		mov word[max], ax
		dec cx
		cmp cx, 0
		je next
		add esi, 2
		jmp find_max
		
next:
	mov ax, word[list]
	mov word[min], ax
	mov esi, 0
	mov cx, word[loopcount]
	
	find_min:
		mov ax, word[list + esi]
		cmp ax, word[min]
		jl new_min
		dec cx
		cmp cx, 0
		je finish
		add esi, 2
		jmp find_min
	
	new_min:
		mov word[min], ax
		dec cx
		cmp cx, 0
		je finish
		add esi, 2
		jmp find_min
	
finish:
	mov     rax, 60			;terminate excuting process
	mov     rdi, 0				;exit status
	syscall				;calling system services      
	
	

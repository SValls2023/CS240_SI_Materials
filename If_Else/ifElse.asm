; Demo/Exercise meant showcasing comparisions or if/else statements in assembly language

; ifElse.asm
; int numTest = 0 (Set to zero, but can be number of your choice)
; int less = 0 (If numTest < 50, less increments by one)
; int greatest = 0 (If numTest > 60, greatest increments by one)
; int between = 0 (If numTest < 60 && numTest > 50, between increments by one)

section .data
	numTest dw 0
	less dw 0
	greatest dw 0
	between dw 0
	
section .text
	global _start

_start:
	mov ax, word[numTest]
	cmp ax, 50
	jle lower
	mov ax, word[numTest]
	cmp ax, 60
	jge higher
	inc word[between]
	jmp end_if
	
lower:
	inc word[less]
	jmp end_if
	
higher:
	inc word[greatest]
	jmp end_if
	
end_if:
	mov rax, 60
	mov rdi, 0
	syscall

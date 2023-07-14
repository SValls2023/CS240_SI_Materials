; Icebreaker program that teaches how to print strings in assembly
; using the writing syscall. The reading/scan syscall is also used here
; for taking in user input.

; Resources:
; Print: https://youtu.be/VQAKkuLL31g
; Scan/Read: https://youtu.be/VAy4FGHDx1I
; Syscall Library: https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md#x86_64-64_bit

; icebreaker.asm
; char greeting [] = "Hello, my name is Samuel Valls"
; char major [] = "I am a CS Major interested in game development"
; char hobby [] = "My hobbies are drawing and playing competitive Smash"

section .data
	greeting db "Hello, my name is Samuel Valls!", 10
	major db "I am a CS Major interested in game develoment.", 10
	hobby db "My hobbies are drawing and playing competitive Smash!", 10
	prompt db "What is my favorite color? "
	answer db "Right, my favorite color is "
	
section .bss
	color resb 12 
	
section .text
	global _start
	
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, greeting
	mov rdx, 32
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, major
	mov rdx, 47
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, hobby
	mov rdx, 54
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, prompt
	mov rdx, 27
	syscall
	
	mov rax, 0
	mov rdi, 0
	mov rsi, color
	mov rdx, 12
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, answer
	mov rdx, 28
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, color
	mov rdx, 12
	syscall
	
	mov rax, 60
	mov rdi, 0 
	syscall

; Challenge exercise for assembly language if-else statements

; fizzbuzz.asm
; int testnum = 0 (Set to zero, but can be number of your choice)
; int five = 5 (Checks if testnum is divisible by 5)
; int three = 3 (Checks if testnum is divisible by 3)
; string fizz = "Fizz" (If testnum is divisible by 3, print "Fizz")
; string buzz = "Buzz" (If testnum is divisible by 5, print "Buzz")

section .data
	testnum dw 0
	three db 3
	five db 5
	fizz db "Fizz", 10
	buzz db "Buzz", 10
	
section .text
	global _start

_start:
	mov ax, word[testnum]
	mov bl, byte[three]
	div bl
	cmp ah, 0
	je fizz_print
	
check_buzz:
	mov ax, word[testnum]
	mov bl, byte[five]
	div bl
	cmp ah, 0
	je buzz_print
	jmp end_if
	
fizz_print:
	mov rax, 1
	mov rdi, 1
	mov rsi, fizz
	mov rdx, 5
	syscall
	jmp check_buzz
	
buzz_print:
	mov rax, 1
	mov rdi, 1
	mov rsi, buzz
	mov rdx, 5
	syscall	
	
end_if:
	mov rax, 60
	mov rdi, 0
	syscall

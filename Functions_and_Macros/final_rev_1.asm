; Sort the element from least to greatest
; Add on a function to find minimum value, max value, and median
; If array is even, grab both median values 
; 	- [Ex: Length 6 -> med1 is array[4] and med2 is array[3]]

; Functions:
; - arraySort(arr&, len, small);
; - stats(arr&, len, min, med1, med2, max)

; Macro
; %arraySumAvg (arr, length, sum, avg)

%macro	arraySumAvg	4
	mov rcx, qword[%2]
	mov rsi, 0
%%avgLoop:
	add rax, qword[%1 + rsi * 8]
	inc rsi
	loop %%avgLoop
	
	mov qword[%3], rax
	mov rdx, 0
	div qword[%2]
	mov qword[%4], rax
	
%endmacro 

section .data
	array	dq	55, 95, 25, 75, 10
	length	dq	5

section .bss
	small	resq	1
	min	resq	1
	med1	resq	1
	med2	resq	1
	max	resq	1
	sum	resq	1
	avg	resq	1
	

section .text
global _start
_start:
	
	; Sort Array Function
	mov	rdi, array
	mov	rsi, qword[length]
	mov 	rdx, small
	call	arraySort
	
	; Stats Function
	mov 	r9, max 
	mov 	r8, med2 
	mov 	rcx, med1 
	mov 	rdx, min 
	mov 	rsi, qword[length] 
	mov 	rdi, array 
	call	stats
	add	rsp, 16
	
	; Array Sum/Average Macro
	arraySumAvg	array, length, sum, avg
	
end_prog:
	mov 	rax, 60
	mov 	rdi, 0
	syscall


;***********************************************************************

global arraySort
arraySort:
	push	rbp					; prologue
	mov	rbp, rsp
	mov	r10, 0					; "i"
	mov	r11, 0					; "j"
	push	r12					; "index"
	push	r13
	
; iLoop begin
iLoop:
	mov 	rdx, qword[rdi+r10*8]			; small = array[i]
	mov	r12, r10				; index = i
	mov	r11, r10				; j = i

; jloop begin
jLoop:
	cmp	qword[rdi+r11*8], rdx			; if array[j] < small 
	jl	sortSmall				; jump to sortSmall
afterSort:
	inc	r11					; j++
	cmp	r11, rsi				; loop if j != length
	jne	jLoop
; jloop end
	mov	r13, qword[rdi+r10*8]			; r13 = array[i]
	mov	qword[rdi+r12*8], r13			; array[index] = array[i]
	mov	qword[rdi+r10*8], rdx			; array[i] = small
	inc	r10					; i++
	cmp	r10, rsi				; loop if i != length
	jne	iLoop
; iLoop end
jmp funcEnd

sortSmall:
	mov 	rdx, qword[rdi+r11*8]			; small = array[j]
	mov 	r12, r11				; index that has smallest = j
	jmp	afterSort
	
funcEnd:
	pop 	r13					; epilogue
	pop 	r12
	mov 	rsp, rbp
	pop 	rbp
	ret

;***********************************************************************

global stats
stats:
	push 	rbp 				; prologue
	mov 	rbp, rsp
	push 	r12
	
	; -----
	; Get min and max.
	
	mov 	rax, qword[rdi] 		; get min
	mov 	qword[rdx], rax 		; return min
	mov 	r12, rsi 			; get len
	dec 	r12 				; set len-1
	mov 	rax, qword[rdi+r12*8] 		; get max
	mov 	qword[r9], rax 		; return max
	
	; -----
	; Get medians
	
	mov 	rax, rsi
	mov 	rdx, 0
	mov 	r12, 2
	div 	r12 				; rax = length/2
	cmp 	rdx, 0 			; check if length is even or odd
	je 	evenLength
	mov 	r12, qword[rdi+rax*8] 		; get arr[len/2]
	mov 	qword[rcx], r12 		; return med1
	mov 	qword[r8], r12 		; return med2
	jmp 	medDone
	
	evenLength:				; jump here is even
	mov 	r12, qword[rdi+rax*8] 		; get arr[len/2]
	mov 	qword[r8], r12			; return med2
	dec 	rax
	mov 	r12, qword [rdi+rax*8] 	; get arr[len/2-1]
	mov 	qword[rcx], r12 		; return med1
	
	medDone:
	; -----
	; End function
	
	mov 	r12, 0 ; counter/index
	mov 	rax, 0 ; running sum
	pop r12 				; epilogue
	mov rsp, rbp
	pop rbp
	ret


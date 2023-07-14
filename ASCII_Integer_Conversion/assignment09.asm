; assignment09.asm
; #begin define print(addr, n)
;	rax = 1;
;	rdi = 1;
;	rsi = addr of string;
;	rdx = n;
;	syscall;
; #end
; #begin define scan(addr, n)
;	rax = 0;
;	rdi = 0;
;	rsi = addr of buffer;
;	rdx = n;
;	syscall;
; #end
; void main() {
; 	char buffer[4];
; 	long num;
; 	short sumN;
; 	char msg1[26] = "Input a number (100~255): ";
; 	char msg2[16] = "1^2 + 2^2 + 3^2 +...+ n^2";
; 	char msg3[4] = " = ";
; 	char ascii[8] = "0000000\n";
;
; 	print(msg1, 26);
; 	scan(buffer, 4);
; 	call toNumber(num, buffer);
; 	call calculate(num, sumN);
; 	call toAscii(sumN, ascii);
; 	print(msg2, 26);
; 	print(buffer, 3);
; 	print(msg3, 3);
; 	print(ascii, 8);
; }
; void toNumber(n, buffer) {
;	n = atoi(buffer);
; }
; void calculate(N, sumN) {
;	for(rcx=0; rcx<=N; rcx++) {
;		sumN += rcx;
;	}
; }
; void toAscii(N, ascii) {
; 	ascii = itoa(sumN);
; }

%macro	print 	2
        mov     rax, 1					;SYS_write
        mov     rdi, 1					;standard output device
        mov     rsi, %1					;output string address
        mov     rdx, %2					;number of character
        syscall						;calling system services
%endmacro

%macro	scan 	2
        mov     rax, 0					;SYS_read
        mov     rdi, 0					;standard input device
        mov     rsi, %1					;input buffer address
        mov     rdx, %2					;number of character
        syscall						;calling system services
%endmacro

section .bss
buffer	resb	4
num	resd	1
sumN	resd    1

section .data
msg1	db	"Input a number (100~255): "
msg2	db      "1^2 + 2^2 + 3^2 +...+ "
msg3	db	" = "
ascii	db      "0000000", 10

section .text
        global _start
_start:
	print	msg1, 26				;cout << msg1
	scan	buffer, 4				;cin >> buffer

	; converts butter to num	
	mov	rbx, buffer				;rbx = address of buffer
	call	toNumber

	; calculates 1^2+2^2+3^2+...+N^2
	mov	rcx, 0					;rcx = 0
	mov	di, word[num]				;di = num
	call 	calculate				;call calculate

	; converts sumN into ascii
	mov	rcx, 6					;rcx = end of ASCII string
	mov	edi, dword[sumN]			;di = sumN
	call	toAscii

	print	msg2, 22				;cout << msg2
	print	buffer, 3				;cout << buffer
	print	msg3, 3				;cout << " = "
	print	ascii, 8				;cout << ascii

        mov     rax, 60				;terminate program
        mov     rdi, 0					;exit status
        syscall					;calling system services

; ascii to number function
toNumber:
	mov	rax, 0					;clear rax
	mov	rdi, 10				;rdi = 10
	mov	rsi, 0					;counter = rsi = 0
next0:
	mov	cl, byte[rbx+rsi]			;cl = [buffer+rsi]
	and	cl, 0fh				;convert ascii to number
	add	al, cl					;al = number
	adc	ah, 0					;ah = 0
	cmp	rsi, 2					;compare rsi with 2
	je	skip0					;if rsi=2 goto skip0
	mul	di					;dx:ax = ax * di
skip0:
	inc	rsi					;rcx++
	cmp	rsi, 3					;compare rcx with 3
	jl	next0					;if rcx<3 goto next0
	mov	word[num], ax				;num = ax
	ret

; calculation function
calculate:
next1:
	mov	edx, 0
	mov	eax, ecx
	mul	ecx
	add	dword[sumN], eax			;sumN += ecx^2
	inc	ecx					;ecx++
	cmp	ecx, edi					;compare ecx and edi=num
	jbe	next1					;if(ecx<=num) jump to next1
	ret

; number to ascii function
toAscii:
	mov	eax, edi
	mov	ebx, 10				;ebx = 10
next2:
	mov	edx, 0					;edx = 0
	div	ebx					;edx=(edx:eax)%10, eax=(edx:eax)/10
	add     byte[ascii+rcx], dl			;ascii+rcx = dl + 30h
	dec	rcx					;rcx--
	cmp	rcx, 0					;compare crx and 0
	jge	next2					;if (rcx>=0) jump to next2
	ret

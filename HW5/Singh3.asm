COMMENT @
Student: Harnoor Singh
Class : CSC3210
Assignment : 5 q3
Description : This program computes the sum of y = i + j 15 times for
all i ranging from 1 to 5 and j ranging from 1 to 3. The result is stored in a list y and
all indexes 1 to 15. 32 - bit registers are used in this program.
eax is i
ebx is j
y is a list
Expected Answer: y= 8, 7, 6, 7, 6, 5, 6, 5, 4, 5, 4, 3, 4, 3, 2
@

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	counter1 DWORD ?		; initializing outer counter with random number
	counter2 DWORD ?		; initializing inner counter with random number
	y DWORD 15 DUP(0)		; initializing a list named y to 0. it contains 15 elements that is the number of times the loop will run

.code
main PROC
	mov esi, 0
	mov ecx, 5; set outer loop count to 5
	L1:
		mov counter1, ecx		; outer loop will run 5 times
		mov ecx, 3				; inner loop count to 3 times
	L2:
		mov counter2, ecx		; save outer loop count
		mov eax, counter1		; moving first counter to eax and eax =i
		mov ebx, counter2		; moving second counter to ebx and ebx =j
		add eax, ebx			; eax = j + i
		mov y[esi], eax			; moving the results to y
		add esi, 4				; going to the next element
	loop L2						; repeat the inner loop
		mov ecx, counter1		; restore outer loop count
	loop L1						; repeat the outer loop
invoke ExitProcess, 0
main endp
end main

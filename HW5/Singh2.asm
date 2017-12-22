COMMENT @
Student: Harnoor Singh
Class : CSC3210
Assignment : 5 ques 2
Description : To reverse elements of character array and to make the method
configurable for any size and type using TYPE, LENGTHOF operators.
Expected Answer : 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'
@

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode : DWORD
.data
list BYTE 'B','A','D','C','F','E','H','G'; one character = 1byte but can work for any size
len = LENGTHOF list / 2					  ; storing the number of times the loop should work in len
.code
main PROC
	mov esi, OFFSET list						; Offseting on list at index 0
	mov ecx, len										; loop will run for len number of times
	L1 :
		mov al, [esi]									; storing the value of even index according to esi
		xchg al, [esi + TYPE list]		; exchanging the value of al register with the adjacent(next odd) element of the list
		xchg al,[esi]									; exchanging the value of esi with the al register
																	; now BA has changed to AB in the first time of loop and so on.
		add esi, TYPE list * 2				; offsetting esi to the the next element
	loop L1													; repeat the block of label l1 until ecx==0

invoke ExitProcess, 0
main endp
end main

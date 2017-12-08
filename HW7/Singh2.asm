COMMENT @
	 Student: Harnoor Singh
	 Class: CSC3210
	 Assignment:7
	 Description: The purpose of this program is to calculate factorial using recursion.The user will enter a number within range of unsigned
	 32 bits and get the result on screen.
	@
INCLUDE Irvine32.inc
.stack 4096
ExitProcess proto, dwExitCode : dword
.data
	print1 Byte "Enter the unsigned number: ", 0
	print2 Byte "The Factorial is: ", 0
.code
main PROC
	call Clrscr					; clear screen
	
	mov edx, OFFSET print1
	call WriteString			; printing "Enter the unsigned number: "
	call ReadDec				; input the unsigned number
	mov ebx, eax				; storing the input from eax in ebx
	
	push ebx
	call Factorial				; calling Factorial Procedures
	
	mov edx, OFFSET print2		; storing the offset of string print2 in edx
	call WriteString			;printing the "The Factorial is: "
	call WriteDec				;printing the result of from the procedure. prints the value in eax
	call Crlf					; printing a new line


main endp

Factorial PROC
	push ebp					; push base pointer
	mov ebp, esp				; move stack pointer to base pointer
	mov eax, [ebp + 8]			; move base pointer + 8 to eax
	cmp eax, 0					; compare eax to 0
	ja L1						; if above, then jump to Loop1 if (eax>0)
	mov eax, 1					; else eax = 1
	jmp L2						; then jump Loop2
	L1 : 
		dec eax					; decrement eax
		push eax				; push eax Factorial(n - 1)
		call Factorial			; call the procedure of factorial again
	ExecuteFactorial :
		mov ebx, [ebp + 8]		; move the value into ebx (get n)
		mul ebx					; multiply ebx to eax eax=eax*ebx
	L2 : 
		pop ebp					; return eax
		ret 4					; clear the stack (cleaning)
	Factorial ENDP				; end of the program
end main

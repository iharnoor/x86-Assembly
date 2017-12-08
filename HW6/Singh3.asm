COMMENT @
Student: Harnoor Singh
	Class : CSC3210
	Assignment : 5 q3
	Description : To test if MSB in al register is set or not. al=al*4 if MSB=0 otherwise al=al/8
	Expected Answer : 1Fh
	@
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data

.code
main PROC
		mov al, 88h   ; AL=88h
		test al, 10000000b    ; al&10000000b
		jz L0                 ; jump to L0 if Zero flag is 1
L1 :	sar al, 3             ; Arithmetic shift to right 3 times
		jmp Exit              ; jump to Exit
L0 :	sal al, 2             ; shift arithmetic left 2 times
		Exit :                ; label for exit

invoke ExitProcess, 0
main endp
end main
COMMENT @
Student: Harnoor Singh
	Class : CSC3210
	Assignment : 5 q2
	Description : Short Circuit evaluation to decrement x by 2 if X != 3 AND (X > A OR X < B) otherwise decrement by 1.
	@
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	X SWORD 11 ; X=11 initialized variables
	A SWORD 9  ; A=9
	B SWORD 8  ; B=8
.code
main PROC
L1:		cmp X, 0   ; X-0 without changing X
		jle Exit   ; jump to exit if X<=0
		cmp X,3    ; X-3
		je L3      ; jump to L3 if X==3
		mov bx,A   ; bx=A
		cmp X,bx   ; X-bx
		jg L2      ; if X>bx jump to L2
		mov ax,B   ; ax=B
		cmp X,ax   ; X-ax
		jge L3     ; jump if X>=ax
L2 :	sub X,2    ; X=X-2
		jmp L1     ; jump to L1
L3 		sub X,1    ; X=X-1
		jmp L1     ; jump to L1
Exit :
invoke ExitProcess, 0
main endp
end main
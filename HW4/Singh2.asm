COMMENT @
Student: Harnoor Singh
	Class : CSC3210
	Assignment : 3
	Description : This assembly program adds then number 10 to the EAX register, adds 8 to the EDX register,
	3 to AX register and 2 to AL register.
@

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
	add eax,10; adds then number 10 to the EAX register
	add edx,8 ; adds 8 to the EDX register
	add ax, 3 ; adds 3 to AX register
	add al, 2 ; adds 2 to AL register

invoke ExitProcess, 0
main endp
end main

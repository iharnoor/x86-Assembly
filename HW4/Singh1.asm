; Student: Harnoor Singh
; Class: CSC3210
; Assignment: 3
; Description : Calculating the result of the expression: AX = val2 + 9 + val3 - val1
; Store the result in AX register

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	val2 WORD 11  ; Initializing a variable name val2 as 11. Type WORD(2 Bytes)
	val3 WORD 16  ; Initializing a variable name val3 as 16. Type WORD(2 Bytes)
	val1 WORD 6   ; Initializing a variable name val1 as 6. Type WORD(2 Bytes)

.code
main proc
	mov	ax, val2  ; Move the value of val2 in the register AX
	add ax, 9     ; Add 9 to the AX register
	add ax, val3  ; Add the value of val3 to the AX register
	sub ax, val1  ; Subtract the value of val1 from AX register. Value stored
                ; in AX register

	invoke ExitProcess,0
main endp
end main

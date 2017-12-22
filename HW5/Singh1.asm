;	Student: Harnoor Singh
;	Class: CSC 3210
;	Due Date: 10/24/2017
;	Assignment: 5 Question1
;	Description: To calculate the sum of 64 bit memory values of 2 bytes each.
; 64 bit variable value = 0506030704080102h
; Operator used : PTR to read 2 bytes at a time
; The sum will be calculated in the direction from left to right.
;	Expected Answer : sum=D17h

ExitProcess proto

.data
x QWORD 0506030704080102h ; x=0506030704080102h. unitialized 8bytes memory.

.code
main proc
	mov ax, WORD PTR[x + 6] ; ax=0506 reading 2 bytes from index 6. byte by byte
	add ax, WORD PTR[x + 4]	; ax=0506+0307
	add ax, WORD PTR[x + 2] ; ax=0506+0307+0408
	add ax, WORD PTR[x + 0] ; ax=0506+0307+0408+0102
	mov bx, ax							; store result in bx register

	call  ExitProcess

main endp
end

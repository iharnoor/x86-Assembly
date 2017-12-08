COMMENT @
Student: Harnoor Singh
	Class : CSC3210
	Assignment : 7 q1
	Description : this program calculates val1 = (val2 - val3) * (val4 / val2) - (val3 * 3) by taking user input
	@
INCLUDE Irvine32.inc
.stack 4096
ExitProcess proto, dwExitCode : dword
.data
	p1 BYTE "Enter signed integer (val2): ", 0
	p2 BYTE "Enter signed integer (val3): ", 0
	p3 BYTE "Enter signed integer (val4): ", 0
	p4 BYTE "The Answer is (val2 - val3) * (val4 / val2) - (val3 * 3) = ", 0
	val1 SDWORD ?
	val2 SDWORD ?
	val3 SDWORD ?
	val4 SDWORD ?
.code
main PROC
	call Clrscr							; clear the screen
	mov dh,12                          ; row 12
	mov dl,40                      ; column 40
	call Gotoxy                     ; locate cursor

	mov edx, OFFSET p1					;offset to print string p1
	call WriteString					; print p1
	call ReadInt						; ReadInt stores the first input in eax
	mov val2, eax						; save eax in val2 so the next ReadInt will not overwrite it
	
    mov dh,13                          ; row 12
	mov dl,40                      ; column 40
	call Gotoxy 
    
	mov edx, OFFSET p2					;offset to print string p1
	call WriteString					; print p2
	call ReadInt						; ReadInt stores the second input in eax
	mov val3, eax						; save eax in val3

    mov dh,14                          ; row 12
	mov dl,40                      ; column 40
	call Gotoxy 

	mov edx, OFFSET p3					
	call WriteString					; print p3
	call ReadInt						; input 3rd int store in val4
	call Crlf
	mov val4, eax

	push val2							; pushing into the stack
	push val3
	push val4
	call IntegerArithmeticProc          ; call the IntegerArithmeticProc PROCEDURE
	mov val1, eax                       ; mov the result in val1

    mov dh,15                          ; row 12
	mov dl,40                      ; column 40
	call Gotoxy 

	mov edx, OFFSET p4                  
	call WriteString                    ; print str4 
	call WriteInt                       ; print the answer from eax
	exit

main endp

IntegerArithmeticProc PROC
	push ebp                              
	mov ebp, esp

	mov eax, [ebp + 16]                ; eax=val2
	sub eax, [ebp + 12]                ; eax= val2-val3 
	mov ebx, eax                       ; ebx=eax

	mov eax, [ebp+8]                   ; eax=val4
	cdq                                ; sign extension from dword to qword
	mov ecx, [ebp + 16]                ; ecx = val2
	idiv ecx	                  	   ; eax = val4 / val2
	mov ecx, eax		               ;ecx=eax (the result)
	
	mov eax, ebx		                ; move ebx (val2 - val3) to eax
	imul ecx                    ;  (val2 - val3) * (val4 / val2)
	mov ebx, eax				;  result to ebx

	mov eax, [ebp+12]           ;  mov val3 to eax
	imul eax, 3			        ; perform val3 * 3 and assign result to eax
	sub ebx, eax				; ebx=(val2 - val3) * (val4 / val2) - (val3 * 3)
	mov eax, ebx				; move the result to eax
	pop ebp                            ; pop ebp
	ret                                
IntegerArithmeticProc endp
	
end main

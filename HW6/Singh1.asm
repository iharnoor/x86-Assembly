COMMENT @
Student: Harnoor Singh
	Class : CSC3210
	Assignment : 5 q1
	Description : To find the minimum element by searching in an Array.
	Expected Answer : min=-4
	@
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
	ary SDWORD 11, 15, -3, -4, 0, 60,11,-1,18 ; initialized array
	arraySIZE=($-ary)						; size of array
	min SDWORD ary[0]          ; min is set to first element of the array
	arySIZE = arraySIZE/TYPE min ; arySIZE is the number of elements in it
	index DWORD 0
.code
main PROC
        mov ecx, ary[0]     ; initializing min
	    mov min, ecx		; here
L1 :
		cmp index, arySIZE                ; evaluating index-arySIZE without changing the value of index
		jge Exit                          ; if index>arySIZE break and exit
		mov ebx, index                    ; mov index to ebx
		mov eax, ary[ebx * TYPE ary]      ; mov element at index to eax
		cmp eax, min                      ; eax-min
		jl L2                             ; jump if eax<min
		inc index                         ; index++
		jmp L1                            ; jump to label L1
L2 :	mov ebx, index                    ; ebx=index
		mov eax, ary[ebx * TYPE ary]      ; eax=ary[index]
		mov min, eax                      ; min=eax
		jmp L1                            ; jump to L1
Exit :                                    ; Label for Exit

invoke ExitProcess, 0
main endp
end main

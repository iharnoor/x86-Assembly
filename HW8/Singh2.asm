COMMENT @
Student: Harnoor Singh
Class : CSC3210
Assignment : 8 q2
Description : This program computes the result of equality of two floating point numbers and prints accordingly. Two floating point
numbers are inputted from the user
Expected Answer: for comparison for 7.8 with 7.77 is that X is greater
@
INCLUDE Irvine32.inc
INCLUDE macros.inc
.data
    X REAL4 ?               ; initializing X
    Y REAL4 ?               ; initializing Y
.code
    main proc
        finit               ; initialize FPU
        mWrite "Enter X: "  ; printf("Enter X: ");
        call ReadFloat      ; scanf("%f ", &X);
        mWrite "Enter Y: "  ; printf("Enter Y: ");
        call ReadFloat      ; scanf("%f ", &Y);
        FCOMI ST(0), ST(1)  ; comparing ST(0) and ST(1)
        jz Equal            ; jump to Equal label if equal to each other
        jae Lower           ; jump to Lower label if X is less than Y that is St(0) is greater
        mWrite "X is greater than Y" ; printing the string
        call crlf           ; print new line
        jmp Exit1	        ; jump to label Exit1
    Equal:                  
        mWrite "X and Y are equal" ; printing the string
        call crlf                  ; print new line
        jmp Exit1                   ; jump to Exit1 label
    Lower:
        mWrite "X is lower than Y"  ; printing the string
        call crlf                   ; new line	                  
    Exit1:
        exit
    main endp
end main


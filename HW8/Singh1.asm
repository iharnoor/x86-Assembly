COMMENT @
Student: Harnoor Singh
Class : CSC3210
Assignment : 8 q1
Description : This program computes the result of expression F = ( (A + B) / C1) * ( (D + A) - E)
stores the result in F variable
Post Fix : A B + C / D A + E - *
Expected Answer: F=+5.5000000000000000e+0001 or F=55  or F =5.5 x 10^1
@
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
.data
A REAL8 5.9         ; initializing variables A,B,C1,D,E
B REAL8 4.1
C1 REAL8 2.0
D REAL8 10.1
E REAL8 5.0
F REAL8 ?
.code
    main proc
        fld A       ; push A
        fld B       ; push B ST(0)=B
        fadd        ; add ST(0)= A+B

        fdiv C1     ; ST(0)= A+B/C1
        fld D       ; push D
        fld A       ; push A

        fadd        ; ST(0)= A+D

        fsub E      ; ST(0)-=E
        fmul        ; ST(0)*= ST(1) and pop
        fstp F      ; storing the result in F
    invoke ExitProcess, 0
main endp
end main

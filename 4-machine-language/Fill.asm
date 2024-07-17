// START: 16,384
// END: 24,576 (RAM[24,576] is used for KBD)
// TOTAL_REGISTERS: 8,192 

    @SCREEN
    D=A
    @addr
    M=D // addr = 16,384

    // The iteration will stop before touching the keyboard register.
    @24576
    D=A
    @limit
    M=D // limit = 24,576


(LOOP)
    @limit
    D=M
    @addr
    D=D-M // D = limit - addr
    @END
    D;JEQ // End if we are at the limit 

    @addr
    A=M
    M=-1
    D=A+1
    @addr
    M=D
    @LOOP
    0;JMP

(END)
    @END
    0;JMP



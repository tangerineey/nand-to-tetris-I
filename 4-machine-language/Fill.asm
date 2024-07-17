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

(CHECKKBD)
    @SCREEN
    D=A
    @addr
    M=D // reset addr to 16,384
    @KBD
    D=M
    @BLACK
    D;JGT // Color the screen if a key is pressed.

(WHITE)
    @limit
    D=M
    @addr
    D=D-M // D = limit - addr
    @CHECKKBD
    D;JEQ // End if we are at the limit 

    @addr
    A=M
    M=0
    D=A+1
    @addr
    M=D
    @WHITE
    0;JMP

(BLACK)
    @limit
    D=M
    @addr
    D=D-M // D = limit - addr
    @CHECKKBD
    D;JEQ // End if we are at the limit 

    @addr
    A=M
    M=-1
    D=A+1
    @addr
    M=D
    @BLACK
    0;JMP



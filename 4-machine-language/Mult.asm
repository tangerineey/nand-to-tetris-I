// Computes the multiplication of two numbers.
// R2 = R0 * R1
// x = R0
// y = R1
// product = 0
//
// for (let i = 0, i < y, i++) {
//    product = product + x 
// }
//
// R2 = product

    @2
    M=0

    @R0
    D=M
    @x
    M=D // x = R0

    @R1
    D=M
    @y
    M=D // y = R1

    @product
    M=0 // product = 0

    @index
    M=0 // index = 0

(LOOP)
    @index
    D=M // Get the current iteration
    @y
    D=D-M // Find how many iterations behind we are
    @STOP
    D;JEQ // Since index++ we need to check if finished

    // If we got here, just increment index and do calculation
    @product
    D=M
    @x
    D=D+M 
    @product
    M=D // product = product + x

    @index
    M=M+1 // index = index + 1
    @LOOP
    0;JMP // Start iteration again

(STOP)
    @product
    D=M
    @R2
    M=D // RAM[2] = product
    
(END)
    @END
    0;JMP // Terminate program



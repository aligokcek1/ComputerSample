# Basic Computer
This is a 12-bit instruction, 8-byte memory computer sample to understand the basic working principle of computers. <br />
The 12-bit instruction format is the following: [operation code][r1][r2][r3] = [11:9][8:6][5:3][2:0] <br />
Operation code (opcode) indicates an operation in the operation table. <br />
r1, r2, r3 registers indicate a cell in the memory. <br />
Memory is an array containing 8-bit 8 cells. <br />
opcode, r1, r2, r3 are 3-bit variables. So, the system can have 8 different operations and use 8 different locations in the memory. The memory size matches the register values. The registers can indicate entire memory. <br />
# Operation table:
0:  memory[r1] = opcode[5:0] <br />
1: memory[r3] = memory[r1] (bitwise xor) memory[r2] <br />
2: memory[r3] = memory[r1] (bitwise or) memory[r2] <br />
3: memory[r3] = memory[r1] (bitwise and) memory[r2] <br />
4: memory[r3] = (bitwise not) memory[r1] <br />
5: memory[r3] = memory[r1] (left shift) memory[r2] <br />
6: memory[r3] = memory[r1] (left shift) instruction[5:3] <br />
7: memory[r3] = memory[r1] (addition) memory[r2] <br />
<br />
You can use the testbench i provided




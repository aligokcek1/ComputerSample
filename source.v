`timescale 1ns / 1ns

module source(copy_memory, instruction, r1, r2, r3, clk);

input wire [11:0] instruction;
input wire clk;
parameter 	S0 = 3'b000,
			S1 = 3'b001,
			S2 = 3'b010,
			S3 = 3'b011,
			S4 = 3'b100,
			S5 = 3'b101,
			S6 = 3'b110,
			S7 = 3'b111;
integer i;
integer c;
		
reg [7:0] memory [7:0];
output reg [7:0] r1;
output reg [7:0] r2;
output reg [7:0] r3;
output reg [63:0] copy_memory;

initial begin
	for (i = 0; i < 8; i ++) begin
		memory[i] = 0;
	end
end

always@(posedge clk) begin
	// Read the operands from the memory
	if (instruction[11:9] > 0) begin
		r1 = memory[instruction[8:6]];
		r2 = memory[instruction[5:3]];
	end

	case(instruction[11:9])
		S0: begin
			memory[instruction[8:6]] = 0;
			memory[instruction[8:6]] = instruction[5:0];
		end
		S1: begin
			r3 = r1 ^ r2;
		end
		S2: begin
			r3 = r1 | r2;
		end 	
		S3: begin
			r3 = r1 & r2;
		end
		S4: begin
			r3 = ~r1;
		end
		S5: begin
			r3 = r1 << r2;
		end
		S6: begin
			r3 = r1 << instruction[5:3];
		end
		S7: begin
			r3 = r1 + r2;
		end
	endcase
	
	// Copy the value of the r3 register into the memory
	if (instruction[11:9] > 0) begin
		memory[instruction[2:0]] = r3;
	end
	
	// Copy memory to see in the testbench
	for (c = 0; c < 8; c ++) begin
		copy_memory[c * 8 +:8] = memory[c];
	end
	
end

endmodule














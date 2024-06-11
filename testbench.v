`timescale 1ns/1ns
module testbench();
wire [63:0] memory;
wire [7:0] r1;
wire [7:0] r2;
wire [7:0] r3;
reg [11:0] instruction;
reg clk;
integer k;

reg [11:0] values [2:0];

source s(memory, instruction, r1, r2, r3, clk);

initial begin

	values[0] = 12'b000000111100;
	values[1] = 12'b000001001111;
	values[2] = 12'b001000001010;

    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, memory, instruction, r1, r2, r3, clk);

	for (k = 0; k < 3; k ++) begin
		instruction = values[k];
		#20;
	end
    
    $finish;
end

always begin	
	clk = 1;
	#10;
	clk = 0;
	#10;
end

endmodule

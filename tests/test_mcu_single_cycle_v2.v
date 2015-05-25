`timescale 1ns / 1ps

module test_mcu_single_cycle_v2;

	// Inputs
	reg clk;
	reg nClear;

	// Outputs
	wire [15:0] PC_next;
	wire [15:0] INSTR;
	wire [15:0] branch_addr;
	wire [15:0] data1, data2;
	wire  [2:0] ALUop;
	wire Jump,Branch,MemRead,MemToReg,MemWrite,ALUsrc;

	// Instantiate the Unit Under Test (UUT)
	mcu_single_cycle uut (
		.clk(clk), 
		.nClear(nClear), 
		.PC_next(PC_next),
		.INSTR(INSTR),
		.branch_addr(branch_addr),
		.ALUop(ALUop),
		.Jump(Jump),
		.Branch(Branch),
		.MemRead(MemRead),
		.MemToReg(MemToReg),
		.MemWrite(MemWrite),
		.ALUsrc(ALUsrc),
		.data1(data1),
		.data2(data2)
	);
	
	always
		#1 clk=~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		nClear = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		nClear = 1;
	end
      
endmodule


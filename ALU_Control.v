module ALU_Control(funct_i, ALUOp_i, ALUCtrl_o);
input [9:0] funct_i;
input [1:0] ALUOp_i;
output [2:0] ALUCtrl_o;
reg ALUCtrl_o;

`define AND 3'b000
`define OR 3'b001
`define ADD 3'b010
`define SUB 3'b110
`define MUL 3'b011





always@ (funct_i or ALUOp_i) begin
	//$display("%b", funct_i);
	//$display("%b", ALUOp_i);

	if(ALUOp_i == 2'b00)
		ALUCtrl_o = `ADD;
	else if(funct_i == 10'b0000000110)
		ALUCtrl_o = `OR;
	else if(funct_i == 10'b0000000111)
		ALUCtrl_o = `AND;
	else if(funct_i == 10'b0000000000)
		ALUCtrl_o = `ADD;
	else if(funct_i == 10'b0100000000)
		ALUCtrl_o = `SUB;
	else if(funct_i == 10'b0000001000)
		ALUCtrl_o = `MUL;
	//$display("%b", ALUCtrl_o);
end


endmodule
	
	






module Control(Op_i, ALUOp_o, ALUSrc_o, RegWrite_o);
input [6:0] Op_i;
output [1:0] ALUOp_o;
output ALUSrc_o;
output RegWrite_o;
wire [6:0] Op_i;
wire [1:0] ALUOp_o;
reg ALUSrc_o;
wire RegWrite_o;
always@ (Op_i) begin

if (Op_i == 7'b0010011)
	ALUSrc_o = 1;	
else
	ALUSrc_o = 0;
end

assign RegWrite_o = 1;
assign ALUOp_o[1:0] = Op_i[6:5];

endmodule

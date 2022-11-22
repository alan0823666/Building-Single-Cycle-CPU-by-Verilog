module ALU(data1_i, data2_i, ALUCtrl_i, data_o, Zero_o);

input [31:0] data1_i;
input [31:0] data2_i;
input  [2:0] ALUCtrl_i;

output [31:0]  data_o;
output [31:0]  Zero_o;


reg [31:0] data_o;
wire Zero_o;

assign Zero_o = 0;

`define AND 3'b000
`define OR 3'b001
`define ADD 3'b010
`define SUB 3'b110
`define MUL 3'b011

always@(data1_i or data2_i or ALUCtrl_i) begin 
	case(ALUCtrl_i)
		`AND: data_o = data1_i & data2_i;
		`OR: data_o = data1_i | data2_i;
		`ADD: data_o = data1_i + data2_i;
		`SUB: data_o = data1_i - data2_i;	
		`MUL: data_o = data1_i * data2_i;
	endcase
end

endmodule
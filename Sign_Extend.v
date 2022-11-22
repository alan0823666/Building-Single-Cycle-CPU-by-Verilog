module Sign_Extend(data_i, data_o);
	input[11:0] data_i;
	output[31:0] data_o;
	
	reg[31:0] data_o;
	wire[11:0] data_i;

always@ (data_i) begin 
    data_o[11:0] = data_i[11:0];
	data_o[31:12] = {20{data_i[11]}};
end
endmodule
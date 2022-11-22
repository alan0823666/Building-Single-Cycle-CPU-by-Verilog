module CPU
(
    clk_i, 
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;
wire [31:0] pc_to_im;
wire [31:0] instuction;
wire [1:0] ALU_Op;
wire ALU_Src;
wire [31:0] Add_to_PC;
wire RegWrite;
wire [31:0] register_1;
wire [31:0] register_2;
wire [31:0] extend_out;
wire [31:0] MUX_out;
wire [2:0] ALUCtrl_out;
wire [31:0] ALU_result;
wire Zero;
Control Control(
    .Op_i       (instuction[6:0]),
    .ALUOp_o    (ALU_Op),
    .ALUSrc_o   (ALU_Src),
    .RegWrite_o (RegWrite)
);



Adder Add_PC(
    .data1_in   (pc_to_im),
    .data2_in   (4),
    .data_o     (Add_to_PC)
);


PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (Add_to_PC),
    .pc_o       (pc_to_im)
);
Instruction_Memory Instruction_Memory(
    .addr_i     (pc_to_im), 
    .instr_o    (instuction)
);

Registers Registers(
    .clk_i      (clk_i),
    .RS1addr_i   (instuction[19:15]),
    .RS2addr_i   (instuction[24:20]),
    .RDaddr_i   (instuction[11:7]), 
    .RDdata_i   (ALU_result),
    .RegWrite_i (RegWrite), 
    .RS1data_o   (register_1), 
    .RS2data_o   (register_2) 
);


MUX32 MUX_ALUSrc(
    .data1_i    (register_2),
    .data2_i    (extend_out),
    .select_i   (ALU_Src),
    .data_o     (MUX_out)
);



Sign_Extend Sign_Extend(
    .data_i     (instuction[31:20]),
    .data_o     (extend_out)
);

  

ALU ALU(
    .data1_i    (register_1),
    .data2_i    (MUX_out),
    .ALUCtrl_i  (ALUCtrl_out),
    .data_o     (ALU_result),
    .Zero_o     (Zero)
);



ALU_Control ALU_Control(
    .funct_i    ({instuction[31:25], instuction[14:12]}),
    .ALUOp_i    (ALU_Op),
    .ALUCtrl_o  (ALUCtrl_out)
);

	
endmodule


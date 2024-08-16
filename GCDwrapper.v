module GCDwrapper #( parameter w=8 )
( input dut_clk, 
output [w-1:0] dut_result );
reg [w*2+2 : 0] rom [0:31];
reg [w*2+2 : 0] romout;
reg [4:0] romaddr=0;
wire result_rdy, clk, reset, start, A_en, B_en, B_sel, B_zero, A_lt_B;
wire [7:0] inA, inB;
wire [1:0] A_sel;
always @ (*) begin
romout = rom[romaddr];
end
always @ (posedge dut_clk) begin
if (!result_rdy) romaddr <= romaddr+1;
end

assign clk = romout[0];
assign reset = romout[1];
assign start = romout[2];
assign inA = romout[10:3];
assign inB = romout[18:11];

GCDdatapath gcd_dp_unit ( clk, inA, inB, dut_result, A_en, B_en, A_sel, B_sel, B_zero, A_lt_B );
GCDcontroller gcd_fsm_unit ( clk, reset, start ,A_en, B_en, A_sel, B_sel,B_zero, A_lt_B, result_rdy );
initial begin
rom[0] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[1] = { 8'b00011110, 8'b00010100,1'b0,1'b1, 1'b1 };
rom[2] = { 8'b00011110, 8'b00010100,1'b0,1'b1, 1'b0 };
rom[3] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[4] = { 8'b00011110, 8'b00010100,1'b1,1'b0, 1'b0 };
rom[5] = { 8'b00011110, 8'b00010100,1'b1,1'b0, 1'b1 };
rom[6] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[7] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[8] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[9] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[10] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[11] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[12] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[13] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[14] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[15] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[16] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[17] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[18] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[19] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[20] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[21] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[22] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[23] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[24] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[25] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[26] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[27] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[28] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[29] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
rom[30] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b0 };
rom[31] = { 8'b00011110, 8'b00010100,1'b0,1'b0, 1'b1 };
end
endmodule

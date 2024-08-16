// Code your design here
module GCDdatapath#( parameter W = 8 )
( input clk, input [W-1:0] operand_A, input [W-1:0] operand_B,
  output [W-1:0] result_data,
  input A_en, input B_en, input [1:0] A_sel, input B_sel,
  output B_zero, output A_lt_B
); 
  reg [W-1:0] A; reg [W-1:0] B; wire [W-1:0] sub_out; wire [W-1:0] A_out;
  assign A_out = (A_sel==2'd0) ? operand_A : ( (A_sel==2'd1) ? B : sub_out ) ;
  always @( posedge clk ) begin if ( A_en ) A <= A_out ; end
  wire [W-1:0] B_out;
  assign B_out = (B_sel==0) ? operand_B : A ;
  always @( posedge clk ) begin if ( B_en ) B <= B_out ; end
  assign B_zero = (B==0); assign A_lt_B = (A < B);
  assign sub_out = A - B; assign result_data = A; 
endmodule

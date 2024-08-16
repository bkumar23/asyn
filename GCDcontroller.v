module GCDcontroller//#( parameter W = 8 )
( input clk, input reset, input start ,
  output reg A_en, output reg B_en, output reg [1:0] A_sel, output reg B_sel,
  input B_zero, input A_lt_B, output reg result_rdy 
); 
  localparam WAIT = 2'd0; localparam CALC = 2'd1; localparam DONE = 2'd2;
  reg [1:0] state_next; reg [1:0] state=WAIT;
  always @( posedge clk ) begin if ( reset ) state <= WAIT ; else state <= state_next ; end
  always @(*) begin
    A_sel = 0 ; A_en = 1'b0; B_sel = 0; B_en = 1'b0; result_rdy = 1'b0;
    case ( state )
      WAIT: begin A_sel = 0; B_sel = 0;  
          if ( start ) begin A_en = 1'b1 ; B_en = 1'b1 ; end end
      CALC: if ( A_lt_B ) begin A_sel = 1; A_en = 1'b1; B_sel = 1; B_en = 1'b1; end
            else if ( !B_zero ) begin A_sel = 2; A_en = 1'b1; end
      DONE: result_rdy = 1'b1; 
    endcase
  end
  always @(*) begin state_next = state;
    case ( state ) WAIT : if ( start ) state_next = CALC;
      CALC : if ( B_zero ) state_next = DONE; DONE : if ( reset ) state_next = WAIT;
    endcase
  end
endmodule

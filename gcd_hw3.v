module gcd_hw3 (
input wire CLOCK_50,
//input wire KEY,
output wire [7:0] LEDR );

wire dut_clk;
wire [7:0] dut_result;

GCDwrapper i0 (dut_clk, dut_result);

assign LEDR[7:1] = dut_result[6:0];
assign LEDR[0] = dut_clk;

localparam log2_slowdown_factor = 2;

reg [log2_slowdown_factor - 1 :0] counter = 0;
assign dut_clk = counter[log2_slowdown_factor - 1];

always @ ( posedge CLOCK_50 ) begin
counter <= counter + 1;
end

endmodule

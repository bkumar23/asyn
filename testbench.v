module testbench;
reg CLOCK_50;
wire [7:0] LEDR;
gcd_hw3 test ( CLOCK_50, LEDR );

initial begin
CLOCK_50 = 1'b0;
#12000 $finish;
end

always #10 CLOCK_50 = ~CLOCK_50;

endmodule
`timescale 1ns/1ns

module DDS(input clk, rst, input [7:0] phase_cntrl, output reg[7:0] address);

  always @(posedge clk)
  begin
    if (rst)
      address = 8'd0;
    else
      address = address + (phase_cntrl) + 8'd1;
  end

endmodule

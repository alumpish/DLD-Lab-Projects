`timescale 1ns/1ns

module DAC(input clk, rst, input [7:0] wave, output reg pulse);

  reg[7:0] count = 8'd0;

  always @(posedge clk)
  begin
    if (rst)
      count = 8'd0;
    else
      count = count +  8'd1;
  end

  always @(count)
  begin
    pulse = (count < wave) ? 1'b1 : 1'b0;
  end

endmodule

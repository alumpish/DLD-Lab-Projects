`timescale 1ns/1ns

module sqaure_wave(input clk, rst, output reg [7:0] square);

  reg [7:0] count = 8'd0;

  always @(posedge clk)
  begin
    if (rst)
      count = 8'd0;
    else
      count = count + 1;

    if (count < 128)
      square = 8'd0;
    else
      square = 8'd255;
  end

endmodule

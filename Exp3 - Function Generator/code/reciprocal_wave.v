`timescale 1ns/1ns

module reciprocal_wave(input clk, rst, output reg [7:0] out);

  reg [7:0] count = 8'd0;

  always @(posedge clk)
  begin
    if (rst)
    begin
      out <= 8'b0;
      count <= 1'b0;
    end
    else
    begin
      count <= count + 1'b1;
      if (count >= 8'd252)
        out = 8'd4;
      else
        out = 8'd255 / (8'd63 - (count >> 2));
    end
  end
endmodule

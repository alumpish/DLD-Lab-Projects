`timescale 1ns/1ns

module sine_wave(input clk, rst, output reg [7:0] sin);

  reg signed [15:0] sin_t = 16'd0, cos_t = 16'd30000;
  reg signed [15:0] sin_r, cos_r;

  always @(posedge clk)
  begin
    if (rst)
    begin
      sin_t = 16'd0;
      cos_t = 16'd30000;
    end
    else
    begin
      sin_r = sin_t + (cos_t >>> 6);
      cos_r = cos_t - (sin_r >>> 6);
      sin_t = sin_r;
      cos_t = cos_r;
    end
  end

  assign sin = sin_r[15:8] + 8'd127;

endmodule


`timescale 1ns/1ns

module wave_generator(input clk, rst, output[7:0] reciprocal, square, triangle, sine, half_wave, full_wave);

  reciprocal_wave rw1(clk, rst, reciprocal);
  sqaure_wave sqaure_w1(clk, rst, square);
  triangle_wave tw1(clk, rst, triangle);
  sine_wave sine_w1(clk, rst, sine);
  half_wave hw1(sine, half_wave);
  full_wave fw1(sine, full_wave);

endmodule

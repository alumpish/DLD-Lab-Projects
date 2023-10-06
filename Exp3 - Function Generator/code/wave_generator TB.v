`timescale 1ns/1ns

module wave_gemerator_TB();

  reg clk = 1'b0, rst = 1'b0;

  wire[7:0] reciprocal, square, triangle, sine, half_wave, full_wave;

  wave_generator wg1(clk, rst, reciprocal, square, triangle, sine, half_wave, full_wave);

  initial
  begin
    repeat(1024)
      #10 clk = ~clk;
  end

  initial
  begin
    #5 rst = 1'b1;
    #20 rst = 1'b0;
  end

endmodule

`timescale 1ns/1ns

module DAC_TB();

  reg clk = 1'b0, rst = 1'b0;
  wire[7:0] sin;
  wire sin_pulse;

  sine_wave sw1(clk, rst, sin);
  DAC dac1(clk, rst, sin, sin_pulse);

  initial
  begin
    repeat(1024)
      #5 clk = ~clk;
  end

  initial
  begin
    #5 rst = 1'b1;
    #20 rst = 1'b0;
  end

endmodule

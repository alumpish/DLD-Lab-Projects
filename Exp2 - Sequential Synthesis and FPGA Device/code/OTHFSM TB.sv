`timescale 1ns/1ns

module OTHFSM_TB();

  reg SerIn, Clk_EN = 1, clk = 0, rst = 0;
  wire Co, inc_cnt, rst_cnt, SerOut, SerOutValid;
  wire [3:0] Count_out;

  Counter c1 (Clk_EN, clk, inc_cnt, rst_cnt, Co, Count_out);
  Detector d1(Clk_EN, SerIn, clk, rst, Co, SerOut, SerOutValid, inc_cnt, rst_cnt);

  initial
  begin
    repeat(60)
      #10 clk = ~clk;
  end

  initial
  begin
    #5 SerIn = 0;
    #40 SerIn = 1;
    #20 SerIn = 0;
    #20 SerIn = 1;
    #60 SerIn = 0;
    #20 SerIn = 1;
    #100 SerIn = 0;
    #100 SerIn = 1;
    #20 SerIn = 0;
    #20 SerIn = 1;
    #60 SerIn = 0;
  end

endmodule

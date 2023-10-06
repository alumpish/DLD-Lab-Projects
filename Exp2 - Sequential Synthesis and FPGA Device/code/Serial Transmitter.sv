`timescale 1ns/1ns

module Serial_Transmitter(input SerIn, ClkPB, clk, rst,
                            output SerOut, SerOutValid, output[6:0] seven_segments);

  wire Co, inc_cnt, rst_cnt, Clk_EN;
  wire [3:0] Count_out;

  Counter c1 (Clk_EN, clk, inc_cnt, rst_cnt, Co, Count_out);
  Detector d1(Clk_EN, SerIn, clk, rst, Co, SerOut, SerOutValid, inc_cnt, rst_cnt);
  One_Pulser op1(~ClkPB, clk, Clk_EN);
  SSD ssd1(Count_out, seven_segments);
endmodule

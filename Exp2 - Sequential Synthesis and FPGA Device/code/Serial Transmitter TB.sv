`timescale 1ns/1ns

module Serial_Transmitter_TB();

  reg SerIn, ClkPB = 1, clk = 0, rst = 0;
  wire Co, inc_cnt, rst_cnt, SerOut, SerOutValid, Clk_EN;
  wire [3:0] Count_out;
  wire [6:0] seven_segments;

  Counter c1 (Clk_EN, clk, inc_cnt, rst_cnt, Co, Count_out);
  Detector d1(Clk_EN, SerIn, clk, rst, Co, SerOut, SerOutValid, inc_cnt, rst_cnt);
  One_Pulser op1(ClkPB, clk, Clk_EN);
  SSD ssd1(Count_out, seven_segments);


  initial
  begin
    repeat(150)
      #10 clk = ~clk;
  end

  initial
  begin
    repeat(25)
    begin
      #20 ClkPB = 1;
      #40 ClkPB = 0;
    end
  end

  initial
  begin
    SerIn = 0;
    #90 SerIn = 1;
    #60 SerIn = 0;
    #60 SerIn = 1;
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

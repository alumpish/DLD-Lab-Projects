`timescale 1ns/1ns

module OP_TB();

  reg ClkPB, clk = 0;
  wire Clk_EN;

  One_Pulser op1(ClkPB, clk, Clk_EN);

  initial
  begin
    repeat(50) #20 clk = ~clk;
  end

  initial
  begin
    ClkPB = 1'b1;
    #70 ClkPB = 1'b0;

    #80 ClkPB = 1'b1;
    #50 ClkPB = 1'b0;
    #35 ClkPB = 1'b1;
    #80 ClkPB = 1'b0;
  end

endmodule

`timescale 1ns/1ns

module freq_detector_TB();

  reg RO_Clock = 1'b0;
  reg rst = 1'b0;
  reg [2:0] SW = 3'b000;
  wire Clk_to_WG;

  frequence_detector fd1(RO_Clock, rst, SW, Clk_to_WG);

  initial
  begin
    repeat(100)
      #20 RO_Clock = ~RO_Clock;
  end

  initial
  begin
    #10 rst = 1'b1;
    #20 rst = 1'b0;
  end

endmodule
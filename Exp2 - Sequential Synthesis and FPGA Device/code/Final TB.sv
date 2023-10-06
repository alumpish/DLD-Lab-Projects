`timescale 1ns/1ns

module Final_TB();

  reg SerIn, ClkPB = 1, clk = 0, rst = 0;
  wire SerOut, SerOutValid;
  wire [6:0] seven_segments;

  Serial_Transmitter ST(SerIn, ClkPB, clk, rst, SerOut, SerOutValid, seven_segments);


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

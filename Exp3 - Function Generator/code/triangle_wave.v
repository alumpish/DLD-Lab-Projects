`timescale 1ns/1ns

module triangle_wave(input clk, rst, output reg [7:0] triangle);

  reg [7:0] count = 8'd0;

  always @(posedge clk)
  begin
    if (rst)
    begin
      triangle <= 8'b0;
      count <= 1'b0;
    end
    else
    begin
      count <= count + 1'b1;
      if (count < 8'd127)
        triangle <= triangle + 2'd2;
      else if(count == 8'd 127)
        triangle <= triangle + 2'd1;
      else if(count == 8'd255)
        triangle <= triangle - 2'd1;
      else
        triangle <= triangle - 2'd2;
    end
  end

endmodule

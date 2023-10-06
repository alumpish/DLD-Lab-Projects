`timescale 1ns/1ns

module Counter (
    input Clk_EN, clk, inc_cnt, rst_cnt,
    output Co,
    output reg [3:0] Count_out
  );

  always @(posedge clk)
  begin
    if (Clk_EN)
      if(rst_cnt)
        Count_out = 4'd0;
      else if (inc_cnt)
        Count_out = Count_out + 1;
  end

  assign Co = (Count_out == 4'd9) ? 1'b1 : 1'b0;
endmodule

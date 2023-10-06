`timescale 1ns/1ns

module Detector (
    input Clk_EN, SerIn, clk, rst, Co,
    output reg SerOut, SerOutValid, inc_cnt, rst_cnt
  );

  parameter [2:0] A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4;
  reg [2:0] ps, ns;
  assign SerOut = SerIn;

  always @(ps, SerIn, Co)
  begin
    ns = A;
    rst_cnt = 0;
    inc_cnt = 0;
    SerOutValid = 0;

    case (ps)
      A :
      begin
        ns = SerIn ? B : A;
        rst_cnt = 1;
      end

      B :
        ns = SerIn ? B : C;

      C:
        ns = SerIn ? D : A;

      D:
        ns = SerIn ? E : C;

      E:
      begin
        ns = Co ? A : E;
        SerOutValid = 1;
        inc_cnt = 1;
      end

      default:
        ns = A;
    endcase
  end

  always @(posedge clk)
  begin
    if (rst)
      ps <= A;
    else if (Clk_EN)
      ps <= ns;
  end
endmodule

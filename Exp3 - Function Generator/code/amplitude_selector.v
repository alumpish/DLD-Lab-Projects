`timescale 1ns/1ns

module amplitud_Selector(input [1:0] select, input [7:0] in, output [7:0] out);
  assign out = in >> select;
endmodule


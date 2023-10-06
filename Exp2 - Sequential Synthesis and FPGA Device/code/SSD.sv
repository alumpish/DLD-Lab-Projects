`timescale 1ns/1ns

module SSD (
    input [3:0] Count_out,
    output reg [6:0] seven_segments
  );

  always @(Count_out)
  begin
    seven_segments = 7'b0000000;

    case(Count_out)
      4'd0 :
        seven_segments = 7'b1000000;
      4'd1 :
        seven_segments = 7'b1111001;
      4'd2 :
        seven_segments = 7'b0100100;
      4'd3 :
        seven_segments = 7'b0110000;
      4'd4 :
        seven_segments = 7'b0011001;
      4'd5 :
        seven_segments = 7'b0010010;
      4'd6 :
        seven_segments = 7'b0000010;
      4'd7 :
        seven_segments = 7'b1111000;
      4'd8 :
        seven_segments = 7'b0000000;
      4'd9 :
        seven_segments = 7'b0010000;
      default :
        seven_segments = 7'b1000000;
    endcase
  end
endmodule

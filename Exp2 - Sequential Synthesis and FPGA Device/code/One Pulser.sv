`timescale 1ns/1ns

module One_Pulser (
    input LongPulse, clk,
    output reg SinglePulse
  );


  reg [1:0] ps, ns;
  parameter [1:0] init = 2'b00, A = 2'b01, B = 2'b10 ;

  always @(ps, LongPulse)
  begin
    SinglePulse = 1'b0;
    ns = init;

    case(ps)
      init:
        ns = LongPulse ? A : init;

      A:
      begin
        ns = B;
        SinglePulse = 1'b1;
      end

      B:
        ns = LongPulse ? B : init;

      default:
        ns = init;
    endcase
  end

  always @(posedge clk)
    ps <= ns;

endmodule

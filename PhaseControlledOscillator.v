`timescale 1ns / 1ps
module PhaseControlledOscillator (
  input clk,           
  input slowclock,     
  input [15:0] phi_out,
  output wire nout      );
  reg [15:0] shift_register = 16'b1111111100000000; // 16-bit circular shift register
  reg [3:0] control_register; // 4-bit control register for phase select
  wire multiplexer_output; 
  always @(posedge slowclock) begin
    shift_register <= {shift_register[14:0], shift_register[15]}; // Shift left
  end
  always @(*) begin
    control_register = phi_out[3:0];
  end
  assign multiplexer_output = (control_register == 4'b0000) ? shift_register[0] :
                               (control_register == 4'b0001) ? shift_register[1] :
                               (control_register == 4'b0010) ? shift_register[2] :
                               (control_register == 4'b0011) ? shift_register[3] :
                               (control_register == 4'b0100) ? shift_register[4] :
                               (control_register == 4'b0101) ? shift_register[5] :
                               (control_register == 4'b0110) ? shift_register[6] :
                               (control_register == 4'b0111) ? shift_register[7] :
                               (control_register == 4'b1000) ? shift_register[8] :
                               (control_register == 4'b1001) ? shift_register[9] :
                               (control_register == 4'b1010) ? shift_register[10] :
                               (control_register == 4'b1011) ? shift_register[11] :
                               (control_register == 4'b1100) ? shift_register[12] :
                               (control_register == 4'b1101) ? shift_register[13] :
                               (control_register == 4'b1110) ? shift_register[14] :
                               (control_register == 4'b1111) ? shift_register[15]:
                               shift_register[0];                                
  assign nout = multiplexer_output;

endmodule

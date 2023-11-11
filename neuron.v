`timescale 1ns / 1ps
    module neuron (
    input clk,           
    input slow_clk,      
    input reset,           
    input ser_state_in,  
    output reg ser_state_out, 
    input nin,           
    input [15:0] phi_in,
    output wire nout,      
    output reg [15:0] phi_out
);
wire [15:0] phi_diff;      
reg nout_prev;
PhaseControlledOscillator oscillator(clk, slow_clk, phi_in, nout);
phase_calculator phase(clk, reset, nin, nout, phi_diff);
always @(posedge clk or posedge reset) begin
    if (reset) begin
        phi_out <= 16'd0;
    end else if (ser_state_in) begin
        ser_state_out <= ser_state_in;
        phi_out <= phi_in - phi_diff;
    end
end
endmodule



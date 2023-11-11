`timescale 1ns / 1ps

module neuron_network(
    input clk,           
    input slow_clk,      
    input reset,         
    input full_tick, 
    input [63:0] phi_in,
 
    output [63:0] phi_out
    );
    wire ser_state_out[3:0];
    wire [3:0] nin;
    wire [3:0] nout;
    
    synapses s(nout, nin);
    
   neuron n1(clk, slow_clk, reset, full_tick, ser_state_out[0], nin[0], phi_in[15:0], nout[0], phi_out[15:0]);
   neuron n2(clk, slow_clk, reset, full_tick, ser_state_out[1], nin[1], phi_in[31:16], nout[1], phi_out[31:16]);
   neuron n3(clk, slow_clk, reset, full_tick, ser_state_out[2], nin[2], phi_in[47:32], nout[2], phi_out[47:32]);
   neuron n4(clk, slow_clk, reset,full_tick, ser_state_out[3], nin[3], phi_in[63:48], nout[3], phi_out[63:48]);
   neuron n5(clk, slow_clk, reset,full_tick, ser_state_out[4], nin[4], phi_in[79:64], nout[4], phi_out[79:64]);
   neuron n6(clk, slow_clk, reset,full_tick, ser_state_out[5], nin[5], phi_in[95:80], nout[5], phi_out[95:80]);
   neuron n7(clk, slow_clk, reset,full_tick, ser_state_out[6], nin[6], phi_in[111:96], nout[6], phi_out[111:96]);
   neuron n8(clk, slow_clk, reset, full_tick, ser_state_out[7], nin[7], phi_in[127:112], nout[7], phi_out[127:112]);
   neuron n9(clk, slow_clk, reset, full_tick, ser_state_out[8], nin[8], phi_in[143:128], nout[8], phi_out[143:128]);
   neuron n10(clk, slow_clk, reset, full_tick, ser_state_out[9], nin[9], phi_in[159:144], nout[9], phi_out[159:144]);
   neuron n11(clk, slow_clk, reset, full_tick, ser_state_out[10], nin[10], phi_in[175:160], nout[10], phi_out[175:160]);
   neuron n12(clk, slow_clk, reset, full_tick, ser_state_out[11], nin[11], phi_in[191:176], nout[11], phi_out[191:176]);
   neuron n13(clk, slow_clk, reset, full_tick, ser_state_out[12], nin[12], phi_in[207:192], nout[12], phi_out[207:192]);
   neuron n14(clk, slow_clk, reset, full_tick, ser_state_out[13], nin[13], phi_in[223:208], nout[13], phi_out[223:208]);
   neuron n15(clk, slow_clk, reset, full_tick, ser_state_out[14], nin[14], phi_in[239:224], nout[14], phi_out[239:224]);  
endmodule

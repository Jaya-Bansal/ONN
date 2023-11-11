`timescale 1ns / 1ps

module phase_calculator(
  input clk,        
  input reset,       
  input n_in,         
  input n_out,        
  output reg [15:0] phi_diff 
);

  reg n_in_prev;            
  reg n_out_prev;           
  reg [15:0] n_in_time;     
  reg [15:0] n_out_time;   
  wire rising_edge_n_in;    
  wire rising_edge_n_out;   

  assign rising_edge_n_in = (n_in & ~n_in_prev);
  assign rising_edge_n_out = (n_out & ~n_out_prev);
  always @(*) begin
   if(rising_edge_n_in) n_in_time <=  $time;  
   if(rising_edge_n_out) n_out_time <= $time;
   end  
   
  always @(posedge clk or posedge reset) begin 
  if(reset) phi_diff<=16'b0;
  else begin
   n_in_prev <= n_in;
   n_out_prev <= n_out;
   end
   end
 always @(*) begin
  if(n_in_time > n_out_time) phi_diff <= n_in_time - n_out_time;
  else phi_diff <= n_out_time - n_in_time;
  end
endmodule


`timescale 1ns / 1ps

module synapses (
  input [14:0] nout,       // Output signals of all neurons
  output reg [14:0] nin     // Output signals for all neurons
);
  reg [1:0] matrix[14:0][14:0];
reg [1:0] data [0:3] = {2'b00, 2'b01, 2'b10, 2'b11};
integer i, j;
initial begin
 for (i = 0; i < 15; i = i + 1) begin
   for (j = 0; j < 15; j = j + 1) begin
     matrix[i][j] = 2'b11;
   end
 end
 for (i = 0; i < 15; i = i + 2) begin
   for (j = 0; j < 15; j = j + 2) begin
     matrix[i][j] = 2'b01;
   end
 end
 for (i = 0; i < 15; i = i + 3) begin
   for (j = 0; j < 15; j = j + 3) begin
     matrix[i][j] = 2'b10;
   end
 end
 for (i = 0; i < 15; i = i + 5) begin
   for (j = 0; j < 15; j = j + 5) begin
     matrix[i][j] = 2'b11;
   end
 end
end
 integer k, l;
 reg [6:0] sum_1, sum_0;
always @(*) begin
  for(k=0; k<14; k = k+1) begin 
  sum_1 = 0; sum_0 = 0;
    for (l = 0; l < 14; l = l + 1) begin
      if (nout[l] == 1) 
        sum_1 = sum_1 + matrix[k][l];
      else 
        sum_0 = sum_0 + matrix[k][l];
    end
  if(sum_1 > sum_0) nin[k] = 1;
  else nin[k] = 0;
end
end
endmodule

module brg(clk, rst, indicator, BaudRate);

input clk; // Clock input
input rst  ; // Reset input
input [15:0] BaudRate ; // Value to divide the generator by
output indicator ; // Each "BaudRate" pulses we set high a indicator 

reg [15:0] count         ; // Register used to count

always @(posedge clk, posedge rst) begin
	count<= 16'b1;
    if (rst) 
	count <= 16'b0;
    	else 
	count <= count + 1'b1; 
	if (count == BaudRate) count<=16'b1; end

assign indicator = (count == BaudRate);
endmodule

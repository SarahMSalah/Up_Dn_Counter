module Up_Dn_Counter (
input wire [4:0] in,
input wire load,
input wire up, 
input wire down,
input wire clk,
output wire high,
output reg [4:0] counter,
output wire low
);

always @(posedge clk)
 begin 
 
    if (load)                    // if load is high, the value is loaded in counter
	 begin
	  counter <= in;
	 end
	
	else if (down && !low)       //if down is high & low flag is low, decrement by 1
	 begin
	  counter <= counter - 5'b00001;
	 end
	
	else if (up && !high && !down)   //if up is high & high flag is low & down is low, increment by 1
	 begin
	  counter <= counter + 5'b00001;
	 end
	 
	else 
	 begin
	 counter <= counter;
	 end
	 
 end
 
 assign high = (counter == 5'b11111);       //if the value is 31, high flag is high
 assign low = (counter == 5'b00000);        //if the value is 0, low flag is high

endmodule

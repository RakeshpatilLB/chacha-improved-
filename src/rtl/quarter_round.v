module quarter_round(
input wire [31:0] a, b, c,
input wire [1:0] sht_amt,
output wire [31:0] d, e);

reg [31:0] temp1; 

reg [4:0] sht_val;

assign  d = a + b;
 
always @*
begin
  temp1 = c ^ d;
case(sht_amt)
    2'd0: sht_val = 5'd16;
    2'd1: sht_val = 5'd20;
    2'd2: sht_val = 5'd24;
    2'd3: sht_val = 5'd25;
endcase
  
end

assign e = (temp1>>sht_val)|(temp1<<(32-sht_val));

endmodule

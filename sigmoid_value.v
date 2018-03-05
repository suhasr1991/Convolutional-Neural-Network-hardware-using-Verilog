module sigmoid_value(res_flag,in_sig,op_sig);

input        res_flag;
input  [6:0] in_sig;
output [6:0] op_sig;
reg    [6:0] sig_value;

assign op_sig = sig_value;

	always @(*) begin
	   sig_value = 7'd0;
		if(res_flag) begin
			case(in_sig)
						7'b1101100: sig_value = 7'b0000100;
						7'b0000111: sig_value = 7'b0001010;
						7'b0011010: sig_value = 7'b0001101;
						7'b0110010: sig_value = 7'b0001111;
						7'b0010101: sig_value = 7'b0001101;
						7'b1101011: sig_value = 7'b0000011;
						7'b1100101: sig_value = 7'b0000010;
						7'b0011110: sig_value = 7'b0001110;
						7'b1101000: sig_value = 7'b0000011;
						7'b0110000: sig_value = 7'b0001111;
						7'b1111110: sig_value = 7'b0001000;
						7'b0010100: sig_value = 7'b0001100;
						7'b0000100: sig_value = 7'b0001001;
						7'b1010100: sig_value = 7'b0000001;
						7'b0001100: sig_value = 7'b0001011;
						7'b0111010: sig_value = 7'b0010000;
						7'b0101001: sig_value = 7'b0001111;
						7'b0011101: sig_value = 7'b0001110;
						//7'b0000111: sig_value = 7'b0001010;
						7'b0010110: sig_value = 7'b0001101;
						7'b1011100: sig_value = 7'b0000010;
						7'b1010110: sig_value = 7'b0000001;
						//7'b0011010: sig_value = 7'b0001101;
						7'b1100111: sig_value = 7'b0000011;
						7'b1010000: sig_value = 7'b0000001;
						7'b0100111: sig_value = 7'b0001111;
						7'b1111011: sig_value = 7'b0000111;
						7'b1011010: sig_value = 7'b0000001;
						//7'b1101100: sig_value = 7'b0000100;
						//7'b0000111: sig_value = 7'b0001010;
						//7'b0011010: sig_value = 7'b0001101;
						//7'b0110010: sig_value = 7'b0001111;
						//7'b0010101: sig_value = 7'b0001101;
						//7'b1101011: sig_value = 7'b0000011;
						//7'b1100101: sig_value = 7'b0000010;
						//7'b0011110: sig_value = 7'b0001110;
						//7'b1101000: sig_value = 7'b0000011;
						//7'b0110000: sig_value = 7'b0001111;
//7'b1111110: sig_value = 7'b0001000;
						//7'b0010100: sig_value = 7'b0001100;
						//7'b0000100: sig_value = 7'b0001001;
						7'b0000000: sig_value = 7'b0001000;
						//7'b1010100: sig_value = 7'b0000001;
						//7'b0001100: sig_value = 7'b0001011;
						//7'b0111010: sig_value = 7'b0010000;
						//7'b0101001: sig_value = 7'b0001111;
						//7'b0011101: sig_value = 7'b0001110;
						7'b1011001: sig_value = 7'b0000001;
						7'b0111100: sig_value = 7'b0010000;
						7'b1000111: sig_value = 7'b0000000;
						//7'b0010110: sig_value = 7'b0001101;
						7'b1000011: sig_value = 7'b0000000;
						7'b1000100: sig_value = 7'b0000000;
						//7'b1111110: sig_value = 7'b0001000;
						7'b0011000: sig_value = 7'b0001101;
						7'b1101110: sig_value = 7'b0000100;
						//7'b0111010: sig_value = 7'b0010000;
						7'b0100101: sig_value = 7'b0001111;
						//7'b1011010: sig_value = 7'b0000001;
						7'b1100110: sig_value = 7'b0000011;
						7'b1111100: sig_value = 7'b0000111;
						7'b1101001: sig_value = 7'b0000011;
						7'b0110101: sig_value = 7'b0001111;
						//7'b0010101: sig_value = 7'b0001101;
						7'b0101110: sig_value = 7'b0001111;
						//7'b0111100: sig_value = 7'b0010000;
						7'b1100000: sig_value = 7'b0000010;
						7'b1111001: sig_value = 7'b0000110;
						7'b0100000: sig_value = 7'b0001110;
						7'b0010111: sig_value = 7'b0001101;
						//7'b0110101: sig_value = 7'b0001111;
						7'b0111111: sig_value = 7'b0010000;
						//7'b1010110: sig_value = 7'b0000001;
						7'b1101101: sig_value = 7'b0000100;
						7'b0000001: sig_value = 7'b0001000;
						7'b0101010: sig_value = 7'b0001111;
						7'b0111011: sig_value = 7'b0010000;
						//7'b0101001: sig_value = 7'b0001111;
						//7'b0111111: sig_value = 7'b0010000;
						7'b0111101: sig_value = 7'b0010000;
						7'b0001000: sig_value = 7'b0001010;
						//7'b0000100: sig_value = 7'b0001001;
						7'b1100100: sig_value = 7'b0000010;
						7'b1101010: sig_value = 7'b0000011;
						//7'b0110010: sig_value = 7'b0001111;
						//7'b1101101: sig_value = 7'b0000100;
						//7'b0100111: sig_value = 7'b0001111;
						7'b1110010: sig_value = 7'b0000101;
						7'b0001101: sig_value = 7'b0001011;
						7'b0011100: sig_value = 7'b0001110;
						7'b0010010: sig_value = 7'b0001100;
						7'b0001110: sig_value = 7'b0001011;
						7'b0011111: sig_value = 7'b0001110;
						//7'b1101101: sig_value = 7'b0000100;
						7'b1110100: sig_value = 7'b0000101;
						7'b0000011: sig_value = 7'b0001001;
						7'b1111000: sig_value = 7'b0000110;
						//7'b1111011: sig_value = 7'b0000111;
						7'b0100010: sig_value = 7'b0001110;
						7'b1110110: sig_value = 7'b0000110;
						7'b1010010: sig_value = 7'b0000001;
						//7'b0011100: sig_value = 7'b0001110;
						//7'b1100101: sig_value = 7'b0000010;
						7'b1110001: sig_value = 7'b0000101;
						7'b0000010: sig_value = 7'b0001000;
						//7'b0000000: sig_value = 7'b0001000;
						7'b1011000: sig_value = 7'b0000001;

					default: sig_value = 7'd0;
			endcase
		end
	end
	
endmodule

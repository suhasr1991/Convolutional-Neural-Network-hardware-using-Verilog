////`timescale 1 ps / 1 ps
//module main(clk,rst,enable,y,res_flag2);
//   input clk,rst;
//	input enable;
//	output [6:0]y;
//	output reg res_flag2;
//	
//	reg        res_flag;
//	reg  [6:0] Layer1_op;
//	reg  [8:0] count,count_d;
//	reg  [8:0] count2,count_d2;
//	reg  [8:0] count3,count_d3;
//	reg  [8:0] addr_count1,addr_count_d1;
//	reg  [13:0]address,address_d;
//	reg  [8:0]address_X,address_d_X;
//	reg  [8:0]address_d_T2,address_T2;
//	
//	wire [6:0]RAM_X_op,RAM_T1_op,RAM_T2_op;
//	wire [13:0] XT1;
//	reg  [13:0]L1;
//	wire [6:0] L1_op,y_1,y_2;
//	reg  [6:0] y_d,y_d2;
//	reg  [6:0] ip_mult2,ip_mult21,ip_mult22;
//	wire [6:0] sig_L1;
//	wire [6:0] sig_L2;
//	wire [13:0] op_mult2;
//	reg  [13:0] reg_op;
//	wire [6:0] op_mult;
//	reg  [6:0]inp_l2[0:26];
//	reg  [6:0]inp_l2_d[0:26];
//	assign L1_op = L1[10:4];
//	assign op_mult = reg_op[10:4];
//	assign y = sig_L2;
//	
//	ram_xx ram_xx_inst(
//	.address(address_d_X),
//	.clock(clk),
//	.data(7'h00),
//	.wren(1'b0),
//	.q(RAM_X_op));
//	
//	ram_t1_proj t1_read(
//	.address(address_d),
//	.clock(clk),
//	.data(7'h00),
//	.wren(1'b0),
//	.q(RAM_T1_op));
//	
//	ram_t2 t2_ram_inst(
//	.address(address_d_T2),
//	.clock(clk),
//	.data(7'h00),
//	.wren(1'b0),
//	.q(RAM_T2_op));
//	
//	mult1 m1(
//	.dataa(RAM_X_op),
//	.datab(RAM_T1_op),
//	.result(XT1));
//	
//	mult2 m2(
//	.dataa(ip_mult22),
//	.datab(RAM_T2_op),
//	.result(op_mult2));
//	
//	add1 a1(
//	.dataa(L1_op),
//	.datab(y_d),
//	.cout(carry_out1),
//	.overflow(of1),
//	.result(y_1));
//	
//	add2 a2(
//	.dataa(op_mult),
//	.datab(y_d2),
//	.cout(carry_out2),
//	.overflow(of2),
//	.result(y_2));
//	
//	sigmoid_value s1(
//	.res_flag(res_flag),
//	.in_sig(Layer1_op),
//	.op_sig(sig_L1));
//	
//	sigmoid_value s2(
//	.res_flag(res_flag2),
//	.in_sig(y_d2),
//	.op_sig(sig_L2));
//	
//	always @(*) begin
//		address = address_d;
//		address_X = address_d_X;	
//		res_flag = 0;
//		res_flag2 = 0;
//		Layer1_op   = 0;
//		addr_count1  = addr_count_d1;
//		count = count_d;
//		address_T2 =  address_d_T2;
//		ip_mult2 = 0;
//		L1 = XT1;
//		reg_op = op_mult2;
//		count2 = count_d2;
//		count3 = count_d3;
//		
//		 inp_l2[0]=	inp_l2_d[0]; 
//		 inp_l2[1]=	inp_l2_d[1];
//		 inp_l2[2]=	inp_l2_d[2];
//		 inp_l2[3]=	inp_l2_d[3];
//		 inp_l2[4]=	inp_l2_d[4];
//		 inp_l2[5]=	inp_l2_d[5];
//		 inp_l2[6]=	inp_l2_d[6];
//		 inp_l2[7]=	inp_l2_d[7];
//		 inp_l2[8]=	inp_l2_d[8];
//		 inp_l2[9]=	inp_l2_d[9];
//		inp_l2[10]=	inp_l2_d[10]; 
//		inp_l2[11]=	inp_l2_d[11];
//		inp_l2[12]=	inp_l2_d[12];
//		inp_l2[13]=	inp_l2_d[13];
//		inp_l2[14]=	inp_l2_d[14];
//		inp_l2[15]=	inp_l2_d[15];
//		inp_l2[16]=	inp_l2_d[16];
//		inp_l2[17]=	inp_l2_d[17];
//		inp_l2[18]=	inp_l2_d[18];
//		inp_l2[19]=	inp_l2_d[19];
//		inp_l2[20]=	inp_l2_d[20];
//		inp_l2[21]=	inp_l2_d[21];
//		inp_l2[22]=	inp_l2_d[22];
//		inp_l2[23]=	inp_l2_d[23];
//		inp_l2[24]=	inp_l2_d[24];
//		inp_l2[25]=	inp_l2_d[25];
//		inp_l2[26]=	inp_l2_d[26];
//		//y=0;
//		
//		if(enable) begin
//			address = address_d + 14'd1;
//			
//			addr_count1  = addr_count_d1 + 9'd1; 
//			
//			if (address_d_X <= 9'd400) begin
//				address_X = address_d_X + 9'd1;
//			end else begin
//				address_X = 9'd1;
//			end
//			
//			if(addr_count_d1 == 9'd403) begin
//				res_flag = 1;
//				Layer1_op        = y_d;
//				addr_count1   = 9'd1;	
//				//$display("%d",Layer1_op);
//			end
//			
//			//rounding logic
//			if (XT1[3]) begin
//				L1 = {XT1[13:3] + 11'b000_0000_0001,XT1[2:0]};
//			//	L1 = XT1;
//			end
//			
//			//rounding logic
//			if (op_mult2[3]) begin
//				reg_op = {op_mult2[13:3] + 11'b000_0000_0001,op_mult2[2:0]};
//			end
//			
//			if(count <= 9'd25) begin
//				if(res_flag) begin
//					count = count_d + 1'b1;
//					inp_l2[count] = sig_L1;
//					//$display("inp_l2=%b,count=%d",inp_l2[count],count);
//					//ip_mult2 = sig_L1;
//					//address_T2 =  address_d_T2 + 1'b1;
//					//$display("%d",y_d2);
//				end
//			end
//			
//			if (count == 9'd26) begin
//				address_T2 =  address_d_T2 + 1'b1;
//				
//				if (count2 <= 9'd25) begin
//					count2 = count_d2 + 1'b1;
//					ip_mult2   =  inp_l2[count2];
//				end else if (count2 == 9'd26) begin
//					count2 = 1;
//				end
//			end
//
//			if(count3 <= 9'd9) begin
//				if(count_d2==9'd2 && address_d_T2 > 9'd2) begin
//						res_flag2 = 1;
//						count3 = count_d3 + 1'b1;
//						//$display("%d",y_d2);
//						//y = y_d2;
//				end
//			end
//				
//		end
//	end
//	
//	always @(posedge clk)begin
//		if(rst) begin
//			address_d       <=  14'd0;
//			address_d_X     <=  9'd0;
//			address_d_T2    <=  9'd0;
//			y_d             <=  7'd0;
//			count_d         <=  9'd0;
//			addr_count_d1   <=  9'd0;
//			count_d2        <=  9'd0;
//			count_d3        <=  9'd0;
//			ip_mult21       <=  7'd0;
//			ip_mult22       <=  7'd0;
//			y_d2            <=  7'd0;
//			inp_l2_d[0]     <=  7'd0;
//			inp_l2_d[1]     <=  7'd0;
//			inp_l2_d[2]     <=  7'd0;
//			inp_l2_d[3]     <=  7'd0;
//			inp_l2_d[4]     <=  7'd0;
//			inp_l2_d[5]     <=  7'd0;
//			inp_l2_d[6]     <=  7'd0;
//			inp_l2_d[7]     <=  7'd0;
//			inp_l2_d[8]     <=  7'd0;
//			inp_l2_d[9]     <=  7'd0;
//			inp_l2_d[10]     <=  7'd0;
//			inp_l2_d[11]     <=  7'd0;
//			inp_l2_d[12]     <=  7'd0;
//			inp_l2_d[13]     <=  7'd0;
//			inp_l2_d[14]     <=  7'd0;
//			inp_l2_d[15]     <=  7'd0;
//			inp_l2_d[16]     <=  7'd0;
//			inp_l2_d[17]     <=  7'd0;
//			inp_l2_d[18]     <=  7'd0;
//			inp_l2_d[19]     <=  7'd0;
//			inp_l2_d[20]     <=  7'd0;
//			inp_l2_d[21]     <=  7'd0;
//			inp_l2_d[22]     <=  7'd0;
//			inp_l2_d[23]     <=  7'd0;
//			inp_l2_d[24]     <=  7'd0;
//			inp_l2_d[25]     <=  7'd0;
//			inp_l2_d[26]     <=  7'd0;
//		end else begin
//			address_d       <=  address;
//			address_d_X     <=  address_X;
//			address_d_T2    <=  address_T2;
//			if(res_flag) begin
//				y_d          <=  0;
//			end else begin
//				if (carry_out1 && of1) begin
//					y_d          <=  7'b0000001;
//				end else if(!carry_out1 && of1) begin
//					y_d          <=  7'b0111111;
//				end else begin
//					y_d          <=  y_1;
//				end
//			end
//			
//			if(res_flag2) begin
//				y_d2            <=  0;
//			end else begin
//				if (carry_out2 && of2) begin
//					y_d2          <=  7'b0000001;
//				end else if(!carry_out1 && of1) begin
//					y_d2          <=  7'b0111111;
//				end else begin
//					y_d2            <=  y_2;
//				end
//			end
//			
//			count_d         <=  count;
//			addr_count_d1   <=  addr_count1;
//			count_d2        <=  count2;
//			count_d3        <=  count3;
//			ip_mult21       <=  ip_mult2;
//			ip_mult22       <=  ip_mult21;
//			inp_l2_d[0]     <=  inp_l2[0]; 
//			inp_l2_d[1]     <=  inp_l2[1];
//			inp_l2_d[2]     <=  inp_l2[2];
//			inp_l2_d[3]     <=  inp_l2[3];
//			inp_l2_d[4]     <=  inp_l2[4];
//			inp_l2_d[5]     <=  inp_l2[5];
//			inp_l2_d[6]     <=  inp_l2[6];
//			inp_l2_d[7]     <=  inp_l2[7];
//			inp_l2_d[8]     <=  inp_l2[8];
//			inp_l2_d[9]     <=  inp_l2[9];
//			inp_l2_d[10]     <= inp_l2[10]; 
//			inp_l2_d[11]     <= inp_l2[11];
//			inp_l2_d[12]     <= inp_l2[12];
//			inp_l2_d[13]     <= inp_l2[13];
//			inp_l2_d[14]     <= inp_l2[14];
//			inp_l2_d[15]     <= inp_l2[15];
//			inp_l2_d[16]     <= inp_l2[16];
//			inp_l2_d[17]     <= inp_l2[17];
//			inp_l2_d[18]     <= inp_l2[18];
//			inp_l2_d[19]     <= inp_l2[19];
//			inp_l2_d[20]     <= inp_l2[20];
//			inp_l2_d[21]     <= inp_l2[21];
//			inp_l2_d[22]     <= inp_l2[22];
//			inp_l2_d[23]     <= inp_l2[23];
//			inp_l2_d[24]     <= inp_l2[24];
//			inp_l2_d[25]     <= inp_l2[25];
//			inp_l2_d[26]     <= inp_l2[26];
//		end
//	end
//	
//endmodule

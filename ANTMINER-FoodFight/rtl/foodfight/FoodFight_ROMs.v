// Copyright (c) 2019 MiSTer-X
/*
module PRGxROM
(
	input			cl,
	input  [12:0]	ad,
	output [15:0]	dt,
	
	input			DLCL,
	input  [16:0]	DLAD,
	input   [7:0]	DLDT,
	input			DLEN
);

DLROM #(13,8) ro(cl,ad,dt[ 7:0], DLCL,DLAD,DLDT,DLEN & ~DLAD[13]);
DLROM #(13,8) re(cl,ad,dt[15:8], DLCL,DLAD,DLDT,DLEN &  DLAD[13]);

endmodule
*/

module BGCHROM
(
	input			cl,
	input  [12:0]	ad,
	output  [7:0]	dt //,
	
//	input			DLCL,
//	input  [16:0]	DLAD,
//	input   [7:0]	DLDT,
//	input			DLEN
);

bgrom BGROM ( // 136020-109.6lm
.clk(cl), 
.addr(ad), 
.data(dt)
);

//DLROM #(13,8) r0(cl,ad,dt); //, DLCL,DLAD,DLDT,DLEN & (DLAD[16:13]==4'b1_000));

endmodule


module SPCHROM
(
	input			cl,
	input  [12:0]	ad,
	output [15:0]	dt //,
	
//	input			DLCL,
//	input  [16:0]	DLAD,
//	input   [7:0]	DLDT,
//	input			DLEN
);

sprom0 SPROM0 ( // 136020-110.4e
.clk(cl), 
.addr(ad), 
.data(dt[7:0])
);

sprom1 SPROM1 ( // 136020-111.4d
.clk(cl), 
.addr(ad), 
.data(dt[15:8])
);

//DLROM #(13,8) r0(cl,ad,dt[ 7:0]); //, DLCL,DLAD,DLDT,DLEN & (DLAD[16:13]==4'b1_001));
//DLROM #(13,8) r1(cl,ad,dt[15:8]); //, DLCL,DLAD,DLDT,DLEN & (DLAD[16:13]==4'b1_010));

endmodule

/*
module NVRAM
(
	input			cl,
	input	  [7:0]	ad,
	input			en,
	input			wr,
	input   [3:0]	id,
	output  [3:0]	od,
	
	input			DLCL,
	input  [16:0]	DLAD,
	input   [7:0]	DLDT,
	input			DLEN
);


DPRAM256_4 r (
	ad,DLAD[7:0], ada adb
	cl,DLCL, cla clb
	id,DLDT[3:0], dataa datab
	en,1'b0, rdena rdenb
	en & wr,(DLEN & (DLAD[16:8]==9'h160)), 
	od
);

endmodule



module DLROM #(parameter AW,parameter DW)
(
	input							CL0,
	input [(AW-1):0]			AD0,
	output reg [(DW-1):0]	DO0,

	input							CL1,
	input [(AW-1):0]			AD1,
	input	[(DW-1):0]			DI1,
	input							WE1
);

reg [(DW-1):0] core[0:((2**AW)-1)];

always @(posedge CL0) DO0 <= core[AD0];
always @(posedge CL1) if (WE1) core[AD1] <= DI1;

endmodule

*/

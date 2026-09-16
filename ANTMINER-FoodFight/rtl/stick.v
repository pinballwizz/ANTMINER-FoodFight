module PseudoAnaStk
(
	input			CLK,
	input	 [8:0]	PV,

	input			LF,
	input			RG,
	input			UP,
	input			DW,

	output [7:0]	AX,
	output [7:0]	AY
);

reg  signed [9:0] StkX = 0, StkY = 0;

wire signed [9:0] DELT = 15;
wire signed [9:0] PLIM = 120;
wire signed [9:0] MLIM = -10'd120;

reg [8:0] pPV;
always @(posedge CLK) begin
	if ((pPV!=PV)&(PV==0)) begin

		if (LF) StkX = StkX+DELT;
		else if (RG) StkX = StkX-DELT;
		else StkX = (StkX>0) ? (StkX-DELT) : (StkX<0) ? (StkX+DELT) : StkX;

		if (UP) StkY = StkY+DELT;
		else if (DW) StkY = StkY-DELT;
		else StkY = (StkY>0) ? (StkY-DELT) : (StkY<0) ? (StkY+DELT) : StkY;

		StkX = (StkX<MLIM) ? MLIM : (StkX>PLIM) ? PLIM : StkX;
		StkY = (StkY<MLIM) ? MLIM : (StkY>PLIM) ? PLIM : StkY;

	end
	pPV <= PV;
end

wire [7:0] oStkX = StkX + 8'd127;
wire [7:0] oStkY = StkY + 8'd127;

assign AX = oStkX;
assign AY = oStkY;

endmodule
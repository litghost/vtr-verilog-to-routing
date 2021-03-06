/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */
/* ./multBlockGen.pl 23801 -fractionalBits 0*/
module multiplier_block (
    i_data0,
    o_data0
);

  // Port mode declarations:
  input   [31:0] i_data0;
  output  [31:0]
    o_data0;

  //Multipliers:

  wire [31:0]
    w1,
    w1024,
    w1023,
    w16384,
    w15361,
    w256,
    w15617,
    w8184,
    w23801;

  assign w1 = i_data0;
  assign w1023 = w1024 - w1;
  assign w1024 = w1 << 10;
  assign w15361 = w16384 - w1023;
  assign w15617 = w15361 + w256;
  assign w16384 = w1 << 14;
  assign w23801 = w15617 + w8184;
  assign w256 = w1 << 8;
  assign w8184 = w1023 << 3;

  assign o_data0 = w23801;

  //multiplier_block area estimate = 6602.90402074559;
endmodule //multiplier_block

module surround_with_regs(
	i_data0,
	o_data0,
	clk
);

	// Port mode declarations:
	input   [31:0] i_data0;
	output  [31:0] o_data0;
	reg  [31:0] o_data0;
	input clk;

	reg [31:0] i_data0_reg;
	wire [30:0] o_data0_from_mult;

	always @(posedge clk) begin
		i_data0_reg <= i_data0;
		o_data0 <= o_data0_from_mult;
	end

	multiplier_block mult_blk(
		.i_data0(i_data0_reg),
		.o_data0(o_data0_from_mult)
	);

endmodule

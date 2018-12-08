`default_nettype none

module blinky_top (
input wire i_clk,
output wire o_ledG
);

wire oscclk;

SB_HFOSC osc0(.CLKHFPU(1'b1), .CLKHFEN(1), .CLKHF(oscclk));

blinky bl0(.i_clk(oscclk), .o_led(o_ledG));

endmodule

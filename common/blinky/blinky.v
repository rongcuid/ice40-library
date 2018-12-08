`default_nettype none

module blinky
(
    input wire i_clk,
    output wire o_led
);

reg [25:0] counter;
always @ (posedge i_clk) 
    counter <= counter + 26'b1;

assign o_led = counter[25];

`ifdef FORMAL
    reg f_past_valid;
    initial f_past_valid = 1'b0;
    always @ (posedge i_clk) f_past_valid <= 1'b1;

    always @ (posedge i_clk) 
        if (f_past_valid)
            assert(counter == $past(counter) + 26'b1);

    always @ (*)
        assert(o_led == counter[25]);
`endif

endmodule

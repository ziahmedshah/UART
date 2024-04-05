module testbanch;
    localparam BAUD_RATE_VALUE = 130;  // Desired baud rate value for testing

    // Declare signals
    reg clk;
    reg rst;
    wire indicator;
    reg [15:0] BaudRate;

    // Instantiate the brg module
    brg dut (
        .clk(clk),
        .rst(rst),
        .BaudRate(BaudRate),
        .indicator(indicator)
    );

    // Clock generation
    always begin
        #5; clk = ~clk;
    end
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        BaudRate = BAUD_RATE_VALUE;
        #100;
        rst = 0;
        #100000;
        // End simulation
        $finish;
    end
endmodule

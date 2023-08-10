module owner_withdraw (
    input clk,
    input [3:0] machine_money,
    output reg updated_red_light,
    output reg [3:0] updated_machine_money
);

always @(clk) begin
    updated_machine_money = machine_money;
    updated_red_light = 0;

    if (machine_money != 4'b0000) begin
        updated_machine_money <= 4'b0000;
        updated_red_light <= 1'b0;
    end
    else begin
        $display("ERROR: Machine's Balance is Zero :(");
        updated_red_light <= 1'b1;
    end
end    

endmodule
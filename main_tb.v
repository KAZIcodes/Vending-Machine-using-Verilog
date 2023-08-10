module main_tb;

//inputs
reg clk;
reg [1:0] mode;
reg [3:0] customer_money;
reg [2:0] customer_request;
reg [3:0] quantity_request;
reg [2:0] product_id;
reg [3:0] amount_added;
//outputs
wire red_light;
wire [3:0] updated_customer_money;
wire [3:0] machine_money;
wire [6:0] segments;
wire display_red_light;


main uut(
.clk(clk),
.mode(mode),
.customer_money(customer_money),
.customer_request(customer_request),
.quantity_request(quantity_request),
.product_id(product_id),
.amount_added(amount_added),
.red_light(red_light),
.updated_customer_money(updated_customer_money),
.machine_money(machine_money)
);


display uut_2(
    .clk(clk),
    .mode(mode),
    .display_red_light(display_red_light),
    .segments(segments)
);


initial begin
    $dumpfile("project.vcd");
    $dumpvars;
    
    
    clk = 0;
    mode <= 2'b00; //Customer
    customer_money <= 4'b0110;
    quantity_request <= 1;
    customer_request <= 3'b111;
    #5;
    clk = 1;
    #10;



    clk = 0;
    mode <= 2'b00; //Customer  error test
    customer_money <= 4'b1110;
    quantity_request <= 1;
    customer_request <= 3'b001;
    #5;
    clk = 1;
    #10;


    clk = 0;
    mode <= 2'b00; //Customer
    customer_money <= 4'b0110;
    quantity_request <= 1;
    customer_request <= 3'b111;
    #5;
    clk = 1;
    #10;


    clk = 0;
    mode <= 2'b01; //withdraw
    #5;
    clk = 1;
    #10;


    clk = 0;
    mode <= 2'b10; //supply    
    product_id <= 3'b001;
    amount_added <= 4'b1101;
    #5;
    clk = 1;
    #10;

    clk = 0;
    mode <= 2'b01; //withdraw error test
    #5;
    clk = 1;
    #10;

    clk = 0;
    mode <= 2'b00; //Customer
    customer_money <= 4'b0110;
    quantity_request <= 1;
    customer_request <= 3'b111;
    #5;
    clk = 1;
    #10;

    clk = 0;
    mode <= 2'b10; //supply  error test
    product_id <= 3'b010;
    amount_added <= 4'b1101;
    #5;
    clk = 1;
    #10;

    
    


end

endmodule
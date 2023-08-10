module main (
    input clk,
    input [1:0] mode,
    input [3:0] customer_money,
    input [2:0] customer_request,
    input [3:0] quantity_request,
    input [2:0] product_id,
    input [3:0] amount_added,
    output reg red_light,
    output reg [3:0] updated_customer_money,
    output reg [3:0] machine_money
    //output reg [3:0] updated_machine_money, 
    //output reg [3:0] updated_customer_money,
);

wire [3:0] updated_customer_money_temp;
wire [3:0] updated_machine_money;
wire [3:0] updated_machine_money_OW;
wire updated_red_light;
wire updated_red_light_OW;
wire updated_red_light_OS;

reg clk_OW;
reg clk_OS;
reg clk_Customer;

initial begin
    machine_money = 0;
    red_light = 0;
    clk_OW = 0;
    clk_OS = 0;
    clk_Customer = 0;
end


//instants:
customer customer_inst(
    .clk(clk_Customer),
    .customer_money(customer_money),
    .customer_request(customer_request),
    .quantity_request(quantity_request),
    .machine_money(machine_money),
    .updated_machine_money(updated_machine_money),
    .updated_customer_money(updated_customer_money_temp),
    .updated_red_light(updated_red_light)
  );


owner_supply OS_inst(
    .clk(clk_OS),
    .product_id(product_id),
    .amount_added(amount_added),
    .updated_red_light(updated_red_light_OS)
);


owner_withdraw OW_inst(
    .clk(clk_OW),
    .machine_money(machine_money),
    .updated_machine_money(updated_machine_money_OW),
    .updated_red_light(updated_red_light_OW)
); 


    

always @(posedge clk) begin
    case (mode)
        2'b00 : clk_Customer = ~clk_Customer;        //Customer Mode
        2'b01 : clk_OW = ~clk_OW;              //Owner_withdraw Mode   
        2'b10 : clk_OS = ~clk_OS;             //Owner_supply Mode      
        2'b11 : begin
            $display("ERROR: Mode Not Available!"); 
            red_light = 1;
        end
    endcase
    
    #1;
    if (mode == 2'b01) begin
        machine_money <= updated_machine_money_OW;  //samte rast mishod mostaghim ham 0 gozasht
        red_light <= updated_red_light_OW;
    end
    else if (mode == 2'b10) begin
        // choon moghe supply be money machine dast nemizanim kari bahash nadari va mizarim hamoon value ghabli bemoone; bara hamin khate paeen cm has
        //machine_money <= updated_machine_money;
        red_light <= updated_red_light_OS;
    end
    else if (mode == 2'b00) begin
        machine_money <= updated_machine_money;
        red_light <= updated_red_light;
    end

    updated_customer_money <= updated_customer_money_temp;
end




endmodule
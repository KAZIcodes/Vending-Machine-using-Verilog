module customer(
    input clk,
    //input  red_light,
    input [3:0] customer_money,
    input [2:0] customer_request,
    input [3:0] quantity_request,
    input [3:0] machine_money,
    output reg [3:0] updated_machine_money, 
    output reg [3:0] updated_customer_money,
    output reg updated_red_light
);

  // Declare an array to store data
  reg [10:0] stuff[0:7];  // 8 (7) coud be changed to the number of products we have or the machine can store
  reg [10:0] updated_stuff[0:7]; 
  //first load stufff.txt data
  initial begin  
  $readmemb("stuff.txt", stuff);
 //$readmemb("stuff.txt", updated_stuff);
  end

  integer i;
  always @(clk) begin
    updated_machine_money = machine_money;
    updated_customer_money = customer_money;
    updated_red_light = 0;

    $readmemb("stuff.txt", stuff);

    for (i = 0; i < 9; i = i+1) begin

      if (stuff[i][10:8] == customer_request && stuff[i][7:4] >= quantity_request && stuff[i][3:0] * quantity_request <= customer_money) begin
         updated_customer_money <= customer_money - (stuff[i][3:0] * quantity_request);
         updated_machine_money <= machine_money + (stuff[i][3:0] * quantity_request);
         //updated_stuff[i][7:4] <= stuff[i][7:4] - quantity_request; // maybe we coukld merge this and next line !!
         stuff[i][7:4] = stuff[i][7:4] - quantity_request;
         updated_red_light <= 1'b0;
    end
    else if (stuff[i][10:8] == customer_request && (stuff[i][7:4] <= quantity_request || stuff[i][3:0] * quantity_request >= customer_money)) begin
        $display("ERROR: either customer has not enough money or the supply of the product is finished! ");
        updated_red_light <= 1'b1; 
  end
  end

      $writememb("stuff.txt", stuff); // updating the supply in txt file

  end


endmodule
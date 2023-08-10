module owner_supply(
    input clk,
    input [2:0] product_id,
    input [3:0] amount_added,
    output reg updated_red_light
);

reg [10:0] stuff[0:7];  // 8 coud be changed to the number of products we have or the machine can store
//first load stufff.txt data
initial begin
  $readmemb("stuff.txt", stuff);
end

integer i;
always @(clk) begin
    updated_red_light = 0;

    $readmemb("stuff.txt", stuff);
    
    //wire not_found = 1'b1;
    for (i = 0; i < 8; i = i+1) begin

      if (stuff[i][10:8] == product_id && stuff[i][7:4] != 4'b1111) begin
         stuff[i][7:4] = stuff[i][7:4] + amount_added;
         updated_red_light <= 1'b0;
         //flag = 1'b0; 
    end
    else if (stuff[i][10:8] == product_id && stuff[i][7:4] == 4'b1111) begin
        $display("ERROR: The Item Being Added Is Already Full !");
        updated_red_light <= 1'b1; 
        //flag = 1'b0; 
  end
  end
    /*if (not_found) begin
        $display("ERROR: The Product ID Not Found !");
        updated_red_light <= 1'b1;
    end*/

      $writememb("stuff.txt", stuff); // updating the supply in txt file

end

endmodule
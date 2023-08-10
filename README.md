# Vending-Machine-using-Verilog
<b>Verilog code for a Vending Machine</b>

</b>Introduction</b><br>
In this project, we are going to simulate a simple vending machine using Verilog HDL.

<b>Description:</b><br>
This machine is a refrigerator that has some items each with a specific price and customers could obtain their desired items after paying the respective price. It has a keyboard, which takes the type of material as input and after receiving the price, delivers it to the customer. It stores customers’ money and the received money. It can also display the remaining money of any customer. It also has an LED that indicates the status of the machine.
It has 8 types of products along with their other specifications in a file called stuff.txt. The general format of this file is as follows:
"Type of the product (3 bits) Supply of the product (4 bits) Price of the product (4 bits)"
Each type has its respective entry in the stuff.txt file. An example of this file looks like this:<br>
                                                                                                        00001100110<br>
                                                                                                        00100001111<br>
                                                                                                        01011110001<br>
                                                                                                        01110110010<br>
                                                                                                        10010001000<br>
                                                                                                        10101100110<br>
                                                                                                        11001100110<br>
                                                                                                        11101100110<br>
                                                                                                        
The machine works in three modes; two modes for the owner and one mode for the customer.<br><br>
<b>1 Customer:</b><br><br>
The customer has some initial money and can buy goods with that money by specifying the type of product and the desired quantity. Each sale must be processed first: whether the customer has enough money and the desired quantity of the products is less than the total supply should be checked.
If the amount of money and the number of products were sufficient, this step will be completed by deducting the respective amount of money from the customer’s account and depositing it into the machine’s account, and updating the number of products of the machine. Should we encounter any problem, the red light should be turned on by the error signal (i.e., the red light is sensitive to errors.)<br><br>
<b>2 Owner:</b><br><br>
The owner can charge the machine’s supplies (i.e., they can add to the supply of each product.) The owner can also retrieve the money stored in the machine. Again, it must be checked first whether the new supply exceeds the capacity of 4-bit numbers and whether there is any amount of money saved. Needless to say, encountering any error will trigger the red light.<br><br>
<b>Specifications:</b>
1. This implementation contains three modules, each for each mode, and each with its re- spective test cases. The main module is where these quasi-independent modules are connected.
2. This implementation is clock-based.
3. A 4-bit variable would be sufficient for each amount of money in this project.

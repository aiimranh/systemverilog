//executed based on clock sematics (generally through out the entire simulaton)...
//concurrent assertion is called in a module or in a interface but
//not in a procedural blocks...
//assert property is the keyword to use concurrent assertion...

//syntax 1:
//assert property(<expression>);

//syntax 2:
//assert property(property_name) begin
//		$info("assertion has passed");
//end else begin
//		$info("assertion has failed");
//end

//syntax 3:
//assert property(property_name)
//		$info("assertion has passed");
//else
//		$info("assertion has failed");

//property syntax 1:
//property <property_name>;
//		<local variable>;
//		<@(posedge clk)>
//		<disable iff (!reset)>
//		<expression or sequence>;
//endproperty

//property syntax 2:
//property <property_name>(<arguments lists>);
//		<local variable>;
//		<@(posedge clk)>
//		<disable iff (!reset)>
//		<expression or sequence>;
//endproperty

//property syntax 3:
//property <property_name>(<arguments lists>);
//		<local variable>;
//		<@(posedge clk)>
//		<disable iff (!reset)>
//		<expression or sequence>;
//endproperty

//sequence syntax 1:
//sequence <sequence_name>;
//		<local variable>;
//		<@(posedge clk)>
//		<expression>;
//endseqeunce

//sequence syntax 2:
//sequence <sequence_name>(<arguments lists>);
//		<local variable>;
//		<@(posedge clk)>
//		<expression>;
//endseqeunce

//sequence syntax 3: $display in sequence
//sequence <sequence_name>(<arguments lists>);
//		<local variable>;
//		<@(posedge clk)>
//		<expression,$display("executed the expression")>;
//endseqeunce

//sequence syntax 4: $display in sequence
//sequence <sequence_name>(<arguments lists>);
//		<local variable>;
//		<@(posedge clk)>
//		<expression,$display("executed the left expression")> ##1 <expression,$display("executed the right expression>);
//endseqeunce


`timescale 1ns/1ns
module tb;
  
  int num = 0;
  bit clk;
  initial forever #5 clk = ~clk;
  
  always @(posedge clk) begin
    num++;
    $display("num = %0d",num);
  end
  
  property even_prop;
    @(posedge clk)
    (num%2 == 0,$info("propery executed"));
  endproperty
  
  even_assert : assert property(even_prop) begin
    $info("assertion has passed");
  end else begin
    $info("assertion has failed");
  end
  
  initial begin
    #100;
    $finish(0);
  end
endmodule
  
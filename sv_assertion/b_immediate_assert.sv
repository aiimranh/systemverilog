//executed based on simulation clock simantics. &
//specified in a procedural blocks...

//syntax 1:
//[assertion_name] : assert(<expression>);

//syntax 2:
//[assertion_name] : assert(<expression>) begin
//		$info("assert has passed");
//end else begin
//		$info("assert has failed");
//end

//syntax 3:
//[assertion_name] : assert(<expression>)
//		$info("assert has passed");
//else
//		$info("assert has failed");

//<expression> -> refers to the conditon...


`timescale 1ns/1ns
module tb;
  
  int num = 0;
  bit clk;
  initial forever #5 clk = ~clk;
  
  always @(posedge clk) begin
    num++;
    $display("num = %0d",num);
  end
  
	always @(posedge clk) begin

      //implementation of immediate assertion...
      //immediate assertion always work with current time slot value...
      even_ass: assert(num%2==0) begin
        $info("assertion has passed");
      end else begin
        $info("assertion has failed");
    end
  end
  
  initial begin
    #100;
    $finish(0);
  end
endmodule

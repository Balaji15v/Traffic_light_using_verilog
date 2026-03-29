module traffic_light_tb;
  reg clk,rst;
  wire [2:0]lr,lr_tb,rl_tb,bt_lr;
  traffic_light dut(.clk(clk),.rst(rst),.lr(lr),.lr_tb(lr_tb),.rl_tb(rl_tb),.bt_lr(bt_lr));
  initial 
    begin
    clk=0;
    forever #10 clk=~clk;
    end
  initial
    begin
    rst=0;
    #10 rst=1;
    #10 rst=0;
    #500;
    $finish;
  end
  initial 
    begin
    $dumpfile("TL.vcd");
    $dumpvars();
  end
endmodule

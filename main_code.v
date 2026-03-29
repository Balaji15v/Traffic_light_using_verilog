module traffic_light(clk,rst,lr,lr_tb,rl_tb,bt_lr);
  input clk,rst;
  output reg [2:0]lr,lr_tb,rl_tb,bt_lr;
  parameter s1=0,s2=1,s3=2,s4=3,s5=4,s6=5;
  reg [2:0]ps;
  reg [3:0]count;
  parameter t1=10,t2=2,t3=8;
  
  always @(posedge clk or posedge rst)
    begin
      if(rst==1)
        begin
          ps<=s1;
          count<=0;
        end
      else
        case(ps)
          s1: if(count<t1)
            begin
              ps<=s1;
              count<=count+1;
            end
          else begin
            ps<=s2;
            count<=0;
          end
          s2: if(count<t2)
            begin
              ps<=s2;
              count<=count+1;
            end
          else begin
            ps<=s3;
            count<=0;
          end
          s3: if(count<t3)
            begin
              ps<=s3;
              count<=count+1;
            end
          else begin
            ps<=s4;
            count<=0;
          end
          s4: if(count<t2)
            begin
              ps<=s4;
              count<=count+1;
            end
          else begin
            ps<=s5;
            count<=0;
          end
          s5: if(count<t3)
            begin
              ps<=s5;
              count<=count+1;
            end
          else begin
            ps<=s6;
            count<=0;
          end
          s6: if(count<t2)
            begin
              ps<=s6;
              count<=count+1;
            end
          else begin
            ps<=s1;
            count<=0;
          end
          default: ps<=s1;
        endcase
    end
  always @(ps)
    begin
      case(ps)
        s1: begin
          lr<=3'b001;
          rl_tb<=3'b100;
          lr_tb<=3'b001;
          bt_lr<=3'b100;
        end
         s2: begin
          lr<=3'b001;
          rl_tb<=3'b010;
          lr_tb<=3'b010;
          bt_lr<=3'b100;
        end
         s3: begin
          lr<=3'b001;
          rl_tb<=3'b001;
          lr_tb<=3'b100;
          bt_lr<=3'b100;
        end
         s4: begin
          lr<=3'b010;
          rl_tb<=3'b010;
          lr_tb<=3'b100;
          bt_lr<=3'b100;
        end
         s5: begin
          lr<=3'b100;
          rl_tb<=3'b100;
          lr_tb<=3'b100;
          bt_lr<=3'b001;
        end
         s6: begin
          lr<=3'b100;
          rl_tb<=3'b100;
          lr_tb<=3'b100;
          bt_lr<=3'b010;
        end
        default:   begin
          lr<=3'b000;
          rl_tb<=3'b000;
          lr_tb<=3'b000;
          bt_lr<=3'b000;
        end
        endcase
      end
endmodule 

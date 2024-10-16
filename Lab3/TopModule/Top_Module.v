`timescale 1ns / 1ps

module seven_segment (
    input clk,
    input [3:0] in,
    input switch,
    output reg [3:0] seven_enable,
    output reg A,
    output reg B,
    output reg C,
    output reg D,
    output reg E,
    output reg F,
    output reg G
);

  reg [9:0] refresh_counter = 0;
  wire refresh_tick = refresh_counter[9];

  always @(posedge clk) begin
    refresh_counter <= refresh_counter + 1;
  end

  reg [1:0] current_digit = 0;

  always @(posedge refresh_tick) begin
    current_digit <= current_digit + 1;
  end

  always @(*) begin
    case (current_digit)
      2'b00: begin
        seven_enable = 4'b0111;
        A = 1'b0;
        B = 1'b0;
        C = 1'b0;
        D = 1'b0;
        E = 1'b0;
        F = 1'b0;
        G = 1'b1;
      end
      2'b01: begin
        seven_enable = 4'b1011;
        if (!switch) begin
          A = 1'b0;
          B = 1'b0;
          C = 1'b0;
          D = 1'b1;
          E = 1'b0;
          F = 1'b0;
          G = 1'b1;
        end else begin
          A = 1'b0;
          B = 1'b1;
          C = 1'b1;
          D = 1'b1;
          E = 1'b0;
          F = 1'b0;
          G = 1'b0;
        end
      end
      2'b10: begin
        seven_enable = 4'b1101;
        if (!switch) begin
          A = 1'b1;
          B = 1'b1;
          C = 1'b1;
          D = 1'b1;
          E = 1'b1;
          F = 1'b1;
          G = 1'b1;
        end else begin
          A = 1'b0;
          B = 1'b1;
          C = 1'b1;
          D = 1'b1;
          E = 1'b0;
          F = 1'b0;
          G = 1'b0;
        end
      end
      2'b11: begin
        seven_enable = 4'b1110;
        case (in)
          4'b0000: // HEX 0
                    begin
            A = 1'b0;
            B = 1'b0;
            C = 1'b0;
            D = 1'b0;
            E = 1'b0;
            F = 1'b0;
            G = 1'b1;
          end
          4'b0001: // HEX 1 
                    begin
            A = 1'b1;
            B = 1'b0;
            C = 1'b0;
            D = 1'b1;
            E = 1'b1;
            F = 1'b1;
            G = 1'b1;
          end
          4'b0010: // HEX 2
                    begin
            A = 1'b0;
            B = 1'b0;
            C = 1'b1;
            D = 1'b0;
            E = 1'b0;
            F = 1'b1;
            G = 1'b0;
          end
          4'b0011: // HEX 3
                    begin
            A = 1'b0;
            B = 1'b0;
            C = 1'b0;
            D = 1'b0;
            E = 1'b1;
            F = 1'b1;
            G = 1'b0;
          end
          4'b0100: // HEX 4
                    begin
            A = 1'b1;
            B = 1'b0;
            C = 1'b0;
            D = 1'b1;
            E = 1'b1;
            F = 1'b0;
            G = 1'b0;
          end
          4'b0101: // HEX 5
                    begin
            A = 1'b0;
            B = 1'b1;
            C = 1'b0;
            D = 1'b0;
            E = 1'b1;
            F = 1'b0;
            G = 1'b0;
          end
          4'b0110: // HEX 6
                    begin
            A = 1'b0;
            B = 1'b1;
            C = 1'b0;
            D = 1'b0;
            E = 1'b0;
            F = 1'b0;
            G = 1'b0;
          end
          4'b0111: // HEX 7
                    begin
            A = 1'b0;
            B = 1'b0;
            C = 1'b0;
            D = 1'b1;
            E = 1'b1;
            F = 1'b1;
            G = 1'b1;
          end
          4'b1000: // HEX 8
                    begin
            A = 1'b0;
            B = 1'b0;
            C = 1'b0;
            D = 1'b0;
            E = 1'b0;
            F = 1'b0;
            G = 1'b0;
          end
          4'b1001: // HEX 9
                    begin
            A = 1'b0;
            B = 1'b0;
            C = 1'b0;
            D = 1'b1;
            E = 1'b1;
            F = 1'b0;
            G = 1'b0;
          end
          4'b1010: // HEX A
                    begin
            A = 1'b0;
            B = 1'b0;
            C = 1'b0;
            D = 1'b1;
            E = 1'b0;
            F = 1'b0;
            G = 1'b0;
          end
          4'b1011: // HEX B
                    begin
            A = 1'b1;
            B = 1'b1;
            C = 1'b0;
            D = 1'b0;
            E = 1'b0;
            F = 1'b0;
            G = 1'b0;
          end
          4'b1100: // HEX C
                    begin
            A = 1'b0;
            B = 1'b1;
            C = 1'b1;
            D = 1'b0;
            E = 1'b0;
            F = 1'b0;
            G = 1'b1;
          end
          4'b1101: // HEX D
                    begin
            A = 1'b1;
            B = 1'b0;
            C = 1'b0;
            D = 1'b0;
            E = 1'b0;
            F = 1'b1;
            G = 1'b0;
          end
          4'b1110: // HEX E
                    begin
            A = 1'b0;
            B = 1'b1;
            C = 1'b1;
            D = 1'b0;
            E = 1'b0;
            F = 1'b0;
            G = 1'b0;
          end
          4'b1111: // HEX F
                    begin
            A = 1'b0;
            B = 1'b1;
            C = 1'b1;
            D = 1'b1;
            E = 1'b0;
            F = 1'b0;
            G = 1'b0;
          end
        endcase
      end
      default: begin
        seven_enable = 4'b1111;
        A = 1'b0;
        B = 1'b0;
        C = 1'b0;
        D = 1'b0;
        E = 1'b0;
        F = 1'b0;
        G = 1'b0;
      end
    endcase
  end

endmodule

module Top_module (
    clk,
    rst,
    switches,
    leds,
    seven_seg,
    seven_enable
);
  input clk, rst;  // Needed for synchronous inputs
  input [10:0] switches;  // Input switches
  output [2:0] leds;  // 
  output [6:0] seven_seg;  // Display outputs to seven segment
  output [3:0] seven_enable;  // Select which seven segment to display


  wire [9:0] seq;
  reg in;
  wire clk_1hz;
  wire [3:0] Value;
  reg [3:0] Seg_Value;
  reg pause;

  ClockDivider TarClock (
      .clk_1hz(clk_1hz),
      .clk_100mhz(clk),
      .rst(rst)
  );
  Convertor Conv (
      .clk(clk_1hz),
      .pause(switches[10]),
      .rst(rst),
      .sequence(seq),
      .switch0(switches[0]),
      .switch1(switches[1]),
      .switch2(switches[2]),
      .switch3(switches[3]),
      .switch4(switches[4]),
      .switch5(switches[5]),
      .switch6(switches[6]),
      .switch7(switches[7]),
      .switch8(switches[8]),
      .switch9(switches[9])
  );

  /**************** CONNECT FLAGS WITH LEDS ******************/


  /********* End connect flags with LEDS implementation **********/
  State_Machine SM (
      .clk(clk_1hz),
      .rst(rst),
      .in(seq[9]),
      .pause(switches[10]),
      .out(Value),
      .state(leds)
  );


  /**************** CONNECT ALU OUTPUT WITH SEVEN SEGMENT DISPLAY ******************/
  /* Here you initialize seven_seg, the register for the output of the seven segment dsiplay*/
  seven_segment sev_seg (
      .clk(clk),
      .in(Value),
      .switch(switches[10]),
      .seven_enable(seven_enable),
      .A(seven_seg[0]),
      .B(seven_seg[1]),
      .C(seven_seg[2]),
      .D(seven_seg[3]),
      .E(seven_seg[4]),
      .F(seven_seg[5]),
      .G(seven_seg[6])
  );


  /********* End connect alu output to seven seg implementation**********/





endmodule
/************ End module *************/






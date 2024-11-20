module Program_Counter(
    input clk,
    input rst,
    input signed [31:0] InstructionCountIn,
    output reg signed [31:0] InstructionCountOut,
    input select_branch
);

reg initialized;

initial begin
    InstructionCountOut = 32'd0;
    initialized = 1'b0;
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        InstructionCountOut <= 32'd0;
        initialized <= 1'b0;
    end else if (!initialized) begin
        initialized <= 1'b1;
        InstructionCountOut <= 32'd0;
    end else begin
        if (select_branch) begin
            if (InstructionCountIn[31] == 1'b1) begin
                InstructionCountOut <= InstructionCountOut - (~InstructionCountIn + 1);
            end else begin
                InstructionCountOut <= InstructionCountOut + InstructionCountIn;
            end
        end else begin
            InstructionCountOut <= InstructionCountOut + 1;
        end
    end
end

endmodule

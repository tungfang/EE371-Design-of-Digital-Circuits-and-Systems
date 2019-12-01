module fir_filter #(parameter N = 8, data_width = 24, addr_width = 3, data_depth = 2**addr_width-1)
	(clk, reset, enable, Din, Dout);
    input logic clk, reset, enable;
    input logic signed [data_width - 1:0] Din;
    output logic signed [data_width - 1:0] Dout;

    logic signed [data_width:0] factored_in, factored_out, acc_sum;

    logic wr_en, rd_en, fifo_empty, fifo_full;

    logic [addr_width - 1 : 0] words_used;
    logic [addr_width : 0] count;

    Altera_UP_SYNC_FIFO #(.DATA_WIDTH(data_width), .DATA_DEPTH(data_depth), .ADDR_WIDTH(addr_width))
        fifo(.clk(clk), .reset(reset), .write_en(wr_en), .write_data(factored_in), .read_en(rd_en), 
        .fifo_is_empty(fifo_empty), .fifo_is_full(fifo_full), .words_used(words_used), .read_data(factored_out));
    

    enum{fill,  full} ps, ns;

    always_comb begin
        case(ps)
            fill: begin
            if (count == data_depth - 2)
                    ns = full;
                else
                    ns = fill;
            end
            full: ns = full;
            default: ns = fill;
        endcase    
    end
    
    always_ff @(posedge clk) begin 
        if (ps == fill) begin
            if (reset)
                count <= '0;
            else 
                count <= count + {{(addr_width){1'b0}}, 1'd1};
            acc_sum <= '0;
        end else begin
            if (enable)
                acc_sum <= Dout;
        end
    end
    
    always_ff @(posedge clk) begin
        if (reset)   
            ps <= fill;
        else 
            ps <= ns;
    end

    assign wr_en = (ps == fill) ? 1 : enable;
    assign rd_en = (ps == fill) ? 0 : enable;
    assign factored_in = (ps == fill) ? 0 : (Din >>> addr_width);
    assign Dout = (ps == fill) ? 0 : (factored_in -factored_out + acc_sum);
endmodule


module fir_filter_testbench #(parameter N = 8, data_width = 24, addr_width = 3, data_depth = 2**addr_width-1)();
    logic clk, reset, enable;
    logic signed [data_width - 1:0] Din;
    logic signed [data_width - 1:0] Dout; 

    
endmodule
module ex_fir_filter #(parameter data_width = 24, addr_width = 3, data_depth = 2**addr_width-1)
	(clk, reset, enable, in, out);
    input logic clk, reset, enable;
    input logic signed [data_width - 1:0] in;
    output logic signed [data_width - 1:0] out;

    logic signed [data_width - 1:0] write_data, read_data, acc_out;

    
    logic wr_en, rd_en, fifo_empty, fifo_full, en;


    logic [addr_width - 1 : 0] words_used;
    logic [addr_width : 0] count;


    Altera_UP_SYNC_FIFO #(.DATA_WIDTH(data_width), .DATA_DEPTH(data_depth), .ADDR_WIDTH(addr_width))
        fifo(.clk(clk), .reset(reset), .write_en(wr_en), .write_data(write_data), .read_en(rd_en), 
        .fifo_is_empty(fifo_empty), .fifo_is_full(fifo_full), .words_used(words_used), .read_data(read_data));
    
    enum{Setup,  Normal} ps, ns;

    always_comb begin
        case(ps)
            Setup: begin
                if(count == data_depth - 2)
                    ns = Normal;
                else
                    ns = Setup;
                end
            Normal: ns = Normal;
            default: ns = Setup;
        endcase    
    end
    
    always_ff @(posedge clk) begin 
        if (ps == Setup) begin
            if (reset)
                count <= '0;
            else 
                count <= count + {{(addr_width){1'b0}}, 1'd1};
            acc_out <= '0;
        end else begin
            if (enable)
                acc_out <= out;
        end
    end

    always_ff @(posedge clk) begin
        if (reset)   
            ps <= Setup;
        else 
            ps <= ns;
    end

    always_comb begin  
        if (ps == Setup) begin  
            wr_en = 1'b1;
            rd_en = 1'b0;
            write_data = '0;
            out = '0;
        end
        else begin 
            wr_en = enable;
            rd_en = enable;
            write_data = in >>> addr_width;
            out = write_data - read_data + acc_out;
        end
    end



endmodule


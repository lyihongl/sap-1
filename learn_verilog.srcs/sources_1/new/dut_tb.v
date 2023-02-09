`timescale 1ps/1ps

module dut_tb ();
//reg a;
//wire b;
reg rst;
// reg read;
// reg latch;
// wire[7:0] data_tx;
// wire[7:0] reg_out;
// wire[7:0] data_in;

// reg[7:0] counter;

// wire[7:0] data;
// wire[7:0] data_out;
// assign data_out = data;
// assign data = latch ? counter : 8'bz;
//assign data = data_recv;
// assign latch = 
//reg clk;
reg clk=1'b1;

always #1 clk = ~clk;

wire[15:0] test_in;
reg[7:0] extern_val;

wire [8:0] rom_addr_debug;


initial begin
    // file = $readmemh("./dat/test.bin", "r");
    // $ferror(file, error);
    // if (error != 0)
    // $display("\nFile Open Failed with Error Code = %x", error);
    // test_in <= 0;
    extern_val <= 0;
    rst = 1;
    rst <= #2 0;
    // read = 0;
    // latch = 0;

    extern_val <= 8'b00000010;
    extern_val <= #13 8'b00000110;
    // test_in <= #5 16'h0110;
    // test_in <= #7 16'h0000;
    // test_in <= #9 16'h0208;
    // test_in <= #11 16'h0000;
    // test_in <= #13 16'h0030;
    // test_in <= #15 16'h0000;
    // test_in <= #17 16'h0080;
    // counter = 8'b00000000;
    // read = 0;
    // latch <= #40 1;
    // latch <= #41 0;
    // read <= #45 1;
    // read <= #46 0;
    // latch <= #48 1;
    // latch <= #49 0;
    // read <= #49 1;
    // read <= #50 0;
end
    wire external_in;
    wire hlt;
    wire mem_in;
    wire ram_out;
    wire ram_in;
    wire ins_dat_out;
    wire ins_dat_in;
    wire reg_a_out;
    wire reg_a_in;
    wire alu_out;
    wire alu_sub;
    wire reg_b_in;
    wire out_latch;
    wire pc_en;
    wire pc_out;
    wire jp;
    assign {
        hlt,
        mem_in,
        ram_out,
        ram_in,
        ins_dat_out,
        ins_dat_in,
        reg_a_out,
        reg_a_in,
        alu_out,
        alu_sub,
        reg_b_in,
        external_in,
        out_latch,
        pc_en,
        pc_out,
        jp
        // fi // store flags
    } = test_in;

// always @(posedge clk) begin
    
    // counter <= counter + 1;
    // if(counter + 1 == 256) begin
    //     counter <= 8'b0;
    // end

    // if(latch)
    //     data_write <= counter;
        // read <= 1;
        // data_recv <= data;
//    rst <= 0;
// end

wire halted;
wire[7:0] cpu_out;
wire[7:0] bus_debug;
wire[7:0] alu_debug;
wire[7:0] debug_a;
wire[7:0] debug_b;

cpu cpu_dut
(
    .clk(clk),
    .rst(rst),
    .external_val(extern_val),
    // .test_in(test_in),
    .cpu_out(cpu_out),
    .halted(halted),
    .bus_debug(bus_debug),
    .cw_debug(test_in)
    // .alu_debug(alu_debug),
    // .debug_a(debug_a),
    // .debug_b(debug_b)
);
    // rom instr_decode({ last_carry, last_zero, out_reg_instr[7:4], micro_counter }, cw);
assign rom_addr_debug = {cpu_dut.last_carry, cpu_dut.last_zero, cpu_dut.out_reg_instr[7:4], cpu_dut.micro_counter};

// gen_reg
// gen_reg_dut(
//   .clk(clk),
//   .rst(rst),
//   .read(read),
//   .latch(latch),
//   .data(data),
//   .reg_out(reg_out) 
// );
//main
//main_dut(
//    .a(clk),
//    .b(b)
//);
endmodule
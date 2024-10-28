module mux_n_to_1 #(
  parameter N = 9, 
  parameter m = 4
)(
  input [N-1:0] inp,
  input [m-1:0] select, 
  output out
);

  generate 
    if (N==1)
      assign out = inp[0];
    else if (N==2) begin
      assign out = (select[0]) ? inp[1] : inp[0]; 
    end
    else if (N>2) begin
      wire [1:0]temp;
      if ((N & (N-1))==0) begin
        mux_n_to_1 #(.N(N/2),.m(m-1)) M1 (.inp(inp[N/2-1:0]), .select(select[m-2:0]), .out(temp[0]) );
        mux_n_to_1 #(.N(N/2),.m(m-1))  M2 (.inp(inp[N-1:N/2]), .select(select[m-2:0]), .out(temp[1]) );
        assign out = (select[m-1]) ? temp[1] : temp[0];
      end
      else if (((N-1) & (N-2))==0) begin
        mux_n_to_1 #(.N(2**(m-1)),.m(m-1)) M4 (.inp(inp[(2**(m-1)-1):0]), .select(select[m-2:0]), .out(temp[0]) );
        assign temp[1] = inp[N-1];
        assign out = (select[m-1]) ? temp[1] : temp[0];
      end
      else if (((N-2) & (N-3))==0) begin
        mux_n_to_1 #(.N(2**(m-1)),.m(m-1)) M6 (.inp(inp[(2**(m-1)-1):0]), .select(select[m-2:0]), .out(temp[0]) );
        assign temp[1] = (select[0]) ? inp[N-1] : inp[N-2];
        assign out = (select[m-1]) ? temp[1] : temp[0];
      end
      else begin
        mux_n_to_1 #(.N(2**(m-1)),.m(m-1)) M8 (.inp(inp[(2**(m-1)-1):0]), .select(select[m-2:0]), .out(temp[0]) );
        mux_n_to_1 #(.N(N - (2**(m-1))),.m(m-1)) M9 (.inp(inp[N-1:(2**(m-1))]), .select(select[m-2:0]), .out(temp[1]) );
        assign out = (select[m-1]) ? temp[1] : temp[0];
      end
    end
  endgenerate
endmodule

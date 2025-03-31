module injetor(
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output reg [14:0] saida
);

// implemente seu código aqui

integer i;
  always @(*) begin
    saida = entrada; // Copia a entrada para a saída
    if (erro) begin
      for (i = 0; i < 15; i = i + 1) begin
        if (n == i) begin
          saida[i] = ~saida[i]; // Inverte o bit na posição especificada
        end
      end
    end
  end

endmodule

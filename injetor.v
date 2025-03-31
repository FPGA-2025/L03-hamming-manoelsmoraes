module injetor(
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output reg [14:0] saida
);

// implemente seu código aqui


  always @(*) begin
    saida = entrada; // Copia a entrada para a saída
    if (erro) begin
      saida[n] = ~saida[n]; // Inverte o bit na posição especificada
    end
  end

endmodule

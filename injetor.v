module injetor(
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output reg [14:0] saida
);

// implemente seu código aqui


  always @(*) begin
    saida = entrada;  // Inicializa a saída com o valor da entrada
    // if (erro) begin
     if (erro && (n < 15)) begin 
      // Se o erro for ativado, inverte o bit na posição especificada
      saida[n] = ~entrada[n];
    end
  end

endmodule

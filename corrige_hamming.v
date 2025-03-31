module corrige_hamming (
  input [14:0] entrada,  // Palavra de 15 bits (dados + paridade)
  output reg [10:0] saida  // Saída corrigida de 11 bits de dados
);

  wire p1, p2, p4, p8;
  wire [3:0] erro_pos;
  reg [14:0] corrigido;

  // Recalcula os bits de paridade com base nos dados recebidos
  assign p1 = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
  assign p2 = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
  assign p4 = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
  assign p8 = entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

  // Determina a posição do erro com base nos bits de paridade
  assign erro_pos = {p8, p4, p2, p1};  // A posição do erro é formada pela combinação dos bits de paridade

  always @(*) begin
    corrigido = entrada;  // Inicializa a palavra corrigida com a entrada original

    // Se erro_pos não for 0, existe um erro, e precisamos inverter o bit na posição indicada
    if (erro_pos != 4'b0000) begin
      corrigido[erro_pos - 1] = ~corrigido[erro_pos - 1];  // Inverte o bit na posição do erro
    end

    // Extrai os bits de dados corrigidos (somente os bits de dados, não os de paridade)
    saida = {corrigido[14], corrigido[13], corrigido[12], corrigido[11], corrigido[10], corrigido[9], corrigido[7], corrigido[6], corrigido[5], corrigido[3], corrigido[2]};
  end

endmodule

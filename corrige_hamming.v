module corrige_hamming (
  input [14:0] entrada, // a paridade é o bit mais significativo (dado[8])
  output reg [10:0] saida
);


// implemente o seu código aqui

wire p1, p2, p4, p8;
  wire [3:0] erro_pos;
  reg [14:0] corrigido;

  // Recalcula os bits de paridade com base nos dados recebidos
  assign p1 = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
  assign p2 = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
  assign p4 = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
  assign p8 = entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

  // Determina a posição do erro
  assign erro_pos = {p8, p4, p2, p1};

  always @(*) begin
    corrigido = entrada;
    
    // Se erro_pos não for 0, inverter o bit correspondente
    if (erro_pos != 4'b0000) begin
      corrigido[erro_pos - 1] = ~corrigido[erro_pos - 1];
    end
    
    // Extrai os bits de dados corrigidos
    saida = {corrigido[14], corrigido[13], corrigido[12], corrigido[11], corrigido[10], corrigido[9], corrigido[7], corrigido[6], corrigido[5], corrigido[3], corrigido[2]};
  end

endmodule

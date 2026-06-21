
def avaliar_transacao(valor, local_habitual, local_atual, limite_disponivel, hora_transacao):
    """
    Avalia o risco de fraude de uma transação bancária.
    Retorna o status ('Aprovada', 'Revisão Manual', 'Bloqueada') e o motivo.
    """
    # Regra 1: Valor excede o limite disponível do cartão
    if valor > limite_disponivel:
        return "Bloqueada", "Saldo/Limite insuficiente."
    
    # Regra 2: Localização impossível (Transação fora do país/local habitual na madrugada)
    if not local_habitual and (hora_transacao >= 23 or hora_transacao <= 5):
        if valor > 500:
            return "Bloqueada", "Suspeita de fraude geográfica em horário crítico."
        return "Revisão Manual", "Transação fora do padrão de localização noturna."
    
    # Regra 3: Valores atípicos muito elevados
    if valor > 10000:
        return "Revisão Manual", "Valor requer dupla autenticação (acima de 10k)."
        
    # Regra 4: Transação normal
    return "Aprovada", "Transação validada com sucesso."

# --- SIMULAÇÃO DE TESTES DO BANCO ---
if __name__ == "__main__":
    print("--- INICIANDO MOTOR DE ANÁLISE DE RISCO DE FRAUDE --- \n")
    
    # Caso 1: Cliente a comprar algo normal de dia
    status1, motivo1 = avaliar_transacao(45.90, True, True, 2000.00, 14)
    print(f"Transação 1: {status1} | Motivo: {motivo1}")
    
    # Caso 2: Tentativa de compra de madrugada num país diferente por valor alto
    status2, motivo2 = avaliar_transacao(1200.00, False, False, 5000.00, 3)
    print(f"Transação 2: {status2} | Motivo: {motivo2}")
    
    # Caso 3: Compra legítima mas de valor muito elevado que exige alerta
    status3, motivo3 = avaliar_transacao(15000.00, True, True, 20000.00, 16)
    print(f"Transação 3: {status3} | Motivo: {motivo3}")




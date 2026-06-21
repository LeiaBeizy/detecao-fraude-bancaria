# detecao-fraude-bancaria
# 🛡️ Sistema Inteligente de Deteção de Fraude Bancária

Este projeto simula um motor de regras de risco utilizado por instituições financeiras para validar transações de cartões de crédito em tempo real, mitigando fraudes e protegendo os ativos dos clientes.

## 💼 Contexto de Negócio
O sistema analisa variáveis comportamentais e operacionais (valor da compra, localização do cliente, saldo disponível e horário) para tomar decisões automatizadas de segurança antes que o pagamento seja processado.

## 🚀 Funcionalidades e Regras de Risco
* **Validação de Limite**: Bloqueio imediato se a compra exceder o saldo disponível.
* **Análise Geográfica Noturna**: Identificação de compras suspeitas em localizações atípicas durante a madrugada (horário de maior incidência de fraudes).
* **Alerta de Alta Volumetria**: Encaminhamento de transações acima de 10.000€ para revisão manual ou dupla autenticação.

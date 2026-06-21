## 🛠️ Tecnologias e Estrutura do Repositório

* **📂 `sql/`**: Contém o ficheiro `queries_fraude.sql` com o histórico de transações e métricas de inteligência de risco.
* **📄 `main.py`**: Motor de regras em Python que processa e avalia as transações em tempo real.

## 📊 Análise Histórica de Fraude (SQL)

Para criar métricas macro de segurança, estruturamos uma query que agrupa as decisões tomadas pelo motor e calcula a volumetria de risco:

```sql
SELECT 
    status_final,
    COUNT(transacao_id) AS total_transacoes,
    ROUND(COUNT(transacao_id) * 100.0 / (SELECT COUNT(*) FROM transacoes), 2) AS percentual_do_total
FROM transacoes
GROUP BY status_final;
```

### 📈 Volumetria e Resultados Visuais

A integração do Python com a base de dados SQLite gera automaticamente o seguinte gráfico de distribuição de risco:

![Volumetria de Transações por Decisão de Risco](grafico_volumetria_fraude.png)

* **Interpretação de Negócio**: O gráfico demonstra que 50% das transações foram validadas com sucesso, enquanto 30% foram bloqueadas preventivamente por comportamento suspeito na madrugada e 20% exigiram dupla autenticação por valores elevados.

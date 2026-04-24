# Stored Functions(Funções Armazenadas)

## Definição
Blocos de código SQL e procedurais (PL/pgSQL) que são armazenados no banco de dados e executados no lado do servidor.

### Vantagens:
* **Reuso de Código:** Evita a repetição de lógica de negócios.
* **Performance:** Reduz o tráfego de rede (execução local) e utiliza planos de execução otimizados.
* **Segurança:** Permite que usuários executem lógica complexa sem ter acesso direto às tabelas subjacentes.

### Distinção (Função vs. Procedure)
No PostgreSQL, a diferença principal é que funções devem retornar um valor, enquanto procedures podem ser chamadas diretamente e são mais usadas para tarefas transacionais (e foram adicionadas mais recentemente). Focaremos em Funções.

---

## Tipos de variáveis
- **INTEGER:** número inteiro comum (ex: 10, 200, -5)
- **BIGINT:** inteiro maior, usado para valores muito grandes
- **NUMERIC:** número decimal com alta precisão (ideal para dinheiro)
- **DOUBLE PRECISION:** número decimal com ponto flutuante (mais rápido, menos preciso)
- **TEXT:** texto de tamanho ilimitado
- **VARCHAR(n):** texto com limite de caracteres definido
- **CHAR(n):** texto de tamanho fixo (preenchido com espaços)
- **DATE:** armazena apenas a data (ano, mês, dia)
- **TIME:** armazena apenas a hora
- **TIMESTAMP:** armazena data e hora juntos
- **BOOLEAN:** valor lógico: TRUE, FALSE ou NULL

----

#### Links

![Video 01](https://www.youtube.com/watch?v=F-D1jzqt1q4&t=3s)

![Video 02](https://youtu.be/h-ZHa-ou6kQ?si=8-XNx6XfDfB3-g77)

![Video 03](https://www.youtube.com/watch?v=EblKNoUXaWQ)

![Video 04](https://youtu.be/jGNF7Lfdf68?si=FO9KQ5tkJc_nOZEO)
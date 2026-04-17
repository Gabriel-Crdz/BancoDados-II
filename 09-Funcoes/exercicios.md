## 1. (Strings) 
O setor de TI precisa criar um "login" padrão para os vendedores acessarem o sistema.
Escreva uma consulta que retorne o nome do vendedor e uma coluna chamada login 
contendo apenas o primeiro nome dele, todo em letras minúsculas.
```sql
SELECT nome, LOWER(SPLIT_PART(nome, ' ', 1)) AS login FROM vendedor
```

## 2. (Numéricos) 
A gerência financeira quer saber o valor que está parado no estoque. 
Retorne a descricao do produto e o valor_total_estoque (que é a multiplicação da quantidade atual pelo preço). 
Arredonde o resultado final para duas casas decimais.
```sql
SELECT descricao, ROUND((qtde * preco), 2) AS valor_total_estoque FROM produto;
```

## 3. (Datas) 
Para a campanha de fidelidade de aniversário, precisamos saber a idade exata dos clientes. 
Crie uma consulta que mostre o nome do cliente e a sua idade exata 
(em anos, meses e dias) calculada até a data de hoje.
```sql
SELECT nome, AGE(CURRENT_DATE, data_nasc) AS aniversario FROM cliente;
```

## 4. (Strings e Numéricos) 
Por conta da LGPD (Lei Geral de Proteção de Dados), 
precisamos de um relatório que mostre o nome do cliente e o CPF mascarado. 
Retorne o nome e uma coluna chamada cpf_oculto mostrando 
apenas os 3 primeiros dígitos do CPF, seguidos de "\*\**" (Exemplo: 123***).
```sql
SELECT nome, SUBSTRING(cpf FROM 1 FOR 3) || '********'  AS cpf_oculto FROM cliente;
```

## 5. (Datas) 
A política da loja permite a devolução de produtos até 7 dias após a compra. 
Escreva uma consulta na tabela de vendas que retorne o id_venda, a data da venda 
(apenas a data, sem a hora) e uma coluna chamada data_limite_devolucao adicionando 7 dias à data da venda.
```sql
SELECT id_venda, TO_CHAR(data_venda, 'DD/MM/YYYY') AS data_venda, 
TO_CHAR((data_venda + INTERVAL '7 days'), 'DD/MM/YYYY') AS data_limite_devolucao 
FROM venda;
```

## 6. (Numéricos) 
Vamos calcular o pagamento mensal da equipe. 
Retorne o nome do vendedor, o salário base, a comissão e o salario_total (salário + comissão). 
O valor do salário total deve ser truncado (sem arredondar, apenas cortando os centavos) para facilitar o depósito.
```sql
SELECT nome, salario, comissao, TRUNC((salario + comissao), 0) AS salario_total FROM vendedor;
```

## 7. (Strings) 
A equipe de design vai montar um catálogo impresso e precisa analisar o tamanho dos textos. 
Retorne a descricao do produto toda em letras maiúsculas e uma coluna mostrando 
a quantidade de caracteres que cada descrição possui.
```sql
SELECT UPPER(descricao), LENGTH(descricao) AS tamanho FROM produto;
```

## 8. (Numéricos) 
Precisamos verificar a urgência de reposição do estoque.
Calcule a diferença entre a quantidade atual (qtde) e a quantidade mínima (qtde_min) dos produtos. 
Para evitar resultados negativos caso o estoque esteja abaixo do mínimo, exiba a diferença sempre em valor absoluto.
```sql
SELECT id_produto, ABS(qtde - qtde_min) AS diferenca FROM produto; 
```

## 9. (Datas) 
O setor de marketing quer agrupar os clientes por geração. 
Retorne o nome do cliente e uma coluna chamada ano_nascimento que extraia apenas o ano da data de nascimento.
```sql
SELECT nome,  EXTRACT(YEAR FROM data_nasc) AS ano_nascimento 
FROM cliente ORDER BY ano_nascimento ASC;
```

## 10. (Strings e Datas) 
Vamos criar etiquetas personalizadas para o mural da empresa. 
Usando concatenação, crie uma frase para cada vendedor no exato formato:
**"O vendedor(a) [\NOME] nasceu no ano de [\ANO]"**. Chame a coluna de etiqueta_mural.
```sql
SELECT CONCAT('O vendedor(a) ', nome , ' nasceu no ano de ' , EXTRACT(YEAR FROM data_nasc)) AS etiqueta_mural FROM vendedor;
```
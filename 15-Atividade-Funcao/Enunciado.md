Modele uma base de dados para gerenciar as vendas de uma loja de produtos esportivos,
devendo atender os seguintes requisitos:
● Os produtos devem possuir um cadastro completo, e o um relatório para auxiliar ao
gerente de quando e quanto deve comprar mais de um determinado produto.
● Deve haver um processo de gerenciamento de fornecedores levando em
consideração quanto tempo cada produto demora para chegar ao estoque,
considerando a compra e o recebimento.
● O cadastro dos clientes devem possuir Nome, CPF, Rg, Endereço Completo e
Telefone.
● O cadastro dos vendedores deve possuir codigo, nome, endereço, telefone, celular
e CPF.
A funcionalidade vendas deve obedecer as seguintes regras:
● As vendas são realizadas por um vendedor, e deve ser possível descobrir o total da
venda, data, hora e cliente que está comprando.
● Os vendedores recebem um salário, registrado de forma individual, e uma comissão
em percentual, que varia de produto para produto.
● Poderão ser realizadas vendas à vista ou a prazo, quando a prazo, deve haver um
registro de percentual e aumento no total da venda, de acordo com o total de
parcelas, por exemplo: 2x – 5%, 3x – 7%, 4x 8%, etc.
● Vendas a prazo devem criar parcelas de pagamento, com sua data de vencimento e
valor, atrasos em pagamentos geram multa por atraso, as multas por atraso devem
estar em um local que possa ser alterado de acordo com a necessidade do cliente.
● Vendas em dinheiro podem não estar relacionadas a um Cliente.
● Uma função para auxiliar na compra deve implementar a carga dos produtos no
estoque.
● O sistema irá finalizar as vendas e baixar do estoque os produtos, sempre que for
acionada a função finaliza_venda.
● A base de dados deve manter as formas normais.
Entrega SQL:
1. SQL DDL da especificação da base de dados de todas as tabelas.
2. SQL DML - Inserção de 5 vendedores, 20 produtos, 10 clientes e 30 vendas, cada cliente e
cada vendedor deve possuir pelo menos 4 registros relacionados a vendas.
3. SELECT - Consulta que apresente os 3 vendedores que tiveram maior total de vendas em
determinado mês.
4. SELECT - Consulta que apresente os 3 clientes que gastaram mais dinheiro na loja em todos
os tempos.
5. SELECT - Consulta que calcule a soma do salário mais a comissão de vendas por vendedor.
6. SELECT - Consulta que verifique os produtos que já atingiram a quantidade mínima de
estoque e qual a quantidade de produtos que deve ser comprada.
7. SELECT - Consulta que apresente o total das vendas em dinheiro e o total a prazo em
determinado período.
8. SELECT – Que verifique se as quantidades em estoque, as quantidades vendidas e as
quantidades compradas representam o estoque dos produtos corretamente. A função dessa
consulta é determinar se algum produto sumiu do estoque.
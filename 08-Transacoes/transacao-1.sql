BEGIN; -- Inicia a transação
/* Apertir daqui quaisquer comandos executados não ficaram definitivamente no banco */
/* Ou, todos dão certo ou nada é feito! Qualquer erro a transação é abortado! */

/* Inserindo a venda */
INSERT INTO venda(id_vendedor, id_cliente, data_venda, total, status) 
VALUES (2, 2, now(), 0, 0);

SELECT * FROM venda; -- Verificação

/* Inserindo o item da venda */
INSERT INTO item_venda(id_venda, id_produto, qtde, preco)
VALUES
(8, 5, 2, (SELECT preco FROM produto WHERE id_produto = 5)); -- Sub-Select para pegar o preço

SELECT * FROM item_venda; -- Verificação

/* Atualizando a quantidade de itens no estoque */
UPDATE produto SET qtde = (SELECT qtde-2 FROM produto WHERE id_produto = 5) WHERE id_produto = 5; -- Sub-Select para pegar a quantidade

SELECT * FROM produto WHERE id_produto = 5; -- Verificação

SELECT SUM(qtde * preco) FROM item_venda WHERE id_venda = 8;

/* Adicionando o preco total da venda */
UPDATE venda SET total = (SELECT SUM(qtde * preco) FROM item_venda WHERE id_venda = 8) WHERE id_venda = 8; -- Sub-Select para pegar o total

COMMIT; -- Salvando a transação no banco definitivamente
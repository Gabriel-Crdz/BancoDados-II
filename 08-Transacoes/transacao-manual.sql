
/* Fazendo a venda */
-- Cria a venda
INSERT INTO venda 
VALUES
(6, 3, 2, now(), 0, 0);

-- Adiciona os itens da venda
INSERT INTO item_venda
VALUES
(6, 5, 2, 3973,82);

-- Alterando o estoque
UPDATE produto SET qtde = 8 WHERE id_produto = 5;

/* Desfazendo a venda */

UPDATE produto SET qtde = 10 WHERE id_produto = 5;

DELETE FROM item_venda WHERE id_venda = 6;

DELETE FROM venda WHERE id_venda = 6;
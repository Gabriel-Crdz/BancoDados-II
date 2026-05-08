
/* VERSÃO 1.0 */
-- registrando o item_venda 
CREATE OR REPLACE FUNCTION inserir_item_venda(
    p_id_venda INTEGER,
    p_id_produto INTEGER, 
    p_qtde INTEGER
) RETURNS BOOLEAN
LANGUAGE plpgsql AS $$
DECLARE
    v_preco NUMERIC;
BEGIN
    IF verificar_estoque_2(p_id_produto, p_qtde) THEN
        UPDATE produto SET qtde = qtde - p_qtde WHERE id_produto = p_id_produto;
    ELSE
        RETURN FALSE;
    END IF;

    SELECT preco INTO v_preco FROM produto WHERE id_produto = p_id_produto;

    INSERT INTO item_venda(id_venda, id_produto, preco, qtde)
    VALUES(p_id_venda, p_id_produto, v_preco, p_qtde);
    
    RETURN TRUE;
END;
$$;

SELECT * FROM produto;

SELECT inserir_item_venda(20, 12, 22); -- Retorna FALSE, por que a qtde de venda é maior que a qtde no estoque

SELECT inserir_item_venda(20, 12, 5); -- Retorna TRUE, e atualiza a tabela produto decrementendo a qtde do produto, e inserindo na tabela item_venda

/* VERSÃO 1.2 */
-- Calculando o preço total da venda
CREATE OR REPLACE FUNCTION inserir_item_venda(
    p_id_venda INTEGER,
    p_id_produto INTEGER, 
    p_qtde INTEGER
) RETURNS BOOLEAN
LANGUAGE plpgsql AS $$
DECLARE
    v_preco NUMERIC;
    v_total NUMERIC;
BEGIN
    IF verificar_estoque_2(p_id_produto, p_qtde) THEN
        UPDATE produto SET qtde = qtde - p_qtde WHERE id_produto = p_id_produto;
    ELSE
        RETURN FALSE;
    END IF;

    SELECT preco INTO v_preco FROM produto WHERE id_produto = p_id_produto;

    INSERT INTO item_venda(id_venda, id_produto, preco, qtde)
    VALUES(p_id_venda, p_id_produto, v_preco, p_qtde);
    
    SELECT SUM(preco * qtde) INTO v_total FROM item_venda WHERE id_venda = p_id_venda;

    UPDATE venda SET total = v_total WHERE id_venda = p_id_venda;

    RETURN TRUE;
END;
$$;

SELECT inserir_item_venda(20, 13, 3);

SELECT * FROM venda;
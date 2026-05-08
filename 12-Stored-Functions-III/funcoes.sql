CREATE OR REPLACE FUNCTION verificar_estoque(
    p_id_produto INTEGER,
    p_qtde INTEGER
) RETURNS TEXT
LANGUAGE plpgsql AS $$
DECLARE
    v_estoque INTEGER;
BEGIN
    SELECT qtde
    INTO v_estoque -- Passa o valor da query para a variavel
    FROM produto
    WHERE id_produto = p_id_produto;

    IF v_estoque < p_qtde THEN
        RETURN 'Estoque Insuficiente!';
    END IF;

    RETURN 'Venda Permitida!';

END;
$$;

SELECT verificar_estoque(12, 2);

/*Quando a função realiza uma validação que sera usa por outra função e melhor usar um retorno de variavel logica, *retornar texto apenas quando for mostrar o informação! */
CREATE OR REPLACE FUNCTION verificar_estoque_2(
    p_id_produto INTEGER,
    p_qtde INTEGER
) RETURNS BOOLEAN
LANGUAGE plpgsql AS $$
DECLARE
    v_estoque INTEGER;
BEGIN
    SELECT qtde
    INTO v_estoque
    FROM produto
    WHERE id_produto = p_id_produto;

    IF v_estoque < p_qtde THEN
        RETURN FALSE;
    END IF;

    RETURN TRUE;

END;
$$;

SELECT verificar_estoque_2(12, 20);

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION estoque_critico(p_id_produto INTEGER)
RETURNS TEXT
LANGUAGE plpgsql AS $$
DECLARE
    v_qtde INTEGER;
BEGIN
    SELECT qtde INTO v_qtde
    FROM produto
    WHERE id_produto = p_id_produto;

    IF v_qtde <= 2 THEN
        RETURN 'ESTOQUE CRITICO!';
    ELSIF v_qtde <= 5 THEN
        RETURN 'Estoque baixo';
    END IF;

    RETURN 'Estoque normal';

END;
$$;

SELECT estoque_critico(10);

/* No banco existe atributos de controle para qtde minima de produtos, e recomendado usar ela para fazer a validação do estoque critico */
CREATE OR REPLACE FUNCTION estoque_critico(p_id_produto INTEGER)
RETURNS TEXT
LANGUAGE plpgsql AS $$
DECLARE
    v_qtde INTEGER;
    v_qtde_min INTEGER;
BEGIN
    SELECT qtde INTO v_qtde FROM produto
    WHERE id_produto = p_id_produto;

    SELECT qtde_min INTO v_qtde_min FROM produto
    WHERE id_produto = p_id_produto;

    IF v_qtde <= FLOOR(v_qtde_min / 2) THEN -- Sempre arredondar o valor para nao dar erro, já que o estoque trabalha com tipo inteiro 
        RETURN 'ESTOQUE CRITICO!';
    ELSIF v_qtde <= v_qtde_min THEN
        RETURN 'Estoque baixo';
    END IF;

    RETURN 'Estoque normal';

END;
$$;

SELECT estoque_critico(5);

---------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION ajustar_precos(p_perc NUMERIC) RETURNS BOOLEAN
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE produto SET preco = preco + (preco * p_perc / 100);
    RETURN TRUE;

END;
$$;

SELECT ajustar_precos(10);

---------------------------------------------------------------------------------------

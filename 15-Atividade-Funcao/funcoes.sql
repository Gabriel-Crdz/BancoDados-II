# 3. FUNCTIONS

CREATE OR REPLACE FUNCTION finaliza_venda(p_id_venda INT)
RETURNS VOID AS $$
DECLARE
    item RECORD;
BEGIN

    -- Validar estoque
    FOR item IN
        SELECT id_produto, quantidade
        FROM itens_venda
        WHERE id_venda = p_id_venda
    LOOP

        IF (
            SELECT quantidade
            FROM estoque
            WHERE id_produto = item.id_produto
        ) < item.quantidade THEN

            RAISE EXCEPTION 'Estoque insuficiente';
        END IF;

    END LOOP;

    -- Baixar estoque
    FOR item IN
        SELECT id_produto, quantidade
        FROM itens_venda
        WHERE id_venda = p_id_venda
    LOOP

        UPDATE estoque
        SET quantidade = quantidade - item.quantidade
        WHERE id_produto = item.id_produto;

        INSERT INTO movimentacao_estoque(
            id_produto,
            tipo,
            quantidade,
            observacao
        )
        VALUES (
            item.id_produto,
            'S',
            item.quantidade,
            'Venda finalizada'
        );

    END LOOP;

    UPDATE vendas
    SET status = 'FINALIZADA'
    WHERE id_venda = p_id_venda;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION receber_compra(p_id_compra INT)
RETURNS VOID AS $$
DECLARE
    item RECORD;
BEGIN

    FOR item IN
        SELECT id_produto, quantidade
        FROM itens_compra
        WHERE id_compra = p_id_compra
    LOOP

        INSERT INTO estoque(id_produto, quantidade)
        VALUES(item.id_produto, item.quantidade)

        ON CONFLICT (id_produto)
        DO UPDATE
        SET quantidade = estoque.quantidade + EXCLUDED.quantidade;

        INSERT INTO movimentacao_estoque(
            id_produto,
            tipo,
            quantidade,
            observacao
        )
        VALUES(
            item.id_produto,
            'E',
            item.quantidade,
            'Recebimento de compra'
        );

    END LOOP;

    UPDATE compras
    SET
        status = 'RECEBIDA',
        data_recebimento = CURRENT_DATE
    WHERE id_compra = p_id_compra;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gerar_parcelas(
    p_id_venda INT,
    p_qtd_parcelas INT
)
RETURNS VOID AS $$
DECLARE
    v_total NUMERIC(10,2);
    v_valor_parcela NUMERIC(10,2);
    i INT;
BEGIN

    SELECT total_final
    INTO v_total
    FROM vendas
    WHERE id_venda = p_id_venda;

    v_valor_parcela := v_total / p_qtd_parcelas;

    FOR i IN 1..p_qtd_parcelas LOOP

        INSERT INTO parcelas(
            id_venda,
            numero_parcela,
            data_vencimento,
            valor
        )
        VALUES(
            p_id_venda,
            i,
            CURRENT_DATE + (30 * i),
            v_valor_parcela
        );

    END LOOP;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION aplicar_multa()
RETURNS VOID AS $$
DECLARE
    v_multa NUMERIC(5,2);
BEGIN

    SELECT multa_atraso_percentual
    INTO v_multa
    FROM configuracoes_financeiras
    LIMIT 1;

    UPDATE parcelas
    SET multa = valor * (v_multa / 100)
    WHERE
        status = 'PENDENTE'
        AND data_vencimento < CURRENT_DATE;

END;
$$ LANGUAGE plpgsql;

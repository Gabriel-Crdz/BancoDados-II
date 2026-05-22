CREATE TABLE parcela(
    id_parcela SERIAL PRIMARY KEY,
    num_parcela INTEGER NOT NULL CHECK(num_parcela >= 2 OR num_parcela <= 12),
    data_pagamento TIMESTAMP NULL,
    data_vencimento DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    id_venda INTEGER NOT NULL REFERENCES venda(id_venda)
)

CREATE OR REPLACE FUNCTION calcular_parcela(p_id_venda INTEGER, p_acrescimo NUMERIC, p_num_parcela INTEGER)
RETURNS BOOLEAN AS $$
DECLARE
    v_valor_parcela NUMERIC(7, 2);
    v_data_vencimento DATE;
    v_valor_venda NUMERIC(7, 2);
BEGIN
    if p_num_parcela < 2 OR p_num_parcela > 12 THEN
        RETURN FALSE;
    END IF;

    SELECT total INTO v_valor_venda FROM venda WHERE id_venda = p_id_venda; -- Obtem o valor total da venda

    SELECT DATE(data_venda) INTO v_data_vencimento FROM venda WHERE id_venda = p_id_venda; -- Obtem a data da venda

    v_valor_parcela := (v_valor_venda / p_num_parcela) * (1 + (p_acrescimo / 100)); -- Calcula o juros simples da venda

    FOR i IN 1..p_num_parcela LOOP
        v_data_vencimento := v_data_vencimento + INTERVAL '1 month'; -- Calcula o vencimento da proxima parcela

        INSERT INTO parcela(num_parcela, data_pagamento, data_vencimento, valor, id_venda)
        VALUES(i, NULL, v_data_vencimento, v_valor_parcela, p_id_venda);
    END LOOP;
    
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

SELECT calcular_parcela(5, 10, 12);

SELECT * FROM parcela;


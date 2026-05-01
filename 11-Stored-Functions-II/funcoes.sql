/* 
* No postgreSQL as funções possuem polimorfismo,
* enquanto os parâmetros forem diferentes todas elas são validas com o mesmo nome
*/

CREATE OR REPLACE FUNCTION soma()
RETURNS INTEGER AS $$
DECLARE
    x INTEGER := 10;
BEGIN   
    x := x + 5;
    RETURN x;
END;
$$ LANGUAGE plpgsql;

SELECT soma ();

CREATE OR REPLACE FUNCTION soma(p_y INTEGER)
RETURNS INTEGER AS $$
DECLARE
    v_x INTEGER := 10;
BEGIN   
    v_x := v_x + p_y;
    RETURN v_x;
END;
$$ LANGUAGE plpgsql;

SELECT soma (12);

CREATE OR REPLACE FUNCTION soma(p_x INTEGER, p_y INTEGER)
RETURNS INTEGER AS $$
BEGIN   
    RETURN p_x + p_y;
END;
$$ LANGUAGE plpgsql;

SELECT soma (12, 10);

---------------------------------------------------------------------------------------

/* IF-ELSE */

CREATE FUNCTION verifica_idade(idade INTEGER)
RETURNS TEXT AS $$
BEGIN
   IF idade >= 18 THEN
       RETURN 'Maior de idade';
   ELSE
       RETURN 'Menor de idade';
   END IF;
END;
$$ LANGUAGE plpgsql;

SELECT verifica_idade (23);

/* Versão com ELSIF */

CREATE OR REPLACE FUNCTION verifica_idade(idade INTEGER)
RETURNS TEXT AS $$
BEGIN
    IF idade < 12 THEN
        RETURN 'Criança';
    ELSIF idade < 18 THEN
        RETURN 'Adolescente';
    ELSIF idade < 40 THEN
        RETURN 'Adulto';
    ELSIF idade < 60 THEN
        RETURN 'Meia Idade';
    ELSIF idade < 70 THEN
        RETURN 'Idoso';
    ELSE
        RETURN 'Melhor Idade!';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT verifica_idade(74);

/* Versão CASE */

CREATE OR REPLACE FUNCTION verificar_idade(idade INTEGER)
RETURNS TEXT AS $$
DECLARE
    categoria TEXT;
BEGIN
    CASE
        WHEN idade < 0 THEN
            categoria := 'idade inválida';
        WHEN idade < 12 THEN
            categoria := 'criança';
        WHEN idade < 18 THEN
            categoria := 'adolescente';
        WHEN idade < 60 THEN
            categoria := 'adulto';
        ELSE
            categoria := 'idoso';
    END CASE;
    RETURN categoria;
END;
$$ LANGUAGE plpgsql;

SELECT verificar_idade(10)

---------------------------------------------------------------------------------------

/* WHILE */

CREATE FUNCTION contador()
RETURNS INTEGER AS $$
DECLARE
   i INTEGER := 1;
BEGIN
   WHILE i <= 5 LOOP
       i := i + 1;
   END LOOP;

   RETURN i;
END;
$$ LANGUAGE plpgsql;

SELECT contador();

CREATE OR REPLACE FUNCTION contador(p_y INTEGER)
RETURNS INTEGER AS $$
DECLARE
   i INTEGER := 0;
BEGIN
   WHILE i <= p_y LOOP
       i := i + 1;
       RAISE NOTICE '%', i; -- Mostra os valores do "i" durante o loop
   END LOOP;

   RETURN i;
END;
$$ LANGUAGE plpgsql;

SELECT contador(100);

---------------------------------------------------------------------------------------

/* FOR */

CREATE FUNCTION soma_loop()
RETURNS INTEGER AS $$
DECLARE
   total INTEGER := 0;
BEGIN
   FOR i IN 1..5 LOOP
       total := total + i;
   END LOOP;

   RETURN total;
END;
$$ LANGUAGE plpgsql;

SELECT soma_loop();

CREATE OR REPLACE FUNCTION soma_loop()
RETURNS INTEGER AS $$
DECLARE
   total INTEGER := 0;
BEGIN
   FOR i IN 1..5 LOOP
       total := total + i;
       RAISE NOTICE '%', total;
   END LOOP;

   RETURN total;
END;
$$ LANGUAGE plpgsql;

SELECT soma_loop();

---------------------------------------------------------------------------------------

CREATE or REPLACE FUNCTION contador_2(limite INTEGER)
RETURNS INTEGER AS $$
DECLARE
    contador INTEGER := 0;
    soma INTEGER := 0;
BEGIN
    -- IF: Valida o parâmetro
    IF limite <= 0 THEN 
        RAISE NOTICE 'Limite invalido: %', limite;
        return 0;
    END IF;

    -- WHILE: Soma de 1 até limite
    WHILE contador < limite LOOP 
        contador := contador + 1;
        soma := soma + contador;
    END LOOP;

    RAISE NOTICE 'Soma com WHILE: %', soma;

    soma := 0; -- Zerando soma

    -- FOR: soma novamente de forma diferente
    FOR i IN 1..limite LOOP
        soma := soma + i;
    END LOOP;

    RAISE NOTICE 'Soma com FOR: %', soma;

    RETURN soma;
END;
$$ LANGUAGE plpgsql;

SELECT contador_2(20);
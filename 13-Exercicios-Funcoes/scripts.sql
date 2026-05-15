
1. Verificador de Paridade
CREATE OR REPLACE FUNCTION verificar_paridade(p_valor INTEGER) 
RETURNS TEXT AS $$
BEGIN
    IF (p_valor % 2) = 0 THEN  
        RETURN 'PAR';
    ELSE
        RETURN 'IMPAR';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT verificar_paridade(2);

2. Calculadora de Idade Exata
CREATE OR REPLACE FUNCTION calcular_idade(p_data_nasc DATE)
RETURNS INTEGER AS $$
DECLARE v_idade INTEGER;
BEGIN
    v_idade := EXTRACT(YEAR FROM AGE(p_data_nasc))::INTEGER;
    RETURN v_idade;
END;
$$ LANGUAGE PLPGSQL;

SELECT calcular_idade('2007-01-15');

3. Cálculo de Fatorial
CREATE OR REPLACE FUNCTION fatorial(p_num INTEGER)
RETURNS INTEGER AS $$
DECLARE fat INTEGER := 1;
BEGIN
    FOR i IN 1 .. p_num LOOP
        fat := fat * i;
    END LOOP;
    RETURN fat;
END;
$$ LANGUAGE plpgsql;

SELECT fatorial(5);

4. Inversor de Texto
CREATE OR REPLACE FUNCTION inverter_texto(p_texto VARCHAR(80))
RETURNS VARCHAR(80) AS $$
DECLARE invertido VARCHAR(80) := '';
BEGIN
    FOR i IN 1..LENGTH(p_texto) LOOP
        invertido := SUBSTRING(p_texto FROM i FOR 1) || invertido;
    END LOOP;
    RETURN invertido;
END;
$$ LANGUAGE plpgsql;

SELECT inverter_texto('ALCIONE');

5. Saudação por Turno
CREATE OR REPLACE FUNCTION saudacao(p_data TIMESTAMP)
RETURNS TEXT AS $$
DECLARE hora INTEGER;
BEGIN
    hora := EXTRACT(HOUR FROM p_data);
    IF hora >= 6  AND hora < 12 THEN
        RETURN 'BOM DIA';
    ELSIF hora >= 12 AND hora < 18 THEN
        RETURN 'BOA TARDE';
    ELSE 
        RETURN 'BOA NOITE';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT saudacao('2020-02-02 00:59:00');

6. Somatório de Pares em um Intervalo
OBS: Adicionei um validação para que independente da ordem dos valores a função retorne o soma sempre
CREATE OR REPLACE FUNCTION somar_pares(p_num1 INTEGER, p_num2 INTEGER)
RETURNS INTEGER AS $$
DECLARE 
    resultado INTEGER := 0;
BEGIN
    IF p_num1 < p_num2 THEN
        FOR i IN p_num1..p_num2 LOOP
            IF (i % 2) = 0 THEN 
                resultado := resultado + i;
            END IF;
        END LOOP;
    ELSE
        FOR i IN p_num2..p_num1 LOOP
            IF (i % 2) = 0 THEN 
                resultado := resultado + i;
            END IF;
        END LOOP;
    END IF;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

SELECT somar_pares(10 , 0);

7.Validador de E-mail Simples
CREATE OR REPLACE FUNCTION validar_email(p_email VARCHAR(80))
RETURNS TEXT AS $$
BEGIN
    IF POSITION('@' IN p_email) > 0 AND
    POSITION('.' IN SUBSTRING(p_email FROM POSITION('@' IN p_email))) > 0 THEN
        RETURN 'VALIDO';
    ELSE    
        RETURN 'INVALIDO';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT validar_email('carlos.email');

8. Contador de Vogais
CREATE OR REPLACE FUNCTION contar_vogais(p_texto TEXT)
RETURNS INTEGER AS $$
DECLARE 
    qtde INTEGER := 0;
    caractere CHAR;
BEGIN
    FOR i IN 0..LENGTH(p_texto) LOOP
        caractere := SUBSTRING(p_texto FROM i FOR 1);

        IF caractere = 'a' OR caractere = 'e' OR caractere = 'i' OR caractere = 'o' OR caractere = 'u' THEN
            qtde := qtde + 1;
        END IF;
    END LOOP;

    RETURN qtde;
END;
$$ LANGUAGE plpgsql;

SELECT contar_vogais('carlos');

9. Classificador de Dia da Semana
CREATE OR REPLACE FUNCTION classificar_dias(p_data DATE)
RETURNS TEXT AS $$
DECLARE 
    num_dia INTEGER := 0;
BEGIN
    num_dia := EXTRACT(DOW FROM p_data);
    IF num_dia > 0 AND num_dia < 6 THEN
        RETURN 'DIA UTIL';
    ELSE
        RETURN 'FIM DE SEMANA';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT classificar_dias('2007-01-15');

10. Gerador de Código de Matrícula
CREATE OR REPLACE FUNCTION codigo_matricula(p_nome VARCHAR(80), p_data DATE)
RETURNS TEXT AS $$
DECLARE
    matricula VARCHAR(80);
BEGIN
    matricula := UPPER(SUBSTRING(p_nome FROM 1 FOR 3)) || EXTRACT(YEAR FROM P_data)::VARCHAR || LENGTH(p_nome)::VARCHAR;
    RETURN matricula;
END;
$$ LANGUAGE plpgsql;

SELECT codigo_matricula('gabriel', '2007-03-02');
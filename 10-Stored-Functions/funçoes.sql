CREATE OR REPLACE FUNCTION hello_world()
RETURNS text AS $$
DECLARE
BEGIN
	RETURN 'Hello World!';
END;
$$ LANGUAGE plpgsql;

SELECT hello_world(); -- Retorna: 'Hello World'

CREATE OR REPLACE FUNCTION hello_world_2()
RETURNS TEXT AS $$
DECLARE
	mensagem TEXT := 'Hello World 2!';
	notificacao TEXT := 'AVISO: Hello World foi Executado!';
BEGIN
	RAISE NOTICE '%', notificacao;
	RETURN mensagem;
END;
$$ LANGUAGE plpgsql;
SELECT hello_world_2(); -- Retorna: 'AVISO: Hello World foi Executado!'

CREATE OR REPLACE FUNCTION hello_world_3()
RETURNS TEXT AS $$
DECLARE
	mensagem TEXT := 'Hello World 3!';
	notificacao TEXT := 'AVISO: Hello World foi Executado!';
BEGIN
	RAISE EXCEPTION 'CUIDADO: %', notificacao; -- Lança a mensagem com erro
	RETURN mensagem;
END;
$$ LANGUAGE plpgsql;

SELECT hello_world_3(); 

CREATE OR REPLACE FUNCTION hello_world_4(p_msg TEXT)
RETURNS TEXT AS $$
DECLARE
	mensagem TEXT := 'Hello World 4!';
BEGIN
	RETURN mensagem || ' - ' || p_msg;
END;
$$ LANGUAGE plpgsql;

SELECT hello_world_4('Carlos'); 

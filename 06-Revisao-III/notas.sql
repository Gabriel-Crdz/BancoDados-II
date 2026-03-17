/* Uso do WHERE */
UPDATE planetas SET habitantes = 8100000000 WHERE nome = 'Terra';

DELETE FROM planetas WHERE nome = 'Pluto';

DELETE FROM planetas WHERE id = 1; -- Não excluir por conta da integridade referencial

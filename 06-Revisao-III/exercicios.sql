/* 1. Atualize Arrakis para 2000000 habitantes */
UPDATE planetas SET habitantes = 2000000 WHERE nome = 'Arrakis';

/*Aumente 500 habitantes de planetas com menos de 1 milhão */
UPDATE planetas SET habitantes = habitantes + 500 WHERE habitantes < 1000000;

/* 3. Delete satelites */
DELETE FROM satelites WHERE diametro < 600;

/* 4. Delete planetas da galaxia 13 */

DELETE FROM planetas WHERE idGalaxia = 13;

/* DESAFIO */
/*
1. Criar planeta 'Pandora2'
2. Criar 3 satelites
3. Usar ON DELETE CASCADE
4. Deletar o planeta
5. Verificar se os satelites deletaram 
*/

INSERT INTO planetas VALUES
(51, 'Pandora-2', 400000, 6, 9);

INSERT INTO satelites(nome, idPlaneta, diametro) VALUES
('Breno', 51, 1200),
('Vinicius', 51, 190),
('Guilherme', 51, 8443);

ALTER TABLE satelites
DROP CONSTRAINT fk_planeta WHERE fk_planeta = 51;

ALTER TABLE satelites
ADD CONSTRAINT fk_planeta
    FOREIGN KEY(idPlaneta)
    REFERENCES planetas(id)
ON DELETE CASCADE; 
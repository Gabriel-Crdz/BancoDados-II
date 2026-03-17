/* Regras de Exclusão (Foreign Key) */

RESTRICT / NO ACTION -- Impede excluir se houver registros filhos

CASCADE -- Exclui pai apaga automaticamente os filhos

SET NULL -- Filhos permanecem mas FK vira NULL

SET DEFAULT -- Filhos recebem valor padrão da coluna

----------------------------------------------------------
-- Exemplo:

ALTER TABLE satelites
DROP CONSTRAINT fk_planeta;

ALTER TABLE satelites
ADD CONSTRAINT fk_planeta
    FOREIGN KEY(idPlaneta)
    REFERENCES planetas(id)
ON DELETE CASCADE; 

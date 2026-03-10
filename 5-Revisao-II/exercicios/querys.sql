/* Exercícios SELECT */

/* 1. Liste  todos os planetas mostrando apenas o nome */
SELECT nome FROM planetas;

/* 2. Liste todos os planetas e o numero de habitantes (Use alias para renomear as colunas para: planeta população) */
SELECT nome AS planeta, Habitantes As população 
FROM planetas;

/* 3. Liste todos os planetas ordenados alfabeticamente */
SELECT nome AS planeta 
FROM planetas 
ORDER BY planeta ASC;

/* 4. Liste todos os planetas do mais populoso para o menos populoso */
SELECT nome, habitantes 
FROM planetas 
ORDER BY habitantes DESC;

/* 5. Liste todas as galaxias em ordem alfabetica */
SELECT * FROM galaxias 
ORDER BY nome ASC; 

/* 6. Liste os planetas e suas galaxias (Use alias: planeta, galaxia)*/
SELECT p.nome AS planeta, g.nome AS galaxia 
FROM planetas AS p, galaxias AS g 
WHERE p.idGalaxia = g.id;

/* 7. Liste quantos planetas existem em cada galaxia */
SELECT g.nome AS galaxia, COUNT(p.nome) AS planeta
FROM planetas AS p, galaxias AS g
WHERE p.idGalaxia = g.id
GROUP BY galaxia;

/* 8. Liste a soma de habitantes por galaxia */
SELECT g.nome AS galaxia, SUM(p.habitantes) AS população
FROM planetas AS p, galaxias AS g 
WHERE p.idGalaxia = g.id
GROUP BY galaxia;

/* 9. Liste quantos planetas existe para cada especie dominante */
SELECT e.nome AS especie, COUNT(p.nome) AS planeta
FROM planetas AS p, especies AS e 
WHERE p.idEspecie = e.id
GROUP BY especie;

/* 10. Liste as galaxias ordenadas pela quantidade de planetas(da maior para a menor) */
SELECT g.nome AS galaxia, COUNT(p.nome) AS planeta
FROM planetas AS p, galaxias AS g
WHERE p.idGalaxia = g.id
GROUP BY galaxia
ORDER BY planeta DESC;




SELECT * FROM planetas; -- SELECT padrão

SELECT * FROM planetas WHERE habitado = true; -- WHERE: aplica uma condição para busca dos valores

SELECT * FROM planetas 
ORDER BY massa DESC; -- ORDER BY: ordena os valores; ASC: ascendente, DESC: decrescente

SELECT idGalaxia, COUNT(*) FROM planetas GROUP BY idGalaxia; -- COUNT: conta os registros; GROUP BY: Agrupa os atributos

SELECT * FROM planetas WHERE nome LIKE 'T%'; -- LIKE(Case Sensintive): busca os valores com a indicação



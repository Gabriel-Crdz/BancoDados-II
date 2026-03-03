CREATE DATABASE universo;

CREATE TYPE tipo_superficie AS ENUM ('solido', 'liquido', 'gasoso'); -- Criando tipo ENUM

CREATE TABLE galaxias(
    id INTEGER,
    nome VARCHAR(50)
);

CREATE TABLE especies(
    id INTEGER,
    nome VARCHAR(50)
);

CREATE TABLE planetas(
    id INTEGER,
    nome VARCHAR(50),
    id_especie INTEGER,
    superficie tipo_superficie, -- Usando tipo superficie
    habitantes INTEGER,
    massa FLOAT,
    circunferencia numeric(15, 2)
);

/* ALTERANDO TABELAS EXISTENTES */

/* Adicionando chave-primaria */
-- Versão reduzida
ALTER TABLE galaxias ADD PRIMARY KEY (id);
ALTER TABLE especies ADD PRIMARY KEY (id);

ALTER TABLE planetas ADD CONSTRAINT pk_planetas PRIMARY KEY (id); -- Versão mais completa(profissional)

/* Adicionando chave-estrangeira */
ALTER TABLE planetas 
ADD CONSTRAINT fk_galaxia 
FOREIGN KEY (id_galaxia) REFERENCES galaxias (id);

ALTER TABLE planetas
ADD CONSTRAINT fk_especie
FOREIGN KEY (id_especie) REFERENCES especies (id);

/* Criando um gerador(auto-incremento) para a chave-primaria */
ALTER TABLE galaxias
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTIFY;

ALTER TABLE galaxias
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTIFY;

ALTER TABLE galaxias
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTIFY;

/* Renomeando */
ALTER TABLE especies RENAME TO especies_inteligentes; -- Tabela

ALTER TABLE planetas RENAME COLUMN tipo_climatico TO clima; -- Atributo

ALTER TABLE planetas ALTER COLUMN massa TYPE NUMERIC(10, 2) -- Tipo de dados

/* Adicionado colunas */
ALTER TABLE planetas 
ADD COLUMN id_galaxia integer,
ADD COLUMN tipo_climatico VARCHAR(50);

/* Excluindo */
CREATE TABLE teste(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(50)
);

DROP TABLE teste;

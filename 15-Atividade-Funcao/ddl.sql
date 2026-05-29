# 1. SQL DDL 
CREATE DATABASE db_loja_esportiva

CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    rg VARCHAR(20),
    endereco TEXT NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE vendedores (
    id_vendedor SERIAL PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(150) NOT NULL,
    endereco TEXT NOT NULL,
    telefone VARCHAR(20),
    celular VARCHAR(20),
    cpf CHAR(11) UNIQUE NOT NULL,
    salario NUMERIC(10,2) NOT NULL
);

CREATE TABLE fornecedores (
    id_fornecedor SERIAL PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    id_categoria INT REFERENCES categorias(id_categoria),
    descricao VARCHAR(150) NOT NULL,
    preco_custo NUMERIC(10,2) NOT NULL,
    preco_venda NUMERIC(10,2) NOT NULL,
    comissao_percentual NUMERIC(5,2) NOT NULL,
    estoque_minimo INT NOT NULL DEFAULT 0,
    prazo_reposicao_dias INT NOT NULL DEFAULT 0,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE estoque (
    id_produto INT PRIMARY KEY REFERENCES produtos(id_produto),
    quantidade INT NOT NULL DEFAULT 0
);

CREATE TABLE movimentacao_estoque (
    id_movimentacao SERIAL PRIMARY KEY,
    id_produto INT REFERENCES produtos(id_produto),
    tipo CHAR(1) NOT NULL CHECK (tipo IN ('E', 'S')),
    quantidade INT NOT NULL,
    data_movimentacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observacao TEXT
);

CREATE TABLE compras (
    id_compra SERIAL PRIMARY KEY,
    id_fornecedor INT REFERENCES fornecedores(id_fornecedor),
    data_compra DATE NOT NULL,
    data_recebimento DATE,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE itens_compra (
    id_item_compra SERIAL PRIMARY KEY,
    id_compra INT REFERENCES compras(id_compra),
    id_produto INT REFERENCES produtos(id_produto),
    quantidade INT NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL
);

CREATE TABLE formas_pagamento (
    id_forma_pagamento SERIAL PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE regras_parcelamento (
    parcelas INT PRIMARY KEY,
    percentual_acrescimo NUMERIC(5,2) NOT NULL
);

CREATE TABLE configuracoes_financeiras (
    id_config SERIAL PRIMARY KEY,
    multa_atraso_percentual NUMERIC(5,2) NOT NULL
);

CREATE TABLE vendas (
    id_venda SERIAL PRIMARY KEY,
    id_vendedor INT REFERENCES vendedores(id_vendedor),
    id_cliente INT REFERENCES clientes(id_cliente),
    id_forma_pagamento INT REFERENCES formas_pagamento(id_forma_pagamento),
    data_venda DATE NOT NULL DEFAULT CURRENT_DATE,
    hora_venda TIME NOT NULL DEFAULT CURRENT_TIME,
    total_bruto NUMERIC(10,2) NOT NULL,
    percentual_acrescimo NUMERIC(5,2) DEFAULT 0,
    total_final NUMERIC(10,2) NOT NULL,
    quantidade_parcelas INT DEFAULT 1,
    status VARCHAR(20) DEFAULT 'ABERTA'
);

CREATE TABLE itens_venda (
    id_item_venda SERIAL PRIMARY KEY,
    id_venda INT REFERENCES vendas(id_venda),
    id_produto INT REFERENCES produtos(id_produto),
    quantidade INT NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL,
    percentual_comissao NUMERIC(5,2) NOT NULL
);

CREATE TABLE parcelas (
    id_parcela SERIAL PRIMARY KEY,
    id_venda INT REFERENCES vendas(id_venda),
    numero_parcela INT NOT NULL,
    data_vencimento DATE NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    data_pagamento DATE,
    multa NUMERIC(10,2) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'PENDENTE'
);


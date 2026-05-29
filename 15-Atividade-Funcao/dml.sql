# 2. SQL DML 

INSERT INTO categorias(nome) VALUES
('Futebol'),
('Basquete'),
('Corrida'),
('Musculação'),
('Natação');

INSERT INTO formas_pagamento(descricao) VALUES
('Dinheiro'),
('Pix'),
('Cartão Débito'),
('Cartão Crédito'),
('Prazo');

INSERT INTO regras_parcelamento VALUES
(2, 5.00),
(3, 7.00),
(4, 8.00),
(5, 10.00);

INSERT INTO configuracoes_financeiras(multa_atraso_percentual)
VALUES (2.50);

INSERT INTO fornecedores
(razao_social, cnpj, telefone, email)
VALUES
('SportMax', '11111111111111', '46999990001', 'contato@sportmax.com'),
('FitPower', '22222222222222', '46999990002', 'vendas@fitpower.com'),
('RunFast', '33333333333333', '46999990003', 'run@runfast.com');

INSERT INTO vendedores
(codigo, nome, endereco, telefone, celular, cpf, salario)
VALUES
('V001', 'Carlos Silva', 'Rua A, 100', '4630010001', '46999910001', '11111111111', 2500.00),
('V002', 'Ana Souza', 'Rua B, 200', '4630010002', '46999910002', '22222222222', 2600.00),
('V003', 'Marcos Lima', 'Rua C, 300', '4630010003', '46999910003', '33333333333', 2400.00),
('V004', 'Juliana Rocha', 'Rua D, 400', '4630010004', '46999910004', '44444444444', 2700.00),
('V005', 'Pedro Alves', 'Rua E, 500', '4630010005', '46999910005', '55555555555', 2550.00);

INSERT INTO clientes
(nome, cpf, rg, endereco, telefone)
VALUES
('João Mendes', '10000000001', 'RG001', 'Rua 1', '46988880001'),
('Maria Clara', '10000000002', 'RG002', 'Rua 2', '46988880002'),
('Lucas Pereira', '10000000003', 'RG003', 'Rua 3', '46988880003'),
('Fernanda Costa', '10000000004', 'RG004', 'Rua 4', '46988880004'),
('Roberto Dias', '10000000005', 'RG005', 'Rua 5', '46988880005'),
('Patricia Gomes', '10000000006', 'RG006', 'Rua 6', '46988880006'),
('Ricardo Melo', '10000000007', 'RG007', 'Rua 7', '46988880007'),
('Amanda Ribeiro', '10000000008', 'RG008', 'Rua 8', '46988880008'),
('Thiago Martins', '10000000009', 'RG009', 'Rua 9', '46988880009'),
('Camila Lopes', '10000000010', 'RG010', 'Rua 10', '46988880010');

INSERT INTO produtos
(id_categoria, descricao, preco_custo, preco_venda,
comissao_percentual, estoque_minimo, prazo_reposicao_dias)
VALUES
(1,'Bola Futebol',50,90,5,10,15),
(1,'Chuteira Nike',200,350,8,5,20),
(1,'Meião',20,40,4,15,10),
(2,'Bola Basquete',60,120,6,10,12),
(2,'Tênis Basquete',250,450,10,5,25),
(2,'Regata Basquete',40,80,5,10,15),
(3,'Tênis Corrida',180,320,9,8,18),
(3,'Garrafa Térmica',25,50,4,20,7),
(3,'Relógio Esportivo',150,280,7,5,30),
(4,'Halter 5kg',40,75,5,12,10),
(4,'Barra Musculação',120,220,8,5,20),
(4,'Luvas Academia',25,45,4,10,12),
(4,'Corda Crossfit',35,70,5,8,14),
(5,'Óculos Natação',30,65,5,15,9),
(5,'Touca Natação',15,35,4,20,8),
(5,'Maiô Profissional',80,150,6,6,18),
(1,'Camisa Time',70,140,7,10,16),
(2,'Munhequeira',10,25,3,20,5),
(3,'Short Corrida',35,70,5,12,11),
(4,'Colchonete',45,90,6,8,13);

INSERT INTO estoque VALUES
(1,100),(2,50),(3,120),(4,70),(5,40),
(6,60),(7,55),(8,150),(9,30),(10,80),
(11,35),(12,90),(13,75),(14,110),(15,130),
(16,40),(17,65),(18,140),(19,95),(20,50);

INSERT INTO compras
(id_fornecedor, data_compra, data_recebimento, status)
VALUES
(1,'2026-05-01','2026-05-05','RECEBIDA'),
(2,'2026-05-03','2026-05-07','RECEBIDA'),
(3,'2026-05-05','2026-05-10','RECEBIDA');

INSERT INTO itens_compra
(id_compra, id_produto, quantidade, valor_unitario)
VALUES
(1,1,50,50),
(1,2,20,200),
(1,3,40,20),

(2,7,30,180),
(2,8,50,25),
(2,9,15,150),

(3,10,25,40),
(3,11,15,120),
(3,12,40,25);

INSERT INTO vendas
(id_vendedor,id_cliente,id_forma_pagamento,
data_venda,hora_venda,total_bruto,
percentual_acrescimo,total_final,
quantidade_parcelas,status)
VALUES
(1,1,1,'2026-05-01','10:00',180,0,180,1,'FINALIZADA'),
(1,2,5,'2026-05-01','11:00',350,5,367.50,2,'FINALIZADA'),
(1,3,2,'2026-05-02','09:30',120,0,120,1,'FINALIZADA'),
(1,4,5,'2026-05-02','14:00',280,7,299.60,3,'FINALIZADA'),
(1,5,1,'2026-05-03','15:00',90,0,90,1,'FINALIZADA'),
(2,6,5,'2026-05-03','16:00',450,8,486,4,'FINALIZADA'),
(2,7,2,'2026-05-04','09:00',75,0,75,1,'FINALIZADA'),
(2,8,1,'2026-05-04','10:00',140,0,140,1,'FINALIZADA'),
(2,9,5,'2026-05-05','11:00',320,5,336,2,'FINALIZADA'),
(2,10,3,'2026-05-05','13:00',220,0,220,1,'FINALIZADA'),
(3,1,1,'2026-05-06','10:00',65,0,65,1,'FINALIZADA'),
(3,2,5,'2026-05-06','11:00',150,7,160.50,3,'FINALIZADA'),
(3,3,2,'2026-05-07','12:00',45,0,45,1,'FINALIZADA'),
(3,4,1,'2026-05-07','13:00',70,0,70,1,'FINALIZADA'),
(3,5,5,'2026-05-08','14:00',90,5,94.50,2,'FINALIZADA'),
(4,6,2,'2026-05-08','15:00',120,0,120,1,'FINALIZADA'),
(4,7,5,'2026-05-09','10:00',280,8,302.40,4,'FINALIZADA'),
(4,8,1,'2026-05-09','11:00',350,0,350,1,'FINALIZADA'),
(4,9,5,'2026-05-10','12:00',450,10,495,5,'FINALIZADA'),
(4,10,2,'2026-05-10','13:00',90,0,90,1,'FINALIZADA'),
(5,1,1,'2026-05-11','10:00',140,0,140,1,'FINALIZADA'),
(5,2,5,'2026-05-11','11:00',320,5,336,2,'FINALIZADA'),
(5,3,2,'2026-05-12','12:00',220,0,220,1,'FINALIZADA'),
(5,4,1,'2026-05-12','13:00',65,0,65,1,'FINALIZADA'),
(5,5,5,'2026-05-13','14:00',180,7,192.60,3,'FINALIZADA'),
(1,6,2,'2026-05-13','15:00',75,0,75,1,'FINALIZADA'),
(2,7,1,'2026-05-14','10:00',90,0,90,1,'FINALIZADA'),
(3,8,5,'2026-05-14','11:00',280,5,294,2,'FINALIZADA'),
(4,9,1,'2026-05-15','12:00',150,0,150,1,'FINALIZADA'),
(5,10,5,'2026-05-15','13:00',350,8,378,4,'FINALIZADA');

INSERT INTO itens_venda
(id_venda,id_produto,quantidade,
valor_unitario,percentual_comissao)
VALUES
(1,1,2,90,5),
(2,2,1,350,8),
(3,4,1,120,6),
(4,9,1,280,7),
(5,1,1,90,5),
(6,5,1,450,10),
(7,10,1,75,5),
(8,17,1,140,7),
(9,7,1,320,9),
(10,11,1,220,8),
(11,14,1,65,5),
(12,16,1,150,6),
(13,12,1,45,4),
(14,13,1,70,5),
(15,20,1,90,6),
(16,4,1,120,6),
(17,9,1,280,7),
(18,2,1,350,8),
(19,5,1,450,10),
(20,1,1,90,5),
(21,17,1,140,7),
(22,7,1,320,9),
(23,11,1,220,8),
(24,14,1,65,5),
(25,1,2,90,5),
(26,10,1,75,5),
(27,20,1,90,6),
(28,9,1,280,7),
(29,16,1,150,6),
(30,2,1,350,8);

INSERT INTO parcelas
(id_venda,numero_parcela,data_vencimento,
valor,data_pagamento,multa,status)
VALUES
(2,1,'2026-06-01',183.75,NULL,0,'PENDENTE'),
(2,2,'2026-07-01',183.75,NULL,0,'PENDENTE'),
(4,1,'2026-06-02',99.87,NULL,0,'PENDENTE'),
(4,2,'2026-07-02',99.87,NULL,0,'PENDENTE'),
(4,3,'2026-08-02',99.86,NULL,0,'PENDENTE'),
(6,1,'2026-06-03',121.50,NULL,0,'PENDENTE'),
(6,2,'2026-07-03',121.50,NULL,0,'PENDENTE'),
(6,3,'2026-08-03',121.50,NULL,0,'PENDENTE'),
(6,4,'2026-09-03',121.50,NULL,0,'PENDENTE');

/* SCRIPT CRIAÇÃO DB */

CREATE DATABASE loja;
USE loja;

CREATE TABLE categoria(
cd INT PRIMARY KEY
AUTO_INCREMENT,
nome VARCHAR(100)
);

CREATE TABLE produto(
cd INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR( 120),
qtd INT(10),
valor DECIMAL(10,2),
id_categoria INT,
FOREIGN KEY (id_categoria)
REFERENCES categoria(cd)
);

CREATE TABLE vendedor(
cd INT PRIMARY KEY
AUTO_INCREMENT,
nome VARCHAR(100),
salario DECIMAL(10,2)
);

CREATE TABLE estado(
cd INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30),
sigla CHAR(2)
);

CREATE TABLE cidade(
cd INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
id_estado INT,
FOREIGN KEY (id_estado) REFERENCES estado(cd)
);

CREATE TABLE cliente(
cd INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
telefone VARCHAR(100),
sexo CHAR(1),
status CHAR(8),
id_cidade INT,
FOREIGN KEY (id_cidade) REFERENCES cidade(cd)
);

CREATE TABLE pedido(
cd INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT,
id_vendedor INT,
dt_pedido DATE,
vl_total DECIMAL(10,2),
FOREIGN KEY (id_cliente) REFERENCES cliente(cd),
FOREIGN KEY (id_vendedor) REFERENCES vendedor(cd)
);

CREATE TABLE item_pedido(
cd INT PRIMARY KEY AUTO_INCREMENT,
id_pedido INT,
id_produto INT,
qt_produto INT,
vl_unitario DECIMAL(10,2),
FOREIGN KEY (id_pedido) REFERENCES pedido(cd),
FOREIGN KEY (id_produto) REFERENCES produto(cd)
);


/* QUESTÃO 1 */

#LINK: 

/* QUESTÃO 2 */ 

/* INSERÇÕES CATEGORIAS */

INSERT INTO categoria(nome) VALUES ('Elétrica');
INSERT INTO categoria(nome) VALUES ('Hidráulica');
INSERT INTO categoria(nome) VALUES ('Ferragem');
INSERT INTO categoria(nome) VALUES ('Construção');
INSERT INTO categoria(nome) VALUES ('Ferramentas');

/* INSERÇÕES PRODUTOS */

INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_ELETRICA 1', 10, 4.20, 1);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_ELETRICA 2', 5, 10.50, 1);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_ELETRICA 3', 4, 9.99, 1);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_ELETRICA 4', 20, 50.30, 1);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_ELETRICA 5', 10, 4.20, 1);

INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_HIDRAULICA 1', 10, 4.20, 2);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_HIDRAULICA 2', 5, 10.20, 2);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_HIDRAULICA 3', 4, 9.50, 2);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_HIDRAULICA 4', 20, 45.50, 2);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_HIDRAULICA 5', 10, 4.25, 2);

INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_FERRAGEM 1', 10, 4.50, 3);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_FERRAGEM 2', 5, 11.00, 3);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_FERRAGEM 3', 4, 8.00, 3);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_FERRAGEM 4', 20, 20.50, 3);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_FERRAGEM 5', 10, 3.20, 3);

INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_CONSTRUÇÃO 1', 10, 2.20, 4);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_CONSTRUÇÃO 2', 5, 4.99, 4);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_CONSTRUÇÃO 3', 4, 9.99, 4);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_CONSTRUÇÃO 4', 20, 90.99, 4);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_CONSTRUÇÃO 5', 10, 4.20, 4);

INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_FERRAMENTAS 1', 10, 29.99, 5);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_FERRAMENTAS 2', 5, 12.35, 5);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_FERRAMENTAS 3', 4, 99.99, 5);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_FERRAMENTAS 4', 20, 50.00, 5);
INSERT INTO produto(nome, qtd, valor, id_categoria) VALUES('PRODUTO_FERRAMENTAS 5', 10, 5.00, 5);

/* INSERÇÕES VENDEDORES */

INSERT INTO vendedor(nome) VALUES('Luca Poe de Almeida');
INSERT INTO vendedor(nome) VALUES('Gabriel Bernardo Gamon');
INSERT INTO vendedor(nome) VALUES('Pedro Vitor');
INSERT INTO vendedor(nome) VALUES('Eduardo Yasui');

/* INSERÇÕES ESTADOS */

INSERT INTO estado(nome, sigla) VALUES('São Paulo','SP');
INSERT INTO estado(nome, sigla) VALUES('Rio de Janeiro','RJ');
INSERT INTO estado(nome, sigla) VALUES('Minas Gerais','MG');

/* INSERÇÕES CIDADES */

INSERT INTO cidade(nome, id_estado) VALUES('Santos', 1);
INSERT INTO cidade(nome, id_estado) VALUES('São Vicente', 1);
INSERT INTO cidade(nome, id_estado) VALUES('Guarulhos', 1);

INSERT INTO cidade(nome, id_estado) VALUES('Niterói', 2);
INSERT INTO cidade(nome, id_estado) VALUES('Petrópolis', 2);
INSERT INTO cidade(nome, id_estado) VALUES('Rio de Janeiro', 2);

INSERT INTO cidade(nome, id_estado) VALUES('Belo Horizonte', 3);
INSERT INTO cidade(nome, id_estado) VALUES('Uberlândia', 3);
INSERT INTO cidade(nome, id_estado) VALUES('Juiz de Fora', 3);

/* INSERÇÕES CLIENTES */

INSERT INTO cliente(nome, telefone, sexo, status, id_cidade) VALUES('NOME_USER_1','TELEFONE_USER_1','M','INATIVO', 1);
INSERT INTO cliente(nome, telefone, sexo, status, id_cidade) VALUES('NOME_USER_2','TELEFONE_USER_2','M','ATIVO', 2);
INSERT INTO cliente(nome, telefone, sexo, status, id_cidade) VALUES('NOME_USER_3','TELEFONE_USER_3','M','ATIVO', 3);
INSERT INTO cliente(nome, telefone, sexo, status, id_cidade) VALUES('NOME_USER_4','TELEFONE_USER_4','M','ATIVO', 4);
INSERT INTO cliente(nome, telefone, sexo, status, id_cidade) VALUES('NOME_USER_5','TELEFONE_USER_5','M','INATIVO', 5);
INSERT INTO cliente(nome, telefone, sexo, status, id_cidade) VALUES('NOME_USER_6','TELEFONE_USER_6','M','ATIVO', 6);
INSERT INTO cliente(nome, telefone, sexo, status, id_cidade) VALUES('NOME_USER_7','TELEFONE_USER_7','M','ATIVO', 7);
INSERT INTO cliente(nome, telefone, sexo, status, id_cidade) VALUES('NOME_USER_8','TELEFONE_USER_8','M','INATIVO', 8);
INSERT INTO cliente(nome, telefone, sexo, status, id_cidade) VALUES('NOME_USER_9','TELEFONE_USER_9','M','ATIVO', 9);


/* QUESTÃO 3 */

#1 Exiba a lista de clientes ativos em ordem alfabética
SELECT * FROM cliente WHERE (status = 'ATIVO') order by nome asc;

#2 Exiba a lista de clientes inativos 
SELECT * FROM cliente WHERE (status = 'INATIVO');

#3 Exiba todos os produtos da categoria “Hidráulica” 
SELECT * FROM produto WHERE (id_categoria = 2);

#4 Exiba todos os produtos com valor até R$ 200,00 
SELECT * FROM produto WHERE (valor<=200);

#5 Exiba o nome de todos os clientes do sexo Feminino (“F”) 
SELECT * FROM cliente WHERE (sexo = "F");

#6 Exiba a lista de pedidos deste mês
SELECT * FROM pedido WHERE(MONTH(CURDATE()) = (SELECT MONTH(dt_pedido) AS Month) && YEAR(CURDATE()) = (SELECT YEAR(dt_pedido) AS Year));

#7 Exiba a lista dos pedidos de hoje
SELECT * FROM pedido WHERE(CURDATE() = dt_pedido);

#8 Exiba a Soma total dos pedidos do mês atual
SELECT COUNT(cd) FROM pedido WHERE (MONTH(CURDATE()) = MONTH(dt_pedido));

#9 Exiba os itens do pedido 4 
SELECT * FROM item_pedido WHERE(id_pedido = 4);

#10 Exiba os pedidos do cliente 2
SELECT * FROM pedido WHERE(id_cliente = 2);

#11 Exiba a lista de vendedores, informando a quantidade de vendas de cada um
SELECT (nome) FROM vendedor INNER JOIN pedido ON vendedor.id = pedido.id_vendedor;

#12 Exiba a lista de produtos com qtd inferior a 50
SELECT * FROM produto WHERE (qtd<50);

#13 Exiba a lista dos produtos mais comprados (em pedidos) 

#14 Exiba a média de valor dos produtos cadastrados
SELECT AVG(valor) as ValorMédioProdutos FROM produto;

#15 Exiba o produto mais barato cadastrado 
SELECT Prd.nome as NomeProduto, MIN(valor) as precoBaixo FROM produto Prd;

#16 Exiba o produto mais caro cadastrado
SELECT Prd.nome as NomeProduto, MAX(valor) as precoAlto FROM produto Prd;

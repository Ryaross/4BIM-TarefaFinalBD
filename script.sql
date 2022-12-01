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

#Anexo no REPO

/* QUESTÃO 2 */ 

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
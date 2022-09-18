DROP DATABASE IF EXISTS lanchonete;
CREATE DATABASE lanchonete;
USE lanchonete;


/** ------------------------------------------ CRIAÇÃO DAS TABELAS  ------------------------------------------ **/
/** CARDAPIO **/
CREATE TABLE cardapio (
    id int PRIMARY KEY NOT NULL
);

/** SANDUÍCHE **/
CREATE TABLE sanduiche (
	id int primary key NOT NULL,
    nome varchar(255)  NOT NULL,
    preco decimal(10,2) NOT NULL,
    id_cardapio int NOT NULL,
    FOREIGN KEY (id_cardapio) REFERENCES cardapio(id)
);

/** CLIENTE **/
CREATE TABLE cliente (
	id int primary key NOT NULL,
    nome varchar(255) NOT NULL,
    logradouro varchar(255) NOT NULL,
    complemento varchar(255),
    CEP varchar(8) NOT NULL,
    numero int NOT NULL
);

CREATE TABLE telefone_cliente (
	id int primary key NOT NULL,
    id_cliente int NOT NULL,
    telefone varchar(16) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

/** ENTREGADOR **/
CREATE TABLE entregador (
	id int primary key NOT NULL,
    nome varchar(255) NOT NULL
);

CREATE TABLE telefone_entregador (
	id int primary key NOT NULL,
    id_entregador int NOT NULL,
    telefone varchar(16) NOT NULL,
    FOREIGN KEY (id_entregador) REFERENCES entregador(id)
);

/** PEDIDO **/
CREATE TABLE pedido (
	id int primary key NOT NULL,
    id_cliente int NOT NULL,
    id_entregador int NOT NULL,
    data_emissao DATETIME NOT NULL,
    `status` int NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_entregador) REFERENCES entregador(id)
);

CREATE TABLE pedido_sanduiche (
	id int primary key NOT NULL,
    id_pedido int NOT NULL,
    id_sanduiche int NOT NULL,
    quantidade int NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_sanduiche) REFERENCES sanduiche(id)
);

/** ------------------------------------------ INSERÇÃO NAS TABELAS  ------------------------------------------ **/

INSERT INTO cardapio VALUES (1);

INSERT INTO sanduiche VALUES(1, 'Baurú', 8.99, 1);
INSERT INTO sanduiche VALUES(2, 'X-Salada', 6.49, 1);
INSERT INTO sanduiche VALUES(3, 'X-Tudo', 9.99, 1);
INSERT INTO sanduiche VALUES(4, 'X-Egg', 7.99, 1);

INSERT INTO cliente VALUES(1, 'Luiz', 'Rua Pardais', 'Casa', '12345678', 1);
INSERT INTO cliente VALUES(2, 'João', 'Rua Canários', 'Apartamento 5', '12345678', 1);
INSERT INTO cliente VALUES(3, 'Maria', 'Rua Pombas', 'Casa 3', '12345678', 1);
INSERT INTO cliente VALUES(4, 'Felipe', 'Rua Galinhas', NULL, '12345678', 1);

INSERT INTO telefone_cliente VALUES(1, 1, '41123456789');
INSERT INTO telefone_cliente VALUES(2, 1, '41123456789');
INSERT INTO telefone_cliente VALUES(3, 2, '41123456789');
INSERT INTO telefone_cliente VALUES(4, 2, '41123456789');
INSERT INTO telefone_cliente VALUES(5, 3, '41123456789');
INSERT INTO telefone_cliente VALUES(6, 3, '41123456789');
INSERT INTO telefone_cliente VALUES(7, 4, '41123456789');
INSERT INTO telefone_cliente VALUES(8, 4, '41123456789');

INSERT INTO entregador VALUES(1, 'Alecrim');
INSERT INTO entregador VALUES(2, 'Parmesiana');

INSERT INTO telefone_entregador VALUES(1, 1, '41123456789');
INSERT INTO telefone_entregador VALUES(2, 1, '41123456789');
INSERT INTO telefone_entregador VALUES(3, 2, '41123456789');
INSERT INTO telefone_entregador VALUES(4, 2, '41123456789');

INSERT INTO pedido VALUES(1, 1, 1, '1254-01-02 05:34:05', 0);
INSERT INTO pedido VALUES(2, 2, 1, '2022-04-18 15:28:01', 1);
INSERT INTO pedido VALUES(3, 3, 2, '2022-01-02 05:34:05', 1);
INSERT INTO pedido VALUES(4, 1, 2, '2079-11-22 23:00:48', 2);

INSERT INTO pedido_sanduiche VALUES(1, 1, 1, 3);
INSERT INTO pedido_sanduiche VALUES(2, 1, 2, 1);
INSERT INTO pedido_sanduiche VALUES(3, 2, 3, 1);
INSERT INTO pedido_sanduiche VALUES(4, 3, 4, 6);
INSERT INTO pedido_sanduiche VALUES(5, 4, 1, 1);
INSERT INTO pedido_sanduiche VALUES(6, 4, 3, 1);
INSERT INTO pedido_sanduiche VALUES(7, 4, 4, 3);

/** ------------------------------------------ CONSULTA NAS TABELAS  ------------------------------------------ **/

SELECT * FROM cliente;
SELECT * FROM pedido WHERE pedido.status = 0;
SELECT * FROM sanduiche WHERE sanduiche.preco >= 8;

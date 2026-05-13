-- Atividade 04/03/2026

CREATE DATABASE db_loja;
USE db_loja;

CREATE TABLE cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100),
  idade INT
);

CREATE TABLE produto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  preco DECIMAL(10,2),
  estoque INT
);

-- Inserts cliente
INSERT INTO cliente (nome, email, idade) VALUES ('Victor', 'victor@email.com', 22);
INSERT INTO cliente (nome, email, idade) VALUES ('Maria', 'maria@email.com', 30);
INSERT INTO cliente (nome, email, idade) VALUES ('João', 'joao@email.com', 25);

-- Inserts produto
INSERT INTO produto (nome, preco, estoque) VALUES ('Teclado', 150.00, 10);
INSERT INTO produto (nome, preco, estoque) VALUES ('Mouse', 80.00, 25);
INSERT INTO produto (nome, preco, estoque) VALUES ('Monitor', 1200.00, 5);

-- Selects
SELECT * FROM cliente;
SELECT * FROM produto;

SELECT nome, email FROM cliente WHERE idade > 23;
SELECT nome, preco FROM produto WHERE estoque > 0;

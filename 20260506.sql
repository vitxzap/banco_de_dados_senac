-- Atividade 06/05/2026
CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  preco DECIMAL(10,2)
);

--  trigger que aumenta 10%
DELIMITER $$
CREATE TRIGGER before_insert_produto
BEFORE INSERT ON produtos
FOR EACH ROW
BEGIN
  SET NEW.preco = NEW.preco * 1.10;
END$$
DELIMITER ;

-- Testando ele
INSERT INTO produtos (nome, preco) VALUES ('Teclado Gamer', 100.00);
SELECT * FROM produtos;
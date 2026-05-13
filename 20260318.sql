-- Atividade 18/03/2026

CREATE DATABASE db_funcionarios;
USE db_funcionarios;

CREATE TABLE funcionario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  cargo VARCHAR(50),
  salario DECIMAL(10,2)
);


INSERT INTO funcionario (nome, cargo, salario) VALUES ('Victor',   'Desenvolvedor',  3500.00);
INSERT INTO funcionario (nome, cargo, salario) VALUES ('Maria',    'Analista',       4200.00);
INSERT INTO funcionario (nome, cargo, salario) VALUES ('João',     'Gerente',        7500.00);
INSERT INTO funcionario (nome, cargo, salario) VALUES ('Ana',      'Designer',       3800.00);
INSERT INTO funcionario (nome, cargo, salario) VALUES ('Carlos',   'DBA',            6200.00);
INSERT INTO funcionario (nome, cargo, salario) VALUES ('Fernanda', 'Estagiária',     1500.00);
INSERT INTO funcionario (nome, cargo, salario) VALUES ('Pedro',    'Suporte',        2800.00);
INSERT INTO funcionario (nome, cargo, salario) VALUES ('Juliana',  'RH',             4000.00);
INSERT INTO funcionario (nome, cargo, salario) VALUES ('Rafael',   'Desenvolvedor',  3700.00);
INSERT INTO funcionario (nome, cargo, salario) VALUES ('Beatriz',  'Diretora',      12000.00);


DELIMITER $$
CREATE FUNCTION fn_calculaAumento (
  salario_func DECIMAL(10,2),
  percentual_de_aumento DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE v_novo_salario DECIMAL(10,2);
  SET v_novo_salario = salario_func + (salario_func * percentual_de_aumento / 100);
  RETURN v_novo_salario;
END$$
DELIMITER ;


SELECT fn_calculaAumento(3000.00, 10) AS exemplo_aumento;


SELECT
  id,
  nome,
  cargo,
  salario AS salario_atual,
  fn_calculaAumento(salario, 10) AS salario_com_aumento
FROM funcionario;

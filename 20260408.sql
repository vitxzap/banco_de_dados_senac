-- Atividade 08/04/2026

-- Exercício 1: Calculadora
CREATE DATABASE db_calculadora;
USE db_calculadora;

DELIMITER $$
CREATE PROCEDURE sp_calculadora (
  IN p_operacao CHAR(1),
  IN p_num1 DECIMAL(10,2),
  IN p_num2 DECIMAL(10,2)
)
BEGIN
  DECLARE v_resultado DECIMAL(10,2);

  CASE p_operacao
    WHEN '+' THEN SET v_resultado = p_num1 + p_num2;
    WHEN '-' THEN SET v_resultado = p_num1 - p_num2;
    WHEN '*' THEN SET v_resultado = p_num1 * p_num2;
    WHEN '/' THEN
      IF p_num2 = 0 THEN
        SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT = 'Erro: divisão por zero!';
      ELSE
        SET v_resultado = p_num1 / p_num2;
      END IF;
    ELSE
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Operação inválida! Use +, -, * ou /';
  END CASE;

  SELECT v_resultado AS resultado;
END$$
DELIMITER ;

-- As operações sendo testadas abaiox
CALL sp_calculadora('+', 10, 5);
CALL sp_calculadora('-', 10, 5);
CALL sp_calculadora('*', 10, 5);
CALL sp_calculadora('/', 10, 5);


-- Exercício 2: Média de 4 notas
CREATE DATABASE db_alunos;
USE db_alunos;

DELIMITER $$
CREATE PROCEDURE sp_mediaAluno (
  IN p_nota1 DECIMAL(4,2),
  IN p_nota2 DECIMAL(4,2),
  IN p_nota3 DECIMAL(4,2),
  IN p_nota4 DECIMAL(4,2)
)
BEGIN
  DECLARE v_media DECIMAL(4,2);

  IF p_nota1 < 0 OR p_nota1 > 10
     OR p_nota2 < 0 OR p_nota2 > 10
     OR p_nota3 < 0 OR p_nota3 > 10
     OR p_nota4 < 0 OR p_nota4 > 10 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Erro: as notas devem estar entre 0 e 10!';
  ELSE
    SET v_media = (p_nota1 + p_nota2 + p_nota3 + p_nota4) / 4;
    SELECT v_media AS media_final;
  END IF;
END$$
DELIMITER ;


CALL sp_mediaAluno(8, 7.5, 9, 6.5);

-- Atividade 01/04/2026

CREATE TABLE usuario (
  usuario_CPF   VARCHAR(14) NOT NULL PRIMARY KEY,
  usuario_nome  VARCHAR(100) NOT NULL,
  usuario_email VARCHAR(100) NOT NULL,
  dt_cadastro   DATE NOT NULL
);

DELIMITER $$
CREATE PROCEDURE sp_insereUsuario (
  IN p_cpf   VARCHAR(14),
  IN p_nome  VARCHAR(100),
  IN p_email VARCHAR(100),
  IN p_dt    DATE
)
BEGIN
  IF p_cpf IS NULL OR p_nome IS NULL OR p_email IS NULL OR p_dt IS NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Erro: nenhum campo pode ser nulo!';
  ELSE
    INSERT INTO usuario (usuario_CPF, usuario_nome, usuario_email, dt_cadastro)
    VALUES (p_cpf, p_nome, p_email, p_dt);
    SELECT 'Cadastro efetuado com sucesso!' AS mensagem;
  END IF;
END$$
DELIMITER ;


CALL sp_insereUsuario('123.456.789-00', 'Victor', 'victor@email.com', '2026-04-01');
SELECT * FROM usuario;

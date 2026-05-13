-- Atividade 25/03/2026

-- View 1
CREATE VIEW PR_metro (cod_PR_metro, descricao, unidade) AS
SELECT codigoProduto, descricao, unidade
FROM produto
WHERE unidade = 'M';

-- View 2
CREATE VIEW salarioAnual (codigoVendedor, nomeVendedor, salarioAnualMedio) AS
SELECT codigoVendedor, nomeVendedor, (salarioFixo * 12)
FROM vendedor;



CREATE VIEW vw_ClientesSP (codCliente, nomeCliente, cidade) AS
SELECT codigoCliente, nomeCliente, cidade
FROM cliente
WHERE cidade = 'Sao Paulo';

SELECT codCliente, nomeCliente, cidade
FROM vw_ClientesSP;



CREATE VIEW vw_ProdutosKG (cod_produto, descricao, unidade) AS
SELECT codigoProduto, descricao, unidade
FROM produto
WHERE unidade = 'KG';

INSERT INTO vw_ProdutosKG
VALUES (201, 'Arroz Integral', 'KG');



CREATE VIEW vw_FuncionariosTI (codFunc, nomeFunc, departamento, salario) AS
SELECT codigoFuncionario, nomeFuncionario, departamento, salario
FROM funcionario
WHERE departamento = 'TI';

UPDATE vw_FuncionariosTI
SET salario = salario * 1.10
WHERE codFunc = 305;



CREATE VIEW vw_PedidosCancelados (codPedido, codCliente, dataPedido, status) AS
SELECT codigoPedido, codigoCliente, dataPedido, status
FROM pedido
WHERE status = 'CANCELADO';

DELETE FROM vw_PedidosCancelados
WHERE codPedido = 1045;

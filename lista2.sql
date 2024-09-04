--  Logística e Cadeia de Suprimentos

-- 1
SELECT produtos.produto_id, produtos.nome AS nome_produto, fornecedores.nome AS nome_fornecedor
FROM produtos
LEFT JOIN fornecedores ON produtos.fornecedor_id = fornecedores.fornecedor_id;

-- 2
SELECT movimentacao_estoque.movimentacao_id, produtos.nome AS nome_produto, movimentacao_estoque.quantidade, movimentacao_estoque.data_movimentacao
FROM movimentacao_estoque
INNER JOIN produtos ON movimentacao_estoque.produto_id = produtos.produto_id;

-- 3
SELECT armazens.armazem_id, armazens.nome AS nome_armazem, movimentacao_estoque.movimentacao_id, movimentacao_estoque.quantidade, movimentacao_estoque.data_movimentacao
FROM armazens
LEFT JOIN movimentacao_estoque ON armazens.armazem_id = movimentacao_estoque.armazem_id;

-- 4
SELECT produtos.produto_id, produtos.nome AS nome_produto, entregas.entrega_id, entregas.quantidade, entregas.endereco_entrega, entregas.data_entrega, entregas.status
FROM produtos
LEFT JOIN entregas ON produtos.produto_id = entregas.produto_id;

-- 5
SELECT fornecedores.fornecedor_id, fornecedores.nome AS nome_fornecedor, produtos.produto_id, produtos.nome AS nome_produto
FROM fornecedores
LEFT JOIN produtos ON fornecedores.fornecedor_id = produtos.fornecedor_id;

-- 6
SELECT produtos.produto_id, produtos.nome AS nome_produto, COALESCE(SUM(movimentacao_estoque.quantidade), 0) AS quantidade_total
FROM produtos
LEFT JOIN movimentacao_estoque ON produtos.produto_id = movimentacao_estoque.produto_id
GROUP BY produtos.produto_id, produtos.nome;
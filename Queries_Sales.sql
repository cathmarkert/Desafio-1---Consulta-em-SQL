-- Valor total das vendas e dos fretes por produto e ordem de venda
SELECT ProdutoID as 'Produto', sum(Quantidade*Valor - Desconto) as 'Valor total das vendas', sum(ValorFrete) as 'Valor do Frete' FROM my_table t1 
INNER JOIN my_table2 t2 on t1.CupomID=t2.CupomID
GROUP BY ProdutoID
ORDER BY Data, ProdutoID

-- Valor de venda por tipo de produto
SELECT DISTINCT ProdutoID, Valor FROM my_table t1 
ORDER BY ProdutoID

-- Quantidade e valor das vendas por dia, mês, ano;
SELECT Data, count(ProdutoID) as 'Quantidade de Produtos', sum(Valor*Quantidade-Desconto) as 'Valor das Vendas' FROM my_table t1 
inner join my_table2 t2 on t1.CupomID=t2.CupomID
inner join my_table3 t3 on t2.ClienteID=t3.ClienteID
GROUP BY ProdutoID
ORDER BY Data

-- Lucro dos meses
SELECT sum(ValorLiquido*Quantidade-Desconto) as 'Lucro' FROM my_table t1 
inner join my_table2 t2 on t1.CupomID=t2.CupomID
WHERE 
     SUBSTR(Data, 4, 2) = '01' -- para cada mês, alterar aqui
GROUP BY ProdutoID

-- Venda por produto
SELECT * FROM my_table t1 
inner join my_table2 t2 on t1.CupomID=t2.CupomID
inner join my_table3 t3 on t2.ClienteID=t3.ClienteID
ORDER BY ProdutoID 

-- Venda por cliente, cidade do cliente e estado
SELECT * FROM my_table t1 
inner join my_table2 t2 on t1.CupomID=t2.CupomID
inner join my_table3 t3 on t2.ClienteID=t3.ClienteID
ORDER BY ClienteID, Cidade
-- não existe estado nesse BD

-- Média de produtos vendidos
SELECT ProdutoID, avg(Quantidade) as 'Média de Produtos Vendidos' FROM my_table t1 
GROUP BY ProdutoID

-- Média de compras que um cliente faz
SELECT ProdutoID, avg(Quantidade) as 'Média de produtos comprados' FROM my_table t1 
inner join my_table2 t2 on t1.CupomID=t2.CupomID
inner join my_table3 t3 on t2.ClienteID=t3.ClienteID
WHERE t2.ClienteID=2 -- selecionar os diferentes tipos de cliente
GROUP BY ProdutoID




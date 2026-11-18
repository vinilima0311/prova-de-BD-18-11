use LojaTech2026;

-- 3.1
select c.Nome,
       count(v.Codigo) as NumeroCompras,
       sum(v.Quantidade) as QuantidadeTotalItens,
       sum(v.Quantidade * v.ValorVenda) as Faturamento,
       avg(v.Quantidade * v.ValorVenda) as TicketMedio
from Clientes c
inner join Vendas v on c.Codigo = v.Cliente
group by c.Codigo, c.Nome
order by Faturamento desc;

-- 3.2
select c.Nome,
       min(v.ValorVenda) as MenorValorPago,
       max(v.ValorVenda) as MaiorValorPago
from Clientes c
inner join Vendas v on c.Codigo = v.Cliente
group by c.Codigo, c.Nome;

-- 3.3
select cat.Nome as Categoria,
       sum(v.Quantidade * v.ValorVenda) as FaturamentoTotal
from Vendas v
inner join Produtos p on v.Produto = p.Codigo
inner join Categorias cat on p.CategoriaId = cat.Codigo
group by cat.Codigo, cat.Nome
having FaturamentoTotal > 900.00;

-- 3.4
select p.Descricao,
       p.ValorVenda as ValorTabela,
       avg(v.ValorVenda) as ValorMedioPraticado,
       sum(v.Quantidade * (p.ValorVenda - v.ValorVenda)) as DescontoTotalConcedido
from Vendas v
inner join Produtos p on v.Produto = p.Codigo
group by p.Codigo, p.Descricao, p.ValorVenda;

-- 3.5
select date_format(DataVenda, '%Y-%m') as Mes,
       sum(Quantidade * ValorVenda) as FaturamentoMensal
from Vendas
where year(DataVenda) = 2026
group by Mes
order by Mes asc;

-- 3.6
select p.Descricao,
       sum(v.Quantidade) as TotalQuantidadeVendida
from Vendas v
inner join Produtos p on v.Produto = p.Codigo
group by p.Codigo, p.Descricao
order by TotalQuantidadeVendida desc
limit 3;
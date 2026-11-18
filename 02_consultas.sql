-- 2.1
select Codigo, Nome, Cidade, DataNascimento
from Clientes
where UF = 'SP'
  and DataNascimento between '1980-01-01' and '1988-12-31'
  and (Nome like 'M%' or Nome like 'P%')
order by Nome;

-- 2.2
select Codigo, Nome,
       coalesce(Email, 'SEM E-MAIL') as Email,
       coalesce(CEP, 'SEM CEP') as CEP
from Clientes;

-- 2.3
select c.Nome as Cliente, 
       p.Descricao as Produto, 
       v.DataVenda, 
       v.Quantidade, 
       v.ValorVenda as ValorUnitarioPraticado, 
       (v.Quantidade * v.ValorVenda) as TotalItem
from Vendas v
inner join Clientes c on v.Cliente = c.Codigo
inner join Produtos p on v.Produto = p.Codigo
order by v.DataVenda desc;

-- 2.4
select c.Codigo, c.Nome
from Clientes c
left join Vendas v on c.Codigo = v.Cliente
where v.Codigo is null;

-- 2.5
select p.Codigo, p.Descricao
from Vendas v
right join Produtos p on v.Produto = p.Codigo
where v.Codigo is null;

-- 2.6
select c.Codigo, c.Nome,
       coalesce(sum(v.Quantidade * v.ValorVenda), 0) as TotalGasto,
       case 
           when coalesce(sum(v.Quantidade * v.ValorVenda), 0) = 0 then 'Sem Compras'
           when coalesce(sum(v.Quantidade * v.ValorVenda), 0) < 300 then 'Bronze'
           when coalesce(sum(v.Quantidade * v.ValorVenda), 0) < 700 then 'Prata'
           else 'Ouro'
       end as Perfil
from Clientes c
left join Vendas v on c.Codigo = v.Cliente
group by c.Codigo, c.Nome
order by TotalGasto desc;

use LojaTech2026;

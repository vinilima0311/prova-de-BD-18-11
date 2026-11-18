use LojaTech2026;

-- 4.1
create or replace view vwProdutosAtivos as
select p.Codigo, p.Descricao, c.Nome as Categoria, p.ValorVenda, p.Estoque
from Produtos p
inner join Categorias c on p.CategoriaId = c.Codigo
where p.Ativo = 1;

-- 4.2
create or replace view vwResumoClientes as
select c.Codigo, 
       c.Nome,
       count(v.Codigo) as QuantidadeCompras,
       coalesce(sum(v.Quantidade * v.ValorVenda), 0) as TotalGasto,
       max(v.DataVenda) as DataUltimaCompra,
       case 
           when coalesce(sum(v.Quantidade * v.ValorVenda), 0) = 0 then 'Sem Compras'
           when coalesce(sum(v.Quantidade * v.ValorVenda), 0) < 300 then 'Bronze'
           when coalesce(sum(v.Quantidade * v.ValorVenda), 0) < 700 then 'Prata'
           else 'Ouro'
       end as Perfil
from Clientes c
left join Vendas v on c.Codigo = v.Cliente
group by c.Codigo, c.Nome;

-- 4.3
select * 
from vwResumoClientes
where Perfil = 'Ouro';

use LojaTech2026;

create table if not exists HistoricoPrecos (
    Codigo int auto_increment primary key,
    ProdutoId int,
    ProdutoDescricao varchar(150),
    PrecoAnterior decimal(9,2),
    PrecoNovo decimal(9,2),
    DataHoraAlteracao datetime
);

create table if not exists VendasExcluidas (
    Codigo int primary key,
    Cliente int,
    Produto int,
    Quantidade int,
    ValorVenda decimal(18,2),
    DataVenda date,
    DataHoraExclusao datetime
);


	
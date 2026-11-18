use LojaTech2026;

-- 1.1
create table if not exists Categorias (
    Codigo int auto_increment primary key,
    Nome varchar(100) not null unique
);

-- 1.2
alter table Produtos 
    add column CategoriaId int,
    add column Estoque int not null default 0,
    add constraint fk_produto_categoria foreign key (CategoriaId) references Categorias(Codigo);

-- 1.3
insert into Categorias (Nome) values
('design e modelagem'),
('elétrica e eletrônica'),
('gestão'),
('programação'),
('sistemas operacionais');

update Produtos set CategoriaId = 1 where Codigo in (1, 6, 7, 8);
update Produtos set CategoriaId = 2 where Codigo in (2, 3);
update Produtos set CategoriaId = 3 where Codigo in (4, 5);
update Produtos set CategoriaId = 4 where Codigo in (9, 10);
update Produtos set CategoriaId = 5 where Codigo = 11;
update Produtos set Estoque = 20;
update Produtos set Estoque = 3 where Codigo = 2;
update Produtos set Estoque = 0 where Codigo = 6;

-- 1.4
alter table Clientes add column CEP varchar(9);

update Clientes set CEP = '01001-000' where Codigo = 1;
update Clientes set CEP = '20040-002' where Codigo = 2;

use LojaTech2026;
delimiter //

-- 5.1
create trigger trg_Vendas_BeforeInsert
before insert on Vendas
for each row
begin
    declare v_ativo int;
    declare v_estoque int;
    declare v_preco_tabela decimal(9,2);

    if new.Quantidade is null or new.Quantidade <= 0 then
        signal sqlstate '45000' set message_text = 'Erro: a quantidade deve ser maior de 0';
    end if;

    select Ativo, Estoque, ValorVenda 
    into v_ativo, v_estoque, v_preco_tabela
    from Produtos 
    where Codigo = new.Produto;

    if v_ativo = 0 then
        signal sqlstate '45000' set message_text = 'Erro: produto inativo';
    end if;

    if v_estoque < new.Quantidade then
        signal sqlstate '45000' set message_text = 'Erro: estoque insuficiente';
    end if;

    if new.ValorVenda is null or new.ValorVenda = 0 then
        set new.ValorVenda = v_preco_tabela;
    end if;

    if new.DataVenda is null then
        set new.DataVenda = curdate();
    end if;
end//

-- 5.2
create trigger trg_Vendas_AfterInsert
after insert on Vendas
for each row
begin
    update Produtos 
    set Estoque = Estoque - new.Quantidade
    where Codigo = new.Produto;
end//


delimiter ;

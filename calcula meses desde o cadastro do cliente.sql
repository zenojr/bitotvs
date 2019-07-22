alter table dw_rep_ultimo_impl
drop column dias_sem_cadastro

alter table dw_dim_clientes
add meses_impl int

select * from dw_dim_clientes

insert into dw_dim_clientes()
SELECT dt_implantacao ,  DATEDIFF(MONTH, convert(datetime, dt_implantacao, 103 ) , getdate() ) AS meses_impl
from dw_dim_clientes;

select * from dw_carga_ped_nf
select * from dw_dim_clientes
select * from dw_rep_ultimo_impl
select cast( dt_implantacao as date )
from dw_dim_clientes

select convert(datetime, dt_implantacao, 103) 
from dw_dim_clientes 

datediff(month, b.dt_implantacao, getdate()) AS dias_sem_cadastro
datediff(day,a.dt_implant,convert(datetime,(convert(varchar(12),GETDATE(),103)),103)) dias_sem_compra

create view [impl_cliente] as
SELECT a.cod_repres, b.cod_cli, b.nome_cli, dt_implantacao, 
DATEDIFF(MONTH, convert(datetime, dt_implantacao, 103 ) , getdate() ) AS meses_impl
FROM dbo.dw_carga_ped_nf a, dbo.dw_dim_clientes b

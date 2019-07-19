delete from dw_ultimo_pedido; 
insert into dw_ultimo_pedido
select a.dt_implant,a.cod_emitente,a.num_ped_nf num_ped_cli,a.cod_repre,
SUM(peso_venda) peso_venda,
SUM(vl_tot_ped) vl_tot_ped,
datediff(day,a.dt_implant,convert(datetime,(convert(varchar(12),GETDATE(),103)),103)) dias_sem_compra
FROM dbo.dw_pedido_nf a, v_ultima_data_pedido b, v_utlimo_pedido c
WHERE a.tipo_info='PD'
and a.cod_emitente=b.cod_emitente
and a.dt_implant=b.dt_implant
and a.cod_emitente=c.cod_emitente
and a.num_ped_nf=c.num_ped_nf
group by a.dt_implant,a.cod_emitente,a.cod_emitente,a.num_ped_nf,a.cod_repre

delete from dw_rep_ultimo_impl;
insert into dw_rep_ultimo_impl
select a.cod_repres,
datediff(month, b.dt_implantacao, getdate()) AS dias_sem_cadastro
from dbo.dw_carga_ped_nf a, dbo.dw_dim_clientes b, dbo.dw_rep_ultimo_impl c
where a.tipo_info = 'PD'



alter table dw_dim_clientes
add dias_da_impl int

insert into dw_dim_clientes;



select * from dw_ultimo_pedido
select * from dw_pedido_nf
select * from dw_dim_clientes


create table dw_rep_ultimo_impl (
	cod_repre varchar(20),
	cod_cli int,
	nome_cli varchar(80),
	dt_implantacao datetime,
	dias_sem_cadastro int
);


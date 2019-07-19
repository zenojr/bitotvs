create view [impl_cliente] as
SELECT a.cod_repres, b.cod_cli, b.nome_cli, dt_implantacao, 
DATEDIFF(MONTH, convert(datetime, dt_implantacao, 103 ) , getdate() ) AS meses_impl
FROM dbo.dw_carga_ped_nf a, dbo.dw_dim_clientes b


select * from dw_carga_ped_nf 
select * from dw_dim_clientes 

select * from impl_cliente 
group by nome_cli

use [totvsbi_velho] EXEC sp_changedbowner 'sa'

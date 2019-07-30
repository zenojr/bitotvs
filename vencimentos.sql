select * from dw_dim_clientes 

select * from dw_carga_fat
select * from dw_carga_ped_nf
select * from dw_peso_cobre
select * from dw_peso_cobre_2
select * from dw_fat
select * from eis_dimensao_dat

select * from dw_vencimentos

drop table dw_vencimentos

create table dw_vencimentos (
	cod_empresa int,            
	cod_estab int,               
	cod_espec_docto char(20),
	cod_ser_docto char(20),           
	cod_tit_acr char(20),             
	cod_parcela char(20),            
	cod_cliente int,            
	cod_repres int,             
	cod_portador char(20),           
	dat_emis_docto char(40),         
	dat_vencto_tit_acr char(40),     
	dat_liquidac_tit_acr char(40),    
	dat_ult_liquidac_tit_acr char(40),
	val_liq_tit_acr char(40),         
	val_origin_tit_acr char(40)
)


update dw_dim_clientes
set meses_impl = DATEDIFF(MONTH, convert(datetime, dt_implantacao, 103 ) , getdate() )

select * from dw_vencimentos

select cod_cliente, dat_emis_docto from dw_vencimentos DATEDIFF(day, convert(datetime, dat_emis_docto, 103 ) , getdate() )
from dw_vencimentos

select cod_cliente, dat_vencto_tit_acr, dat_liquidac_tit_acr, datediff(day, convert(date, dat_vencto_tit_acr, 103), getdate() ) as dias_vcto
from dw_vencimentos
where dat_vencto_tit_acr like '%2019'

select cod_cliente, dat_vencto_tit_acr, dat_liquidac_tit_acr, 
datediff(day, convert(date, dat_vencto_tit_acr, 103), convert(date, dat_liquidac_tit_acr, 103) ) as dias_atraso
from dw_vencimentos
where dat_vencto_tit_acr like '%2019'  
and dat_liquidac_tit_acr not like '31/12/9999'
order by dias_atraso

declare @startdate varchar(20)
set @startdate = (select dat_emis_docto from dw_vencimentos where cod_tit_acr = 13050 )
print @startdate

SELECT nome_abrev, dt_implantacao ,  DATEDIFF(MONTH, convert(datetime, dt_implantacao, 103 ) , getdate() ) AS meses_impl
from dw_dim_clientes;

select cod_cliente, dat_emis_docto,  from dw_vencimentos

select * from dw_vencimentos

update dw_vencimentos
set dias_vcto = datediff(day, convert(date, dat_vencto_tit_acr, 103), getdate() )

update dw_vencimentos
set dias_atraso = datediff(day, convert(date, dat_vencto_tit_acr, 103), convert(date, dat_liquidac_tit_acr, 103) )


select * from dw_vencimentos


create view viewValoresVencimentos as
select cod_cliente, convert(decimal(17, 2), val_liq_tit_acr ), convert(decimal(17,2), val_origin_tit_acr)
from dw_vencimentos

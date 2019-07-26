select * from dw_dim_clientes 

select * from dw_carga_fat
select * from dw_carga_ped_nf
select * from dw_peso_cobre
select * from dw_peso_cobre_2
select * from dw_fat
select * from eis_dimensao_dat


create table dw_vencimentos (
	cod_empresa int,            
	cod_estab int,               
	cod_espec_docto int,
	cod_ser_docto int,           
	cod_tit_acr int,             
	cod_parcela int,            
	cdn_cliente int,            
	cdn_repres int,             
	cod_portador int,           
	dat_emis_docto char(40),         
	dat_vencto_tit_acr char(40),     
	dat_liquidac_tit_acr char(40),    
	dat_ult_liquidac_tit_acr char(40),
	val_liq_tit_acr char(40),         
	val_origin_tit_acr char(40)
)
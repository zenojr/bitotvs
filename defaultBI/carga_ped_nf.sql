use totvsbi_velho;

delete dw_carga_ped_nf;

delete from dw_pedido_nf where dt_implant >= GETDATE() - 200;

BULK 
INSERT dw_carga_ped_nf
FROM 'C:\totvsbi\CargaBI\Txt\bi-pedido-nf.txt' 
WITH ( CODEPAGE = 'ACP', FIELDTERMINATOR = ';' , ROWTERMINATOR = '\n' );

--delete from dw_pedido_nf;
insert into dw_pedido_nf
select 
substring(tipo_info,1,2),
substring(sit_ped,1,13),
substring(cotacao,1,7),
convert(datetime,dt_implant,103),
cast(cod_emitente as integer),
convert(datetime,dt_entrega,103),
substring(cod_repres,1,16),
substring(dw_dim_item.it_codigo,1,16),
cast(qtd_ped as decimal)/100,
CAST(vl_tot_ped as decimal)/100,
cast(qtd_fat as decimal)/100,
CAST(vl_tot_fat as decimal)/100,
cast(peso_venda as decimal)/100,
substring(num_ped_nf,1,9),
substring(num_ped_cli,1,9),
cast(qtd_ped as decimal)/100*peso_liq,
cast(qtd_ped as decimal)/100*peso_cobre,
cast(qtd_ped as decimal)/100*peso_pvc,
cast(qtd_fat as decimal)/100*peso_liq,
cast(qtd_fat as decimal)/100*peso_cobre,
cast(qtd_fat as decimal)/100*peso_pvc

from dw_carga_ped_nf, dw_dim_item
where dw_dim_item.it_codigo=substring(dw_carga_ped_nf.it_codigo,1,16)


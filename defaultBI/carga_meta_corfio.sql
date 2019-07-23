use totvsbi_velho;

delete dw_carga_meta_vendas;

BULK 
INSERT dw_carga_meta_vendas
FROM 'C:\totvsbi\CargaBI\Txt\bi-meta-corfio.txt' 
WITH ( CODEPAGE = 'ACP', FIELDTERMINATOR = ';' , ROWTERMINATOR = '\n' );

insert into dw_meta_vendas
select 
convert(date,data,103),
cast(peso_fat as decimal),
CAST(vlr_fat as decimal)/100,
cast(peso_aberto as decimal),
CAST(vlr_aberto as decimal)/100,
cast(meta as decimal),
cast(dia_util as decimal),
cast(peso_meta as decimal),
cast(mes_ref as decimal),
substring(versao,1,5),
substring(empresa,1,5)

from dw_carga_meta_vendas
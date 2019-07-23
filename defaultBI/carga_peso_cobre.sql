use totvsbi_velho;

delete dw_carga_peso_cobre;

BULK 
INSERT dw_carga_peso_cobre
FROM 'C:\totvsbi\CargaBI\Txt\bi-peso-cobre.txt' 
WITH ( CODEPAGE = 'ACP', FIELDTERMINATOR = ';' , ROWTERMINATOR = '\n' );

insert into dw_peso_cobre
select 
convert(date,data,103),
cast(peso_nor_rigido as decimal),
CAST(peso_nor_flex as decimal),
cast(peso_esp_rigido as decimal),
CAST(peso_esp_flex as decimal),
cast(meta_rigido as decimal),
cast(meta_flex as decimal),
cast(dias_uteis as decimal),
cast(meta_dia as decimal),
cast(ton_dia_rigido as decimal),
cast(ton_dia_flex as decimal),
cast(mes_ref as decimal)

from dw_carga_peso_cobre
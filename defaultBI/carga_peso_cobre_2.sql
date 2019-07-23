use totvsbi_velho;

delete dw_carga_peso_cobre_2;

BULK 
INSERT dw_carga_peso_cobre_2
FROM 'C:\totvsbi\CargaBI\Txt\bi-peso-cobre-2.txt' 
WITH ( CODEPAGE = 'ACP', FIELDTERMINATOR = ';' , ROWTERMINATOR = '\n' );

insert into dw_peso_cobre_2
select 
convert(date,data,103),
cast(peso_rigido as decimal),
CAST(peso_flex as decimal),
cast(peso_total as decimal)

from dw_carga_peso_cobre_2
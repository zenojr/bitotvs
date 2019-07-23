use totvsbi_velho;

delete dw_carga_fat;

BULK 
INSERT dw_carga_fat
FROM 'C:\totvsbi\CargaBI\Txt\bi-fat.txt' 
WITH ( CODEPAGE = 'ACP', FIELDTERMINATOR = ';' , ROWTERMINATOR = '\n' );

insert into dw_fat
select 
convert(date,data_tot,103),
cast(peso_fat_tot as decimal),
CAST(vlr_fat_tot as decimal)/100,
cast(peso_fat_aberto as decimal),
CAST(vlr_fat_aberto as decimal)/100
from dw_carga_fat
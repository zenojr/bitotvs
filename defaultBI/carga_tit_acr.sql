use totvsbi_velho;
delete from dw_vencimentos
BULK 
INSERT dw_vencimentos
FROM 'C:\totvsbi\CargaBI\Txt\tit-acr.txt' 
WITH ( CODEPAGE = 'ACP', FIELDTERMINATOR = ';' , ROWTERMINATOR = '\n' );

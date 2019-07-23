use totvsbi_velho;

delete from dw_dim_item;
BULK 
INSERT dw_dim_item
FROM 'C:\totvsbi\CargaBI\Txt\bi-item.txt' 
WITH ( CODEPAGE = 'ACP', FIELDTERMINATOR = ';' , ROWTERMINATOR = '\n' );
update dw_dim_item
set peso_liq=peso_liq/100,peso_cobre=peso_cobre/100,peso_pvc=peso_pvc/100;
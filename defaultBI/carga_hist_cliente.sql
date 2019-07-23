use totvsbi_velho;
delete from dw_dim_hist_cliente;
BULK 
INSERT dw_dim_hist_cliente
FROM 'C:\totvsbi\CargaBI\Txt\bi-hist-clientes.txt' 
WITH ( CODEPAGE = 'ACP', FIELDTERMINATOR = ';' , ROWTERMINATOR = '\n' );
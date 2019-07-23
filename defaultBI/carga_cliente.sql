use totvsbi_velho;
delete from dw_dim_clientes;
BULK 
INSERT dw_dim_clientes
FROM 'C:\totvsbi\CargaBI\Txt\bi-clientes.txt' 
WITH ( CODEPAGE = 'ACP', FIELDTERMINATOR = ';' , ROWTERMINATOR = '\n' );

update dw_dim_clientes
set meses_impl = DATEDIFF(MONTH, convert(datetime, dt_implantacao, 103 ) , getdate() )
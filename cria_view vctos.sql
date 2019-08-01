create view viewValores as
select cod_cliente, 
cast(val_liq_tit_acr as decimal) 
from dw_vencimentos

select * from dw_vencimentos
select cast( '3355.53' as decimal(17,2) ) from dw_vencimentos


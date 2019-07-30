create view viewValores as
select cod_cliente, 
cast(val_liq_tit_acr as decimal) 
from dw_vencimentos


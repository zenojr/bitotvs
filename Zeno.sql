select * from dw_dim_clientes;

alter table dw_dim_clientes
drop column dt_implantacao

alter table dw_dim_clientes
add dt_implantacao varchar(10);

SELECT CONVERT(date, dt_implantacao, 103)
from dw_dim_clientes;


SELECT DATEDIFF(month, dt_implantacao, getdate()) AS DateDiff
from dw_dim_clientes;


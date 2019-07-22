select * from dw_dim_clientes

alter table dw_dim_clientes
add  cod_rep int,
	 nom_abrev_rep char(20)

alter table dw_dim_clientes
add meses_impl int

alter table dw_dim_clientes
drop column meses_impl

delete from dw_dim_clientes
insert into dw_dim_clientes( meses_impl )
SELECT DATEDIFF(MONTH, convert(datetime, dt_implantacao, 103 ) , getdate() ) meses_impl
from dw_dim_clientes


update dw_dim_clientes
set meses_impl = DATEDIFF(MONTH, convert(datetime, dt_implantacao, 103 ) , getdate() )

SELECT nome_abrev, dt_implantacao ,  DATEDIFF(MONTH, convert(datetime, dt_implantacao, 103 ) , getdate() ) AS meses_impl
from dw_dim_clientes;

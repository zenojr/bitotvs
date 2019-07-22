select * from dw_dim_clientes

alter table dw_dim_clientes
add  cod_rep int,
	 nom_abrev_rep char(20)

alter table dw_dim_clientes
add meses_impl int

alter table dw_dim_clientes
drop column meses_impl

declare @cod_cli int
select @cod_cli = cod_cli from dw_dim_clientes
insert into dw_dim_clientes( meses_impl )
SELECT DATEDIFF(MONTH, convert(datetime, dt_implantacao, 103 ) , getdate() )
from dw_dim_clientes
where @cod_cli = @cod_cli
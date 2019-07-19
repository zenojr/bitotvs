select * from dw_dim_clientes

alter table dw_dim_clientes
add  cod_rep int,
	 nom_abrev_rep char(20)
USE [totvsbi_velho]
GO

/****** Object:  View [dbo].[v_ultimo_ped]    Script Date: 11/04/2010 15:21:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--drop view [dbo].[v_ultimo_ped]
create view [dbo].[v_ultimo_ped]
as
select dw_ultimo_pedido.dt_implant,
dw_ultimo_pedido.cod_emitente,dw_ultimo_pedido.num_ped_nf,
dw_ultimo_pedido.cod_repre,
dw_ultimo_pedido.peso_venda,
dw_dim_clientes.nom_cliente,
dw_dim_clientes.atividade,
dw_dim_clientes.categoria,
dw_ultimo_pedido.vl_tot_ped ,
1 qtd_cliente,
dias_sem_compra
FROM dw_ultimo_pedido, dw_dim_clientes
WHERE dw_ultimo_pedido.cod_emitente=dw_dim_clientes.cod_cliente
GO



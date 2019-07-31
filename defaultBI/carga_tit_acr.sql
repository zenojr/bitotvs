use totvsbi_velho;
delete from dw_vencimentos
BULK 
INSERT dw_vencimentos
FROM 'C:\totvsbi\CargaBI\Txt\tit-acr.txt' 
WITH ( CODEPAGE = 'ACP', FIELDTERMINATOR = ';' , ROWTERMINATOR = '\n' );

update dw_vencimentos
set dias_vcto = datediff(day, convert(date, dat_vencto_tit_acr, 103), getdate() )

update dw_vencimentos
set dias_atraso = datediff(day, convert(date, dat_vencto_tit_acr, 103), convert(date, dat_liquidac_tit_acr, 103) )

update dw_vencimentos
set val_liq_tit_acr = cast( val_liq_tit_acr as decimal(17,2))/100 from dw_vencimentos

update dw_vencimentos
set val_origin_tit_acr = cast( val_origin_tit_acr as decimal(17,2))/100 from dw_vencimentos


update dw_meta_vendas set versao = '' where data >= GETDATE() - 500
                                      and   data <= GETDATE() - 0; 
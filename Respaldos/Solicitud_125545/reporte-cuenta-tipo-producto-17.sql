------------------------------------------------------------------------------------------------
-------- Solicitud 125545 Reporte de cuentas de tipo producto 17  
-------- W. Valdiviezo    2018/09/07
-------- Script original: reporte-cuenta-tipo-producto-17.sql de la Solicitud 125545 
------------------------------------------------------------------------------------------------

select
ah_cta_banco as 'No. CUENTA',
ah_nombre as 'NOMBRE DEL TITULAR',
ah_estado as 'ESTADO CUENTA',
case ah_bloqueos
when 0 then 'NO'
else 'SI'
end 'BLOQUEO DE MOVIMIENTOS',

case (select count(1) from cob_ahorros..ah_his_bloqueo
                where hb_cuenta = 1669817
                and  hb_accion = 'B'
                and hb_levantado = 'NO')
when 0 then 'NO'
else 'SI'
end 'BLOQUEO DE VALORES',

case (select count(1)
                from cob_ahorros..ah_embargo
                where  he_cta_banco = a.ah_cta_banco
                and he_fecha_lev is null
                and he_usuario_lev is null)
when 0 then 'NO'
else 'SI'
end 'FONDOS RETENIDOS',
(select pb_descripcion from cob_remesas..pe_pro_bancario
where pb_pro_bancario = a.ah_prod_banc) as 'TIPO DE PRODUCTO'
from cob_ahorros..ah_cuenta a
where ah_prod_banc = 17
and ah_estado in ('A','I')

GO
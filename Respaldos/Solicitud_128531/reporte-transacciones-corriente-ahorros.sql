------------------------------------------------------------------------------------------------
-------- Solicitud 128531 Reporte de transacciones de ahorros y corriente desde 01/01/2018 hasta 
-------- un día anterior al actual de la Agencia Lago Agrio
-------- W. Valdiviezo    2018/09/24
-------- Script original: reporte-transacciones-corriente-ahorros.sql
------------------------------------------------------------------------------------------------

-- Consulta de las transacciones de las Cuentas Corrientes 
print 'Transacciones de Cuentas Corrientes'
print ''
select (select of_nombre from cobis..cl_oficina where of_oficina = b.hm_oficina) as 'Oficina', 
hm_fecha as 'Fecha', 
hm_tipo_tran as 'No. Transacción',
(select tn_descripcion from cobis..cl_ttransaccion where tn_trn_code = b.hm_tipo_tran) as 'Descripción',
hm_usuario as 'Usuario', 
case hm_estado
    when 'R' 
    then 'Si' 
    else 'No'
    end 'Reverso', 
hm_cta_banco as 'Cta. Afectada', 
hm_valor as 'Monto'
from cob_cuentas_his..cc_his_movimiento b
where hm_oficina = 3 and hm_fecha >= '01/01/2018'


-- Consulta de las transacciones de las Cuentas de Ahorros 
print ''
print 'Transacciones de Cuentas Ahorros'
print ''
select (select of_nombre from cobis..cl_oficina where of_oficina = b.hm_oficina) as 'Oficina', 
hm_fecha as 'Fecha', 
hm_tipo_tran as 'No. Transacción',
(select tn_descripcion from cobis..cl_ttransaccion where tn_trn_code = b.hm_tipo_tran) as 'Descripción',
hm_usuario as 'Usuario', 
case hm_estado
    when 'R' 
    then 'Si' 
    else 'No'
    end 'Reverso', 
hm_cta_banco as 'Cta. Afectada', 
hm_valor as 'Monto'
from cob_ahorros_his..ah_his_movimiento b
where hm_oficina = 3 and hm_fecha >= '01/01/2018'
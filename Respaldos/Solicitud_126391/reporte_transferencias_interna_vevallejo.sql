------------------------------------------------------------------------------------------------
-------- Solicitud 126391 Reporte de transferencias internas realizadas por el usuario vevallejo desde el 01/01/2018
-------- W. Valdiviezo    2018/09/07
-------- Script original: reporte_transferencias_interna_vevallejo.sql
------------------------------------------------------------------------------------------------

select hm_cta_banco as 'CTA. ORDENANTE', hm_ctadestino as 'CTA. BENEFICIARIA', of_nombre as 'OFICINA', hm_valor as 'MONTO', hm_usuario as 'USUARIO', hm_fecha as 'FECHA' from cob_ahorros_his..ah_his_movimiento, cobis..cl_oficina
where hm_oficina = of_oficina
and hm_ctadestino is not null
and hm_tipo_tran in ( 237 ,239 ,294, 300, 2519, 2520 ,2626, 2627)
and hm_fecha >= '01/01/2018'
and hm_usuario = 'vevallejo'
union 
select hm_cta_banco, hm_ctadestino, of_nombre, hm_valor, hm_usuario, hm_fecha as 'FECHA' from cob_cuentas_his..cc_his_movimiento, cobis..cl_oficina
where hm_oficina = of_oficina
and hm_ctadestino is not null
and hm_tipo_tran in ( 237 ,239 ,294, 300, 2519, 2520 ,2626, 2627)
and hm_fecha >= '01/01/2018'
and hm_usuario = 'vevallejo'

GO
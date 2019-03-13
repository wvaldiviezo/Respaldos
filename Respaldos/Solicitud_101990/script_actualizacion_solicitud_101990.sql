------------------------------------------------------------------------------------------------
-------- Solicitud 101990 Cambiar de RUC: 0000000005001 código de ente (2360587) por 1768014410001 código de ente (513579), y vincular las 17 cuentas al RUC correcto
-------- ANTERIOR					 					ACTUAL
--------  DIRECCIÓN GENERAL DE AVIACIÓN CIVIL			DAC
--------  Ente: 2360587									Ente: 513579
--------  Ruc: 0000000005001							Ruc: 1768014410001
--------  W. Valdiviezo    2018/09/25
-------- Script original: script_actuaizacion_solicitud_101990.sql
------------------------------------------------------------------------------------------------

-- actualización de la data
print 'Actualización del ente y del ruc del cliente en la tabla cobis..cl_cliente '
print '1. Ente del Cliente antes de actualizar: 2360587'
print '2. Ruc del Cliente antes de actualizar: 0000000005001'
if exists(select * from cobis..cl_cliente
where cl_det_producto in (select dp_det_producto from cobis..cl_det_producto
where dp_cuenta in(
'4006656221',
'4006672073',
'4006677366',
'4006682816',
'4006702137',
'4006722810',
'4006738015',
'4006753332',
'4006772687',
'4006777776',
'4006778594',
'4006783167',
'4006798340',
'4006808543',
'4006814926',
'4006815948',
'4006820147'
))
and cl_rol  = 'T')
BEGIN
update cobis..cl_cliente
set cl_cliente = 513579, cl_ced_ruc = '1768014410001'
where cl_det_producto in (select dp_det_producto from cobis..cl_det_producto
where dp_cuenta in(
'4006656221',
'4006672073',
'4006677366',
'4006682816',
'4006702137',
'4006722810',
'4006738015',
'4006753332',
'4006772687',
'4006777776',
'4006778594',
'4006783167',
'4006798340',
'4006808543',
'4006814926',
'4006815948',
'4006820147'
))
and cl_rol  = 'T'
END
GO
print '1. Ente del Cliente después de actualizar: 513579'
print '2. Ruc del cliente después de actualizar: 1768014410001'
print '---------------------------------------------------'
print '---------------------------------------------------'
print 'Actualización del ruc y del ente del cliente en la tabla cob_ahorros..ah_cuenta'
print '1. Ruc del Cliente antes de actualizar: 0000000005001'
print '2. Ent del Cliente antes de actualizar: 2360587'
--- ah_ced_ruc; ah_cliente
if exists(select 1 from cob_ahorros..ah_cuenta
where ah_cta_banco in(
'4006656221',
'4006672073',
'4006677366',
'4006682816',
'4006702137',
'4006722810',
'4006738015',
'4006753332',
'4006772687',
'4006777776',
'4006778594',
'4006783167',
'4006798340',
'4006808543',
'4006814926',
'4006815948',
'4006820147'
))
BEGIN
UPDATE cob_ahorros..ah_cuenta
set ah_ced_ruc = '1768014410001', ah_cliente = 513579
where ah_cta_banco in(
'4006656221',
'4006672073',
'4006677366',
'4006682816',
'4006702137',
'4006722810',
'4006738015',
'4006753332',
'4006772687',
'4006777776',
'4006778594',
'4006783167',
'4006798340',
'4006808543',
'4006814926',
'4006815948',
'4006820147'
)
END
GO
print '1. Ruc del cliente después de actualizar: 1768014410001'
print '2. Ente del Cliente después de actualizar: 513579'
print '---------------------------------------------------'
print '---------------------------------------------------'
print 'Actualización del ente del cliente en la tabla cobis..cl_det_producto'
print '1. Ente del Cliente antes de actualizar: 2360587'
--- dp_cliente_ec
if exists(select dp_cliente_ec from cobis..cl_det_producto
where dp_cuenta in(
'4006656221',
'4006672073',
'4006677366',
'4006682816',
'4006702137',
'4006722810',
'4006738015',
'4006753332',
'4006772687',
'4006777776',
'4006778594',
'4006783167',
'4006798340',
'4006808543',
'4006814926',
'4006815948',
'4006820147'
))
BEGIN
UPDATE cobis..cl_det_producto
set dp_cliente_ec = 513579
where dp_cuenta in(
'4006656221',
'4006672073',
'4006677366',
'4006682816',
'4006702137',
'4006722810',
'4006738015',
'4006753332',
'4006772687',
'4006777776',
'4006778594',
'4006783167',
'4006798340',
'4006808543',
'4006814926',
'4006815948',
'4006820147'
)
END
GO
print '2. Ente del Cliente después de actualizar: 513579'
------------------------------------------------------------------------------------------------
-------- Solicitud 128362 Atar la cuenta número 4011654622 al ente número 2987972 Ríos Sanchez Víctor Alonso
--------  W. Valdiviezo    2018/09/26
-------- Script original: rollback_actualizacion_solicitud_128362.sql
------------------------------------------------------------------------------------------------

print 'Actualización del Ente, RUC y Nombe del cliente en la tabla cob_ahorros..ah_cuenta '
print '1. Ente del Cliente antes de actualizar: 2987972'
print '2. Ruc del Cliente antes de actualizar: 0151829926'
print '3. Nombre del Cliente antes de actualizar: RÍOS SANCHEZ VÍCTOR ALONSO'
print '---------------------------------------------------------------------------------------------'

if exists(select * from cob_ahorros..ah_cuenta
          where ah_cta_banco = '4011654622')
BEGIN
	update cob_ahorros..ah_cuenta
	set ah_cliente = 2812247, ah_ced_ruc = '116045372', ah_nombre = 'BARBA ELIZALDE OLGA DOMITILA'
	where ah_cta_banco = '4011654622'
END
GO

print 'Actualización del Ente, RUC y Nombe del cliente en la tabla cob_ahorros..ah_cuenta '
print '1. Ente del Cliente después de actualizar: 2812247'
print '2. Ruc del Cliente después de actualizar: 116045372'
print '3. Nombre del Cliente después de actualizar: BARBA ELIZALDE OLGA DOMITILA'
print '---------------------------------------------------------------------------------------------'

use cobis
go
print 'Información antes de la actualización'
print 'No. CUENTA 4011654622 con ENTE 2812247 tiene el  PRODUCTO 5813742'
if exists(select 1 from cobis..cl_det_producto
		  where dp_det_producto in (5813742))
	BEGIN
		update cobis..cl_det_producto
        set dp_cliente_ec = 2812247
		where dp_det_producto = 5813742
	END
GO
print '--------------------------------------------------------------------------------------------------'
print 'Información después de la actualización'
print 'No. CUENTA 4011654622 con ENTE 2812247 tiene el  PRODUCTO 5813742'
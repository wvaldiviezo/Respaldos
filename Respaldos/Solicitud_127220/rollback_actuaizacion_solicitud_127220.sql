------------------------------------------------------------------------------------------------
-------- Solicitud 127220 ELIMINACIÓN Y/O ANULACIÓN DE RANGO INGRESADO INCORRECTO
-------- W. Valdiviezo    2018/09/14
-------- Script original: rollback_actuaizacion_solicitud_127220.sql
-------- Ejecutar este script en caso de presentarse algún inconvenientes con la ejecución del script
-------- rollback_actuaizacion_solicitud_127220.sql
------------------------------------------------------------------------------------------------

-- actualización de la data

print '1. Registro de rangos antes de actualizar: '
print 'lo_libreta_ini = 2629501; lo_libreta_fin = 2630000'

if exists(select * from cob_ahorros..ah_libreta_oficina where lo_oficina = 144 and lo_libreta_ini = 2629501)
BEGIN
     UPDATE cob_ahorros..ah_libreta_oficina
     SET lo_fecha_roficina = '09/14/2018', lo_libreta_ini = 2629501, lo_libreta_fin = 2632001
     WHERE lo_oficina = 144
           AND lo_estado = 'I'
           AND lo_libreta_ini = 2629501
           AND lo_libreta_fin = 2630000

           print 'Registro de los rangos después de actualizar: '
		   print 'lo_libreta_ini = 2629501; lo_libreta_fin = 2632001'
END
GO

print '2. Registro de rangos antes de actualizar: '
print 'lo_libreta_ini = 2632001; lo_libreta_fin = 2632500'

if exists(select * from cob_ahorros..ah_libreta_oficina where lo_oficina = 144 and lo_libreta_ini = 2632002)
BEGIN
     UPDATE cob_ahorros..ah_libreta_oficina
     SET lo_fecha_roficina = '09/14/2018', lo_libreta_ini = 2632002 , lo_libreta_fin = 2632500
     WHERE lo_oficina = 144
           AND lo_estado = 'I'
           AND lo_libreta_ini = 2632001
           AND lo_libreta_fin = 2632500        

           print 'Registro de los rangos después de actualizar: '
		   print 'lo_libreta_ini = 2632002; lo_libreta_fin = 2632500'
END
GO
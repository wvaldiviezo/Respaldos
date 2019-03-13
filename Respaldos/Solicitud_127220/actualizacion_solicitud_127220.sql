------------------------------------------------------------------------------------------------
-------- Solicitud 127220 ELIMINACIÓN Y/O ANULACIÓN DE RANGO INGRESADO INCORRECTO
-------- 			lo_libreta_ini 	- 	lo_libreta_fin
-------- 				2629501 	- 		2632001
-------- 				2632002 	- 		2632500
-------- W. Valdiviezo    2018/09/14
-------- Script original: actuaizacion_solicitud_127220.sql
------------------------------------------------------------------------------------------------

/* Nota: 
** Antes de actualizar los registros se debe verificar si en la tabla cob_ahorros..ah_num_libreta 
** no se están usando los rangos generados
** select * from cob_ahorros..ah_num_libreta where nl_nro_libreta = xxxxxxx
*/
-- actualización de la data

print '1. Registro de rangos antes de actualizar: '
print 'lo_libreta_ini = 2629501; lo_libreta_fin = 2632001'

if exists(select * from cob_ahorros..ah_libreta_oficina where lo_oficina = 144 and lo_libreta_ini = 2629501)
BEGIN
     UPDATE cob_ahorros..ah_libreta_oficina
     SET lo_fecha_roficina = '09/14/2018', lo_libreta_ini = 2629501, lo_libreta_fin = 2630000
     WHERE lo_oficina = 144
           AND lo_estado = 'I'
           AND lo_libreta_ini = 2629501
           AND lo_libreta_fin = 2632001

           print 'Registro de los rangos después de actualizar: '
		   print 'lo_libreta_ini = 2629501; lo_libreta_fin = 2630000'
END
GO

print '2. Registro de rangos antes de actualizar: '
print 'lo_libreta_ini = 2632002; lo_libreta_fin = 2632500'

if exists(select * from cob_ahorros..ah_libreta_oficina where lo_oficina = 144 and lo_libreta_ini = 2632002)
BEGIN
     UPDATE cob_ahorros..ah_libreta_oficina
     SET lo_fecha_roficina = '09/14/2018', lo_libreta_ini = 2632001 , lo_libreta_fin = 2632500
     WHERE lo_oficina = 144
           AND lo_estado = 'I'
           AND lo_libreta_ini = 2632002
           AND lo_libreta_fin = 2632500        

           print 'Registro de los rangos después de actualizar: '
		   print 'lo_libreta_ini = 2632001; lo_libreta_fin = 2632500'
END
GO
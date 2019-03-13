------------------------------------------------------------------------------------------------
-------- Solicitud 136916 detalle de las fechas de actualización de datos del cliente: CHANGO ARMIJO EDISA CUMANDA 
-------- con número de cédula 0200365633, antes del 31 de octubre de 2018
-------- W. Valdiviezo    2018/11/08
-------- Script original: detalle_fechas_actualizacion_sol_136916.sql
------------------------------------------------------------------------------------------------

USE cobis
GO

SELECT  tn_descripcion as 'Descripcion Modificacion',
	ts_fecha as 'Fecha Modificacion',
	ts_hora  as 'Hora Modificacion' ,
	ts_usuario as 'Usuario Modifica',
	(select of_nombre from cobis..cl_oficina where of_oficina = a.ts_oficina) as 'Oficina Modifica',
	ts_terminal as 'Terminal Modifica',
 	en_nomlar as 'Cliente'
FROM cobis..cl_tran_servicio a, cobis..cl_ente b,
     cobis..cl_ttransaccion c, cobis..cl_oficina d
WHERE tn_trn_code = ts_tipo_transaccion
AND ts_fecha    < '10/31/2018'
AND b.en_ente = a.ts_ente
AND en_ced_ruc = '0200365633'

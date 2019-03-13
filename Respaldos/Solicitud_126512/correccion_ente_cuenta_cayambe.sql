------------------------------------------------------------------------------------------------
-------- Solicitud 126512 Corrección de la cuenta al  ente correcto
-------- W. Valdiviezo    2018/09/28
-------- Script original: correccion_ente_cuenta_cayambe.sql
------------------------------------------------------------------------------------------------
-- El resultado de la actualización debería ser la siguiente:
--
-- Nombre: Imbaquingo Catucuago Jose Joaquin   		Nombre: Lanchimba Lanchimba Maria Rosalia 
-- Ente:   3083082								    Ente:   2040694
-- C.I.:   1708592371  								C.I.:   1724067705
-- Cta. Ahorros: 4011870016						Cta. Ahorros: 4004100208


use cobis
go
print 'Información antes de la actualización'
print 'CLIENTE Lanchimba Lanchimba Maria Rosalia con ENTE 2040694 tiene los PRODUCTOS 3656011 y 5880098'
print 'CLIENTE Imbaquingo Catucuago Jose Joaquin con ENTE 3083082 NO tiene PRODUCTOS'
--- Actualización
if exists(select 1 from cobis..cl_det_producto
		  where dp_det_producto in (3656011,5880098 ))
	BEGIN
		update cobis..cl_det_producto
        set dp_cliente_ec = 3083082
		where dp_det_producto = 5880098
	END
GO
print '--------------------------------------------------------------------------------------------------'
print 'Información después de la actualización'
print 'CLIENTE Lanchimba Lanchimba Maria Rosalia con ENTE 2040694 tiene el PRODUCTO 3656011, Cta Ahorros: 4004100208'
print 'CLIENTE Imbaquingo Catucuago Jose Joaquin con ENTE 3083082 tiene el PRODUCTO 5880098, Cta Ahorros: 4011870016'
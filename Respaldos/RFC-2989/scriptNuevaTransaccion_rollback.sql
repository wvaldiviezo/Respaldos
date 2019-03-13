------------------------------------------------------------------------------------------------
-------- script RFC 201807-2989 Deshabilitación de opciones para apertura y actualización de personas tipo USUARIOS
-------- W. Valdiviezo
-------- 01/08/2018
------------------------------------------------------------------------------------------------

USE cobis
GO

SET NOCOUNT ON
GO

-- Insertar una nueva transacción para SP

PRINT ''
PRINT '=> Elimina Transacción: "171118 - Deshabilitación de opciones para apertura y actualización de personas tipo USUARIOS'
IF EXISTS(SELECT 1 FROM cobis..cl_ttransaccion WHERE tn_trn_code IN (171118))
BEGIN
   DELETE FROM cobis..cl_ttransaccion WHERE tn_trn_code IN (171118)
END
GO

-- Relacionar el SP con la trasacción creada.
-- Asociar al sp: 1400 - sp_front_end

PRINT ''
PRINT '=> Elimina Transacción: "171118 - Deshabilitación de opciones para apertura y actualización de personas tipo USUARIOS'
IF EXISTS(SELECT 1 FROM cobis..ad_pro_transaccion WHERE pt_transaccion IN (171118) AND pt_procedure IN (171118) AND pt_producto IN (2))
BEGIN
   DELETE FROM cobis..ad_pro_transaccion WHERE pt_transaccion IN (171118) AND pt_procedure IN (171118) AND pt_producto IN (2)
END
GO
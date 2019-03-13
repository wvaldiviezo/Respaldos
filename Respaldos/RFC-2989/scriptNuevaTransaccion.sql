------------------------------------------------------------------------------------------------
-------- script RFC 201807-2989 Deshabilitación de opciones para apertura y actualización de personas tipo USUARIOS
-------- W. Valdiviezo
-------- 01/08/2018
------------------------------------------------------------------------------------------------

-- Insertar una nueva transacción para SP
use cobis
go 

SET NOCOUNT ON
GO

PRINT ''

PRINT '   Crea Transacción: "171118 - Deshabilitación de opciones para apertura y actualización de personas tipo USUARIOS'
IF EXISTS(SELECT 1 FROM cobis..cl_ttransaccion WHERE tn_trn_code IN (171118))
BEGIN
   DELETE FROM cobis..cl_ttransaccion WHERE tn_trn_code IN (171118)
END
GO

insert into cobis..cl_ttransaccion (tn_trn_code, tn_descripcion, tn_nemonico ,tn_desc_larga ) values (171118, 'BLOQUEO PANEL MODULO CLIENTES', 'CLCONT','BLOQUEO PANEL MODULO CLIENTES POR ROL Y TIPO DE CLIENTE')
GO


-- Relacionar el SP con la trasacción creada.
-- Asociar al sp: 1400 - sp_front_end

PRINT ''
PRINT '   Crea Relación: Transacción "171118 - Deshabilitación de opciones para apertura y actualización de personas tipo USUARIOS"'
IF EXISTS(SELECT 1 FROM cobis..ad_pro_transaccion WHERE pt_transaccion IN (171118) AND pt_procedure IN (171118) AND pt_producto IN (2))
BEGIN
   DELETE FROM cobis..ad_pro_transaccion WHERE pt_transaccion IN (171118) AND pt_procedure IN (171118) AND pt_producto IN (2)
END
GO

insert into cobis..ad_pro_transaccion(pt_producto, pt_tipo, pt_moneda,pt_transaccion,pt_estado,pt_fecha_ult_mod,pt_procedure, pt_especial ) values(2,'R',0,171118,'V',getdate(),1400, null)
GO


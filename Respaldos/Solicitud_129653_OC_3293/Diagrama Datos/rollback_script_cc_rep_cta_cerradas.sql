﻿
/* <descripcion> rfc_201712_1907.sql </descripcion> */
/* <autor> Richard Vicente Rodríguez Jumbo </autor> */
/* <fechaCreacion> 23/02/2018 </fechaCreacion> */
/* Historial de Cambios */
/* <descripcion>  </descripcion> */
/* <cambio idRFC="RFC-201712-1907" autor="Richard Rodríguez" fecha="23/02/2018"> */
/*  */

/*Orden de cambio: 3293 W. Valdiviezo Fecha: 17/08/2018*/
/*Descripción: RollBack del scrip_crear_tabla_ccrep_cta_cerradas.sql*/


SET NOCOUNT ON
GO

USE cob_reportbatch
GO

PRINT ''
PRINT '=> Crea Tabla: "cob_reportbatch..cc_rep_cta_cerradas"'
IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'cc_rep_cta_cerradas' AND type = 'U')
BEGIN
   DROP TABLE cc_rep_cta_cerradas
END
GO
CREATE TABLE cc_rep_cta_cerradas(
   cc_fec_fecha            CHAR(15)   NOT NULL,   -- Fecha de Cierre de la Cuenta
   cc_num_cuenta           CHAR(16)   NOT NULL,   -- Número de Cuenta con Estado Cerrada
   cc_num_identificacion   CHAR(15)   NOT NULL,   -- Número de Identificación del Titular de la Cuenta Cerrada
   cc_des_nombres          CHAR(60)   NOT NULL,   -- Descripción de Apellidos y Nombres del Titular de la Cuenta Cerrada
   cc_des_tipo             CHAR(64)   NOT NULL,   -- Descripción de Tipo de Producto asociado a la Cuenta Cerrada
   cc_cod_producto         CHAR(10)   NOT NULL,   -- Códido de Producto Bancario de la Cuenta Cerrada
   cc_des_motivo_cierre    CHAR(64)   NOT NULL,   -- Descripción de Motivo del Cierre de la Cuenta
   cc_des_observacion      CHAR(50)   NOT NULL,   -- Descripción de Motivo del Cierre de la Cuenta
)
GO

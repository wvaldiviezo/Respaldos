/******************************************************************/
/*  Archivo:             sp_rep_cta_cerradas.sp                   */
/*  Stored procedure:    sp_rep_cta_cerradas                      */
/*  Base de datos:       cob_cuentas                                    */
/******************************************************************/
/*                        IMPORTANTE                              */
/*  Este programa es parte de los paquetes bancarios propiedad de */
/*  "MACOSA", representantes exclusivos para el Ecuador de la     */
/*  "NCR CORPORATION".                                            */
/*  Su uso no autorizado queda expresamente prohibido asi como    */
/*  cualquier alteracion o agregado hecho por alguno de sus       */
/*  usuarios sin el debido consentimiento por escrito de la       */
/*  Presidencia Ejecutiva de MACOSA o su representante.           */
/******************************************************************/
/*                          PROPOSITO                             */
/*  Reporte Mensual de Actualización de Datos de Clientes         */
/******************************************************************/
/*                        MODIFICACIONES                          */
/*  FECHA              AUTOR              RAZON                   */
/*  22/Feb/2018        R. Rodriguez       RFC-201712-1907         */
/*  15/Oct/2018        W. Valdiviezo      OC-201810-3293          */
/******************************************************************/

USE cob_cuentas
GO


IF EXISTS (SELECT 1 FROM sysobjects where name = 'sp_rep_cta_cerradas')
   DROP proc sp_rep_cta_cerradas
GO

CREATE PROC sp_rep_cta_cerradas (
-- Parámetros de Entrada
   @i_fecha            DATETIME       ,   -- Fecha de Proceso
   @i_batch            INT      = NULL,   -- Número de Proceso Batch
   @i_sarta            INT      = NULL,   -- Número de Sarta
   @i_secuencial       INT      = NULL,   -- Secuencial de Ejecución
   @i_corrida          INT      = NULL,   -- Número de Corrida
   @i_intento          INT      = NULL    -- Número de Intento de Corrida
)
AS
DECLARE
-- Variables de Trabajo
   @w_sp_name          VARCHAR(64) ,      -- Nombre del Procedimiento
   @w_fecha            VARCHAR(10) ,      -- Fecha de Trabajo
   @w_ruta             varchar(255),      -- Ruta de .ini para Ejecución de Batch
   @w_path_cabecera    VARCHAR(255),      -- Path de Ubicación del Archivo de Cabecera
   @w_nomb_cabecera    VARCHAR(255),      -- Nombre del Archivo de Cabecera
   @w_path_listado     VARCHAR(255),      -- Path de Ubicación del Listado
   @w_nomb_listado     VARCHAR(255),      -- Nombre del Arhivo de Listado
   @w_nomb_reporte     VARCHAR(255),      -- Nombre del Reporte
   @w_nomb_reporte_log VARCHAR(255),      -- Log al Procesar Reporte
   @w_nomb_reporte_fin VARCHAR(255),      -- Nombre del Reporte
   @w_comando_bat      VARCHAR(255),      -- Comando de Ejecución
   @w_comando_ret      INT         ,      -- Retorno de Ejecución del Comando Bat
   @w_msg_error        VARCHAR(255),      -- Mensaje de Error
   @w_retorno          INT         ,      -- Retorno de Ejecución de Stored Procedure
   @w_fecha_ini        VARCHAR(10) ,      -- Fecha Inicio para Reporte
   @w_fecha_fin        VARCHAR(10)        -- Fecha Fin para Reporte


/* Setea Variables de Trabajo */
SELECT @w_sp_name       = 'sp_rep_cta_cerradas',
       @w_path_cabecera = '/cobis/cobis/ctacte/batch/fuentes/',
       @w_nomb_cabecera = 'cab_rep_cta_cerradas.txt',
       @w_path_listado  = '/cobis/cobis/ctacte/batch/listados/',
       @w_nomb_listado  = 'rep_cta_cerradas.lis',
       @w_fecha         = CONVERT(VARCHAR(10), @i_fecha, 103),
       @w_ruta          = pa_char FROM cobis..cl_parametro WHERE pa_nemonico = 'RUTAPP' AND pa_producto = 'ADM'
SELECT @w_fecha_ini     = '01/01/' + SUBSTRING(@w_fecha, 7, 4),
       @w_fecha_fin     = SUBSTRING(@w_fecha, 4, 2) + '/' + SUBSTRING(@w_fecha, 1, 2) + '/' + SUBSTRING(@w_fecha, 7, 4)


/* Arma Nombre de Archivos */
SELECT @w_nomb_reporte     = @w_path_listado + SUBSTRING(@w_nomb_listado, 1, (LEN(@w_nomb_listado) - 4)) + '_' + SUBSTRING(@w_fecha, 1, 2) + SUBSTRING(@w_fecha, 4, 2) + SUBSTRING(@w_fecha, 7, 4) + SUBSTRING(@w_nomb_listado, CHARINDEX('.', @w_nomb_listado), LEN(@w_nomb_listado)),
       @w_nomb_reporte_log = @w_path_listado + SUBSTRING(@w_nomb_listado, 1, (LEN(@w_nomb_listado) - 4)) + '_' + SUBSTRING(@w_fecha, 1, 2) + SUBSTRING(@w_fecha, 4, 2) + SUBSTRING(@w_fecha, 7, 4) + '.out',
       @w_nomb_reporte_fin = @w_path_listado + 'cta_cerrada' + '_' + SUBSTRING(@w_fecha, 1, 2) + SUBSTRING(@w_fecha, 4, 2) + SUBSTRING(@w_fecha, 7, 4) + SUBSTRING(@w_nomb_listado, CHARINDEX('.', @w_nomb_listado), LEN(@w_nomb_listado))


/* Copia Archivo Cabecera al Path Listados */
SELECT @w_comando_bat = NULL
SELECT @w_comando_bat = 'cp ' + @w_path_cabecera + @w_nomb_cabecera + ' ' + @w_path_listado
EXECUTE @w_comando_ret = master..xp_cmdshell @w_comando_bat
IF @w_comando_ret != 0 
BEGIN
   SELECT @w_msg_error = 'Error al Copiar Archivo Cabecera: "' + @w_nomb_cabecera + '" al path: "' + @w_path_listado + '"'
   GOTO ERROR
END


/* Limpia Tabla "cob_reportbatch..cc_rep_cta_cerradas" */
DELETE FROM cob_reportbatch..cc_rep_cta_cerradas


/* Llena Tabla "cob_reportbatch..cc_rep_cta_cerradas" */
INSERT INTO cob_reportbatch..cc_rep_cta_cerradas
-- CUENTAS DE AHORRO NORMAL --
SELECT ISNULL(CONVERT(CHAR(15), hc_fecha, 101), ''),
       ISNULL(CONVERT(CHAR(16), ah_cta_banco), ''),
       ISNULL(CONVERT(CHAR(15), ah_ced_ruc), ''),
       ISNULL(CONVERT(CHAR(60), ah_nombre), ''),
       ISNULL(CONVERT(CHAR(64), pd_descripcion), ''),
       ISNULL(CONVERT(CHAR(10), ah_prod_banc), ''),
       ISNULL(CONVERT(CHAR(64), UPPER(valor)), ''),
       ISNULL(CONVERT(CHAR(50), UPPER(hc_observacion)), ''),
       ISNULL(CONVERT(CHAR(64), (select of_nombre from cobis..cl_oficina where of_oficina = a.hc_oficina)), ''),
       ISNULL(CONVERT(CHAR(64), (select c.valor 
	    from cobis..cl_tabla t, 
             cobis..cl_catalogo c,
             cobis..cl_oficina
        where of_oficina =  a.hc_oficina
        and t.tabla = 'cl_zonal'
        and t.codigo = c.tabla
        and c.codigo = of_zonal)),''),                                 
       ISNULL(CONVERT(CHAR(35), hc_saldo), ''),
       ISNULL(CONVERT(CHAR(30), hc_autorizante ), '')
   FROM   cob_ahorros..ah_his_cierre a,
          cob_ahorros..ah_cuenta,
          cobis..cl_producto,
          cobis..cl_catalogo
   -- Join Tablas --
   WHERE  hc_filial             = ah_filial
   AND    hc_cuenta             = ah_cuenta
   AND    pd_producto           = ah_producto
   AND    hc_causa              = codigo
   -- Opciones Tablas --
   AND    hc_fecha              >= @w_fecha_ini
   AND    hc_fecha              <= @w_fecha_fin
   AND    ah_estado             = 'C'
   AND    ah_prod_banc          NOT IN (SELECT CONVERT(SMALLINT, codigo)
                                        FROM   cobis..cl_catalogo
                                        WHERE  tabla = (SELECT codigo
                                                       FROM   cobis..cl_tabla
                                                        WHERE  tabla = 'ah_prg_productos'))
   AND    pd_estado             = 'V'
   AND    estado                = 'V'
   AND    tabla                 = (SELECT codigo
                                   FROM   cobis..cl_tabla
                                   WHERE  tabla = 'ah_causa_cierre')
   UNION
-- CUENTAS DE AHORRO PROGRAMADO --
SELECT ISNULL(CONVERT(CHAR(15), hc_fecha, 101), ''),
       ISNULL(CONVERT(CHAR(16), ah_cta_banco), ''),
       ISNULL(CONVERT(CHAR(15), ah_ced_ruc), ''),
       ISNULL(CONVERT(CHAR(60), ah_nombre), ''),
       ISNULL(CONVERT(CHAR(64), pd_descripcion), ''),
       ISNULL(CONVERT(CHAR(10), ah_prod_banc), ''),
       ISNULL(CONVERT(CHAR(64), UPPER(valor)), ''),
       ISNULL(CONVERT(CHAR(50), UPPER(hc_observacion)), ''),
       ISNULL(CONVERT(CHAR(64), (select of_nombre from cobis..cl_oficina where of_oficina = a.hc_oficina)), ''),
       ISNULL(CONVERT(CHAR(64), (select c.valor 
	    from cobis..cl_tabla t, 
             cobis..cl_catalogo c,
             cobis..cl_oficina
        where of_oficina =  a.hc_oficina
        and t.tabla = 'cl_zonal'
        and t.codigo = c.tabla
        and c.codigo = of_zonal)),''),                                 
       ISNULL(CONVERT(CHAR(35), hc_saldo), ''),
       ISNULL(CONVERT(CHAR(30), hc_autorizante ), '')
   FROM   cob_ahorros..ah_his_cierre a,
          cob_ahorros..ah_cuenta,
          cobis..cl_producto,
          cobis..cl_catalogo
   -- Join Tablas --
   WHERE  hc_filial             = ah_filial
   AND    hc_cuenta             = ah_cuenta
   AND    pd_producto           = ah_producto
   AND    hc_causa              = codigo
   -- Opciones Tablas --
   AND    hc_fecha              >= @w_fecha_ini
   AND    hc_fecha              <= @w_fecha_fin
   AND    ah_estado             = 'C'
   AND    ah_prod_banc          IN (SELECT CONVERT(SMALLINT, codigo)
                                    FROM   cobis..cl_catalogo
                                    WHERE  tabla = (SELECT codigo
                                                    FROM   cobis..cl_tabla
                                                    WHERE  tabla = 'ah_prg_productos'))
   AND    pd_estado             = 'V'
   AND    estado                = 'V'
   AND    tabla                 = (SELECT codigo
                                   FROM   cobis..cl_tabla
                                   WHERE  tabla = 'ah_prg_motivo_cierre')
   UNION
-- CUENTAS CORRIENTES --
SELECT ISNULL(CONVERT(CHAR(15), hc_fecha, 101), ''),
       ISNULL(CONVERT(CHAR(16), cc_cta_banco), ''),
       ISNULL(CONVERT(CHAR(15), cc_ced_ruc), ''),
       ISNULL(CONVERT(CHAR(60), cc_nombre), ''),
       ISNULL(CONVERT(CHAR(64), pd_descripcion), ''),
       ISNULL(CONVERT(CHAR(10), cc_prod_banc), ''),
       ISNULL(CONVERT(CHAR(64), UPPER(valor)), ''),
       ISNULL(CONVERT(CHAR(50), UPPER(hc_observacion)), ''),
	   ISNULL(CONVERT(CHAR(64), (select of_nombre from cobis..cl_oficina where of_oficina = a.hc_oficina)), ''),
       ISNULL(CONVERT(CHAR(64), (select c.valor 
	    from cobis..cl_tabla t, 
             cobis..cl_catalogo c,
             cobis..cl_oficina
        where of_oficina =  a.hc_oficina
        and t.tabla = 'cl_zonal'
        and t.codigo = c.tabla
        and c.codigo = of_zonal)),''),                                 
       ISNULL(CONVERT(CHAR(35), hc_saldo), ''),
       ISNULL(CONVERT(CHAR(30), hc_autorizante ), '')
   FROM   cob_cuentas..cc_his_cierre a,
          cob_cuentas..cc_ctacte,
          cobis..cl_producto,
          cobis..cl_catalogo
   -- Join Tablas --
   WHERE  hc_filial             = cc_filial
   AND    hc_cuenta             = cc_ctacte
   AND    pd_producto           = cc_producto
   AND    hc_causa              = codigo
   -- Opciones Tablas --
   AND    hc_fecha              >= @w_fecha_ini
   AND    hc_fecha              <= @w_fecha_fin
   AND    cc_estado             = 'C'
   AND    pd_estado             = 'V'
   AND    estado                = 'V'
   AND    tabla                 = (SELECT codigo
                                   FROM   cobis..cl_tabla
                                   WHERE  tabla = 'cc_causa_cierre')
-- ORDEN
ORDER BY 1


/* Genera Archivo Plano BCP OUT con Datos de Tabla "cob_reportbatch..cc_rep_cta_cerradas" */
SELECT @w_comando_bat = null
SELECT @w_comando_bat =  @w_ruta + ' bcp cob_reportbatch..cc_rep_cta_cerradas out ' + @w_nomb_reporte + ' -c -t "|" -b 1000 > ' +  @w_nomb_reporte_log + ' -auto'
EXECUTE @w_comando_ret = master..xp_cmdshell @w_comando_bat
IF @w_comando_ret != 0 
BEGIN
   SELECT @w_msg_error = 'Error al Generar Reporte (BCP OUT) sobre la Tabla cob_reportbatch..cc_rep_cta_cerradas'
   GOTO ERROR
END


/* Concatena Cabecera + Archivo Plano BCP OUT */
SELECT @w_comando_bat = null
SELECT @w_comando_bat = 'cat ' + @w_path_listado + @w_nomb_cabecera + ' ' + @w_nomb_reporte + ' > '+ @w_nomb_reporte_fin
EXECUTE @w_comando_ret = master..xp_cmdshell @w_comando_bat
IF @w_comando_ret != 0 
BEGIN
   SELECT @w_msg_error = 'Error al Concatenar Cabecera y Archivo Plano BCP OUT ' +  @w_nomb_reporte_fin
   GOTO ERROR
END


/* Elimina Cabecera Temporal */
SELECT @w_comando_bat = null
SELECT @w_comando_bat = 'rm ' + @w_path_listado + @w_nomb_cabecera
EXECUTE @w_comando_ret = master..xp_cmdshell @w_comando_bat
IF @w_comando_ret != 0
BEGIN
   PRINT 'Error al Elimiar el archivo "cab_rep_cta_cerradas.txt" o archivo no existe en la ruta: %1!', @w_path_listado
END


/* Elimina Archivo Detalle */
SELECT @w_comando_bat = null
SELECT @w_comando_bat = 'rm ' + @w_nomb_reporte
EXECUTE @w_comando_ret = master..xp_cmdshell @w_comando_bat
IF @w_comando_ret != 0
BEGIN
   PRINT 'Error al Elimiar archivo: %1! o archivo no existe en la ruta: %2!', @w_nomb_reporte, @w_path_listado
END


/* Elimina Archivo Log .out */
SELECT @w_comando_bat = null
SELECT @w_comando_bat = 'rm ' + @w_nomb_reporte_log
EXECUTE @w_comando_ret = master..xp_cmdshell @w_comando_bat
IF @w_comando_ret != 0
BEGIN
   PRINT 'Error al Elimiar archivo: %1! o archivo no existe en la ruta: %2!', @w_nomb_reporte_log, @w_path_listado
END


RETURN 0


ERROR:
EXEC @w_retorno = cobis..sp_ba_error_log
     @i_sarta       = @i_sarta,
     @i_batch       = @i_batch,
     @i_secuencial  = @i_secuencial,
     @i_corrida     = @i_corrida,
     @i_intento     = @i_intento,
     @i_error       = @w_comando_ret,
     @i_detalle     = @w_msg_error
     
     IF @w_retorno != 0
        RETURN @w_retorno
     ELSE
        RETURN @w_retorno
GO

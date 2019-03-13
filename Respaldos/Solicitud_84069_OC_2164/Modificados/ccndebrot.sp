/************************************************************************/
/*  Archivo:             ccndebrot.sp                                   */
/*  Stored procedure:    sp_nd_ctas_rotativas                           */
/*  Base de datos:       cob_cuentas                                    */
/*  Disenado por:        Cristian Veloz M.                              */
/*  Fecha de escritura:  24/Oct/2011                                    */
/************************************************************************/
/*                      IMPORTANTE                                      */
/* Este programa es parte de los paquetes bancarios propiedad de        */
/* MACOSA", representantes exclusivos para el Ecuador de la             */
/* "NCR CORPORATION".                                                   */
/* Su uso no autorizado queda expresamente prohibido asi como           */
/* cualquier alteracion o agregado hecho por alguno de sus              */
/* usuarios sin el debido consentimiento por escrito de la              */
/* Presidencia Ejecutiva de MACOSA o su representante.                  */
/************************************************************************/
/*                      PROPOSITO                                       */
/*  Este programa realiza las notas de débito de cuentas rotativas      */
/************************************************************************/
/*                      MODIFICACIONES                                  */
/*      FECHA     AUTOR             RAZON                               */
/* 24/Oct/2011    C. Veloz          Emision inicial                     */
/* 01/Oct/2018    W. Valdiviezo     Corrección de la emisión de mensajes*/
/*									En Nota de Débito					*/
/************************************************************************/
use cob_cuentas
go

if exists (select * from sysobjects where name = 'sp_nd_ctas_rotativas')
   drop proc sp_nd_ctas_rotativas
go

create proc sp_nd_ctas_rotativas (
        @i_srv              varchar(64),
        @i_filial           tinyint,
        @i_fecha_proceso    datetime,
        @o_procesadas       int = null out 
)
as
declare @w_return           int,
        @w_sp_name          varchar(30),
        @w_ssn              int,
        @w_cont             int,
        @w_procesadas       int,
        @w_msg              char(1),
        @w_obs              varchar(50),
        @w_cta_banco        cuenta,
        @w_valor            money,
        @w_oficina          smallint, 
        @w_prod_banc        smallint, 
        @w_moneda           smallint,
        @w_documento        varchar(16),
        @w_sublinea         varchar(10), 
        @w_secuencial       int, 
        @w_tipo_tran        varchar(10), 
        @w_tipo_dep         varchar(10), 
        @w_tipo_int         varchar(10), 
        @w_cau              varchar(10), 
        @w_causa            varchar(10), 
        @w_centralizada     char(1), 
        @w_cuenta_bce       varchar(30), 
        @w_concepto         varchar(255)

/* Captura nombre de Stored Procedure */
select @w_sp_name    = 'sp_nd_ctas_rotativas',
       @w_procesadas = 0

/* Tipo de transacción para depósitos */
select @w_tipo_dep = pa_char
from cobis..cl_parametro
where pa_nemonico  = 'TTRNBC'
and pa_producto    = 'REM'

if @@rowcount <> 1
begin
   return 101085
end

/* Tipo de transacción para intereses */
select @w_tipo_int = pa_char
from cobis..cl_parametro
where pa_nemonico  = 'TTPIRO'
and pa_producto    = 'REM'

if @@rowcount <> 1
begin
   return 101085
end

/* Inicializar el SSN monetario */
select @w_ssn = max(tm_secuencial)
from cob_cuentas..cc_tran_monet
where tm_secuencial < 0

if @w_ssn is null
  select @w_ssn = -10000000

/* Cursor para generar notas de débito */
declare cur_nd cursor for 
 select dr_cuenta,
        dr_tipo_tran,
        cr_centralizado,
        cr_cuenta_bce,
        dr_sublinea, 
        dr_secuencial, 
        dr_efectivo
   from cc_depositos_rotativos, cc_cuentas_rotativas
  where dr_cuenta       = cr_cuenta
    and dr_fecha_debito = @i_fecha_proceso
    and dr_estado      <> 'D'
    and dr_efectivo     > 0

open cur_nd

fetch cur_nd into 
      @w_cta_banco,
      @w_tipo_tran,
      @w_centralizada,
      @w_cuenta_bce,
      @w_sublinea,
      @w_secuencial,
      @w_valor

while @@sqlstatus = 0
begin

  select @w_msg   = 'D',
         @w_obs   = 'OK',
         @w_cau   = '',
         @w_causa = '',
         @w_ssn   = @w_ssn + 1

  /* Datos de la cuenta */
  select @w_oficina   = cc_oficina,
         @w_prod_banc = cc_prod_banc, 
         @w_moneda    = cc_moneda
    from cc_ctacte
   where cc_cta_banco = @w_cta_banco

  if @@rowcount != 1
  begin
    /* No existe cuenta_banco */
    select @w_msg = 'E',
           @w_obs = '[' + convert(varchar(10),@@rowcount) + ']NO EXISTE CUENTA'
    goto LEER
  end

  /* Variables */
  if @w_tipo_tran = @w_tipo_dep
  begin
     select @w_cau = '251', 
            @w_causa = 'TC00201009',
            @w_concepto = 'Recaudacion de Cuentas Rotativas'
  end
  else
  begin
     if @w_tipo_tran = @w_tipo_int
     begin
        select @w_cau = '268', 
               @w_concepto = 'Capitalizacion de Intereses Cuentas Rotativas'

        if @w_centralizada = 'C'
           select @w_causa = 'TC00201093'
        else
           if @w_centralizada = 'D'
              select @w_causa = 'TC00201012'
     end
  end

  begin tran

    if @w_valor > 0
    begin
       /* Llamada al stored procedure que emite la nota de debito  */
       exec @w_return   = sp_ccndc_automatica
            @s_srv      = @i_srv,
            @s_ofi      = @w_oficina,
            @s_ssn      = @w_ssn,
            @t_trn      = 50,
            @i_cta      = @w_cta_banco,
            @i_val      = @w_valor,
            @i_cau      = @w_cau,
            @i_mon      = @w_moneda,
            @i_fecha    = @i_fecha_proceso,
            @i_imp      = 'N',
            @i_is_batch = 'S'

       if @w_return != 0
       begin
          rollback tran 
          select @w_msg = 'E'
                                 
           select @w_obs_1 = ''                    
           select @w_obs_1  = isnull(mensaje, '')
             from cobis..cl_errores
             where numero  = @w_return
                if @w_obs  = ''
                  select @w_obs = '[' + convert(varchar(10),@w_return) + '] ERROR EN NOTA DEBITO'
                else                       
                  select @w_obs = '[' + convert(varchar(10),@w_return) + ']'+  @w_obs_1 
          goto LEER
       end 
    end

    -- Ingresa informacion a Bancos
    select @w_documento = convert(varchar(16), @w_secuencial)

    exec @w_return       = cob_bancos..sp_tran_general_batch
         @s_user         = 'sa',
         @i_operacion    = 'I',
         @i_fecha        = @i_fecha_proceso,
         @i_tipo_tran    = 2,
         @i_causa        = @w_causa,
         @i_documento    = @w_documento,
         @i_concepto     = @w_concepto,
         @i_valor        = @w_valor,
         @i_modulo       = 'CTE',
         @i_batch        = 'S',
         @i_cod_relacion = @w_ssn,
         @i_cod_linea    = @w_sublinea, 
         @i_cta_rotativa = @w_cta_banco, 
         @i_contracuenta = @w_cuenta_bce

    if @w_return != 0
    begin
       rollback tran
       select @w_msg = 'E'
	   select @w_obs_2 = ''                    
           select @w_obs_2  = isnull(mensaje, '')
             from cobis..cl_errores
             where numero  = @w_return
				if @w_obs  = ''
				  select @w_obs = '[' + convert(varchar(10),@w_return) + '] ERROR EN BANCOS'
                else                       
                  select @w_obs = '[' + convert(varchar(10),@w_return) + ']'+  @w_obs_2
       goto LEER
    end 

  commit tran

  LEER: 

    /* Registro de errores en el proceso */
     update cc_depositos_rotativos
       set dr_estado       = @w_msg,
           dr_observacion  = @w_obs
     where dr_fecha_debito = @i_fecha_proceso
       and dr_cuenta       = @w_cta_banco
       and dr_sublinea     = @w_sublinea
       and dr_secuencial   = @w_secuencial

    if @@error != 0
    begin
       close cur_nd
       deallocate cursor cur_nd
       return 203056
    end

    /* Número de registros procesados */
    select @w_procesadas  = @w_procesadas + 1

    /* Siguiente registro del cursor */
    fetch cur_nd into 
          @w_cta_banco,
          @w_tipo_tran,
          @w_centralizada,
          @w_cuenta_bce,
          @w_sublinea,
          @w_secuencial,
          @w_valor
end

/* Cerrar y liberar cursor */
close cur_nd
deallocate cursor cur_nd

select @o_procesadas = @w_procesadas

return 0
go


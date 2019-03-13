------------------------------------------------------------------------------------------------
-------- Solicitud 136476: Información desde el 09 de mayo 2016 hasta octubre 2018, correspondiente a cheques protestados 
-------- W. Valdiviezo    2018/11/13
-------- Script original: cheques_protestados_sol_136476.sql
------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
--- Consulta e Inserción de los cheques en una tabla temporal sol_136476
--- protestados en el rango de fechas solicitado
-------------------------------------------------------------------------------------------------------
use cob_tempotra
go

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'sol_136476' AND type = 'U')
DROP TABLE sol_136476
GO

create table sol_136476 (cuenta_banco char(16) null, cuenta int null, cheque int null, fecha_reg varchar (10) null, nombre varchar (100) null, subtipo varchar (10) null, valor money null, monto_protestado money null, oficina varchar (100) null)

insert into sol_136476 
select
   cc_cta_banco , hp_cuenta, hp_cheque,
   convert (varchar (10), hp_fecha_reg ,101),
   cc_nombre ,
   case en_subtipo 
    when 'P' then 'NATURAL'
    when 'C' then 'JURIDICA'
   end ,
   hp_valor , 0,
   (select of_nombre from cobis..cl_oficina where of_oficina = X.hp_oficina) 
from cob_cuentas..cc_his_protesto X, 
     cob_cuentas..cc_ctacte C,
     cobis..cl_ente E
where hp_fecha_reg >= '05/09/2016'
and hp_fecha_reg <= '10/31/2018' 
and hp_estado = 'P'
and X.hp_cuenta = C.cc_ctacte
and C.cc_ced_ruc = E.en_ced_ruc
go

-------------------------------------------------------------------------------------------------------
--- Inserción de los valores de los cheques protestados, valor antes del cheque y cálculo del valor de la 
--- diferencia del protesto del cheque en una tabla temporal sol_136476_t
-------------------------------------------------------------------------------------------------------

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'sol_136476_t' AND type = 'U')
DROP TABLE sol_136476_t
GO

create table sol_136476_t (tcuenta int null, tcheque int null, tdiferencia money null)

insert into sol_136476_t 
select  cc_ctacte, 
hp_cheque, 
(hp_valor - hm_saldo_disponible)
from cob_cuentas..cc_his_protesto a,cob_cuentas_his..cc_his_movimiento b,
cob_cuentas..cc_ctacte c
where cc_ctacte = hp_cuenta
and hp_hora_prot >= '05/09/2016'
and hm_cta_banco = c.cc_cta_banco
and hm_hora = a.hp_hora_prot
and hm_cheque = a.hp_cheque

-------------------------------------------------------------------------------------------------------
--Actualiza datos masivos de la tabla temporal sol_136476 a la tabla sol_136476_t
-------------------------------------------------------------------------------------------------------

update sol_136476 
set monto_protestado  = tdiferencia 
from sol_136476 , sol_136476_t 
where tcuenta = cuenta
and tcheque = cheque

-------------------------------------------------------------------------------------------------------
--Impresión del resultado final del Reporte
-------------------------------------------------------------------------------------------------------

select fecha_reg FECHA_PROTESTO, nombre NOMBRE_CLIENTE, subtipo TIPO_PERSONA, cheque NUM_CHEQUE, valor MONTO_CHEQUE, monto_protestado MONTO_PROTESTADO_CHEQ, oficina OFICINA
from sol_136476 where monto_protestado > 0
order by cuenta, cheque
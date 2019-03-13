------------------------------------------------------------------------------------------------
-------- Solicitud 134229: Lista de clientes que tienen balances en cero por producto
-------- W. Valdiviezo    2018/12/26
-------- Script original: lista_clientes_balances_cero_por_producto.sql
------------------------------------------------------------------------------------------------

use cob_tempotra
go

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpA_sol_134229' AND type = 'U')
DROP TABLE tmpA_sol_134229
GO
create table tmpA_sol_134229(num_ente_balance int null)

CREATE INDEX index_tmpA_sol_134229 ON tmpA_sol_134229 (num_ente_balance)
go

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpA1_sol_134229' AND type = 'U')
DROP TABLE tmpA1_sol_134229
GO
create table tmpA1_sol_134229(tipo_producto char(15) null, ente_ah_cliente int null)

CREATE INDEX index_tmpA1_sol_134229 ON tmpA1_sol_134229 (ente_ah_cliente)
go

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpCC_sol_134229' AND type = 'U')
DROP TABLE tmpCC_sol_134229
GO
create table tmpCC_sol_134229(tipo_producto char(15) null, ente_cc_cliente int null)

CREATE INDEX index_tmpCC_sol_134229 ON tmpCC_sol_134229 (ente_cc_cliente)
go

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpDPF_sol_134229' AND type = 'U')
DROP TABLE tmpDPF_sol_134229
GO
create table tmpDPF_sol_134229(tipo_producto char(15) null, ente_dpf_cliente int null)

CREATE INDEX index_tmpDPF_sol_134229 ON tmpDPF_sol_134229 (ente_dpf_cliente)
go

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpCred_sol_134229' AND type = 'U')
DROP TABLE tmpCred_sol_134229
GO
create table tmpCred_sol_134229(tipo_producto char(15) null, ente_cred_cliente int null)

CREATE INDEX index_tmpCred_sol_134229 ON tmpCred_sol_134229 (ente_cred_cliente)
go

--busqueda de balances en los entes
insert into cob_tempotra..tmpA_sol_134229
select distinct en_ente from cobis..cl_ente where en_balance = 0
go
--Entes que tiene Cta. de ahorros
insert into tmpA1_sol_134229
select 'Cta_Ahorro', ah_cliente                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
from cob_ahorros..ah_cuenta, cob_tempotra..tmpA_sol_134229 
where ah_cliente = num_ente_balance
and ah_estado = 'A'
go
--Entes que tiene Cta. de Corriente
insert into tmpCC_sol_134229
select 'Cta_Corriente', cc_cliente
from cob_cuentas..cc_ctacte,cob_tempotra..tmpA_sol_134229
where cc_cliente = num_ente_balance
and cc_estado = 'A'
go
 --Entes que tienen DPF
insert into tmpDPF_sol_134229
select 'DPF', op_cod_cliente
from cob_tesoreria..te_operacion, cob_tesoreria..te_doperaciones_titulo_emi,cob_tesoreria..te_portafolio_titulos_emi, cob_tempotra..tmpA_sol_134229 
where dt_cod_operacion = op_cod_operacion
and dt_cod_portafolio = pt_cod_portafolio 
and op_cod_cliente =  num_ente_balance
and pt_estado not in ('L','A')
go
--Entes que tiene Crédito
insert into cob_tempotra..tmpCred_sol_134229
select 'Credito', op_cliente
from cob_cartera..ca_operacion, cob_tempotra..tmpA_sol_134229
where op_cliente = num_ente_balance
and op_estado not in (0,3,11,99)

--Impresión del Reporte de los clientes que no tienen balances
print 'Lista de clientes con balances en cero y sus respectivos productos'
print ''
select en_ente NUM_ENTE, en_ced_ruc NUM_CED_RUC,
   case en_subtipo
    when 'P' then 'NATURAL'
    when 'C' then 'JURIDICA'
   end TIPO_PERSONA,
en_nomlar NOMBRE_CLIENTE, tipo_producto TIPO_PRODUCTO
from cobis..cl_ente, cob_tempotra..tmpA1_sol_134229
where en_ente = ente_ah_cliente
union
select en_ente NUM_ENTE, en_ced_ruc NUM_CED_RUC,
   case en_subtipo
    when 'P' then 'NATURAL'
    when 'C' then 'JURIDICA'
   end TIPO_PERSONA,
en_nomlar NOMBRE_CLIENTE, tipo_producto TIPO_PRODUCTO
from cobis..cl_ente, cob_tempotra..tmpCC_sol_134229
where en_ente = ente_cc_cliente
union
select en_ente NUM_ENTE, en_ced_ruc NUM_CED_RUC,
   case en_subtipo
    when 'P' then 'NATURAL'
    when 'C' then 'JURIDICA'
   end TIPO_PERSONA,
en_nomlar NOMBRE_CLIENTE, tipo_producto TIPO_PRODUCTO
from cobis..cl_ente, cob_tempotra..tmpDPF_sol_134229
where en_ente = ente_dpf_cliente
union
select en_ente NUM_ENTE, en_ced_ruc NUM_CED_RUC,
   case en_subtipo
    when 'P' then 'NATURAL'
    when 'C' then 'JURIDICA'
   end TIPO_PERSONA,
en_nomlar NOMBRE_CLIENTE, tipo_producto TIPO_PRODUCTO
from cobis..cl_ente, cob_tempotra..tmpCred_sol_134229
where en_ente = ente_cred_cliente 
order by en_ente, tipo_producto
go




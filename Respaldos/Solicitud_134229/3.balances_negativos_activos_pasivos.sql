------------------------------------------------------------------------------------------------
-------- Solicitud 134229: Lista de CLIENTES PERSONAS NATURALES - BALANCES CON SALDOS QUE SUPEREN UN MILLON DE DOLARES
-------- W. Valdiviezo    2018/02/20
-------- Script original: balances_negativos_activos_pasivos.sql
use cob_tempotra
go

--Creacion de tablas temporales
IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpA_sol_134229_30' AND type = 'U')
DROP TABLE tmpA_sol_134229_30
GO
create table tmpA_sol_134229_30(ente_30 int null)

CREATE INDEX index_tmpA_sol_134229_30 ON tmpA_sol_134229_30 (ente_30)
go
----
IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpA_sol_134229_32' AND type = 'U')
DROP TABLE tmpA_sol_134229_32
GO
create table tmpA_sol_134229_32
			   (pl_clientet32 int null,
				pl_balancet32 int null, 
				pl_cuentat32 int null, 
				pl_valort32 money null, 
				ba_tbalancet32 char(3) null,
				tp_signot32 char(1) null, 
				tb_descripciont32 char(70) null, 
				tb_col_izquierdat32 char(30) null, 
				tb_col_derechat32 char(30) null, 
				tb_tipo_entet32 char(1) null, 
				ct_descripciont32 char(60) null, 
				ct_categoriat32 char(1) null)

CREATE INDEX index_tmpA_sol_134229_32 ON tmpA_sol_134229_32 (pl_clientet32)
go
----
IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpA_sol_134229_312' AND type = 'U')
DROP TABLE tmpA_sol_134229_312
GO
create table tmpA_sol_134229_312
			   (sumaAP money null,
				ct_categoriat312 char(1) null,
				pl_clientet312 int null,
				tb_descripciont32 char(60) null,
				pl_balancet32 int null)

CREATE INDEX index_tmpA_sol_134229_312 ON tmpA_sol_134229_312 (pl_clientet312)
go

--barrido de entes menores a 0 en los balances
insert into tmpA_sol_134229_30
select distinct(pl_cliente)
from cobis..cl_plan 
where pl_valor < 0
order by pl_cliente
go
--select * from cob_tempotra..tmpA_sol_134229_30

--busqueda de los entes anteriores con sus respectivos valores de los balances
insert into cob_tempotra..tmpA_sol_134229_32
select pl_cliente, pl_balance, pl_cuenta, pl_valor, ba_tbalance, tp_signo, tb_descripcion, tb_col_izquierda, tb_col_derecha, tb_tipo_ente, ct_descripcion, ct_categoria
from cobis..cl_plan, cobis..cl_balance, cobis..cl_tplan, cobis..cl_tbalance, cobis..cl_cuenta, cob_tempotra..tmpA_sol_134229_30
where pl_cliente = ente_30
and ba_cliente = pl_cliente 
and pl_balance = ba_balance
and ba_tbalance = tp_tbalance
and pl_cuenta = tp_cuenta
and ba_tbalance = tb_tbalance
and pl_cuenta = ct_cuenta
and pl_valor < 0
order by pl_cliente, ba_tbalance
go
--select * from tmpA_sol_134229_32
--Actualizacion masiva de valores negativos de acuerdo al signo
update cob_tempotra..tmpA_sol_134229_32
set pl_valort32 = pl_valort32 * -1
where tp_signot32 = '-'
go

--suma de activos y pasivos por ente, balance
insert into tmpA_sol_134229_312
select sum(pl_valort32), ct_categoriat32, pl_clientet32, tb_descripciont32, pl_balancet32
from cob_tempotra..tmpA_sol_134229_32
where tb_col_izquierdat32 = 'ACTIVOS'
and tb_col_derechat32 = 'PASIVOS'
group by ct_categoriat32, pl_clientet32, tb_descripciont32, pl_balancet32
order by pl_clientet32, pl_balancet32
go
--select * from cob_tempotra..tmpA_sol_134229_312

---IMPRESION DEL REPORTE FINAL
select pl_clientet312 as NUM_ENTE, en_ced_ruc as NUM_CED_RUC, en_nomlar as CLIENTE,
	case en_subtipo
	    when 'P' then 'NATURAL'
	    when 'C' then 'JURIDICA'
   	end TIPO_CLIENTE,
	pl_balancet32 as NUM_BALANCE,
 	tb_descripciont32 as BALANCE, 
	case ct_categoriat312
	    when 'A' then 'ACTIVO'
	    when 'P' then 'PASIVO'
        end CATEGORIA, 
sumaAP as VALOR
from cob_tempotra..tmpA_sol_134229_312, cobis..cl_ente
where sumaAP < 0
and pl_clientet312 = en_ente 
go

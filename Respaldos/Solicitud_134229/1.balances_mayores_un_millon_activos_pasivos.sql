------------------------------------------------------------------------------------------------
-------- Solicitud 134229: Lista de CLIENTES PERSONAS NATURALES - BALANCES CON SALDOS QUE SUPEREN UN MILLON DE DOLARES
-------- W. Valdiviezo    2018/02/20
-------- Script original: balances_mayores_un_millon_activos_pasivos.sql
use cob_tempotra
go

--Creacion de tablas temporales
IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpA_sol_134229_3' AND type = 'U')
DROP TABLE tmpA_sol_134229_3
GO
create table tmpA_sol_134229_3(ente_3 int null)

CREATE INDEX index_tmpA_sol_134229_3 ON tmpA_sol_134229_3 (ente_3)
go
----
IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpA_sol_134229_31' AND type = 'U')
DROP TABLE tmpA_sol_134229_31
GO
create table tmpA_sol_134229_31
			   (pl_clientet3 int null,
				pl_balancet3 int null, 
				pl_cuentat3 int null, 
				pl_valort3 money null, 
				ba_tbalancet3 char(3) null,
				tp_signot3 char(1) null, 
				tb_descripciont3 char(70) null, 
				tb_col_izquierdat3 char(30) null, 
				tb_col_derechat3 char(30) null, 
				tb_tipo_entet3 char(1) null, 
				ct_descripciont3 char(60) null, 
				ct_categoriat3 char(1) null)

CREATE INDEX index_tmpA_sol_134229_31 ON tmpA_sol_134229_31 (pl_clientet3)
go
----
IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpA_sol_134229_311' AND type = 'U')
DROP TABLE tmpA_sol_134229_311
GO
create table tmpA_sol_134229_311
			   (sumaAP money null,
				ct_categoriat31 char(1) null,
				pl_clientet31 int null,
				tb_descripciont3 char(60) null,
				pl_balancet3 int null)

CREATE INDEX index_tmpA_sol_134229_311 ON tmpA_sol_134229_311 (pl_clientet31)
go

--barrido de entes mayores a 1,000.000.00 en los balances
insert into tmpA_sol_134229_3
select distinct(pl_cliente)
from cobis..cl_plan 
where pl_valor > 1000000
order by pl_cliente
go
--select * from cob_tempotra..tmpA_sol_134229_3

--busqueda de los entes anteriores con sus respectivos valores de los balances
insert into cob_tempotra..tmpA_sol_134229_31
select pl_cliente , pl_balance, pl_cuenta, pl_valor, ba_tbalance, tp_signo, tb_descripcion, tb_col_izquierda, tb_col_derecha, tb_tipo_ente, ct_descripcion, ct_categoria
from cobis..cl_plan, cobis..cl_balance, cobis..cl_tplan, cobis..cl_tbalance, cobis..cl_cuenta, cob_tempotra..tmpA_sol_134229_3
where pl_cliente = ente_3
and ba_cliente = pl_cliente 
and pl_balance = ba_balance
and ba_tbalance = tp_tbalance
and pl_cuenta = tp_cuenta
and ba_tbalance = tb_tbalance
and pl_cuenta = ct_cuenta
order by pl_cliente, ba_tbalance
go
--select * from tmpA_sol_134229_31
--Actualizacion masiva de valores negativos de acuerdo al signo
update cob_tempotra..tmpA_sol_134229_31
set pl_valort3 = pl_valort3 * -1
where tp_signot3 = '-'
go

--suma de activos y pasivos por ente, balance
insert into tmpA_sol_134229_311
select sum(pl_valort3), ct_categoriat3, pl_clientet3, tb_descripciont3, pl_balancet3
from cob_tempotra..tmpA_sol_134229_31
where tb_col_izquierdat3 = 'ACTIVOS'
and tb_col_derechat3 = 'PASIVOS'
group by ct_categoriat3, pl_clientet3, tb_descripciont3, pl_balancet3
order by pl_clientet3, pl_balancet3
go
--select * from cob_tempotra..tmpA_sol_134229_311

---IMPRESION DEL REPORTE FINAL
select pl_clientet31 as NUM_ENTE, en_ced_ruc as NUM_CED_RUC, en_nomlar as CLIENTE,
	case en_subtipo
	    when 'P' then 'NATURAL'
	    when 'C' then 'JURIDICA'
   	end TIPO_CLIENTE,
	pl_balancet3 as NUM_BALANCE,
 	tb_descripciont3 as BALANCE, 
	case ct_categoriat31
	    when 'A' then 'ACTIVOS'
	    when 'P' then 'PASIVOS'
        end CATEGORIA, 
sumaAP as VALOR
from cob_tempotra..tmpA_sol_134229_311, cobis..cl_ente
where sumaAP > 1000000
and pl_clientet31 = en_ente 
go
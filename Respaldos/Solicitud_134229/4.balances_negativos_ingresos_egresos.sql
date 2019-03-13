------------------------------------------------------------------------------------------------
-------- Solicitud 134229: Lista de CLIENTES PERSONAS NATURALES - BALANCES CON SALDOS QUE SUPEREN UN MILLON DE DOLARES
-------- W. Valdiviezo    2018/02/20
-------- Script original: balances_negativos_ingresos_egresos.sql
use cob_tempotra
go

--Creacion de tablas temporales
IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpA_sol_134229_3122' AND type = 'U')
DROP TABLE tmpA_sol_134229_3122
GO
create table tmpA_sol_134229_3122
			   (sumaIE money null,
				ct_categoriat312 char(1) null,
				pl_clientet312 int null,
				tb_descripciont32 char(60) null,
				pl_balancet32 int null)

CREATE INDEX index_tmpA_sol_134229_3122 ON tmpA_sol_134229_3122 (pl_clientet312)
go

--suma de activos y pasivos por ente, balance
insert into tmpA_sol_134229_3122
select sum(pl_valort32), ct_categoriat32, pl_clientet32, tb_descripciont32, pl_balancet32
from cob_tempotra..tmpA_sol_134229_32
where tb_col_izquierdat32 = 'INGRESOS'
and tb_col_derechat32 = 'EGRESOS'
group by ct_categoriat32, pl_clientet32, tb_descripciont32, pl_balancet32
order by pl_clientet32, pl_balancet32
go
--select * from cob_tempotra..tmpA_sol_134229_3122

---IMPRESION DEL REPORTE FINAL
select pl_clientet312 as NUM_ENTE, en_ced_ruc as NUM_CED_RUC, en_nomlar as CLIENTE,
	case en_subtipo
	    when 'P' then 'NATURAL'
	    when 'C' then 'JURIDICA'
   	end TIPO_CLIENTE,
	pl_balancet32 as NUM_BALANCE,
 	tb_descripciont32 as BALANCE, 
	case ct_categoriat312
	    when 'A' then 'INGRESOS'
	    when 'P' then 'EGRESOS'
        end CATEGORIA, 
sumaIE as VALOR
from cob_tempotra..tmpA_sol_134229_3122, cobis..cl_ente
where sumaIE < 0
and pl_clientet312 = en_ente 
go

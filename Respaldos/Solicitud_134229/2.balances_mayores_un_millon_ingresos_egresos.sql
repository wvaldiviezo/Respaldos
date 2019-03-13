------------------------------------------------------------------------------------------------
-------- Solicitud 134229: Lista de CLIENTES PERSONAS NATURALES - BALANCES CON SALDOS QUE SUPEREN UN MILLON DE DOLARES
-------- W. Valdiviezo    2018/02/20
-------- Script original: balances_mayores_un_millon_ingresos_egresos.sql
use cob_tempotra
go

--Creacion de tablas temporales
IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'tmpA_sol_134229_3111' AND type = 'U')
DROP TABLE tmpA_sol_134229_3111
GO
create table tmpA_sol_134229_3111
			   (sumaIE money null,
				ct_categoriat311 char(1) null,
				pl_clientet311 int null,
				tb_descripciont31 char(60) null,
				pl_balancet31 int null)

CREATE INDEX index_tmpA_sol_134229_3111 ON tmpA_sol_134229_3111 (pl_clientet311)
go

--suma de ingresos y egresos por ente, balance
insert into tmpA_sol_134229_3111
select sum(pl_valort3), ct_categoriat3, pl_clientet3, tb_descripciont3, pl_balancet3
from cob_tempotra..tmpA_sol_134229_31
where tb_col_izquierdat3 = 'INGRESOS'
and tb_col_derechat3 = 'EGRESOS'
group by ct_categoriat3, pl_clientet3, tb_descripciont3, pl_balancet3
order by pl_clientet3, pl_balancet3
go
--select * from cob_tempotra..tmpA_sol_134229_3111

---IMPRESION DEL REPORTE FINAL
select pl_clientet311 as NUM_ENTE, en_ced_ruc as NUM_CED_RUC, en_nomlar as CLIENTE,
	case en_subtipo
	    when 'P' then 'NATURAL'
	    when 'C' then 'JURIDICA'
   	end TIPO_CLIENTE,
	pl_balancet31 as NUM_BALANCE,
 	tb_descripciont31 as BALANCE, 
	case ct_categoriat311
	    when 'A' then 'INGRESOS'
	    when 'P' then 'EGRESOS'
        end CATEGORIA, 
sumaIE as VALOR
from cob_tempotra..tmpA_sol_134229_3111, cobis..cl_ente
where sumaIE > 1000000
and pl_clientet311 = en_ente 
go
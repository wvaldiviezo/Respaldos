------------------------------------------------------------------------------------------------
-------- Solicitud 134229: Lista de los Productos que tienen los clientes que tienen balances Mayores a Un Millon y Negativos
-------- W. Valdiviezo    2018/02/20
-------- Script original: productos_clientes_mayor_un_millon_y_negativos.sql


print 'Lista de los Productos de los clientes que tienen balances Mayores a Un Millon y Negativos'

--Productos de los clientes con balances mayores a un millon y negativos
--select top 10 * from tmpA_sol_134229_3 --ente_3 

--Entes que tiene Cta. de ahorros
select ah_cliente NUM_ENTE, en_ced_ruc NUM_CED_RUC, en_nomlar NOMBRE_CLIENTE, 
	case en_subtipo
	    when 'P' then 'NATURAL'
	    when 'C' then 'JURIDICA'
   	end TIPO_CLIENTE,
'Cta_Ahorro'TIPO_PRODUCTO
from cob_ahorros..ah_cuenta, cob_tempotra..tmpA_sol_134229_3, cobis..cl_ente
where ah_cliente = ente_3
and ah_estado = 'A'
and en_ente = ente_3
UNION
--Entes que tiene Cta. Corriente
select cc_cliente NUM_ENTE, en_ced_ruc NUM_CED_RUC, en_nomlar NOMBRE_CLIENTE,
	case en_subtipo
	    when 'P' then 'NATURAL'
	    when 'C' then 'JURIDICA'
   	end TIPO_CLIENTE,
'Cta_Corriente' TIPO_PRODUCTO
from cob_cuentas..cc_ctacte, cob_tempotra..tmpA_sol_134229_3, cobis..cl_ente
where cc_cliente = ente_3
and cc_estado = 'A'
and en_ente = ente_3
UNION
select op_cod_cliente NUM_ENTE, en_ced_ruc NUM_CED_RUC, en_nomlar NOMBRE_CLIENTE,
	case en_subtipo
	    when 'P' then 'NATURAL'
	    when 'C' then 'JURIDICA'
   	end TIPO_CLIENTE,
'DPF' TIPO_PRODUCTO
from cob_tesoreria..te_operacion, cob_tesoreria..te_doperaciones_titulo_emi,cob_tesoreria..te_portafolio_titulos_emi, cob_tempotra..tmpA_sol_134229_3,cobis..cl_ente
where dt_cod_operacion = op_cod_operacion
and dt_cod_portafolio = pt_cod_portafolio 
and op_cod_cliente =  ente_3
and pt_estado not in ('L','A')
and en_ente = ente_3
UNION
--Entes que tiene Crédito
select op_cliente NUM_ENTE, en_ced_ruc NUM_CED_RUC, en_nomlar NOMBRE_CLIENTE,
	case en_subtipo
	    when 'P' then 'NATURAL'
	    when 'C' then 'JURIDICA'
   	end TIPO_CLIENTE,
'Credito' TIPO_PRODUCTO
from cob_cartera..ca_operacion, cob_tempotra..tmpA_sol_134229_3, cobis..cl_ente
where op_cliente = ente_3
and op_estado not in (0,3,11,99)
and ente_3 = en_ente
go
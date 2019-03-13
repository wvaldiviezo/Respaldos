/*
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------- Solicitud No.:     144494 
-------- Desarrollado por:  W. Valdiviezo    2018/12/26
-------- Script original:   script_direccion_tel_sol_144494.sql
-------- Descripción:       direccion, telefono, oficina y zonal correcpondientes a la data "Personas jurídicas que registran cero (0) en valor de ingresos (5).xlsx ".
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/
use cob_tempotra
go

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'datos_temp3' AND type = 'U')
DROP TABLE datos_temp3
GO
create table datos_temp3(num_entet3 int null, num_oficina int null, descrip_oficina char(60) null)


IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'datos_temp4' AND type = 'U')
DROP TABLE datos_temp4
GO
create table datos_temp4(num_entet4 int null, descrip_zonal char(60) null)


IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'datos_temp5' AND type = 'U')
DROP TABLE datos_temp5
GO
create table datos_temp5(num_ente5 int null, di_descripcion char(100) null, di_principal char(100) null, di_transversal char(100) null, di_direccion int null)


IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'datos_temp6' AND type = 'U')
DROP TABLE datos_temp6
GO
create table datos_temp6(num_dir int null, num_ente6 int null)

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'datos_temp7' AND type = 'U')
DROP TABLE datos_temp7
GO
create table datos_temp7(num_ente6 int null, di_descripcion char(100) null, di_principal char(100) null, di_transversal char(100) null, di_direccion int null)

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'datos_temp8' AND type = 'U')
DROP TABLE datos_temp8
GO
create table datos_temp8(te_ente int null, te_direccion int null, te_valor char (20) null)

--Oficina donde se registro el ente
insert into datos_temp3
select en_ente, en_oficina,
(select of_nombre from cobis..cl_oficina where of_oficina = a.en_oficina)
from cobis..cl_ente a, cob_tempotra..datos_temp b
where a.en_ente = b.num_ente
go
--Zonal donde se registro el ente
insert into datos_temp4
select num_entet3,
(select valor from cobis..cl_tabla t, cobis..cl_catalogo ca where t.codigo = ca.tabla and t.tabla = 'cl_zonal' and ca.codigo = a.of_zonal)
from cobis..cl_oficina a,  cob_tempotra..datos_temp3 b
where a.of_oficina = b.num_oficina
go

alter table datos_temp3 add zonal varchar(20) null
go

update datos_temp3
set zonal = b.descrip_zonal
from cob_tempotra..datos_temp3 a, cob_tempotra..datos_temp4 b
where num_entet3 = num_entet4
go

alter table datos_temp3 add cedula varchar(20) null
go
update datos_temp3
set cedula = a.cedula
from cob_tempotra..datos_temp a, cob_tempotra..datos_temp3 b
where a.num_ente = num_entet3
go
--Todas las direcciones de un ente de tipo D
insert into datos_temp5
select num_ente, di_descripcion, di_principal, di_transversal, di_direccion
from cob_tempotra..datos_temp a, cobis..cl_direccion b
where b.di_tipo = 'D'
and a.num_ente = b.di_ente
go
-- Selección de la última dirección del ente
insert into datos_temp6
select num_dir = MAX(di_direccion), num_ente5
from cob_tempotra..datos_temp5
group by num_ente5
go
--Ultimas Direcciones registradas
insert into datos_temp7
select num_ente6, di_descripcion, di_principal, di_transversal, di_direccion
from cob_tempotra..datos_temp5, cob_tempotra..datos_temp6
where num_ente5 = num_ente6
and num_dir = di_direccion
go
--Telefonos
insert into datos_temp8
select te_ente, te_direccion, te_valor  ---, num_ente6 --, di_direccion, te_direccion, te_secuencial
from   cobis..cl_telefono, cob_tempotra..datos_temp7
where  te_ente          = num_ente6
and    te_direccion     = di_direccion
group  by te_ente, te_direccion                
having(te_secuencial)   = max(te_secuencial)
go
--Armado del reporte final
SELECT b.cedula AS cedula_ruc, b.descrip_oficina AS oficina, b.zonal AS zonal, c.di_descripcion AS direccion, c.di_principal AS calle_principal, c.di_transversal AS calle_transversal, d.te_valor AS telefono
FROM cob_tempotra..datos_temp a
LEFT JOIN cob_tempotra..datos_temp3 b ON a.num_ente = b.num_entet3
LEFT JOIN cob_tempotra..datos_temp7 c ON a.num_ente = c.num_ente6
LEFT JOIN cob_tempotra..datos_temp8 d ON a.num_ente = d.te_ente
go




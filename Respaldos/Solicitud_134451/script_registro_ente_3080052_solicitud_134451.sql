------------------------------------------------------------------------------------------------
-------- Solicitud 134451 Información del usuario que creó el ente numero 3080052
--------  W. Valdiviezo    2018/10/25
-------- Script original: script_registro_ente_3080052_solicitud_134451.sql
------------------------------------------------------------------------------------------------

select en_nombre as 'Cliente', 
       en_ced_ruc as 'Cedula', 
       en_ente as 'Ente', 
       en_func_mod_patr as 'Usuario Registro Ente' 
from cobis..cl_ente 
where en_ente = 3080052    
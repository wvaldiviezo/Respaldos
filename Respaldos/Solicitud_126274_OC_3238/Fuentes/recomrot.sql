!************************************************************************!
!*      Archivo           :  recomrot.sqr                                *!
!*      Base de datos     :  RECAUDOS                                   *!
!*      Producto          :  RECAUDOS                                   *!
!*      Disenado por      :                               				*!
!*      Fecha de escritura:                                 			*!
!************************************************************************!
!*                              IMPORTANTE                              *!
!*      Este programa es parte de los paquetes bancarios propiedad de   *!
!*      "MACOSA", representantes exclusivos para el Ecuador de la       *!
!*      "NCR CORPORATION".                                              *!
!*      Su uso no autorizado queda expresamente prohibido asi como      *!
!*      cualquier alteracion o agregado hecho por alguno de sus         *!
!*      usuarios sin el debido consentimiento por escrito de la         *!
!*      Presidencia Ejecutiva de MACOSA o su representante.             *!
!************************************************************************!
!*                              PROPOSITO                               *!
!*      Reporte para cuentas rotativas que no se encuentra          	*!
!*      parametrizada la comision            							*!
!************************************************************************!
!*                            MODIFICACIONES                            *!
!*      FECHA           AUTOR               RAZON                       *!
!*      18/Ago/2017     R. Rodriguez        RFC-201708-1398             *!
!*		23/08/2017      D. Rojas	   RFC-201708- 1413 VMREPORTS       *!
!*									   REPORTE 4354 AUMENTO DE CAMPO    *!
!*		12/09/2018      w. valdiviezo  SOLICITUD:126274 VMREPORTS       *!
!*									   REPORTE 4354 ELIMINAR REVERSADOS *!
!************************************************************************!

#include  "definic.sqr"

#define   ANCHO_PAG                330 !Ancho de la pagina a imprimir
#define   LARGO_PAG               8000 

Begin-Setup
use cob_cuentas
!printer-init {COD_IMP_COND}
page-size {LARGO_PAG} {ANCHO_PAG}
End-Setup  

#include "log.sqr"
#include "recaudo.sqr"

Begin-Report
do Inicializar_Programa
do ParamN (1,#i_filial,'cobis..cl_filial','fi_filial = ','No existe la filial') !Filial del reporte
do ParamS (2,$i_fecha_proceso,'','','') !Fecha del reporte
do Main
do Finalizar_Programa
End-Report

Begin-procedure Heading_aux 
do Nombre_Filial  (#i_filial,$nombre_filial)
let $programa='recomrot.sqr'
let $titulo = 'REPORTE CUENTAS ROTATIVAS NO COMISION VENTANILLA'
let $nombre_ofi = ''
do Cabecera ($programa,$titulo,$nombre_ofi,'','',$i_fecha_proceso)
position (+1)
do Lin_Horizontal
do Centrar ('Nro. Sec. Tran.', 1)
do Centrar ('Fecha Recaudacion', 2)                     
do Centrar ('Nombre Oficina', 3)                    
do Centrar ('Cta de Recaudacion', 4)                            
do Centrar ('Nombre Cuenta', 5)                         
do Centrar ('Nro. Transaccion', 6)                
do Centrar ('Usuario', 7)                 
do Centrar ('Valor Efectivo', 8)             
do Centrar ('Valor Cheque Propio', 9)  
do Centrar ('Valor Cheque Local', 10)  
do Centrar ('Valor Cheq/ot/plazas', 11)  
do Centrar ('Valor Total', 12)  
do Centrar ('Nombre del Terminal', 13)  
do Lin_Horizontal
End-procedure 

Begin-Procedure Main
do Descomponer_Fecha
!do Abrir_Archivo
do Total_Acredita
do Abrir_Archivo1
do Total_Acredita1
End-Procedure

Begin-Procedure Descomponer_Fecha
!* Determina el anio,mes y dia de la fecha actual *!
Begin-Select
datepart(day,$i_fecha_proceso) &dia
datepart(month,$i_fecha_proceso) &mes
datepart(year,$i_fecha_proceso) &ani
End-Select
!let $w_fecha_ini = substr($i_fecha_proceso 1, 2) || '/' || '01' ||'/' || substr($i_fecha_proceso, 7, 4)
 let $fech = to_char(&mes)||'/'||'01'||'/'|| to_char(&ani)
 let $fech_imp = substr($i_fecha_proceso, 4, 2) || substr($i_fecha_proceso, 1, 2) || substr($i_fecha_proceso, 7, 4)
 !let $fech = '01'||'/'||to_char(&mes)||'/'|| to_char(&ani)
End-Procedure  

Begin-Procedure Total_Acredita
!* Selecciona los totales de garantias por moneda y por sucursal *!
let #aux_secue = 0
Begin-Select
(select  of_nombre from cobis..cl_oficina where of_filial = 1 and  of_oficina = a.hc_oficina ) &of_nombre_ofi () on-break print=never before=Abrir_Archivo ! after= ACTA_CerrarArchivo

!convert (varchar(6),hc_oficina) &hc_oficina () on-break print=never before=Abrir_Archivo ! after= ACTA_CerrarArchivo
convert(varchar(12),hc_fecha_rec,101) &hc_fecha_rec
(select  of_nombre from cobis..cl_oficina where of_filial = 1 and  of_oficina = a.hc_oficina ) &of_nombre
hc_cuenta 
hc_nombre 
hc_ssn 
hc_usuario 
hc_efectivo 
hc_chqpropio 
hc_chqlocal 
hc_remesas 
(hc_efectivo + hc_chqpropio + hc_chqlocal + hc_remesas) &hc_total 
(select hm_terminal from cob_cuentas_his..cc_his_movimiento 
where hm_secuencial = a.hc_secuencia 
and hm_cta_banco = a.hc_cuenta  
and hm_fecha = a.hc_fecha) &hm_terminal
     let #aux_secue = #aux_secue + 1
     let #efectivo = &hc_efectivo
     do Rep_Lista
     next-listing
from cob_cuentas_his..cc_his_conrecaudo a , cob_remesas..re_contarifas ,cob_remesas..re_congeneral
where  a.hc_convenio = ct_convenio
and ct_convenio = cg_convenio 
and  ct_tarifa ='R' and ct_por_tarifa_psg = 0 and hc_comision = 0
and (hc_estado = 'P' and hc_estado_rev = null)
and hc_fecha between $fech and $i_fecha_proceso
!and hc_fecha between '09/11/2013' and '09/11/2013' 
and cg_rep_tran_fact = 'S'
order by hc_oficina
End-Select
End-Procedure 

Begin-Procedure Abrir_Archivo
let #aux_secue = 0
!show 'Codigo Convenio=>'$convenio 
    let $nombre_archivo= '../listados/' || 'recomrot_' || &of_nombre_ofi || '_' || $fech_imp ||'.lis'
    !let $nombre_archivo= '../listados/' || 'recomrot_detalle_' ||'.lis'
    let $nombre_archivoDAT= '../listados/' || 'BNF_ALPAGOS_' || $fecha_proceso  ||'.DAT'
!show 'Nombre Archivo=>' $nombre_archivo
    new-report $nombre_archivo
do Columnas (18,20,18,20,40,20,12,25,25,25,25,25,20,0,0,0,0,0,0,0)
do Heading_aux
End-Procedure  


Begin-Procedure Rep_Lista
  do PrintN (1,#aux_secue,'999999',0)
  do PrintS (2,&hc_fecha_rec,'',0)
  do PrintS (3,&of_nombre,'',0)
  do PrintS (4,&hc_cuenta,'',0)
  do PrintS (5,&hc_nombre,'',0)
  do PrintN (6,&hc_ssn,'9999999999',0)
  do PrintS (7,&hc_usuario,'',0)
  do PrintN (8,#efectivo,'{FOR_DIN}',0)
  do PrintN (9,&hc_chqpropio,'{FOR_DIN}',0)
  do PrintN (10,&hc_chqlocal,'{FOR_DIN}',0)
  do PrintN (11,&hc_remesas,'{FOR_DIN}',0)
  do PrintN (12,&hc_total,'{FOR_DIN}',0)
  do PrintS (13,&hm_terminal,'',0)
End-Procedure

!----------------------------------- proceso totalizado
Begin-procedure Heading_aux1 
do Nombre_Filial  (#i_filial,$nombre_filial)
let $programa='recomrot.sqr'
let $titulo = 'REPORTE CUENTAS ROTATIVAS NO COMISION VENTANILLA TOTALIZADO'
let $nombre_ofi = ''
do Cabecera ($programa,$titulo,$nombre_ofi,'','',$i_fecha_proceso)
position (+1)
do Lin_Horizontal
do Centrar ('Nombre Oficina', 1)
do Centrar ('Nro. Cuenta', 2)                     
do Centrar ('Nombre Cuenta', 3)                    
do Centrar ('Fecha Desde', 4)                            
do Centrar ('Fecha Hasta', 5)                         
do Centrar ('Nro. Total Recaudos', 6)                
do Centrar ('Valor Tot. Recaudo', 7)                 
do Centrar ('Valor Comision', 8)  
do Centrar ('Valor Total Comi', 9)             
do Centrar ('Valor Iva', 10)  
do Centrar ('Valor Total Iva', 11)  
do Centrar ('Val Tot Rec+Comi+Iva', 12)  

do Lin_Horizontal
End-procedure 

Begin-Procedure Total_Acredita1
Begin-Select
(select of_nombre   from cobis..cl_oficina where of_filial = 1 and  of_oficina = b.cc_oficina) &of_nombre_t ,
hc_convenio 
hc_cuenta &hc_cuenta_t
hc_nombre &hc_nombre_t
count(1) &hc_tran_t
( sum(hc_efectivo) + sum(hc_chqpropio) + sum(hc_chqlocal) + sum(hc_remesas)) &hc_val_t
hc_comision &hc_comi_t
sum(hc_comision) &hc_comision_t
(round((hc_comision * 1.12),2) - hc_comision) &hc_iva
sum(round((hc_comision * 1.12),2) - hc_comision) &hc_iva_t
((sum(hc_efectivo) + sum(hc_chqpropio) + sum(hc_chqlocal) + sum(hc_remesas)) + sum(hc_comision) + sum(round((hc_comision * 1.12),2) - hc_comision)) &hc_tot_rec
     do Rep_Lista1
     next-listing
from cob_cuentas_his..cc_his_conrecaudo a , cob_remesas..re_contarifas,cob_cuentas..cc_ctacte b,cob_remesas..re_congeneral
where  cc_cta_banco  = a.hc_cuenta
and a.hc_convenio = ct_convenio
and ct_convenio = cg_convenio
and  ct_tarifa ='R' and (ct_por_tarifa_psg = 0  or ct_por_tarifa_psg > 0 )
and (hc_estado = 'P' and hc_estado_rev = null)
and hc_fecha between $fech and $i_fecha_proceso
!and hc_fecha between '09/24/2013' and '09/30/2013' 
and cg_rep_tran_fact = 'S'
group by cc_oficina,hc_convenio , hc_cuenta, hc_nombre, hc_comision
order by cc_oficina,hc_convenio 
End-Select
End-Procedure 

Begin-Procedure Abrir_Archivo1
     let $nombre_archivo1= '../listados/' || 'recomrot_total_' || $fech_imp  ||'.lis'
     !let $nombre_archivo1= '../listados/' || 'recomrot_total_'  ||'.lis'
show 'Nombre Archivo=>' $nombre_archivo1
    new-report $nombre_archivo1
do Columnas (18,20,40,18,18,18,25,25,25,25,25,25,0,0,0,0,0,0,0,0)
do Heading_aux1
End-Procedure  


Begin-Procedure Rep_Lista1
  do PrintS (1,&of_nombre_t,'',0)
  do PrintS (2,&hc_cuenta_t,'',0)
  do PrintS (3,&hc_nombre_t,'',0)
  do PrintS (4,$fech,'',0)
  do PrintS (5,$i_fecha_proceso,'',0)
  do PrintN (6,&hc_tran_t,'99999',0)
  do PrintN (7,&hc_val_t,'{FOR_DIN}',0)
  do PrintN (8,&hc_comi_t,'{FOR_DIN}',0)
  do PrintN (9,&hc_comision_t,'{FOR_DIN}',0)
  do PrintN (10,&hc_iva,'{FOR_DIN}',0)
  do PrintN (11,&hc_iva_t,'{FOR_DIN}',0)
  do PrintN (12,&hc_tot_rec,'{FOR_DIN}',0)

End-Procedure

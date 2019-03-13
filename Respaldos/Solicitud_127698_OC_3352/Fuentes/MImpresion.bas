Attribute VB_Name = "MImpresion"
'*********************************************************
'   Archivo:        MImpresion.bas
'   Producto:       Master Information Subsystem
'   Diseñado por:   Juan Gómez
'   Fecha de Documentación: 02/Feb/09
'*********************************************************
'                       IMPORTANTE
' Esta Aplicación es parte de los paquetes bancarios pro-
' piedad de MACOSA, representantes exclusivos para el Ecua-
' dor de la NCR CORPORATION.  Su uso no autorizado queda
' expresamente prohibido así como cualquier alteración o
' agregado hecho por alguno de sus usuarios sin el debido
' consentimiento por escrito de la Presidencia Ejecutiva
' de MACOSA o su representante
'*********************************************************
Option Explicit
'Declaración de la variable para conexión a la base de datos
Private VLDB As Database
'Arreglo para control de existencia de datos para las secciones del reporte
'Posición 0 : Balances (Compañias)
'Posición 1 : Empleo   (Personas)
'Posición 2 : Cónyuge (Personas)
'Posición 3 : Referencias Bancarias (Personas y Compañias)
'Posición 4 : Referencias Comerciales (Personas y Compañias)
'Posición 5 : Referencias Personales (Personas)
'Posición 6 : Referencias Tarjetas (Compañias)
Private VLExistencia(6) As String

Public Sub FMImprimirFormulario(parTipoEnte As String, _
                              parCodEnte As String, parRptReporte As CrystalReport, _
                              parConsep As String, parInhabilitado As String)
'*********************************************************
'Objetivo:  Invocar a las funciones para carga de datos en
'           la base temporal y llamada al formulario de
'           Inicio de Relación Comercial
'Input:     parTipoEnte Indica si es persona Natural (P) o
'                       persona Jurídica Compañía (C)
'           parCodEnte  Código del Ente
'           parRptReporte  Es el reporte
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
On Error GoTo ErrorConexion
Dim VTMatriz(1) As Variant
Dim VTi%

'Inicializo el arreglo de existencias en N
For VTi% = 0 To UBound(VLExistencia)
   VLExistencia(VTi%) = "N"
Next VTi%
   parRptReporte.Destination = 0 'Pantalla
   parRptReporte.DataFiles(0) = PathUnico + "\clientes.mdb"
   Set VLDB = DBEngine.OpenDatabase(PathUnico & "\clientes.mdb")
On Error GoTo ErrorReporte
   PLBorrarDB
   If parTipoEnte = "P" Then
      'Abrir la base de datos
      Call FLConsPersona(parCodEnte)
      Call FLConsDirecciones(parCodEnte, parTipoEnte)
      Call FLConsEmpleos(parCodEnte)
      Call FLConsConyuge(parCodEnte)
      Call FLConsBalances(parCodEnte, parTipoEnte)
      'Call FLConsPropiedades(parCodEnte)
      Call FLConsReferencias(parCodEnte)
      Call FLConsRefPersonales(parCodEnte)
      parRptReporte.ReportFileName = App.Path + VGPathIdioma$ + "\personas.rpt"
      'Envio de parametros al reporte
      parRptReporte.ParameterFields(0) = "parEmpleo;" & VLExistencia(1) & ";True"
      parRptReporte.ParameterFields(1) = "parConyuge;" & VLExistencia(2) & ";True"
      parRptReporte.ParameterFields(2) = "parRefPersonales;" & VLExistencia(5) & ";True"
      parRptReporte.ParameterFields(3) = "parRefBancarias;" & VLExistencia(3) & ";True"
      parRptReporte.ParameterFields(4) = "parRefComerciales;" & VLExistencia(4) & ";True"
      parRptReporte.ParameterFields(5) = "parRefTarjetas;" & VLExistencia(6) & ";True"
      parRptReporte.ParameterFields(6) = "parConsep;" & parConsep & ";True"
      parRptReporte.ParameterFields(7) = "parInhabilitado;" & parInhabilitado & ";True"
      parRptReporte.WindowTitle = FMLoadResString(40160)
      parRptReporte.Action = 1
   Else
      Call FLConsCompania(parCodEnte)
      Call FLConsDirecciones(parCodEnte, parTipoEnte)
      Call FLConsAccionistas(parCodEnte, parTipoEnte)
      Call FLConsBalances(parCodEnte, parTipoEnte)
      'Call FLConsPropiedades(parCodEnte)
      Call FLConsReferencias(parCodEnte)
      parRptReporte.ReportFileName = App.Path + VGPathIdioma$ + "\companias.rpt"
      parRptReporte.ParameterFields(0) = "parBalance;" & VLExistencia(0) & ";True"
      parRptReporte.ParameterFields(1) = "parRefBancarias;" & VLExistencia(3) & ";True"
      parRptReporte.ParameterFields(2) = "parRefComerciales;" & VLExistencia(4) & ";True"
      parRptReporte.ParameterFields(3) = "parRefTarjetas;" & VLExistencia(6) & ";True"
      parRptReporte.ParameterFields(4) = "parConsep;" & parConsep & ";True"
      parRptReporte.ParameterFields(5) = "parInhabilitado;" & parInhabilitado & ";True"
      parRptReporte.WindowTitle = FMLoadResString(40161)
      parRptReporte.Action = 1
   End If
   VLDB.Close
   Exit Sub
ErrorConexion:
   'Debug.Print Err.Number
   MsgBox Err.Description, vbCritical, FMLoadResString(9549) '"Error"
   ' MsgBox FMLoadResString(27948), vbInformation, FMLoadResString(9549)
   Set VLDB = Nothing
   Exit Sub
ErrorReporte:
   MsgBox Err.Description, vbCritical, FMLoadResString(9549) '"Error"
   ' Si una de las tablas esta abierta en modo exclusivo no puedo borrar los datos
   If Err.Number <> 3008 Then
      PLBorrarDB
   End If
   VLDB.Close
   Set VLDB = Nothing
   Exit Sub
End Sub

Private Sub PLBorrarDB()
'*********************************************************
'Objetivo:  Borrar los datos de las tablas de la base de
'           datos temporal
'Input:
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
   VLDB.Execute "DELETE FROM cl_persona"
   VLDB.Execute "DELETE FROM cl_compania"
   VLDB.Execute "DELETE FROM cl_direccion"
   VLDB.Execute "DELETE FROM cl_telefono"
   VLDB.Execute "DELETE FROM cl_trabajo"
   VLDB.Execute "DELETE FROM cl_conyuge"
   VLDB.Execute "DELETE FROM cl_propiedad"
   VLDB.Execute "DELETE FROM cl_plan"
   VLDB.Execute "DELETE FROM cl_balance_consolidado"
   VLDB.Execute "DELETE FROM cl_referencia"
   VLDB.Execute "DELETE FROM cl_ref_personal"
   VLDB.Execute "DELETE FROM cl_accionistas"
End Sub

Private Function FLConsPersona(parCodPersona As String)
'*********************************************************
'Objetivo:  Carga de datos en la tabla Access cl_persona
'Input:     parCodPersona Código de la persona
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
On Error GoTo ErrorPersona
Dim VTR%
Dim VTArreglo(75) As String
Dim VTT As Recordset
Dim VTOficina, VTFuncionario As String

   VTOficina = FLObtenerNombreOficina(VGOficina$)
   VTFuncionario = FLObtenerNombreFuncionario(VGLogin$)

   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "Q"
   PMPasoValores SqlConn&, "@i_persona", 0, SQLINT4&, parCodPersona
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "132"
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_persona_cons", True, FMLoadResString(4191)) Then
      VTR% = FMMapeaArreglo(SqlConn&, VTArreglo())
      PMChequea SqlConn&
      Set VTT = VLDB.OpenRecordset("cl_persona")
      
      
      VTT.AddNew
         VTT("persona") = parCodPersona
         VTT("nombre") = VTArreglo(3)
         VTT("p_apellido") = VTArreglo(1)
         VTT("s_apellido") = VTArreglo(2)
         If VTArreglo(18) <> "" Then
            VTT("fecha_nac") = VTArreglo(18)
         End If
         If VTArreglo(19) <> "" Then
            VTT("fecha_crea") = VTArreglo(19)
         End If
         If VTArreglo(20) <> "" Then
            VTT("fecha_mod") = VTArreglo(20)
         End If
         VTT("provincia_nac") = VTArreglo(43)
         VTT("canton_nac") = VTArreglo(45)
         If VTArreglo(36) <> "" And VTArreglo(6) <> "" Then
            VTT("cedula") = VTArreglo(6)
         Else
            VTT("cedula") = VTArreglo(7)
         End If
         VTT("pais") = VTArreglo(9)
         If VTArreglo(48) <> "" Then
            VTT("num_cargas") = VTArreglo(48)
         Else
            VTT("num_cargas") = 0
         End If
         VTT("email") = VTArreglo(41)
         VTT("estado_civil") = VTArreglo(15)
         VTT("nivel_instruccion") = VTArreglo(47)
         VTT("profesion") = VTArreglo(11)
         VTT("sexo") = VTArreglo(5)
         If VTArreglo(50) <> "" Then
            VTT("patrimonio") = VTArreglo(50)
         Else
            VTT("patrimonio") = 0#
         End If
         VTT("actividad") = VTArreglo(13)
         VTT("sector") = VTArreglo(33)
         VTT("oficina") = VTOficina
         VTT("funcionario") = VTFuncionario
         VTT("cargo") = VTArreglo(62)
         VTT("institucion") = VTArreglo(63)
         VTT("jerarquico_sup") = VTArreglo(64)
         If (Not IsNull(VTArreglo(65))) And (VTArreglo(65) <> "") Then
            VTT("fecha_ini") = VTArreglo(65)
         End If
         If (Not IsNull(VTArreglo(66))) And (VTArreglo(66) <> "") Then
            VTT("fecha_fin") = VTArreglo(66)
         End If
         If VTArreglo(67) = "S" Then
               VTT("actual") = "SI"
         End If
         VTT("proposito_rc") = VTArreglo(70)     'DOna RFC201802-1531. 18-04-2018
      VTT.Update
      VTT.Close
   End If
   Exit Function
ErrorPersona:
   Err.Raise Err.Number, , "Consulta de Personas: " + Err.Description
   Exit Function
End Function

Private Function FLConsCompania(parCodEnte As String)
'*********************************************************
'Objetivo:  Carga de datos en la tabla Access cl_compania
'Input:     parCodEnte Código de la compañía
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
Dim VTR%
Dim VTArreglo(50) As String
Dim VTT As Recordset
Dim VTOficina, VTFuncionario As String
On Error GoTo ErrorCompania

   VTOficina = FLObtenerNombreOficina(VGOficina$)
   VTFuncionario = FLObtenerNombreFuncionario(VGLogin$)
   
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "Q"
   PMPasoValores SqlConn&, "@i_compania", 0, SQLINT4&, parCodEnte
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "1218"
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_compania_cons", True, FMLoadResString(4214)) Then
      VTR% = FMMapeaArreglo(SqlConn&, VTArreglo())
      PMChequea SqlConn&
      Set VTT = VLDB.OpenRecordset("cl_compania")
      VTT.AddNew
         VTT("compania") = parCodEnte
         VTT("nombre") = VTArreglo(1)
         VTT("ruc") = VTArreglo(6)
         VTT("tipo_sociedad") = VTArreglo(34)
         VTT("actividad") = VTArreglo(3)
         VTT("rep_legal") = VTArreglo(14)
         VTT("rep_legal_ruc") = VTArreglo(13)
         VTT("tipo") = VTArreglo(16)
         VTT("email") = VTArreglo(32)
         VTT("sitio_web") = VTArreglo(35)
         If VTArreglo(36) <> "" Then
            VTT("patrimonio") = VTArreglo(36)
         Else
            VTT("patrimonio") = 0#
         End If
         If VTArreglo(37) <> "" Then
            VTT("fecha_const") = VTArreglo(37)
         Else
            VTT("fecha_const") = Null
         End If
         If VTArreglo(22) <> "" Then
            VTT("fecha_crea") = VTArreglo(22)
         End If
         If VTArreglo(23) <> "" Then
            VTT("fecha_mod") = VTArreglo(23)
         End If
         If VTArreglo(27) <> "" Then
            VTT("sector") = VTArreglo(27)
         End If
         VTT("oficina") = VTOficina
         VTT("funcionario") = VTFuncionario
         VTT("rep_legal_pas") = VTArreglo(39)
         VTT("proposito_rc") = VTArreglo(45)     'DOna RFC201802-1531. 18-04-2018
      VTT.Update
      VTT.Close
   End If
   Exit Function
ErrorCompania:
   Err.Raise Err.Number, , "Consulta de Compañías: " + Err.Description
   Exit Function
End Function

Private Function FLConsDirecciones(parCodEnte As String, parTipoEnte As String)
'*********************************************************
'Objetivo:  Carga de datos en la tabla Access cl_direccion
'           Registra las direcciones y telefonos de un
'           ente
'Input:     parCodEnte Código del Ente
'           parTipoEnte Tipo de Ente: (P) Persona
'                                     (C) Compañía
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
Dim VTR%, VTi%
Dim VTMatriz(23, 6) As String
Dim VTT As Recordset
Dim VTTelefono As String
Dim VTTelefonoCel As String
Dim VTTelefonoRef As String
Dim VTTelefonoFax As String
On Error GoTo ErrorDireccion
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
   PMPasoValores SqlConn&, "@i_ente", 0, SQLINT4&, parCodEnte
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "1227"
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_direccion_cons", True, FMLoadResString(3361)) Then
      VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
      PMChequea SqlConn&
      Set VTT = VLDB.OpenRecordset("cl_direccion")
      For VTi% = 1 To VTR%
         'Por cada dirección consultada debe traerse los telefonos asociados a la direccion
         FLConsTelefonos parCodEnte, VTMatriz(0, VTi%), VTTelefono, _
                         VTTelefonoCel, VTTelefonoRef, VTMatriz(11, VTi%), _
                         VTTelefonoFax, parTipoEnte
         VTT.AddNew
            VTT("di_direccion") = VTMatriz(0, VTi%)
            VTT("di_ente") = parCodEnte
            VTT("di_principal") = VTMatriz(1, VTi%)
            VTT("di_transversal") = VTMatriz(2, VTi%)
            VTT("di_numero") = VTMatriz(3, VTi%)
            VTT("di_barrio") = VTMatriz(4, VTi%)
            VTT("di_provincia") = VTMatriz(6, VTi%)
            VTT("di_canton") = VTMatriz(8, VTi%)
            VTT("di_parroquia") = VTMatriz(10, VTi%)
            VTT("di_tipo") = VTMatriz(11, VTi%)
            VTT("di_descripcion") = VTMatriz(13, VTi%)
            'VTT("di_ciudad") = VTMatriz(12, VTi%)
            VTT("di_telefono_fij") = VTTelefono
            VTT("di_telefono_cel") = VTTelefonoCel
            VTT("di_telefono_ref") = VTTelefonoRef
            VTT("di_telefono_fax") = VTTelefonoFax
         VTT.Update
      Next VTi%
      VTT.Close
   End If
   Exit Function
ErrorDireccion:
   Err.Raise Err.Number, , "Consulta de Direcciones: " + Err.Description
   Exit Function
End Function

Private Function FLConsAccionistas(parCodEnte As String, parTipoEnte As String)
'*********************************************************
'Objetivo:  Carga de datos en la tabla Access cl_accionistas
'           Registra los accionistas un ente
'Input:     parCodEnte Código del Ente
'           parTipoEnte Tipo de Ente: (C) Compañía
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'23/May/17  D. Rojas            Emisión Inicial
'10/Ene/19  W. Valdiviezo       Impresión de todos los Accionistas de una Empresa/Institución
'*********************************************************
Dim VTR%, VTi%
Dim VTMatriz(23, 20) As String
Dim VTT As Recordset
Dim VTCuentaSiguiente As String


On Error GoTo ErrorAccionistas
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT4&, 171108
   PMPasoValores SqlConn&, "@i_ente", 0, SQLINT4&, parCodEnte
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
   PMPasoValores SqlConn&, "@i_modo", 0, SQLINT2&, 0
   
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_accionista", True, "") Then
      VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
      PMChequea SqlConn&
      Set VTT = VLDB.OpenRecordset("cl_accionistas")
      For VTi% = 1 To VTR%
         
         VTT.AddNew
            VTT("ac_ente") = parCodEnte
            VTT("ac_tipo_identific") = VTMatriz(2, VTi%)
            VTT("ac_identificacion") = VTMatriz(3, VTi%)
            VTT("ac_nombres") = VTMatriz(1, VTi%)
            VTT("ac_porcentaje") = VTMatriz(4, VTi%)
            VTT("ac_num_acciones") = VTMatriz(5, VTi%)
			VTCuentaSiguiente = VTMatriz(0, VTi%)
         VTT.Update
      Next VTi%
      VTT.Close
     Do While VTR% >= VGMaximoRows% - 1
            'Traigo los siguientes registros
            PMPasoValores SqlConn&, "@t_trn", 0, SQLINT4&, 171108
            PMPasoValores SqlConn&, "@i_ente", 0, SQLINT4&, parCodEnte
            PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
            PMPasoValores SqlConn&, "@i_modo", 0, SQLINT2&, 1
			PMPasoValores SqlConn&, "@i_codigo", 0, SQLINT4&, VTCuentaSiguiente
            If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_accionista", True,"") Then
               VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
               PMChequea SqlConn&
               Set VTT = VLDB.OpenRecordset("cl_accionistas")
				For VTi% = 1 To VTR%         
					VTT.AddNew
					VTT("ac_ente") = parCodEnte
					VTT("ac_tipo_identific") = VTMatriz(2, VTi%)
					VTT("ac_identificacion") = VTMatriz(3, VTi%)
					VTT("ac_nombres") = VTMatriz(1, VTi%)
					VTT("ac_porcentaje") = VTMatriz(4, VTi%)
					VTT("ac_num_acciones") = VTMatriz(5, VTi%)
					VTCuentaSiguiente = VTMatriz(0, VTi%)
					VTT.Update
					Next VTi%
				VTT.Close           
           Else
             PMChequea SqlConn&
           End If
        Loop
Else
   PMChequea SqlConn&
   End If
   Exit Function
ErrorAccionistas:
   Err.Raise Err.Number, , "Consulta de Accionistas: " + Err.Description
   Exit Function
End Function

Private Function FLConsTelefonos(parCodEnte As String, parCodDireccion As String, _
                                 ByRef parTelefono As String, ByRef parTelefonoCel As String, _
                                 ByRef parTelefonoRef As String, parCodTipoDir As String, _
                                 ByRef parTelefonoFax, parTipoEnte As String)
'*********************************************************
'Objetivo:  Obtención de los teléfonos para registro en la
'           tabla cl_direccion
'Input:     parCodEnte:      Código del ente
'           parCodDireccion: Código de la dirección del ente
'Output:    parTelefono:     Teléfono domicilio (Persona)
'                            Teléfono 1 (Compañía)
'           parTelefonoCel:  Teléfono Celular (Persona)
'                            Teléfono 2 (Compañía)
'           parTelefonoRef:  Telefono Referencial (Persona)
'           parTelefonoFax:  Fax (Compañía)
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
Dim VTR%, VTi%
Dim VTMatriz(5, 20) As String
'El formulario de inicio de relación comercial permite el ingreso de Teléfono 1, Teléfono 2
'para la dirección de la empresa
Dim VTTelefono1 As Boolean 'Indica el ingreso del telefono1
Dim VTTelefono2 As Boolean 'Indica el ingreso del telefono2
Dim VTFax As Boolean 'Indica el ingreso del telefono de fax
Dim VTLen As Integer
VTTelefono1 = False
VTTelefono2 = False
parTelefono = ""
parTelefonoCel = ""
parTelefonoRef = ""
parTelefonoFax = ""
On Error GoTo ErrorTelefono
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
   PMPasoValores SqlConn&, "@i_ente", 0, SQLINT4&, parCodEnte
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "147"
   PMPasoValores SqlConn&, "@i_direccion", 0, SQLINT1&, parCodDireccion
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_telefono", True, FMLoadResString(3406)) Then
      VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
      PMChequea SqlConn&
      For VTi% = 1 To VTR%
         'Verifico si el cliente es una compañía o persona
         'Si es una compañía solo guardo dos teléfonos (Fijo o Celular) y el teléfono de Fax
         If parTipoEnte = "C" Then
            Select Case VTMatriz(2, VTi%)
            Case "F", "C" 'Código de Telefono Fijo o Celular
               If Not VTTelefono1 Then
                  If VTMatriz(4, VTi%) <> "" Then ' Con extensión
                     parTelefono = VTMatriz(1, VTi%) + "(" + VTMatriz(4, VTi%) + ")"
                  Else 'Sin Extensión
                     parTelefono = VTMatriz(1, VTi%)
                  End If
                  VTTelefono1 = True
               Else
                  If Not VTTelefono2 Then
                     If VTMatriz(4, VTi%) <> "" Then ' Con extensión
                        parTelefonoCel = VTMatriz(1, VTi%) + "(" + VTMatriz(4, VTi%) + ")"
                     Else 'Sin Extensión
                        parTelefonoCel = VTMatriz(1, VTi%)
                     End If
                     VTTelefono2 = True
                  End If
               End If
            Case "X" 'Código de Teléfono Tipo Fax
               If Not VTFax Then
                  If VTMatriz(4, VTi%) <> "" Then ' Con extensión
                     parTelefonoFax = parTelefonoFax + VTMatriz(1, VTi%) + "(" + VTMatriz(4, VTi%) + ")"
                  Else 'Sin Extensión
                     parTelefonoFax = parTelefonoFax + VTMatriz(1, VTi%)
                  End If
                  VTFax = True
               End If
            End Select
         Else  'Si es una persona agrupo los telefónos según el tipo
            Select Case VTMatriz(2, VTi%) 'Verifico el tipo de telefono para concatenarlo
            Case "F" 'Telefono Fijo
               'JGO (28/May/09) Control de longitud de campo
               VTLen = Len(parTelefono) + Len(VTMatriz(1, VTi%)) + Len(VTMatriz(4, VTi%))
               If VTLen < 27 Then ' Longitud del campo en el reporte
                  If VTMatriz(4, VTi%) <> "" Then ' Con extensión
                     parTelefono = parTelefono + VTMatriz(1, VTi%) + "(" + VTMatriz(4, VTi%) + ")" + ";"
                  Else 'Sin Extensión
                     parTelefono = parTelefono + VTMatriz(1, VTi%) + ";"
                  End If
               End If
            Case "C" 'Celular
               VTLen = Len(parTelefonoCel) + Len(VTMatriz(1, VTi%)) + Len(VTMatriz(4, VTi%))
               If VTLen < 27 Then
                  parTelefonoCel = parTelefonoCel + VTMatriz(1, VTi%) + ";" 'Un celular no tiene extension
               End If
            Case "R" 'Referencial
               VTLen = Len(parTelefonoRef) + Len(VTMatriz(1, VTi%)) + Len(VTMatriz(4, VTi%))
               If VTLen < 27 Then
                  If VTMatriz(4, VTi%) <> "" Then ' Con extensión
                     parTelefonoRef = parTelefonoRef + VTMatriz(1, VTi%) + "(" + VTMatriz(4, VTi%) + ")" + ";"
                  Else 'Sin Extensión
                     parTelefonoRef = parTelefonoRef + VTMatriz(1, VTi%) + ";"
                  End If
               End If
            Case "X" 'Fax
               VTLen = Len(parTelefonoFax) + Len(VTMatriz(1, VTi%)) + Len(VTMatriz(4, VTi%))
               If VTLen < 27 Then
                  If VTMatriz(4, VTi%) <> "" Then ' Con extensión
                     parTelefonoFax = parTelefonoFax + VTMatriz(1, VTi%) + "(" + VTMatriz(4, VTi%) + ")" + ";"
                  Else 'Sin Extensión
                     parTelefonoFax = parTelefonoFax + VTMatriz(1, VTi%) + ";"
                  End If
               End If
            End Select
         End If
      Next VTi%
      
   End If
   Exit Function
ErrorTelefono:
   Err.Raise Err.Number, , "Consulta de Teléfonos: " + Err.Description
   Exit Function
End Function

Private Function FLConsEmpleos(parCodEnte As String)
'*********************************************************
'Objetivo:  Consulta de la información de los empleos de
'           de una persona
'Input:     parCodEnte Código de la persona
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
Dim VTR%, VTi%
Dim VTMatriz(20, 20) As String
Dim VTT As Recordset
Dim VTAntiguedad As Long

On Error GoTo ErrorEmpleo
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
   PMPasoValores SqlConn&, "@i_ente", 0, SQLINT4&, parCodEnte
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "1231"
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_empleo", True, FMLoadResString(3361)) Then
      VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
      PMChequea SqlConn&
      Set VTT = VLDB.OpenRecordset("cl_trabajo")
      If VTR% > 0 Then
         VLExistencia(1) = "S"
      Else
         VLExistencia(1) = "N"
      End If
      For VTi% = 1 To VTR%
         VTT.AddNew
            VTT("tr_persona") = parCodEnte
            VTT("tr_trabajo") = VTMatriz(0, VTi%)
            VTT("tr_empresa") = VTMatriz(1, VTi%)
            VTT("tr_cargo") = VTMatriz(2, VTi%)
            VTT("tr_act_empresa") = VTMatriz(14, VTi%)
            VTT("tr_departamento") = VTMatriz(5, VTi%)
            If VTMatriz(12, VTi%) <> "" And VTMatriz(11, VTi%) <> "" Then
               VTAntiguedad = FMDateDiff("m", VTMatriz(11, VTi%), VTMatriz(12, VTi%), "dd/mm/yyyy")
            Else
               If VTMatriz(11, VTi%) <> "" Then
                  VTAntiguedad = FMDateDiff("m", VTMatriz(11, VTi%), FMConvFecha(VGFechaProceso, "mm/dd/yyyy", VGFormatoFecha), "dd/mm/yyyy")
               Else
                  VTAntiguedad = 0
               End If
            End If
            If VTMatriz(11, VTi%) <> "" Then
               VTT("tr_fecha_ingreso") = VTMatriz(11, VTi%)
            End If
            VTT("tr_antiguedad") = VTAntiguedad
            VTT("tr_sit_laboral") = VTMatriz(4, VTi%)
            VTT("tr_email_empresa") = VTMatriz(15, VTi%)
            If VTMatriz(16, VTi%) <> "" Then
               VTT("tr_direccion") = VTMatriz(16, VTi%)
            Else
               VTT("tr_direccion") = 0
            End If
         VTT.Update
      Next VTi%
      VTT.Close
   End If
   Exit Function
ErrorEmpleo:
   Err.Raise Err.Number, , "Consulta de Empleos: " + Err.Description
   Exit Function
End Function

Private Function FLConsConyuge(parCodEnte As String)
'*********************************************************
'Objetivo:  Carga de datos del Cónyuge del cliente en la
'           tabla cl_conyuge
'Input:     parCodEnte Código de la persona
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
Dim VTR%, VTi%
Dim VTArreglo(30) As String
Dim VTT As Recordset
On Error GoTo ErrorConyuge
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "Q"
   PMPasoValores SqlConn&, "@i_persona", 0, SQLINT4&, parCodEnte
   PMPasoValores SqlConn&, "@i_tipo", 0, SQLCHAR&, "0"
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "1320"
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_conyuge", True, FMLoadResString(40049)) Then
      VTR% = FMMapeaArreglo(SqlConn&, VTArreglo())
      PMChequea SqlConn&
      Set VTT = VLDB.OpenRecordset("cl_conyuge")
      If VTArreglo(1) <> "" Then
         VLExistencia(2) = "S"
         VTT.AddNew
            VTT("ente") = parCodEnte
            VTT("p_apellido") = Trim$(VTArreglo(2))
            VTT("s_apellido") = Trim$(VTArreglo(3))
            VTT("nombre") = Trim$(VTArreglo(4))
            If VTArreglo(7) = "" Then
               VTT("cedula") = VTArreglo(6)
            Else
               VTT("cedula") = VTArreglo(7)
            End If
            VTT("nivel_instruccion") = Trim$(VTArreglo(12)) 'Descripcion del nivel de instruccion
            VTT("profesion") = Trim$(VTArreglo(14)) 'Descripción de la profesión
            VTT("actividad") = Trim$(VTArreglo(16)) 'Descripción de la actividad
            VTT("dis_conyugal") = Trim$(VTArreglo(19)) 'Disolución conyugal
            VTT("nacionalidad") = Trim$(VTArreglo(18)) 'Nacionalidad
            VTT("fecha_nacimiento") = Trim$(VTArreglo(24)) 'Fecha de Nacimiento
         VTT.Update
         VTT.Close
      Else
         VTT.Close
         VLExistencia(2) = "N"
         PMChequea SqlConn&
      End If
   End If
   Exit Function
ErrorConyuge:
   Err.Raise Err.Number, , "Consulta de Cónyuge: " + Err.Description
   Exit Function
End Function

Private Function FLConsPropiedades(parCodEnte As String)
'*********************************************************
'Objetivo:  Carga de datos en la tabla Access cl_propiedad
'           con la suma total de las propiedades de un
'           cliente
'Input:     parCodEnte Código del ente
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
Dim VTR%
Dim VTArreglo(4) As String
Dim VTT As Recordset
On Error GoTo ErrorPropiedades
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "Q"
   PMPasoValores SqlConn&, "@i_ente", 0, SQLINT4&, parCodEnte
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "135"
   PMPasoValores SqlConn&, "@i_opcion", 0, SQLCHAR&, "2"
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_propiedad", True, FMLoadResString(3361)) Then
      VTR% = FMMapeaArreglo(SqlConn&, VTArreglo())
      PMChequea SqlConn&
      Set VTT = VLDB.OpenRecordset("cl_propiedad")
      If VTArreglo(1) <> "" Then
         VTT.AddNew
            VTT("terreno") = VTArreglo(1)
            VTT("casa") = VTArreglo(2)
            VTT("vehiculo") = VTArreglo(3)
            VTT("otros") = VTArreglo(4)
            VTT.Update
         VTT.Close
      Else
         VTT.AddNew
         VTT("terreno") = 0#
         VTT("casa") = 0#
         VTT("vehiculo") = 0#
         VTT("otros") = 0#
         VTT.Update
      End If
   End If
   Exit Function
ErrorPropiedades:
   Err.Raise Err.Number, , "Consulta de Propiedades: " + Err.Description
   Exit Function
End Function

Private Function FLConsBalances(parCodEnte As String, parTipoEnte)
'*********************************************************
'Objetivo:  Carga de datos en la tabla Access cl_plan
'           Almacena la declaración de Activos - Pasivos e
'           Ingresos y Egresos de un Ente
'Input:     parCodEnte Código del Ente
'           parTipoEnte Tipo de Ente (P): Persona
'                                    (C): Compañía
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'27 Mar/09  J. Gomez            Cambio de los datos de
'                               balance para persona natural
'*********************************************************
Dim VTR%, VTi%
Dim VTMatriz(11, 20) As String
Dim VTT As Recordset
Dim VTBalanceActivoPasivo As String 'Activo - Pasivo Naturales
Dim VTBalanceIngresoEgreso As String 'Ingreso - Egreso Naturales
Dim VTActivos As String
Dim VTPasivos As String
Dim VTIngresos As String
Dim VTEgresos As String
Dim VTCuentaSiguiente As String
Dim VTCodNoExisteBalance As Integer

On Error GoTo ErrorBalance
'Le obligo a que los tipos de balance tengan esta nomenclatura para facilitar la generación del reporte
Const ActivoPasivo = "AP"
Const IngresoEgreso = "IE"
VTCodNoExisteBalance = 0

   Select Case parTipoEnte
   Case "P"
      VTBalanceActivoPasivo = Trim$(VGTipoBalanceNaturales(0))
      VTBalanceIngresoEgreso = Trim$(VGTipoBalanceNaturales(1))
      If VTBalanceActivoPasivo <> "" Then
         'Consulta para cargar los datos del balance Activos - Pasivos
         'codigo de transaccion
         PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "131"
         PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
         PMPasoValores SqlConn&, "@i_opcion", 0, SQLCHAR&, "2"
         PMPasoValores SqlConn&, "@i_cliente", 0, SQLINT4&, (parCodEnte)
         PMPasoValores SqlConn&, "@i_modo", 0, SQLINT1&, "0"
         PMPasoValores SqlConn&, "@i_tbalance", 0, SQLCHAR&, VTBalanceActivoPasivo
         If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_plan", True, FMLoadResString(3361)) Then
            VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
            PMMapeaVariable SqlConn&, VTActivos
            PMMapeaVariable SqlConn&, VTPasivos
            PMChequea SqlConn&
         Else
            PMChequea SqlConn&
         End If
      End If
      If VTBalanceIngresoEgreso <> "" Then
         'Consulta para cargar los datos del balance Activos - Pasivos
         'codigo de transaccion
         PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "131"
         PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
         PMPasoValores SqlConn&, "@i_opcion", 0, SQLCHAR&, "2"
         PMPasoValores SqlConn&, "@i_cliente", 0, SQLINT4&, (parCodEnte)
         PMPasoValores SqlConn&, "@i_modo", 0, SQLINT1&, "0"
         PMPasoValores SqlConn&, "@i_tbalance", 0, SQLCHAR&, VTBalanceIngresoEgreso
         If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_plan", True, FMLoadResString(3361)) Then
            VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
            PMMapeaVariable SqlConn&, VTIngresos
            PMMapeaVariable SqlConn&, VTEgresos
            PMChequea SqlConn&
         Else
            PMChequea SqlConn&
         End If
      End If
      Set VTT = VLDB.OpenRecordset("cl_balance_consolidado")
      VTT.AddNew
         VTT("bc_persona") = parCodEnte
         If VTActivos <> "" Then
            VTT("bc_activos") = VTActivos
         Else
            VTT("bc_activos") = 0#
         End If
         If VTPasivos <> "" Then
            VTT("bc_pasivos") = VTPasivos
         Else
            VTT("bc_pasivos") = 0#
         End If
         If VTIngresos <> "" Then
            VTT("bc_ingresos") = VTIngresos
         Else
            VTT("bc_ingresos") = 0#
         End If
         If VTEgresos <> "" Then
            VTT("bc_gastos") = VTEgresos
         Else
            VTT("bc_gastos") = 0#
         End If
      VTT.Update
      VTT.Close
   Case "C"
   
        PMPasoValores SqlConn&, "@t_trn", 0, SQLINT4&, 171110
        PMPasoValores SqlConn&, "@i_cliente", 0, SQLINT4&, parCodEnte
 
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_buscar_balance", True, "") Then
      VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
      VTBalanceActivoPasivo = VTMatriz(0, 1)
      VTBalanceIngresoEgreso = VTMatriz(1, 1)
      PMChequea SqlConn&
    Else
      PMChequea SqlConn&
   End If
      If VTBalanceActivoPasivo <> "" Then
         FLTraerCuentasBalance parCodEnte, VTBalanceActivoPasivo, ActivoPasivo, VTCodNoExisteBalance
      End If
      If VTBalanceIngresoEgreso <> "" Then
         FLTraerCuentasBalance parCodEnte, VTBalanceIngresoEgreso, IngresoEgreso, VTCodNoExisteBalance
      End If
   End Select
   Exit Function
ErrorBalance:
   Err.Raise Err.Number, , "Consulta de Balances: " + Err.Description
   Exit Function
End Function

Private Function FLConsReferencias(parCodEnte As String)
'*********************************************************
'Objetivo:  Carga de datos en la tabla Access cl_referencia
'           Almacena la información de las referencias económicas
'           de una persona
'Input:     parCodEnte Código del Ente
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
Dim VTR%, VTi%
Dim VTMatriz(11, 20) As String
Dim VTT As Recordset
Dim VTTipoCuenta As String
On Error GoTo ErrorReferencias
   'codigo de transaccion
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "180"
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
   PMPasoValores SqlConn&, "@i_opcion", 0, SQLCHAR&, "2"
   PMPasoValores SqlConn&, "@i_ente", 0, SQLINT4&, (parCodEnte)
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_ref_eco2", True, FMLoadResString(3361)) Then
      VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
      PMChequea SqlConn&
      Set VTT = VLDB.OpenRecordset("cl_referencia")
      If VTR% > 0 Then
         For VTi% = 1 To VTR%
            VTT.AddNew
               VTT("re_ente") = parCodEnte
               VTT("re_referencia") = VTMatriz(0, VTi%)
               VTT("re_tipo") = VTMatriz(1, VTi%)
               Select Case VTMatriz(1, VTi%)
               Case "B" 'Referencia Bancaria
                  VLExistencia(3) = "S"
               Case "C" 'Referencia Comercial
                  VLExistencia(4) = "S"
               Case "T" 'Referencia de Tarjetas
                  VLExistencia(6) = "S"
               End Select
               VTT("ec_banco") = VTMatriz(2, VTi%)
               If VTMatriz(4, VTi%) <> "" Then
                  If VTMatriz(4, VTi%) = "A" Then
                     VTTipoCuenta = FMLoadResString(3296)
                  Else
                     If VTMatriz(4, VTi%) = "C" Then
                        VTTipoCuenta = FMLoadResString(3297)
                     End If
                  End If
                  VTT("ec_tipo_cta") = VTTipoCuenta
               Else
                  VTT("ec_tipo_cta") = VTMatriz(4, VTi%)
               End If
               VTT("ec_cuenta") = VTMatriz(3, VTi%)
               VTT("co_institucion") = VTMatriz(5, VTi%)
               VTT("co_telefono") = VTMatriz(6, VTi%)
               If VTMatriz(7, VTi%) <> "" Then
                  VTT("co_fecha_ingr_en_inst") = VTMatriz(7, VTi%)
               End If
               VTT("ta_banco") = VTMatriz(8, VTi%)
               VTT("ta_cuenta") = VTMatriz(9, VTi%)
               If VTMatriz(10, VTi) <> "" Then
                  VTT("re_numero_cifras") = VTMatriz(10, VTi%)
               End If
               VTT("re_tipo_cifras") = VTMatriz(11, VTi%)
            VTT.Update
         Next VTi%
      Else
         VLExistencia(3) = "N"
         VLExistencia(4) = "N"
         VLExistencia(6) = "N"
      End If
      VTT.Close
   Else
      PMChequea SqlConn&
   End If
   Exit Function
ErrorReferencias:
   Err.Raise Err.Number, , "Consulta de Referencias Económicas: " + Err.Description
   Exit Function
End Function

Private Function FLConsRefPersonales(parCodEnte As String)
Dim VTR%, VTi%
Dim VTMatriz(13, 20) As String
Dim VTT As Recordset
'*********************************************************
'Objetivo:  Carga de datos en la tabla Access cl_ref_personal
'           Almacena la información de las referencias personales
'           de un cliente
'Input:     parCodPersona Código de la persona
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
On Error GoTo ErrorRefPersonales
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
   PMPasoValores SqlConn&, "@i_ente", 0, SQLINT4&, parCodEnte
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "136"
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_refpersonal", True, FMLoadResString(3361)) Then
      VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
      PMChequea SqlConn&
      Set VTT = VLDB.OpenRecordset("cl_ref_personal")
      If VTR% > 0 Then
         VLExistencia(5) = "S"
      Else
         VLExistencia(5) = "N"
      End If
      For VTi% = 1 To VTR%
         VTT.AddNew
            VTT("rp_persona") = parCodEnte
            VTT("rp_referencia") = VTMatriz(0, VTi%)
            VTT("rp_nombre") = VTMatriz(1, VTi%)
            VTT("rp_p_apellido") = VTMatriz(2, VTi%)
            VTT("rp_s_apellido") = VTMatriz(3, VTi%)
            VTT("rp_parentesco") = VTMatriz(5, VTi%)
            VTT("rp_direccion") = VTMatriz(4, VTi%)
            VTT("rp_telefono_d") = VTMatriz(6, VTi%)
            VTT("rp_telefono_e") = VTMatriz(7, VTi%)
            VTT("rp_telefono_o") = VTMatriz(8, VTi%)
         VTT.Update
      Next VTi%
      VTT.Close
   Else
      PMChequea SqlConn&
   End If
   Exit Function
ErrorRefPersonales:
   Err.Raise Err.Number, , "Consulta de Referencias Personales: " + Err.Description
   Exit Function
End Function
Private Function FLTraerCuentasBalance(parCodEnte As String, parTipoBalance As String, _
                                       parNomTipoBalance As String, ByRef parCodBal As Integer)
Dim VTR%, VTi%
Dim VTMatriz(11, 20) As String
Dim VTCuentaSiguiente As String
Dim VTT As Recordset
Dim VTTipoNom As String
On Error GoTo ErrorPlan
   'Consulta para cargar los datos del balance
   'codigo de transaccion
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "131"
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
   PMPasoValores SqlConn&, "@i_opcion", 0, SQLCHAR&, "2"
   PMPasoValores SqlConn&, "@i_cliente", 0, SQLINT4&, (parCodEnte)
   PMPasoValores SqlConn&, "@i_modo", 0, SQLINT1&, "0"
   PMPasoValores SqlConn&, "@i_tbalance", 0, SQLCHAR&, parTipoBalance
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_plan", True, FMLoadResString(3361)) Then
      VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
      PMChequea SqlConn&
      If VTMatriz(2, 1) <> "" Then
         If VTMatriz(0, 1) = "" Then parCodBal = parCodBal - 1
         If VTMatriz(0, 1) <> "" Then VLExistencia(0) = "S"
         Set VTT = VLDB.OpenRecordset("cl_plan")
         If VTR% > 0 Then
            For VTi% = 1 To VTR%
               VTT.AddNew
                  VTT("pl_cliente") = parCodEnte
                  If VTMatriz(0, VTi%) <> "" Then
                     VTT("pl_balance") = VTMatriz(0, VTi%)
                  Else
                     VTT("pl_balance") = parCodBal
                  End If
                  VTT("pl_cuenta") = VTMatriz(1, VTi%)
                  If VTMatriz(3, VTi%) <> "" Then
                     VTT("pl_valor") = VTMatriz(3, VTi%)
                  Else
                     VTT("pl_valor") = 0#
                  End If
                  VTT("ct_descripcion") = VTMatriz(2, VTi%)
                  VTT("ct_categoria") = VTMatriz(4, VTi%)
                  VTT("tp_tbalance") = parNomTipoBalance
                  VTCuentaSiguiente = VTMatriz(1, VTi%)
               VTT.Update
            Next VTi%
         End If
         VTT.Close
         Do While VTR% >= VGMaximoRows% - 1
            'Traigo los siguientes registros
            PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "131"
            PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "S"
            PMPasoValores SqlConn&, "@i_opcion", 0, SQLCHAR&, "2"
            PMPasoValores SqlConn&, "@i_cliente", 0, SQLINT4&, (parCodEnte)
            PMPasoValores SqlConn&, "@i_modo", 0, SQLINT1&, "1"
            PMPasoValores SqlConn&, "@i_tbalance", 0, SQLCHAR&, parTipoBalance
            PMPasoValores SqlConn&, "@i_cuenta", 0, SQLINT2&, VTCuentaSiguiente
            If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_plan", True, FMLoadResString(3361)) Then
               VTR% = FMMapeaMatriz(SqlConn&, VTMatriz())
               PMChequea SqlConn&
               If VTMatriz(2, 1) <> "" Then
                  Set VTT = VLDB.OpenRecordset("cl_plan")
                  If VTR% > 0 Then
                     For VTi% = 1 To VTR%
                        VTT.AddNew
                           VTT("pl_cliente") = parCodEnte
                           If VTMatriz(0, VTi%) <> "" Then
                              VTT("pl_balance") = VTMatriz(0, VTi%)
                           Else
                              VTT("pl_balance") = parCodBal
                           End If
                           VTT("pl_cuenta") = VTMatriz(1, VTi%)
                           If VTMatriz(3, VTi%) <> "" Then
                              VTT("pl_valor") = VTMatriz(3, VTi%)
                           Else
                              VTT("pl_valor") = 0#
                           End If
                           VTT("ct_descripcion") = VTMatriz(2, VTi%)
                           VTT("ct_categoria") = VTMatriz(4, VTi%)
                           VTT("tp_tbalance") = parNomTipoBalance
                           VTCuentaSiguiente = VTMatriz(1, VTi%)
                        VTT.Update
                     Next VTi%
                  End If
                  VTT.Close
               End If
            Else
               PMChequea SqlConn&
            End If
         Loop
      End If
   Else
      PMChequea SqlConn&
   End If
   Exit Function
ErrorPlan:
   Err.Raise Err.Number, , "Consulta de Cuentas de Balance: " + Err.Description
   Exit Function
End Function

Private Function FLObtenerNombreOficina(parCodOficina As String) As String
'*********************************************************
'Objetivo:  Consulta del nombre de la oficina a la que se
'           encuentra conectado
'Input:     parCodOficina : Código de la Oficina
'Output:    FLObtenerNombreOficina : Nombre de la oficina
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'27/May/09  J. Gomez            Emisión Inicial
'*********************************************************
Dim VTOficina As String
'Obtengo el nombre de la oficina
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "H"
   PMPasoValores SqlConn&, "@i_tipo", 0, SQLCHAR&, "VL"
   PMPasoValores SqlConn&, "@i_oficina", 0, SQLINT2&, parCodOficina
   'codigo de transaccion
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "1574"
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_oficina", True, FMLoadResString(3487)) Then
      PMMapeaVariable SqlConn&, VTOficina
      PMChequea SqlConn&
   Else
      VTOficina = ""
      PMChequea SqlConn&
   End If
   FLObtenerNombreOficina = VTOficina
End Function

Private Function FLObtenerNombreFuncionario(parLogin As String) As String
'*********************************************************
'Objetivo:  Consulta del nombre del funcionario conectado
'Input:     parLogin : Login del funcionario
'Output:    FLObtenerNombreFuncionario : Nombre del funcionario
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'27/May/09  J. Gomez            Emisión Inicial
'*********************************************************
Dim VTFuncionario As String
Dim VTR%
'Obtengo el nombre del funcionario conectado utilizando el login
   ReDim funcionario(2, 2)
   PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "H"
   PMPasoValores SqlConn&, "@i_tipo", 0, SQLCHAR&, "L"
   PMPasoValores SqlConn&, "@i_login", 0, SQLVARCHAR&, parLogin
   PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "1577"
   If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_funcionario", True, FMLoadResString(4285)) Then
      VTR% = FMMapeaMatriz(SqlConn&, funcionario())
      PMChequea SqlConn&
      VTFuncionario = funcionario(1, 1)
   Else
      VTFuncionario = ""
      PMChequea SqlConn&
   End If
   FLObtenerNombreFuncionario = VTFuncionario
End Function


Public Sub FMImprimirFormulario1(parTipoEnte As String, _
                              parCodEnte As String, parRptReporte As CrystalReport, _
                              parConsep As String, parInhabilitado As String)
'*********************************************************
'Objetivo:  Invocar a las funciones para carga de datos en
'           la base temporal y llamada al formulario de
'           Inicio de Relación Comercial
'Input:     parTipoEnte Indica si es persona Natural (P) o
'                       persona Jurídica Compañía (C)
'           parCodEnte  Código del Ente
'           parRptReporte  Es el reporte
'Output:
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'02/Mar/09  J. Gomez            Emisión Inicial
'*********************************************************
On Error GoTo ErrorConexion
Dim VTMatriz(1) As Variant
Dim VTi%

'Inicializo el arreglo de existencias en N
For VTi% = 0 To UBound(VLExistencia)
   VLExistencia(VTi%) = "N"
Next VTi%
   parRptReporte.Destination = 0 'Pantalla
   parRptReporte.DataFiles(0) = PathUnico + "\clientes.mdb"
   Set VLDB = DBEngine.OpenDatabase(PathUnico & "\clientes.mdb")
On Error GoTo ErrorReporte
   PLBorrarDB
   If parTipoEnte = "P" Then
      'Abrir la base de datos
      Call FLConsPersona(parCodEnte)
      Call FLConsDirecciones(parCodEnte, parTipoEnte)
      Call FLConsEmpleos(parCodEnte)
      Call FLConsConyuge(parCodEnte)
      Call FLConsBalances(parCodEnte, parTipoEnte)
      'Call FLConsPropiedades(parCodEnte)
      Call FLConsReferencias(parCodEnte)
      Call FLConsRefPersonales(parCodEnte)
      parRptReporte.ReportFileName = App.Path + VGPathIdioma$ + "\personas.rpt"
      'Envio de parametros al reporte
      VLExistencia(1) = True
      VLExistencia(5) = True
      parRptReporte.ParameterFields(0) = "parEmpleo;" & VLExistencia(1) & ";True"
      parRptReporte.ParameterFields(1) = "parConyuge;" & VLExistencia(2) & ";True"
      parRptReporte.ParameterFields(2) = "parRefPersonales;" & VLExistencia(5) & ";True"
      parRptReporte.ParameterFields(3) = "parRefBancarias;" & VLExistencia(3) & ";True"
      parRptReporte.ParameterFields(4) = "parRefComerciales;" & VLExistencia(4) & ";True"
      parRptReporte.ParameterFields(5) = "parRefTarjetas;" & VLExistencia(6) & ";True"
      parRptReporte.ParameterFields(6) = "parConsep;" & parConsep & ";True"
      parRptReporte.ParameterFields(7) = "parInhabilitado;" & parInhabilitado & ";True"
      parRptReporte.WindowTitle = FMLoadResString(40160)
      parRptReporte.Action = 1
   Else
      Call FLConsCompania(parCodEnte)
      Call FLConsDirecciones(parCodEnte, parTipoEnte)
      Call FLConsBalances(parCodEnte, parTipoEnte)
      'Call FLConsPropiedades(parCodEnte)
      Call FLConsReferencias(parCodEnte)
      parRptReporte.ReportFileName = App.Path + VGPathIdioma$ + "\companias.rpt"
      parRptReporte.ParameterFields(0) = "parBalance;" & VLExistencia(0) & ";True"
      parRptReporte.ParameterFields(1) = "parRefBancarias;" & VLExistencia(3) & ";True"
      parRptReporte.ParameterFields(2) = "parRefComerciales;" & VLExistencia(4) & ";True"
      parRptReporte.ParameterFields(3) = "parRefTarjetas;" & VLExistencia(6) & ";True"
      parRptReporte.ParameterFields(4) = "parConsep;" & parConsep & ";True"
      parRptReporte.ParameterFields(5) = "parInhabilitado;" & parInhabilitado & ";True"
      parRptReporte.WindowTitle = FMLoadResString(40161)
      parRptReporte.Action = 1
   End If
   VLDB.Close
   Exit Sub
ErrorConexion:
   'Debug.Print Err.Number
   MsgBox Err.Description, vbCritical, FMLoadResString(9549) '"Error"
   ' MsgBox FMLoadResString(27948), vbInformation, FMLoadResString(9549)
   Set VLDB = Nothing
   Exit Sub
ErrorReporte:
   MsgBox Err.Description, vbCritical, FMLoadResString(9549) '"Error"
   ' Si una de las tablas esta abierta en modo exclusivo no puedo borrar los datos
   If Err.Number <> 3008 Then
      PLBorrarDB
   End If
   VLDB.Close
   Set VLDB = Nothing
   Exit Sub
End Sub



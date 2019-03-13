VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "Threed32.ocx"
Object = "{39EB654A-9F9F-11D4-BD09-000102BF5D0F}#1.7#0"; "Map60.ocx"
Begin VB.MDIForm FPrincipal 
   Appearance      =   0  'Flat
   BackColor       =   &H8000000C&
   Caption         =   "*C.O.B.I.S.   Management Information Subsystem"
   ClientHeight    =   7755
   ClientLeft      =   165
   ClientTop       =   555
   ClientWidth     =   12735
   Icon            =   "fprincip.frx":0000
   LinkTopic       =   "MDIForm1"
   Tag             =   "4737"
   Begin Threed.SSPanel pnlBarraAyuda 
      Align           =   1  'Align Top
      Height          =   405
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   12735
      _Version        =   65536
      _ExtentX        =   22463
      _ExtentY        =   714
      _StockProps     =   15
      ForeColor       =   0
      BackColor       =   -2147483633
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderWidth     =   1
      Begin COBISMap60.Map32 Map 
         Height          =   135
         Left            =   11475
         Top             =   135
         Visible         =   0   'False
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   238
      End
      Begin Threed.SSCommand CmdBuscarLiquidadas 
         Height          =   360
         Left            =   10260
         TabIndex        =   3
         Tag             =   "1482"
         Top             =   45
         Visible         =   0   'False
         WhatsThisHelpID =   4739
         Width           =   1185
         _Version        =   65536
         _ExtentX        =   2090
         _ExtentY        =   635
         _StockProps     =   78
         Caption         =   "*CLIEN. PROB."
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Picture         =   "fprincip.frx":030A
      End
      Begin Threed.SSCommand cmdBuscarNarco 
         Height          =   360
         Left            =   30
         TabIndex        =   2
         Tag             =   "1481"
         Top             =   0
         WhatsThisHelpID =   4740
         Width           =   1750
         _Version        =   65536
         _ExtentX        =   3087
         _ExtentY        =   635
         _StockProps     =   78
         Caption         =   "*NARCO"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Picture         =   "fprincip.frx":0624
      End
      Begin Threed.SSCommand cmdBuscarCovinco 
         Height          =   360
         Left            =   9210
         TabIndex        =   1
         Top             =   45
         Visible         =   0   'False
         WhatsThisHelpID =   4741
         Width           =   1020
         _Version        =   65536
         _ExtentX        =   1799
         _ExtentY        =   635
         _StockProps     =   78
         Caption         =   "*COVINCO"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Picture         =   "fprincip.frx":093E
      End
      Begin VB.Timer tmrMail 
         Enabled         =   0   'False
         Left            =   12150
         Top             =   45
      End
      Begin VB.Timer tmrHora 
         Interval        =   60000
         Left            =   11655
         Top             =   0
      End
      Begin Threed.SSCommand cmdBuscarCRiesgos 
         Height          =   360
         Left            =   3000
         TabIndex        =   4
         Tag             =   "1483"
         Top             =   0
         WhatsThisHelpID =   4742
         Width           =   1620
         _Version        =   65536
         _ExtentX        =   2857
         _ExtentY        =   635
         _StockProps     =   78
         Caption         =   "*CENTRAL RIESGOS"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         AutoSize        =   1
         Picture         =   "fprincip.frx":0C58
      End
      Begin Threed.SSCommand cmdBuscarCCProtesto 
         Height          =   360
         Left            =   7710
         TabIndex        =   6
         Top             =   45
         Visible         =   0   'False
         WhatsThisHelpID =   4743
         Width           =   1470
         _Version        =   65536
         _ExtentX        =   2593
         _ExtentY        =   635
         _StockProps     =   78
         Caption         =   "*CHEQU. PROTESTA"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         AutoSize        =   1
         Picture         =   "fprincip.frx":0F72
      End
      Begin Threed.SSCommand cmdBuscarInhab 
         Height          =   360
         Left            =   4560
         TabIndex        =   5
         Tag             =   "1484"
         Top             =   0
         WhatsThisHelpID =   36465
         Width           =   1470
         _Version        =   65536
         _ExtentX        =   2593
         _ExtentY        =   635
         _StockProps     =   78
         Caption         =   "*INHABILITADOS"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         AutoSize        =   1
         Picture         =   "fprincip.frx":128C
      End
      Begin Threed.SSCommand cmdBuscarMalasRef 
         Height          =   360
         Left            =   1800
         TabIndex        =   16
         Tag             =   "1482"
         Top             =   0
         WhatsThisHelpID =   4789
         Width           =   1185
         _Version        =   65536
         _ExtentX        =   2090
         _ExtentY        =   635
         _StockProps     =   78
         Caption         =   "*MALAS REF."
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Picture         =   "fprincip.frx":15A6
      End
      Begin Threed.SSCommand cmdBuscarVinc 
         Height          =   360
         Left            =   6000
         TabIndex        =   17
         Tag             =   "1489"
         Top             =   0
         WhatsThisHelpID =   4999
         Width           =   1470
         _Version        =   65536
         _ExtentX        =   2593
         _ExtentY        =   635
         _StockProps     =   78
         Caption         =   "*VINCULADOS"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Enabled         =   0   'False
         AutoSize        =   1
         Picture         =   "fprincip.frx":18C0
      End
   End
   Begin Threed.SSPanel pnlBarraMensajes 
      Align           =   2  'Align Bottom
      Height          =   360
      Left            =   0
      TabIndex        =   7
      Top             =   7395
      Width           =   12735
      _Version        =   65536
      _ExtentX        =   22463
      _ExtentY        =   635
      _StockProps     =   15
      ForeColor       =   0
      BackColor       =   -2147483633
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   16.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderWidth     =   1
      Begin Threed.SSPanel pnlTransaccionLine 
         Height          =   255
         Left            =   4215
         TabIndex        =   8
         Top             =   60
         Width           =   3690
         _Version        =   65536
         _ExtentX        =   2646
         _ExtentY        =   1323
         _StockProps     =   15
         ForeColor       =   0
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BorderWidth     =   1
         BevelOuter      =   1
         Alignment       =   1
      End
      Begin Threed.SSPanel Focos 
         Height          =   135
         Index           =   3
         Left            =   9180
         TabIndex        =   9
         Top             =   165
         Width           =   195
         _Version        =   65536
         _ExtentX        =   2646
         _ExtentY        =   1323
         _StockProps     =   15
         Caption         =   "P"
         ForeColor       =   0
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   41.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BevelWidth      =   0
         BorderWidth     =   0
         BevelOuter      =   0
         Outline         =   -1  'True
         FloodType       =   1
         FloodColor      =   65280
         FloodShowPct    =   0   'False
      End
      Begin Threed.SSPanel Focos 
         Height          =   135
         Index           =   2
         Left            =   8970
         TabIndex        =   10
         Top             =   165
         Width           =   195
         _Version        =   65536
         _ExtentX        =   2646
         _ExtentY        =   1323
         _StockProps     =   15
         Caption         =   "R"
         ForeColor       =   0
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   41.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BevelWidth      =   0
         BorderWidth     =   0
         BevelOuter      =   0
         Outline         =   -1  'True
         FloodType       =   1
         FloodColor      =   65280
         FloodShowPct    =   0   'False
      End
      Begin Threed.SSPanel Focos 
         Height          =   135
         Index           =   1
         Left            =   8760
         TabIndex        =   11
         Top             =   165
         Width           =   195
         _Version        =   65536
         _ExtentX        =   2646
         _ExtentY        =   1323
         _StockProps     =   15
         Caption         =   "T"
         ForeColor       =   0
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   41.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BevelWidth      =   0
         BorderWidth     =   0
         BevelOuter      =   0
         Outline         =   -1  'True
         FloodType       =   1
         FloodColor      =   65280
         FloodShowPct    =   0   'False
      End
      Begin Threed.SSPanel Focos 
         Height          =   135
         Index           =   0
         Left            =   8550
         TabIndex        =   12
         Top             =   165
         Width           =   195
         _Version        =   65536
         _ExtentX        =   2646
         _ExtentY        =   1323
         _StockProps     =   15
         Caption         =   "L"
         ForeColor       =   0
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   41.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BevelWidth      =   0
         BorderWidth     =   0
         BevelOuter      =   0
         Outline         =   -1  'True
         FloodType       =   1
         FloodColor      =   65280
         FloodShowPct    =   0   'False
      End
      Begin Threed.SSPanel pnlHora 
         Height          =   250
         Left            =   7920
         TabIndex        =   13
         Top             =   60
         Width           =   555
         _Version        =   65536
         _ExtentX        =   2646
         _ExtentY        =   1323
         _StockProps     =   15
         ForeColor       =   0
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BorderWidth     =   1
         BevelOuter      =   1
      End
      Begin Threed.SSPanel pnlHelpLine 
         Height          =   255
         Left            =   75
         TabIndex        =   14
         Top             =   60
         Width           =   4125
         _Version        =   65536
         _ExtentX        =   2646
         _ExtentY        =   1323
         _StockProps     =   15
         ForeColor       =   0
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BorderWidth     =   1
         BevelOuter      =   1
         Alignment       =   1
      End
      Begin VB.Label Label1 
         Caption         =   "* L  T   R  P"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   120
         Left            =   8535
         TabIndex        =   15
         Top             =   30
         WhatsThisHelpID =   6574
         Width           =   870
      End
   End
   Begin VB.Menu mnuConexion 
      Caption         =   "*&Conexión"
      HelpContextID   =   13
      Begin VB.Menu mnuLogon 
         Caption         =   "*Log O&n"
         HelpContextID   =   4744
      End
      Begin VB.Menu mnuLogoff 
         Caption         =   "*Log O&ff"
         Enabled         =   0   'False
         HelpContextID   =   4745
      End
      Begin VB.Menu mnuLinea1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPasswd 
         Caption         =   "*Password"
         Enabled         =   0   'False
         HelpContextID   =   944
      End
      Begin VB.Menu mnuLinea17 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPreferencias 
         Caption         =   "*Preferencias..."
         HelpContextID   =   4746
         Tag             =   "1488"
      End
      Begin VB.Menu mnuLinea2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuBloquear 
         Caption         =   "*&Bloquear Terminal"
         Enabled         =   0   'False
         HelpContextID   =   4747
      End
      Begin VB.Menu mnuLinea3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSalir 
         Caption         =   "*&Salir"
         HelpContextID   =   17
         Shortcut        =   ^S
      End
   End
   Begin VB.Menu mnuClientes 
      Caption         =   "*C&lientes"
      Enabled         =   0   'False
      HelpContextID   =   4748
      Tag             =   "1401"
      Begin VB.Menu mnuPersonas 
         Caption         =   "*Personas"
         HelpContextID   =   4749
         Tag             =   "1402"
         Begin VB.Menu mnuInPersona 
            Caption         =   "*Apertura"
            HelpContextID   =   4750
            Tag             =   "1403"
         End
         Begin VB.Menu mnuUpPersona 
            Caption         =   "*Actualizar"
            HelpContextID   =   955
            Tag             =   "1404"
         End
         Begin VB.Menu mnucrerapcli 
            Caption         =   "*Apertura rápida"
            HelpContextID   =   4751
            Tag             =   "1405"
         End
         Begin VB.Menu mnucrecdhcli 
            Caption         =   "*Apertura rápida CDH"
            HelpContextID   =   4777
            Tag             =   "1496"
         End
      End
      Begin VB.Menu mnuCompanias 
         Caption         =   "*Compañías"
         HelpContextID   =   4752
         Tag             =   "1406"
         Begin VB.Menu mnuInCompania 
            Caption         =   "*Apertura"
            HelpContextID   =   4750
            Tag             =   "1407"
         End
         Begin VB.Menu mnuUpCompania 
            Caption         =   "*Actualizar"
            HelpContextID   =   955
            Tag             =   "1408"
         End
         Begin VB.Menu mnuCreRapCia 
            Caption         =   "*Apertura rápida"
            HelpContextID   =   4751
            Tag             =   "1490"
         End
      End
      Begin VB.Menu mnuGrupos 
         Caption         =   "*Grupos Económicos"
         HelpContextID   =   4753
         Tag             =   "1409"
         Begin VB.Menu mnuInGrupo 
            Caption         =   "*Insertar"
            HelpContextID   =   954
            Tag             =   "1410"
         End
         Begin VB.Menu mnuUpGrupo 
            Caption         =   "*Actualizar"
            HelpContextID   =   955
            Tag             =   "1411"
         End
         Begin VB.Menu mnuDesasignacion 
            Caption         =   "*Desasignar Miembros de Grupo "
            HelpContextID   =   4754
            Tag             =   "1412"
         End
      End
      Begin VB.Menu mnupattr 
         Caption         =   "*Patrimonio"
         HelpContextID   =   4756
         Tag             =   "1413"
      End
      Begin VB.Menu mnuvinc 
         Caption         =   "*Vinculaciones"
         HelpContextID   =   4757
         Tag             =   "1414"
         Begin VB.Menu mnuperscomp 
            Caption         =   "*Personas y Companias"
            HelpContextID   =   4758
            Tag             =   "1415"
         End
         Begin VB.Menu mnugrp 
            Caption         =   "*Grupos"
            HelpContextID   =   4759
            Tag             =   "1416"
         End
      End
      Begin VB.Menu mnuRelaciones 
         Caption         =   "*Relaciones entre Clientes"
         HelpContextID   =   4760
         Tag             =   "1417"
         Begin VB.Menu mnuMantenimiento 
            Caption         =   "*Mantenimiento"
            HelpContextID   =   2394
            Tag             =   "1418"
         End
         Begin VB.Menu mnuEliminacion 
            Caption         =   "*Eliminación"
            HelpContextID   =   4762
            Tag             =   "1419"
         End
         Begin VB.Menu mnuAsigMasiva 
            Caption         =   "*Asignación Masiva"
            HelpContextID   =   3655
            Tag             =   "1420"
         End
         Begin VB.Menu mnuAtribInstancias 
            Caption         =   "*Atributos de Instancias"
            HelpContextID   =   3912
            Tag             =   "1421"
         End
      End
      Begin VB.Menu mnuConsultas 
         Caption         =   "*Consultas"
         HelpContextID   =   2404
         Tag             =   "1422"
         Begin VB.Menu mnuConsulta 
            Caption         =   "*Consulta Datos Generales"
            HelpContextID   =   4764
            Tag             =   "1423"
         End
         Begin VB.Menu mnuConsGrupo 
            Caption         =   "*Consulta de Grupos Económicos"
            HelpContextID   =   3989
            Tag             =   "1424"
         End
         Begin VB.Menu mnuConsRelaciones 
            Caption         =   "*Consulta Genérica de Relaciones"
            HelpContextID   =   4766
            Tag             =   "1425"
         End
         Begin VB.Menu mnuHistorico 
            Caption         =   "*Consulta de Historia de Relaciones"
            HelpContextID   =   4768
            Tag             =   "1426"
         End
         Begin VB.Menu mnuConsMiembrosGrupo 
            Caption         =   "*Consulta de Miembros de Grupo Económico"
            HelpContextID   =   4769
            Tag             =   "1427"
         End
         Begin VB.Menu mnuConsGrpCompania 
            Caption         =   "*Consulta de Grupos que son Compañías"
            HelpContextID   =   4770
            Tag             =   "1428"
         End
         Begin VB.Menu mnuentexoficina 
            Caption         =   "*Consulta de Entes por Oficina"
            HelpContextID   =   3814
            Tag             =   "1429"
         End
         Begin VB.Menu mnuclixproducto 
            Caption         =   "*Consulta de Clientes por Producto"
            HelpContextID   =   4771
            Tag             =   "1430"
         End
         Begin VB.Menu mnuConsIndFinanc 
            Caption         =   "*Consulta de Indices Financieros"
            HelpContextID   =   4772
            Tag             =   "1431"
         End
         Begin VB.Menu mnuconsente 
            Caption         =   "*Consulta de Entes"
            HelpContextID   =   4773
            Tag             =   "1432"
         End
         Begin VB.Menu mnuconsentemod 
            Caption         =   "*Consulta de Entes Modificados"
            HelpContextID   =   4773
            Tag             =   "1497"
         End
         Begin VB.Menu mnuIva 
            Caption         =   "*Facturación IVA"
            HelpContextID   =   4774
            Tag             =   "1433"
         End
         Begin VB.Menu mnuForLicFon 
            Caption         =   "*Consulta de formulario licitud de fondos"
            HelpContextID   =   4779
            Tag             =   "171142"
         End
      End
      Begin VB.Menu mnus1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuBalances 
         Caption         =   "*Balances"
         HelpContextID   =   4775
         Tag             =   "1434"
      End
      Begin VB.Menu mnuPostales 
         Caption         =   "*Casillas Postales"
         HelpContextID   =   3234
         Tag             =   "1435"
      End
      Begin VB.Menu mnuDirecciones 
         Caption         =   "*Direcciones"
         HelpContextID   =   3233
         Tag             =   "1436"
      End
      Begin VB.Menu mnuEmpleos 
         Caption         =   "*Empleos"
         HelpContextID   =   40156
         Tag             =   "1437"
      End
      Begin VB.Menu mnufirma 
         Caption         =   "*Firmas"
         HelpContextID   =   4780
         Tag             =   "1438"
      End
      Begin VB.Menu mnuLegal 
         Caption         =   "*Legal"
         HelpContextID   =   4782
         Tag             =   "1439"
      End
      Begin VB.Menu mnuLogotipo 
         Caption         =   "*Logotipo/Imagen"
         HelpContextID   =   4784
         Tag             =   "1440"
      End
      Begin VB.Menu mnuPropiedades 
         Caption         =   "*Propiedades"
         HelpContextID   =   3236
         Tag             =   "1441"
      End
      Begin VB.Menu mnuRefPersonales 
         Caption         =   "*Ref. Personales"
         HelpContextID   =   3359
         Tag             =   "1442"
      End
      Begin VB.Menu mnuRefEconomicas 
         Caption         =   "*Ref. Económicas"
         HelpContextID   =   3237
         Tag             =   "1443"
      End
      Begin VB.Menu mnuSocHecho 
         Caption         =   "*Soc.de Hecho"
         HelpContextID   =   4788
         Tag             =   "1444"
      End
      Begin VB.Menu mnuRelacion 
         Caption         =   "*Relación"
         HelpContextID   =   3917
         Tag             =   "1476"
      End
      Begin VB.Menu mnuDatos 
         Caption         =   "*Datos Adicionales"
         HelpContextID   =   2166
         Tag             =   "1475"
      End
      Begin VB.Menu mnus5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVerificar 
         Caption         =   "*Verificación de Datos"
         HelpContextID   =   3687
         Tag             =   "1445"
      End
      Begin VB.Menu mnuAsignacion 
         Caption         =   "*Asignación de Oficial"
         HelpContextID   =   3678
         Tag             =   "1446"
      End
      Begin VB.Menu mnuMalasRef 
         Caption         =   "*Malas Referencias"
         HelpContextID   =   4285
         Tag             =   "1447"
         Begin VB.Menu mnuRMalasRef 
            Caption         =   "*Registrar Malas Referencias"
            HelpContextID   =   4793
            Tag             =   "1448"
         End
         Begin VB.Menu mnuMRExternas 
            Caption         =   "*Malas Referencias Externas"
            HelpContextID   =   4794
            Tag             =   "1449"
            Begin VB.Menu mnuCovinco 
               Caption         =   "*Covinco"
               HelpContextID   =   4741
               Visible         =   0   'False
               Begin VB.Menu mnuInsMRExternas 
                  Caption         =   "*Insertar"
                  HelpContextID   =   954
               End
               Begin VB.Menu mnuUpMRExternas 
                  Caption         =   "*Actualizar"
                  HelpContextID   =   955
               End
               Begin VB.Menu mnuDelMRExternas 
                  Caption         =   "*Eliminar"
                  HelpContextID   =   957
               End
            End
            Begin VB.Menu mnuNarcotrafico 
               Caption         =   "*Narcotráfico"
               HelpContextID   =   3187
               Tag             =   "1450"
               Visible         =   0   'False
               Begin VB.Menu mnuInsNarco 
                  Caption         =   "*Insertar"
                  HelpContextID   =   954
                  Tag             =   "1451"
               End
               Begin VB.Menu mnuUpNarco 
                  Caption         =   "*Actualizar"
                  HelpContextID   =   955
                  Tag             =   "1452"
               End
               Begin VB.Menu mnuDelNarco 
                  Caption         =   "*Eliminar"
                  HelpContextID   =   957
                  Tag             =   "1453"
               End
            End
            Begin VB.Menu mnuLiquidadas 
               Caption         =   "*Cli. Problemas"
               HelpContextID   =   4795
               Tag             =   "1454"
               Begin VB.Menu mnuInsLiqui 
                  Caption         =   "*Insertar"
                  HelpContextID   =   954
                  Tag             =   "1455"
               End
               Begin VB.Menu mnuUpLiqui 
                  Caption         =   "*Actualizar"
                  HelpContextID   =   955
                  Tag             =   "1456"
               End
               Begin VB.Menu mnuDelLiqui 
                  Caption         =   "*Eliminar"
                  HelpContextID   =   957
                  Tag             =   "1457"
               End
            End
         End
      End
      Begin VB.Menu mnu6 
         Caption         =   "-"
      End
      Begin VB.Menu mnudelente 
         Caption         =   "*Eliminacion Ente"
         HelpContextID   =   4796
         Tag             =   "1458"
      End
      Begin VB.Menu mnu7 
         Caption         =   "-"
      End
      Begin VB.Menu mnuimpresion 
         Caption         =   "*Impresión de Datos"
         HelpContextID   =   4316
         Tag             =   "1459"
         Visible         =   0   'False
      End
      Begin VB.Menu mnu8 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuConsep 
         Caption         =   "*Alertas CONSEP"
         HelpContextID   =   36459
         Tag             =   "1460"
      End
      Begin VB.Menu mnuExcep 
         Caption         =   "*Registro de Excepciones para Validación"
         HelpContextID   =   40269
         Tag             =   "1477"
         Begin VB.Menu mnuAdmiLis 
            Caption         =   "Administración Listas RCS"
            HelpContextID   =   43026
            Tag             =   "171109"
         End
         Begin VB.Menu mnuObsConsep 
            Caption         =   "*Observados por Consep"
            HelpContextID   =   3187
            Tag             =   "1478"
         End
         Begin VB.Menu mnuCedula 
            Caption         =   "*Registro Civil"
            HelpContextID   =   40270
            Tag             =   "1479"
            Begin VB.Menu mnuExcIngRC 
               Caption         =   "*Ingreso y Consulta de Excepciones de Registro Civil"
               HelpContextID   =   41843
               Tag             =   "1493"
            End
            Begin VB.Menu mnuExcElimRC 
               Caption         =   "*Eiminación de Excepciones de Registro Civil"
               HelpContextID   =   41844
               Tag             =   "1494"
            End
         End
         Begin VB.Menu mnuexcformlicfondos 
            Caption         =   "*Excepciones Formulario Licitud de Fondos"
            HelpContextID   =   43040
            Tag             =   "1350"
         End
      End
   End
   Begin VB.Menu mnuMarketing 
      Caption         =   "*&Marketing"
      Enabled         =   0   'False
      HelpContextID   =   4797
      Tag             =   "1461"
      Begin VB.Menu mnuRentabilidad 
         Caption         =   "*Análisis de Rentabilidad"
         HelpContextID   =   4798
         Tag             =   "1462"
         Begin VB.Menu mnuProdxCli 
            Caption         =   "*Productos x Cliente"
            HelpContextID   =   4515
            Tag             =   "1463"
         End
         Begin VB.Menu mnuProdxGrupo 
            Caption         =   "*Productos x Grupo"
            HelpContextID   =   4799
            Tag             =   "1464"
         End
         Begin VB.Menu mnu9 
            Caption         =   "-"
         End
         Begin VB.Menu mnuSitActual 
            Caption         =   "*Situación Actual del Cliente"
            HelpContextID   =   15525
            Tag             =   "1485"
         End
      End
      Begin VB.Menu mnuDistribGeo 
         Caption         =   "*Distribución Geográfica"
         HelpContextID   =   4031
         Tag             =   "1465"
      End
      Begin VB.Menu mnuDistribOtros 
         Caption         =   "*Distribución Cuantitativa [Otros]"
         HelpContextID   =   4801
         Tag             =   "1466"
      End
   End
   Begin VB.Menu mnuRiesgos 
      Caption         =   "*&Riesgos"
      Enabled         =   0   'False
      HelpContextID   =   4802
      Tag             =   "1467"
      Begin VB.Menu mnuPosicion 
         Caption         =   "*Cuentas x Cliente"
         HelpContextID   =   4691
         Tag             =   "1468"
      End
      Begin VB.Menu mnuPosicionG 
         Caption         =   "*Cuentas x Grupo"
         HelpContextID   =   4711
         Tag             =   "1469"
      End
   End
   Begin VB.Menu mnuAdministracion 
      Caption         =   "*A&dministración"
      Enabled         =   0   'False
      HelpContextID   =   4803
      Tag             =   "1470"
      Begin VB.Menu mnuCatalogo 
         Caption         =   "*Catálogo"
         HelpContextID   =   4804
         Tag             =   "1471"
      End
      Begin VB.Menu mnuCatalogoRC 
         Caption         =   "*Catalogo Registro Civil"
         HelpContextID   =   43003
         Tag             =   "1610"
      End
      Begin VB.Menu mnuTBalances 
         Caption         =   "*Tipos de Balances"
         HelpContextID   =   4806
         Tag             =   "1472"
      End
      Begin VB.Menu mnuTipoIdentificacion 
         Caption         =   "*Tipos de Identificación"
         HelpContextID   =   29346
         Tag             =   "1473"
      End
      Begin VB.Menu mnuDatAdicio 
         Caption         =   "*Datos Adicionales"
         HelpContextID   =   2166
         Tag             =   "1474"
      End
      Begin VB.Menu mnu10 
         Caption         =   "-"
      End
      Begin VB.Menu mnuConsAudit 
         Caption         =   "*Consulta de Auditoría"
         HelpContextID   =   29379
         Tag             =   "1491"
      End
   End
   Begin VB.Menu mnuVentanas 
      Caption         =   "*&Ventanas"
      HelpContextID   =   2420
      WindowList      =   -1  'True
      Begin VB.Menu mnuBarraAyuda 
         Caption         =   "*Barra de Ayuda"
         Checked         =   -1  'True
         HelpContextID   =   4808
      End
      Begin VB.Menu mnuBarraMensajes 
         Caption         =   "*Barra Mensajes"
         Checked         =   -1  'True
         HelpContextID   =   4809
      End
      Begin VB.Menu mnuLinea15 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCascada 
         Caption         =   "*Cascada"
         HelpContextID   =   975
      End
      Begin VB.Menu mnuHorizontal 
         Caption         =   "*Horizontal"
         HelpContextID   =   976
      End
      Begin VB.Menu mnuVertical 
         Caption         =   "*Vertical"
         HelpContextID   =   977
      End
      Begin VB.Menu mnuIconos 
         Caption         =   "*Alinear Iconos"
         HelpContextID   =   4810
      End
      Begin VB.Menu mnuLinea4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSizetoFit 
         Caption         =   "*Ajustar Ventana"
         HelpContextID   =   4811
      End
   End
   Begin VB.Menu mnuAyuda 
      Caption         =   "*&Ayuda"
      HelpContextID   =   34
      Begin VB.Menu mnuContenido 
         Caption         =   "*Contenido"
         HelpContextID   =   35
      End
      Begin VB.Menu mnulinea16 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAcerca 
         Caption         =   "*Acerca de ..."
         HelpContextID   =   36
      End
   End
End
Attribute VB_Name = "FPrincipal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'*********************************************************
'   Archivo:        FPRINCIP.FRM
'   Producto:       Master Information Subsystem
'   Diseñado por:   Myriam Dávila
'   Fecha de Documentación: 14/Ene/94
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
' Forma:    FPrincipal
' Descripción:  Es la forma principal de la aplicación, con-
'               tiene el menú y la barra inferior de mensa-
'               jes. Las demás formas se despliegan dentro
'               de esta.
' VARIABLES GLOBALES
'   VGPrefDBError%      mensajes de error de la bdd
'   VGPrefDBMensaje%    mensajes de la bdd
'   VLLogTran$          archivo de log local del sistema
'   VGPathImagen$       path para imagenes
'   VGProducto$         mnemonico del producto (MIS)
' MODULOS
'   MODINI.BAS = rutinas para usar preferencias.
'*********************************************************
'amlopez 6may98 D
'Eliminación de las funciones PMPrefDBError y PMPrefDBMensaje que llaman al map.dll
'amlopez 7may98 U
'Dimensionamiento de la variable VT porque da overflow
'amlopez 14may98 I
'El archivo estfinan.xls contiene macros, entonces no se abre
'directamente, por lo cual en VB5 se tomaba como error al abrir
'amlopez 15may98 I
'Asignar objeto a la variable VGBitmap32 que se
'utiliza en el despliegue de firmas

Option Explicit

Dim VLLogTran$
Dim VLPathExcel$
Public WithEvents VGHook As COBISTools.IdleTimeout
Attribute VGHook.VB_VarHelpID = -1
Public VGTipoDesconexion As Boolean

Private Sub cmdBuscarCovinco_click()
'***********************************************************
'
'
'
'
'
'
'***********************************************************
ReDim VTArreglo(32) As String
    FBuscarCovinco.optCriterio(1).Value = True
    FBuscarCovinco.txtValor.Text = "%"
    FBuscarCovinco.cmdEscoger.Visible = False
    FBuscarCovinco.Show 1
End Sub
Private Sub cmdBuscarCRiesgos_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Consulta de Inhabilitados
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA       AUTOR               RAZON
'26/01/2009  V.Burbano           Emisión Inicial
'*********************************************************

    FBuscarCRiesgos.optCriterio(1).Value = True
    FBuscarCRiesgos.txtValor.Text = "%"
    'VTO 21/06/2001
    'FBuscarCRiesgos.cmdEscoger.Visible = False
    FBuscarCRiesgos.Show
    
End Sub
Private Sub cmdBuscarInhab_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Consulta de Inhabilitados
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA       AUTOR               RAZON
'26/01/2009  V.Burbano           Emisión Inicial
'*********************************************************
   FBuscarInhabilitados.Show
   FBuscarInhabilitados.SetFocus
End Sub

Private Sub cmdBuscarCCProtesto_Click()
   FBuscarCRiesCP.optCriterio(1).Value = True
   FBuscarCRiesCP.txtValor.Text = "%"
   FBuscarCRiesCP.Show
End Sub


Private Sub CmdBuscarLiquidadas_Click()
    FBuscarLiquid!optCriterio(1).Value = True
    FBuscarLiquid.txtValor.Text = ""
    FBuscarLiquid!cmdEscoger.Visible = False
    FBuscarLiquid.Show
End Sub

Private Sub cmdBuscarMalasRef_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Consulta de Inhabilitados
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA       AUTOR               RAZON
'26/01/2009  V.Burbano           Emisión Inicial
'*********************************************************
   FBuscarMalaRef.Show
   FBuscarMalaRef.SetFocus
End Sub

Private Sub cmdBuscarNarco_Click()
    'VGMantNarco% = 0
    FBuscarNarco.cmdEscoger.Visible = False
    FBuscarNarco.Show
    FBuscarNarco.SetFocus
End Sub

Private Sub cmdBuscarVinc_Click()
   FBuscarVinculados.Show
   FBuscarVinculados.SetFocus
End Sub

Private Sub MDIForm_Load()

PMLoadResIcons Me
PMLoadResStrings Me

Set VGMap = Map
'amlopez 15may98 II
'Asignar objeto a la variable VGBitmap32 que se
'utiliza en el despliegue de firmas
Set VGBitmap32 = CreateObject("COBIS.Bitmap32")
'amlopez 15may98 IF
'*********************************************************
'Objetivo:  Cuando se carga la Forma Principal se procede
'           a inicializar todas las variables globales
'           necesarias y se inicializan las Preferencias.
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    'inicializacion de coordenadas
        
    FPrincipal.Top = 15
    FPrincipal.Left = 15
    FPrincipal.Width = 12000
    FPrincipal.Height = 10000

    VGBloqueo = False
    
    'inicializacion del HelpFile
    ARCHIVOINI$ = PathUnico + "\mis.ini"
   
    'inicializacion de variables globales
    'VGMaximoRows% = 21
    VGProducto$ = "MIS"
    'inicializacion de objetos
    
    'inicializacion de preferencias
    Iniciar_Preferencias ARCHIVOINI
    Forma_Preferencias
    pnlHora.Caption = Format$(Now, FMLoadResString(988))
    PMLoadResStrings Me
    'FLogin!txtCampo(0).Text = Get_Preferencia("SERVIDOR")
    'FLogin!txtCampo(1).Text = Get_Preferencia("USUARIO")
    VLLogTran$ = Get_Preferencia("ARCHIVO-LOG")
    VGPathImagen$ = Get_Preferencia("IMAGENES")
    If VGPathImagen$ = "" Then
        VGPathImagen$ = PathUnico
        Set_Preferencia "IMAGENES", VGPathImagen$
        Set_Forma_Preferencia "IMAGENES", VGPathImagen$
    End If
    'inicialización de Focos
    FPrincipal!Focos(0).FloodPercent = 100
    FPrincipal!Focos(1).FloodPercent = 0
    FPrincipal!Focos(2).FloodPercent = 0
    FPrincipal!Focos(3).FloodPercent = 0
    'inicialización de variables de correo electrónico
    VGCorreo% = False
    FPrincipal!tmrMail.Enabled = False
    FPrincipal!tmrMail.Interval = 0
    VGTimerMail% = 5000
    'inicializacion del uso de mapeadores
 FMInitMap Me!pnlHelpLine, FPrincipal!pnlTransaccionLine, FPrincipal!Focos(0), FPrincipal!Focos(1), FPrincipal!Focos(2), FPrincipal!Focos(3), VLLogTran$
 'amlopez 6may98 DI
 'Eliminación de estas funciones que llaman al map.dll
 '    PMPrefDBError False
 '   PMPrefDBMensaje True
 'amlopez 6may98 DF
   FPrincipal!cmdBuscarNarco.Enabled = False
   FPrincipal!CmdBuscarLiquidadas.Enabled = False
   FPrincipal!cmdBuscarMalasRef.Enabled = False
   FPrincipal!cmdBuscarCRiesgos.Enabled = False
   FPrincipal!cmdBuscarInhab.Enabled = False
   FPrincipal!cmdBuscarCovinco.Enabled = False
   FPrincipal!cmdBuscarCCProtesto.Enabled = False
     
   VGHelp.CHMFile = App.Path & "\mis.chm"
   VGPermitirSalir = True                           'HZA 08/NOV/2013

End Sub
Private Sub MDIForm_Unload(Cancel As Integer)
'*********************************************************
'Objetivo:  Al Descargar la forma se chequea si la conexióm
'           con SQL está abierta para cerrarla
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
'     If SqlConn& <> 0 Then
'         SqlClose SqlConn&
'        SqlExit
'        SqlWinExit
'    End If
'    End
    mnuSalir_Click
End Sub
Private Sub mnuAcerca_Click()
'*********************************************************
'Objetivo:  Llama a la forma FAbout
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
     FAbout.Show 1
End Sub

Private Sub mnuAdmiLis_Click()
    FManListaRCS.Show
    FManListaRCS.WindowState = 0
End Sub

Private Sub mnuAsigMasiva_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de asignacion masiva
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FAsigMasiva.Show
    FAsigMasiva.WindowState = 0
End Sub
Private Sub mnuAsignacion_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de asignacion de Oficiales
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FAsigOficial.Show
    FAsigOficial.WindowState = 0
End Sub
Private Sub mnuAtribInstancias_Click()
'*********************************************************
'Objetivo:  Llama a la forma de Modificacion de atributos
'           de Instancias
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'10/May/94  M.Davila            Emisión Inicial
'*********************************************************
    FBusInst.Show
    FBusInst.WindowState = 0
End Sub
Private Sub mnuBalances_Click()
'*********************************************************
'Objetivo:  Llama a la forma FBalances
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
   FBalances.Show 1
End Sub
Private Sub mnuBarraAyuda_Click()
'*********************************************************
'Objetivo:  Despliega u oculta el panel con la barra de
'           ayuda superior. Según esto setea la propie-
'           dad checked del mnuBarraAyuda en True/False
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    mnuBarraAyuda.Checked = Not mnuBarraAyuda.Checked
    pnlBarraAyuda.Visible = Not pnlBarraAyuda.Visible
End Sub
Private Sub mnuBarraMensajes_Click()
'*********************************************************
'Objetivo:  Despliega u oculta el panel con la barra de
'           mensajes inferior. Según esto setea la propie-
'           dad checked del mnuBarraMensajes en True/False
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    mnuBarraMensajes.Checked = Not mnuBarraMensajes.Checked
    pnlBarraMensajes.Visible = Not pnlBarraMensajes.Visible
End Sub
Private Sub mnuBloquear_Click()
    'Main
    'FControl.Show
    'FControl.WindowState = 0
    
    Me.Hide
    fpantalla.Show
End Sub
Private Sub mnuCascada_Click()
'*********************************************************
'Objetivo:  Alinea las formas abiertas en cascada
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FPrincipal.Arrange 0
End Sub
Private Sub mnuCatalogo_Click()
'*********************************************************
'Objetivo:  Llama a la forma FCatalogo
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FCatalogo.Show
    FCatalogo.WindowState = 0
End Sub

Private Sub mnuclixproducto_Click()
'Consulta de Clientes por Producto
Dim VTForm As Form

   ' Control para abrir una sola vez la forma por cada tipo de consulta
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FBentexoficina") Then
         If VTForm.tipo = "P" Then
            VTForm.SetFocus
            Exit Sub
         End If
      End If
   Next
   
   Set VTForm = New FBentexoficina
   VTForm.tipo = "P"
   VTForm.Show
End Sub

Private Sub mnuConsAudit_Click()
   FConsAudit.Show
End Sub

Private Sub mnuconsente_Click()
     FBuscarCliente!cmdEscoger.Visible = False
     FBuscarCliente.Caption = FMLoadResString(4773)
     FBuscarCliente.Tag = "C"
     FBuscarCliente.Show 1
     FBuscarCliente!cmdEscoger.Visible = True
     FBuscarCliente.Caption = FMLoadResString(3824)
     FBuscarCliente.Tag = ""
End Sub

Private Sub mnuconsentemod_Click()
     FModifclie.Show
     FModifclie.WindowState = 0
End Sub

Private Sub mnuConsep_Click()
    FConsep.Show
    FConsep.WindowState = 0
End Sub

Private Sub mnuConsGrupo_Click()
'*********************************************************
'Objetivo:  Llama a la forma FConGrupo en modo de Inserción
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FConsultasGrupo.Show
    FConsultasGrupo.WindowState = 0
End Sub
Private Sub mnuConsGrpCompania_Click()
'*********************************************************
'Objetivo:  Llama a la forma FGrupoCompania que resuelve
'           la consulta de grupos que son compañías
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FGrupoCompania.Show
    FGrupoCompania.WindowState = 0
End Sub
Private Sub mnuConsIndFinanc_Click()
'*********************************************************
'Objetivo:  Invoca a Excel, con la hoja de análisis
'           financiero
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Sep/94  M.Davila            Emisión Inicial
'*********************************************************
    On Error GoTo ErrExcel2
    'path de excel
    VLPathExcel$ = Trim$(Get_Preferencia("PATH-EXCEL"))
    If VLPathExcel$ = "" Then
        VLPathExcel$ = "c:\msoffice\excel\"
        Set_Preferencia "PATH-EXCEL", VLPathExcel$
        Set_Forma_Preferencia "PATH-EXCEL", VLPathExcel$
    End If
    If Mid$(VLPathExcel$, Len(VLPathExcel$), 1) <> "\" Then
        VLPathExcel$ = VLPathExcel$ + "\"
    End If
    FPrincipal.WindowState = 1
    'B002 09/oct/98 Modificación para que renozca path con caracteres en blanco
    x% = Shell("""" & VLPathExcel$ & "excel.exe " & """ " & """" & PathUnico & VGPathIdioma$ & "\estfinan.xls" & """", 3)
    'MsgBox """" & VLPathExcel$ & "excel.exe " & """ " & """" & PathUnico & VGPathIdioma$ & "\estfinan.xls" & """"
    
    Exit Sub
ErrExcel2:
 'amlopez 14may98 II
 'El archivo estfinan.xls contiene macros, entonces no se abre
 'directamente, por lo cual en VB5 se tomaba como error al abrir
    Debug.Print Err.Number
    Debug.Print Err.Description
 If Err.Number = 6 Then
   Resume Next
   Exit Sub
 End If
 'amlopez 14may98 IF
    MsgBox FMLoadResString(4817), 16, FMLoadResString(3765)
    Resume Next
End Sub
Private Sub mnuConsMiembrosGrupo_Click()
'*********************************************************
'Objetivo:  Llama a la forma FMiembrosGrupo que resuelve
'           la consulta de miembros de un grupo económico
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FMiembrosGrupo.Show
    FMiembrosGrupo.WindowState = 0
End Sub
Private Sub mnuConsRelaciones_Click()
'*********************************************************
'Objetivo:  Llama a la forma FConsRelaciones que resuelve
'           distintas consultas de relaciones entre entes
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FConsRelaciones.Show
    FConsRelaciones.WindowState = 0
End Sub
Private Sub mnuConsulta_Click()
'*********************************************************
'Objetivo:  Llama a la forma FConsultaDatos que nos permi-
'           te consultar los datos generales de un cliente
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    'FConsultaDatos.Show
    'FConsultaDatos.WindowState = 0
    FDatClientes.Show
    FDatClientes.WindowState = 0
End Sub
Private Sub mnuContenido_Click()
        VGHelp.HHDisplayContents
End Sub

Private Sub mnuCreRapCia_Click()
   FApRedCia.Show 1
End Sub

Private Sub mnucrerapcli_Click()

Dim VTForm As Form
   ' Control para abrir una sola vez la forma
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FApCliente") Then
         Unload VTForm
         Exit For
      End If
   Next

   FAperclirap.Tag = "I"
   FAperclirap.Show
   FAperclirap.WindowState = 0
'End Sub
   'FAperclirap.Show 0
End Sub


Private Sub mnucrecdhcli_Click()

    'FAperclirapcdh.Show
    'FAperclirapcdh.WindowState = 0
    
Dim VTForm As Form
   ' Control para abrir una sola vez la forma
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FApCliente") Then
         Unload VTForm
         Exit For
      End If
   Next

   FAperclirapcdh.Tag = "I"
   FAperclirapcdh.Show
   FAperclirapcdh.WindowState = 0
'End Sub
   'FAperclirap.Show 0
End Sub

Private Sub mnuDatAdicio_Click()
'*********************************************************
'Objetivo:  Llama a la forma fMantDatoAdicional
'*********************************************************
    fMantDatoAdicional.Show
    fMantDatoAdicional.WindowState = 0
End Sub
Private Sub mnudelente_Click()
    Fdelente.Show
End Sub
Private Sub mnuDelLiqui_Click()
'*********************************************************
'Objetivo:  Eliminar Malas Referencias Externas
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'02/Abr/09  I.Bastidas          Invocación a método para
'                               consulta datos del cliente
'                               con problemas
'*********************************************************
   FBuscarLiquid.optCriterio(1).Value = True
   FBuscarLiquid.cmdEscoger.Visible = True
   FBuscarLiquid.Show 1
   If VGBusqueda(1) <> "" Then
      If FMantInfExterna.FLConsInfExterna(VGBusqueda(1), "LIQ") Then
         FMantInfExterna.Tag = "D"
         FMantInfExterna.Caption = FMLoadResString(4819)
         FMantInfExterna.Show
         FMantInfExterna.WindowState = 0
         FMantInfExterna.cmdTransmitir.Visible = False
         FMantInfExterna.cmdEliminar.Visible = True
      End If
   End If
End Sub
Private Sub mnuDelMRExternas_Click()
'*********************************************************
'Objetivo:  Eliminar Malas Referencias Externas
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
Dim VTR%

    On Error GoTo Error
    
    ReDim VTArreglo(32) As String
    FBuscarCovinco.optCriterio(1).Value = True
    FBuscarCovinco.cmdEscoger.Visible = True
    FBuscarCovinco.Show 1
    If VGBusqueda(2) <> "" Then
        'Realizar el query de la persona en covinco
         PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "Q"
         PMPasoValores SqlConn&, "@i_codigo", 0, SQLINT4&, VGBusqueda(8)
        'codigo de transaccion
         PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "1257"
         If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_covinco_con", True, FMLoadResString(4820)) Then
             VTR% = FMMapeaArreglo(SqlConn&, VTArreglo())
             PMChequea SqlConn&
            FMantInfExterna.Tag = "D"
            VGInformacion$ = "Covinco"
            FMantInfExterna!txtEstado.Text = VTArreglo(1)
            FMantInfExterna!txtCedula.Text = VTArreglo(2)
            FMantInfExterna!txtNombre.Text = VTArreglo(3)
            FMantInfExterna!txtCreditoV.Text = VTArreglo(4)
            FMantInfExterna!txtJudicial.Text = VTArreglo(5)
            FMantInfExterna!txtMalManejo.Text = VTArreglo(6)
            If Trim(VTArreglo(7)) <> "/  /" Then
                FMantInfExterna!txtFecha.Text = VTArreglo(7)
            End If
            FMantInfExterna!txtCodigo.Text = VTArreglo(8)
            FMantInfExterna!txtCodigo.Enabled = False
            FMantInfExterna.Caption = FMLoadResString(4819)
            FMantInfExterna.Show
            FMantInfExterna.WindowState = 0
        End If
    End If
    Exit Sub
Error:
    If Err.Number = 9 Then
        Exit Sub
    End If
End Sub
Private Sub mnuDelNarco_Click()
'*********************************************************
'Objetivo:  Eliminar Malas Referencias Externas
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'02/Abr/09  I.Bastidas          Invocación a método para
'                               consulta datos del cliente
'                               observados por consep
'*********************************************************
VGMantNarco% = 1
   FBuscarNarco.cmdEscoger.Visible = True
   FBuscarNarco.Show 1
   If VGBusqueda(1) <> "" Then
      If FMantInfExterna.FLConsInfExterna(VGBusqueda(1), "NAR") Then
         FMantInfExterna.Tag = "D"
         FMantInfExterna.Caption = FMLoadResString(4819)
         FMantInfExterna.Show
         FMantInfExterna.WindowState = 0
      End If
   End If
End Sub
Private Sub mnuDesasignacion_Click()
'*********************************************************
'Objetivo:  Llama a la forma FDesasignarGrupo
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FDesasignarGrupo.Show
    FDesasignarGrupo.WindowState = 0
End Sub
Private Sub mnuDirecciones_Click()
'*********************************************************
'Objetivo:  Llama a la forma FBuscarCliente y una vez es-
'           cogido un cliente llama a la forma FApGeneral
'           para hacer mantenimiento de las direcciones
'           de un cliente
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FBuscarCliente.Show 1
    If VGBusqueda(1) <> "" Then
        FApGeneral.Tag = FMLoadResString(3233)
        FApGeneral!pnlEnte.Caption = VGBusqueda(1)
        Select Case VGBusqueda(0)
        Case "C" 'compañia
            FApGeneral!pnlNombre.Caption = VGBusqueda(2)
            FApGeneral!pnlCedRuc.Caption = VGBusqueda(3)
        Case "P"  'persona
            FApGeneral!pnlNombre.Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
            If VGBusqueda(5) <> "" Then
                FApGeneral!pnlCedRuc.Caption = VGBusqueda(5)
            Else
                FApGeneral!pnlCedRuc.Caption = VGBusqueda(8)
            End If
        End Select
        FApGeneral.Show 1
    End If
End Sub
Private Sub mnuDistribGeo_Click()
'*********************************************************
'Objetivo:  Llama a la forma FConsultasGeo
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FConsultasGeo.Show
    FConsultasGeo.WindowState = 0
End Sub
Private Sub mnuDistribOtros_Click()
'*********************************************************
'Objetivo:  Llama a la forma FConsultasGeo
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'06/Nov/2001  F.Espinosa            Emisión Inicial
'*********************************************************
    FConsultasOtras.Show
    FConsultasOtras.WindowState = 0
End Sub
Private Sub mnuEliminacion_Click()
'*********************************************************
'Objetivo   LLama a la forma FElimRelac
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FElimRelac.Show
    FElimRelac.WindowState = 0
End Sub
Private Sub mnuEmpleos_Click()
'*********************************************************
'Objetivo:  Llama a la forma FBuscarCliente para buscar
'           personas y una vez escogida una llama a la for-
'           ma FApGeneral para mantener los empleos de esta
'           persona
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FBuscarCliente!optCliente(1).Enabled = False
    FBuscarCliente!optCliente(0).Value = True
    FBuscarCliente.Show 1
    FBuscarCliente!optCliente(1).Enabled = True
    If VGBusqueda(1) <> "" Then
        FApGeneral.Tag = FMLoadResString(40156)
        FApGeneral!pnlEnte.Caption = VGBusqueda(1)
        FApGeneral!pnlNombre.Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
        If VGBusqueda(5) <> "" Then
            FApGeneral!pnlCedRuc.Caption = VGBusqueda(5)
        Else
            FApGeneral!pnlCedRuc.Caption = VGBusqueda(8)
        End If
        
        FApGeneral.Show 1
    End If
End Sub
Private Sub mnuentexoficina_Click()
   ' Consulta de entes por oficina
Dim VTForm As Form

   ' Control para abrir una sola vez la forma por cada tipo de consulta
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FBentexoficina") Then
         If VTForm.tipo = "O" Then
            VTForm.SetFocus
            Exit Sub
         End If
      End If
   Next
   
   Set VTForm = New FBentexoficina
   VTForm.tipo = "O"
   VTForm.Show
End Sub

Private Sub mnuExcElimRC_Click()
   ' Eliminación de Excepciones de Registro Civil
   FConsExcep.VLTipoExcep = "R"
   FConsExcep.VLPasaporte = False
   FConsExcep.VLEliminar = True
   FConsExcep.Show 1
End Sub

Private Sub mnuexcformlicfondos_Click()
' Ingreso de Excepciones Formulario Licitud de Fondos
'***********************************************************************
'Objetivo:  Llama a la Forma de Excepciones Formulario Licitud de Fondos
'Input   :  ninguno
'Output  :  ninguno
'***********************************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'26/Dic/16  O.Cajamarca         Emisión Inicial
'***********************************************************************
Dim VTForm As Form

   ' Control para abrir una sola vez la forma por cada tipo de excepción
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FExcepcionFLF") Then
         If VTForm.VLTipoExcep = "F" Then
            VTForm.SetFocus
            Exit Sub
         End If
      End If
   Next

Dim FExcepcionFLF As Form

    Set FExcepcionFLF = New FExcepcionFLF
    FExcepcionFLF.VLTipoExcep = "F"
    FExcepcionFLF.Show
    FExcepcionFLF.WindowState = 0
End Sub

Private Sub mnuExcIngRC_Click()
' Ingreso de excepciones de Registro Civil
'*********************************************************
'Objetivo:  Llama a la Forma de Excepciones Registro Civil
'           Identificación  - Cédula)
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'19/Mar/09  I.Bastidas          Emisión Inicial
'*********************************************************
Dim VTForm As Form

   ' Control para abrir una sola vez la forma por cada tipo de excepción
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FExcepcionId") Then
         If VTForm.VLTipoExcep = "R" Then
            VTForm.SetFocus
            Exit Sub
         End If
      End If
   Next

Dim FExcepFrm As Form

   Set FExcepFrm = New FExcepcionId
   FExcepFrm.VLTipoExcep = "R"
   FExcepFrm.VLPasaporte = False  ' Indica que el pasaporte no es visible
   FExcepFrm.Show
   FExcepFrm.WindowState = 0
End Sub

Private Sub mnufirma_Click()
   'JGO 08/Abr/09 Control de Instalación de Producto Firmas
   If VGFirmasInst Then
      FBuscarCliente.Show 1
      If VGBusqueda(1) <> "" Then
         Select Case VGBusqueda(0)
         Case "C"
            FFirmasSellos!lblDescripcion(3).Caption = VGBusqueda(1)
            FFirmasSellos!lblDescripcion(2).Caption = VGBusqueda(2)
            FFirmasSellos!lblDescripcion(0).Caption = VGBusqueda(3)
         Case "P"
            FFirmasSellos!lblDescripcion(3).Caption = VGBusqueda(1)
            FFirmasSellos!lblDescripcion(2).Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
            If VGBusqueda(5) <> "" Then
                FFirmasSellos!lblDescripcion(0).Caption = VGBusqueda(5)
            Else
                FFirmasSellos!lblDescripcion(0).Caption = VGBusqueda(8)
            End If
         End Select
         FFirmasSellos!lblDescripcion(1).Caption = VGBusqueda(0)
         FFirmasSellos.Tag = "O" 'entre por el menu
         FFirmasSellos.Show 1
      End If
   Else
      MsgBox FMLoadResString(40429), vbInformation, FMLoadResString(40428)
   End If
End Sub
Private Sub mnugrp_Click()
    FVinculaGrupos.Show
End Sub

Private Sub mnuHistorico_Click()
'*********************************************************
'Objetivo:  Llama a la forma FHistorico
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FHistorico.Show
    FHistorico.WindowState = 0
End Sub
Private Sub mnuHorizontal_Click()
'*********************************************************
'Objetivo:  Alinea las formas abiertas en forma Horizontal
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FPrincipal.Arrange 1
End Sub
Private Sub mnuIconos_Click()
'*********************************************************
'Objetivo:  Alinea los iconos de las formas abiertas en
'           la parte inferior de la forma principal
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FPrincipal.Arrange 3
End Sub
Private Sub mnuimpresion_Click()
    FImpresionDatos.Show
    FImpresionDatos.WindowState = 0
End Sub
Private Sub mnuInCompania_Click()
'*********************************************************
'Objetivo:  Llama a la forma FAPsociedad en modo de Inserción
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
Dim VTForm As Form
   ' Control para abrir una sola vez la forma
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FApCompania") Then
         Unload VTForm
         Exit For
      End If
   Next

   FApCompania.Tag = "I"
   FApCompania.Show
   FApCompania.WindowState = 0
End Sub
Private Sub mnuInGrupo_Click()
'*********************************************************
'Objetivo:  Llama a la forma FApGrupo en modo de inserción
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
Dim VTForm As Form

   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FApGrupoEcon") Then
         Unload VTForm
         Exit For
      End If
   Next
   
   FApGrupoEcon.Tag = "I"
   FApGrupoEcon.Show
   FApGrupoEcon.WindowState = 0
End Sub
Private Sub mnuInPersona_Click()
'*********************************************************
'Objetivo:  Llama a la forma FApCliente en modo de inserción
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
Dim VTForm As Form
   ' Control para abrir una sola vez la forma
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FApCliente") Then
         Unload VTForm
         Exit For
      End If
   Next

   FApCliente.Tag = "I"
   FApCliente.Show
   FApCliente.WindowState = 0
End Sub
Private Sub mnuInsLiqui_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Malas Referencias Externas
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
            FMantInfExterna.Tag = "I"
            FMantInfExterna.Caption = FMLoadResString(4824)
            VGInformacion$ = "Cia. Liquidadas"
            FMantInfExterna.Show
            FMantInfExterna.WindowState = 0
End Sub
Private Sub mnuInsMRExternas_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Malas Referencias Externas
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
            FMantInfExterna.Tag = "I"
            FMantInfExterna.Caption = FMLoadResString(4824)
            VGInformacion$ = "Covinco"
            FMantInfExterna.Show
            FMantInfExterna.WindowState = 0
            
End Sub
Private Sub mnuInsNarco_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Malas Referencias Externas
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
   FMantInfExterna.Tag = "I"
   FMantInfExterna.Caption = FMLoadResString(4824)
   VGInformacion$ = "Narcotráfico"
   FMantInfExterna.Show
   FMantInfExterna.WindowState = 0
End Sub
Private Sub mnuIva_Click()
FIva.Show 0
End Sub

Private Sub mnuForLicFon_Click()       ''DOna. RFC 201808-3177. 27-08-2018
FConsultarForLicFon.Show 0
End Sub

Private Sub mnuLegal_Click()
'*********************************************************
'Objetivo:  Llama a la forma FBuscarCliente y una vez es-
'           cogido un cliente llama a la forma FLegal
'           para hacer mantenimiento de las información
'           legal de una compañía
'Input   :  ninguno
'Output  :  ninguno
'************************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'05/May/94  M.Davila            Emisión Inicial
'13/Abr/09  V.Burbano           Se pasa a Función FlConsLegal
'************************************************************

   FBuscarCliente!optCliente(0).Enabled = False
   FBuscarCliente!optCliente(1).Value = True
   FBuscarCliente.Show 1
   FBuscarCliente!optCliente(0).Enabled = True
   If VGBusqueda(1) <> "" Then
      If FLegal.FLConsLegal(VGBusqueda(1)) Then
         FLegal!lblCompania(0).Caption = VGBusqueda(1)
         FLegal!lblCompania(1).Caption = VGBusqueda(3)
         FLegal!lblCompania(2).Caption = VGBusqueda(2)
         FLegal.Show 1
      End If
   End If
End Sub
Private Sub mnuLogoff_Click()
'*********************************************************
'Objetivo:  Si existe una conexión abierta, llama al sp
'           sp_endlogin, cierra la conexión y deshabilita
'           el correo electrónico
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
Dim VTMensaje$
   Set Me.VGHook = Nothing
    FPrincipal!tmrMail.Enabled = False
    FPrincipal!tmrMail.Interval = 0
     If SqlConn& <> 0 Then
         PMPasoValores SqlConn&, "@i_server", 0, SQLCHAR&, ServerNameLocal$
         PMPasoValores SqlConn&, "@i_login", 0, SQLCHAR&, VGLogin$
         PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "1502"
         If FMTransmitirRPC(SqlConn&, ServerName$, "master", "sp_endlogin", False, "") Then
             PMMapeaVariable SqlConn&, VTMensaje$
             PMChequea SqlConn&
             SqlClose SqlConn&
            MsgBox FMLoadResString(986) + ServerName$, 0, FMLoadResString(712)
             SqlConn& = 0
            SqlExit
            SqlWinExit
            FPrincipal!mnuLogon.Enabled = True
            FPrincipal!mnuLogoff.Enabled = False
            FPrincipal!mnuPasswd.Enabled = False
            FPrincipal!mnuBloquear.Enabled = False
            FPrincipal!mnuClientes.Enabled = False
            FPrincipal!mnuMarketing.Enabled = False
            FPrincipal!mnuRiesgos.Enabled = False
            FPrincipal!mnuAdministracion.Enabled = False
            FPrincipal!cmdBuscarNarco.Enabled = False
            FPrincipal!CmdBuscarLiquidadas.Enabled = False
            FPrincipal!cmdBuscarMalasRef.Enabled = False
            FPrincipal!cmdBuscarCRiesgos.Enabled = False
            FPrincipal!cmdBuscarInhab.Enabled = False
            FPrincipal!cmdBuscarVinc.Enabled = False
            
            FPrincipal!cmdBuscarCovinco.Enabled = False
            FPrincipal!cmdBuscarCCProtesto.Enabled = False
            ' Cerrar todas las formas abiertas menos la principal  VBU- 14-Abr-2009
            Dim VTForm As Form
            For Each VTForm In Forms
               If VTForm.Name <> "FPrincipal" And VTForm.Name <> "FPreferencias" Then
                  Unload VTForm
               End If
            Next
        End If
    End If
End Sub
Private Sub mnuLogon_Click()
'*********************************************************
'Objetivo:  Llama a la forma FLogin, toma el nombre del
'           servidor y el login de las preferencias. Si
'           la conexión es exitosa llama a la forma FParametros
'           para registrar al usuario.
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    'FLogin!txtCampo(0).Text = Get_Preferencia("SERVIDOR")
    'FLogin!txtCampo(1).Text = Get_Preferencia("USUARIO")
    'FLogin.Show 1
    'If SqlConn& <> 0 Then
    '   FParametros.Show 1
    'End If
    
Dim CobSrv As String
Dim CobLogin As String
Dim CobPwd As String
Dim VTDBLibVersion$
Dim VTAuxi&


    CobSrv = Get_Preferencia("SERVIDOR")
    CobLogin = Get_Preferencia("USUARIO")
    SqlConn& = 0
    'Obtiene la versión de DBLibrary
    VTDBLibVersion$ = SqlInit$()
    'Obtiene el número de la conexión
    SqlConn& = SqlOpenLogin(CobSrv, CobLogin, "Administrador", "Administrador")

    VTAuxi = SqlConn& Mod 10000

    If SqlConn& > 0 Then 'Si existe una conexión con el servidor
        'Setea variables globales para la aplicación
        ServerNameLocal$ = CobSrv
        ServerName$ = ""
        VGLogin$ = CobLogin
        Password$ = CobPwd
        DatabaseName$ = "cobis"
        HostName$ = "Administrador"
        VGUsuario$ = ""
        VGUsuarioNombre$ = ""
        Set_Preferencia "USUARIO", VGLogin$
        Set_Forma_Preferencia "USUARIO", VGLogin$
        Set_Preferencia "SERVIDOR", ServerNameLocal$
        Set_Forma_Preferencia "SERVIDOR", ServerNameLocal$
        FParametros.Show 1
        
        If Not VerificarVersion(SqlConn&, App.EXEName + ".exe", App.Major, App.Minor, App.revision, 2) Then
            mnuLogoff_Click
        End If


    ElseIf SqlConn = 0 Then
        'Si el servidor no se conecto
        MsgBox "El servidor no se conectó debidamente", 0, "Mensaje del Servidor"
    End If

End Sub
Private Sub mnuLogotipo_Click()
'*********************************************************
'Objetivo:  Llama a la forma FBuscarCliente, una vez esco-
'           gido un cliente llama a la forma FImagen para
'           asignar/modificar la imagen del cliente
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
Dim VTNombre$

   FBuscarCliente.Show 1
   If VGBusqueda(1) <> "" Then
      Select Case VGBusqueda(0)
      Case "C"
         VTNombre$ = VGBusqueda(2)
      Case "P"
         VTNombre$ = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
      Case "S"
         VTNombre$ = VGBusqueda(2)
      End Select
      
      If FImagen.FLImagen(VGBusqueda(1), VTNombre$) Then
         FImagen.Show 1
      End If
   End If
End Sub
Private Sub mnuMantenimiento_Click()
'*********************************************************
'Objetivo   LLama a la forma FRelacionEnte
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FRelacionEnte.Show
    FRelacionEnte.WindowState = 0
End Sub


Private Sub mnuObsConsep_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Excepciones (Observados por
'           Consep)
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'19/Mar/09  I.Bastidas          Emisión Inicial
'*********************************************************
Dim VTForm As Form

   ' Control para abrir una sola vez la forma por cada tipo de excepción
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FExcepcionId") Then
         If VTForm.VLTipoExcep = "C" Then
            VTForm.SetFocus
            Exit Sub
         End If
      End If
   Next
   
Dim FExcepFrm As Form

   Set FExcepFrm = New FExcepcionId
   FExcepFrm.VLTipoExcep = "C"
   FExcepFrm.VLPasaporte = True  ' Indica que el pasaporte si es visible
   FExcepFrm.Show
   FExcepFrm.WindowState = 0
End Sub
Private Sub mnuPasswd_Click()
    'FPasswd.Show 1
    PMCambioPassword SqlConn&, ServerName$, ServerNameLocal$, VGLogin$, VGFilial, VGOficina
End Sub
Private Sub mnupattr_Click()
    FPatrimonio.Show
End Sub
Private Sub mnuperscomp_Click()
    FVincula.Show
End Sub
Private Sub mnuPosicion_Click()
'*********************************************************
'Objetivo   LLamar a la forma FPosicion
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
   'JGO 08/Abr/09 Control de Instalación de Productos
   If VGAHOInst And VGCTEInst Then
      FPosicion.Show
      FPosicion.WindowState = 0
   Else
      MsgBox FMLoadResString(40427), vbInformation, FMLoadResString(40428)
   End If
End Sub
Private Sub mnuPosicionG_Click()
'*********************************************************
'Objetivo   LLamar a la forma FPosicion
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
   'JGO 08/Abr/09 Control de Productos Instalados
   If VGAHOInst And VGCTEInst Then
      FPosicionG.Show
      FPosicionG.WindowState = 0
   Else
      MsgBox FMLoadResString(40427), vbInformation, FMLoadResString(40428)
   End If
End Sub
Private Sub mnuPostales_Click()
'*********************************************************
'Objetivo   LLamar a la forma FBuscarCliente, una vez esco-
'           gido uno llama a la forma FApGeneral para dar
'           mantenimiento a las casillas postales del cliente
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FBuscarCliente.Show 1
    If VGBusqueda(1) <> "" Then
        FApGeneral.Tag = FMLoadResString(3234)
        FApGeneral!pnlEnte.Caption = VGBusqueda(1)
        Select Case VGBusqueda(0)
        Case "C"
            FApGeneral!pnlNombre.Caption = VGBusqueda(2)
            FApGeneral!pnlCedRuc.Caption = VGBusqueda(3)
        Case "P"
            FApGeneral!pnlNombre.Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
            If VGBusqueda(5) <> "" Then
                FApGeneral!pnlCedRuc.Caption = VGBusqueda(5)
            Else
                FApGeneral!pnlCedRuc.Caption = VGBusqueda(8)
            End If
        End Select
        FApGeneral.Show 1
    End If
End Sub
Private Sub mnuPreferencias_Click()
'*********************************************************
'Objetivo   LLamar a la forma FPreferencias
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FPreferencias.Show 1
End Sub
Private Sub mnuProdxCli_Click()
'*********************************************************
'Objetivo   LLamar a la forma FProdCliente
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FProdCliente.Show
    FProdCliente.WindowState = 0
End Sub
Private Sub mnuProdxGrupo_Click()
'*********************************************************
'Objetivo   LLamar a la forma FProdGrupo
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FProdGrupo.Show
    FProdGrupo.WindowState = 0
End Sub
Private Sub mnuPropiedades_Click()
'*********************************************************
'Objetivo   LLama a la forma FBuscarCliente, una vez escogi-
'           do un cliente llama a la forma FApGeneral para
'           dar mantenimiento a las propiedades del cliente
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FBuscarCliente.Show 1
    If VGBusqueda(1) <> "" Then
        FApGeneral.Tag = FMLoadResString(3236)
        FApGeneral!pnlEnte.Caption = VGBusqueda(1)
        Select Case VGBusqueda(0)
        Case "C"
            FApGeneral!pnlNombre.Caption = VGBusqueda(2)
            FApGeneral!pnlCedRuc.Caption = VGBusqueda(3)
        Case "P"
            FApGeneral!pnlNombre.Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
            If VGBusqueda(5) <> "" Then
                FApGeneral!pnlCedRuc.Caption = VGBusqueda(5)
            Else
                FApGeneral!pnlCedRuc.Caption = VGBusqueda(8)
            End If
        End Select
        FApGeneral.Show 1
    End If
End Sub
Private Sub mnuRefEconomicas_Click()
'*********************************************************
'Objetivo   LLama a la forma FBuscarCliente, una vez escogi-
'           do un cliente llama a la forma FApGeneral para
'           dar mantenimiento a las ref. económicas del cliente
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FBuscarCliente.Show 1
    If VGBusqueda(1) <> "" Then
        FApGeneral.Tag = FMLoadResString(4464)
        FApGeneral!pnlEnte.Caption = VGBusqueda(1)
        Select Case VGBusqueda(0)
        Case "C"
            FApGeneral!pnlNombre.Caption = VGBusqueda(2)
            FApGeneral!pnlCedRuc.Caption = VGBusqueda(3)
        Case "P"
            FApGeneral!pnlNombre.Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
            If VGBusqueda(5) <> "" Then
                FApGeneral!pnlCedRuc.Caption = VGBusqueda(5)
            Else
                FApGeneral!pnlCedRuc.Caption = VGBusqueda(8)
            End If
           
        Case "S"
            FApGeneral!pnlNombre.Caption = VGBusqueda(2)
            FApGeneral!pnlCedRuc.Caption = VGBusqueda(3)
        End Select
        FApGeneral.Show 1
    End If
End Sub
Private Sub mnuRefPersonales_Click()
'*********************************************************
'Objetivo   LLama a la forma FBuscarCliente, una vez escogi-
'           da una persona llama a la forma FApGeneral para
'           dar mantenimiento a las ref. personales del cliente
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FBuscarCliente!optCliente(1).Enabled = False
    FBuscarCliente!optCliente(0).Value = True
    FBuscarCliente.Show 1
    FBuscarCliente!optCliente(1).Enabled = True
    If VGBusqueda(1) <> "" Then
        FApGeneral.Tag = FMLoadResString(3359)
        FApGeneral!pnlEnte.Caption = VGBusqueda(1)
        FApGeneral!pnlNombre.Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
        If VGBusqueda(5) <> "" Then
            FApGeneral!pnlCedRuc.Caption = VGBusqueda(5)
        Else
            FApGeneral!pnlCedRuc.Caption = VGBusqueda(8)
        End If
        
        FApGeneral.Show 1
    End If
End Sub

Private Sub mnuRelacion_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Instancias
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'10/Mar/09  I.Bastidas          Emisión Inicial
'*********************************************************
   FBuscarCliente!optCliente(1).Enabled = True  ' Compañías
   FBuscarCliente!optCliente(0).Value = True    ' Personas
   FBuscarCliente.Show 1
   FInstancias.VLCambio% = 2
   If VGBusqueda(1) <> "" Then
      FInstancias!pnlCodEnte.Caption = VGBusqueda(1)
      Select Case VGBusqueda(0)
      Case "C" 'compañia
         FInstancias!pnlNombre.Caption = VGBusqueda(2)
         FInstancias!pnlCedRuc.Caption = VGBusqueda(3)
         FInstancias!lblClienteIzq.Caption = VGBusqueda(2)
         FInstancias!lblMensaje1.Caption = VGBusqueda(2)
      Case "P"  'persona
         FInstancias!pnlNombre.Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
         If VGBusqueda(5) <> "" Then
             FInstancias!pnlCedRuc.Caption = VGBusqueda(5)
         Else
             FInstancias!pnlCedRuc.Caption = VGBusqueda(8)
         End If
         FInstancias!lblClienteIzq.Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
         FInstancias!lblMensaje1.Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
      End Select
      FInstancias!txtClienteIzq.Text = VGBusqueda(1)
      FInstancias!txtClienteIzq.Enabled = False
      FInstancias.Show 1
   End If
End Sub

Private Sub mnuRMalasRef_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Malas Referencias
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FMalasRef.Show
    FMalasRef.WindowState = 0
End Sub
Private Sub mnuSalir_Click()
'*********************************************************
'Objetivo   Si existe una conexión abierta, cierra la conexión
'           Finaliza la aplicación
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
Dim VTMensaje$

     If SqlConn& <> 0 Then
         PMPasoValores SqlConn&, "@i_server", 0, SQLCHAR&, ServerNameLocal$
         PMPasoValores SqlConn&, "@i_login", 0, SQLCHAR&, VGLogin$
         PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "1502"
         If FMTransmitirRPC(SqlConn&, ServerName$, "master", "sp_endlogin", False, "") Then
             PMMapeaVariable SqlConn&, VTMensaje$
             PMChequea SqlConn&
             SqlClose SqlConn&
            SqlExit
            SqlWinExit
            MsgBox FMLoadResString(986) + ServerNameLocal$, 0, FMLoadResString(712)
        End If
        
    End If
    Escribir_ini ARCHIVOINI
    Set Me.VGHook = Nothing
    Dim VTForm As Form
    For Each VTForm In Forms
        Unload VTForm
    Next
    End
    
    
    End
    
End Sub

Private Sub mnuSitActual_Click()
   FConSitActual.OrigenApertura = "MIS"
   FConSitActual.Show
End Sub

Private Sub mnuSizetoFit_Click()
'*********************************************************
'Objetivo   Fija el tamaño inicial de la forma activa
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    If Screen.ActiveForm.WindowState = 0 Then 'Normal (no minimizada o maximizada)
        If Screen.ActiveForm.Caption = FPrincipal.Caption Then
            FPrincipal.Top = 15
            FPrincipal.Left = 15
            FPrincipal.Width = 9570
            FPrincipal.Height = 7170
        Else
            Screen.ActiveForm.Top = 15
            Screen.ActiveForm.Left = 15
            Screen.ActiveForm.Width = 9420
            Screen.ActiveForm.Height = 6570
        End If
    End If
End Sub
Private Sub mnuDatos_Click()
'*********************************************************
'Objetivo:  Llama a la forma FDatoxEnte
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'13/Abr/09  I.Bastidas          Personalización BNF
'*********************************************************
   FBuscarCliente!optCliente(1).Enabled = True  ' Compañías
   FBuscarCliente!optCliente(0).Value = True    ' Personas
   FBuscarCliente.Show 1
   If VGBusqueda(1) <> "" Then
        FDatoxEnte.VLEnte = VGBusqueda(1)
        FDatoxEnte.VLTente = VGBusqueda(0)  'Persona o Compania
        Select Case VGBusqueda(0)
        Case "C" 'compañia
           FDatoxEnte.VLDescr = VGBusqueda(2)
           FDatoxEnte.VLIden = VGBusqueda(3)
        Case "P"  'persona
           FDatoxEnte.VLDescr = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
           If VGBusqueda(5) <> "" Then
              FDatoxEnte.VLIden = VGBusqueda(5)
           Else
              FDatoxEnte.VLIden = VGBusqueda(8)
           End If
        End Select
        FDatoxEnte.Show 1
    End If
End Sub
Private Sub mnuSocHecho_Click()
 FBuscarCliente!optCliente(1).Enabled = False
    FBuscarCliente!optCliente(0).Value = True
    FBuscarCliente.Show 1
    FBuscarCliente!optCliente(1).Enabled = True
    If VGBusqueda(1) <> "" Then
        FApGeneral.Tag = FMLoadResString(3324)
        FApGeneral!pnlEnte.Caption = VGBusqueda(1)
        FApGeneral!pnlNombre.Caption = VGBusqueda(2) + " " + VGBusqueda(3) + " " + VGBusqueda(4)
        If VGBusqueda(5) <> "" Then
           FApGeneral!pnlCedRuc.Caption = VGBusqueda(5)
        Else
           FApGeneral!pnlCedRuc.Caption = VGBusqueda(8)
        End If
        
        FApGeneral.Show 1
    End If
End Sub
Private Sub mnuTBalances_Click()
'*********************************************************
'Objetivo:  Llama a la forma FTBalances
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'10/May/94  M.Davila            Emisión Inicial
'*********************************************************
    FTBalances.Show
    FTBalances.WindowState = 0
End Sub

Private Sub mnuTipoIdentificacion_Click()
    FTipoIdentificacion.Show
    FTipoIdentificacion.WindowState = 0
End Sub

Private Sub mnuUpCompania_Click()
'*********************************************************
'Objetivo   LLama a la forma FBuscarCliente, una vez escogi-
'           da una compañía, llama a la forma FApCompania
'           en modo de modificación
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'16/Ene/09  J.Gómez             Invocación a método para
'                               consulta datos de la compania
'*********************************************************
   Dim VTForm As Form
   ' Control para abrir una sola vez la forma
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FApCompania") Then
         Unload VTForm
         Exit For
      End If
   Next

   
   FBuscarCliente!optCliente(1).Value = True
   FBuscarCliente!optCliente(0).Enabled = False
   FBuscarCliente.Show 1
   FBuscarCliente!optCliente(0).Enabled = True
   If VGBusqueda(1) <> "" Then
      FApCompania.Tag = "U"
      If FApCompania.FLConsCompania(VGBusqueda(1)) Then
         FApCompania.Caption = FMLoadResString(3247)
         FApCompania.Show
         FApCompania.WindowState = 0
      End If
   End If
End Sub
Private Sub mnuUpGrupo_Click()
'*********************************************************
'Objetivo   LLama a la forma FBuscarGrupo, una vez escogi-
'           do un grupo, llama a la forma FApGrupo
'           en modo de modificación
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
Dim VTR%
Dim VTForm As Form
   ' Control para abrir una sola vez la forma
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FApGrupoEcon") Then
         Unload VTForm
         Exit For
      End If
   Next


ReDim VTArreglo(20) As String
    FBuscarGrupo.Show 1
    If VGBusqueda(1) <> "" Then
      If FApGrupoEcon.FLConsGrupo(VGBusqueda(1)) Then
         FApGrupoEcon.Tag = "U"
         FApGrupoEcon.Show
         FApGrupoEcon.WindowState = 0
      End If
    End If
End Sub
Private Sub mnuUpLiqui_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Malas Referencias
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'02/Abr/09  I.Bastidas          Invocación a método para
'                               consulta datos del cliente
'                               con problemas
'*********************************************************
    FBuscarLiquid.optCriterio(1).Value = True
    FBuscarLiquid.cmdEscoger.Visible = True
    FBuscarLiquid.Show 1
    If VGBusqueda(1) <> "" Then
       If FMantInfExterna.FLConsInfExterna(VGBusqueda(1), "LIQ") Then
          FMantInfExterna.Tag = "U"
          FMantInfExterna.Caption = FMLoadResString(4832)
          FMantInfExterna.Show
          FMantInfExterna.WindowState = 0
       End If
    End If
End Sub
Private Sub mnuUpMRExternas_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Malas Referencias
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
Dim VTR%

    ReDim VTArreglo(32) As String
    FBuscarCovinco.optCriterio(1).Value = True
    FBuscarCovinco.cmdEscoger.Visible = True
    FBuscarCovinco.Show 1
    If VGBusqueda(2) <> "" Then
        'Realizar el query de la persona en Covinco
         PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR&, "Q"
         PMPasoValores SqlConn&, "@i_codigo", 0, SQLINT4&, VGBusqueda(8)
        'codigo de transaccion
         PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2&, "1257"
         If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_covinco_con", True, FMLoadResString(4820)) Then
             VTR% = FMMapeaArreglo(SqlConn&, VTArreglo())
             PMChequea SqlConn&
            FMantInfExterna.Tag = "U"
            VGInformacion$ = "Covinco"
            FMantInfExterna!txtEstado.Text = VTArreglo(1)
            FMantInfExterna!txtCedula.Text = VTArreglo(2)
            FMantInfExterna!txtNombre.Text = VTArreglo(3)
            FMantInfExterna!txtCreditoV.Text = VTArreglo(4)
            FMantInfExterna!txtJudicial.Text = VTArreglo(5)
            FMantInfExterna!txtMalManejo.Text = VTArreglo(6)
            If Trim(VTArreglo(7)) <> "/  /" Then
                FMantInfExterna!txtFecha.Text = VTArreglo(7)
            End If
            FMantInfExterna!txtCodigo.Text = VTArreglo(8)
            'FMantInfExterna!lblDEstado.Caption = VTArreglo(9)
            FMantInfExterna.Caption = FMLoadResString(4832)
            FMantInfExterna.Show
            FMantInfExterna.WindowState = 0
            FMantInfExterna!txtCodigo.Enabled = False
        End If
    End If
End Sub
Private Sub mnuUpNarco_Click()
'*********************************************************
'Objetivo:  Llama a la Forma de Malas Referencias
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'02/Abr/09  I.Bastidas          Invocación a método para
'                               consulta datos del cliente
'                               observados por consep
'*********************************************************
VGMantNarco% = 1
   
   FBuscarNarco.cmdEscoger.Visible = True
   FBuscarNarco.Show 1
   If VGBusqueda(1) <> "" Then
      'FMantInfExterna.PLConsInfExterna VGBusqueda(1), "NAR"
      If FMantInfExterna.FLConsInfExterna(VGBusqueda(1), "NAR") Then
         FMantInfExterna.Tag = "U"
         FMantInfExterna.Caption = FMLoadResString(4832)
         FMantInfExterna.Show
         FMantInfExterna.WindowState = 0
      End If
   End If
End Sub
Private Sub mnuUpPersona_Click()
'*********************************************************
'Objetivo   LLama a la forma FBuscarCliente, una vez escogi-
'           da una persona, llama a la forma FApCliente
'           en modo de modificación
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'18/Ene/09  J.Gómez             Invocación a método para consultar
'                               datos de la Persona escogida
'*********************************************************
Dim VTForm As Form
   ' Control para abrir una sola vez la forma
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FApCliente") Then
         Unload VTForm
         Exit For
      End If
   Next

   If VGPermitirSalir Then          'HZA 08/NOV/2013
      FBuscarCliente!optCliente(1).Enabled = False
      FBuscarCliente!optCliente(0).Value = True
      FBuscarCliente.Show 1
      FBuscarCliente!optCliente(1).Enabled = True
      If VGBusqueda(1) <> "" Then
         If FApCliente.FLConsPersona(VGBusqueda(1)) Then
            FApCliente.Tag = "U"
            FApCliente.Show
            FApCliente.WindowState = 0
         End If
      End If
   End If
End Sub
Private Sub mnuVerificar_Click()
    FVerificar.Show
    FVerificar.WindowState = 0
End Sub
Private Sub mnuVertical_Click()
'*********************************************************
'Objetivo   Alinea las formas abiertas en forma vertical
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    FPrincipal.Arrange 2
End Sub
Private Sub pnlHora_Click()
 PMDebug SqlConn&, Not (VGDebug)
VGDebug = Not (VGDebug)
If VGDebug = 0 Then
   MsgBox FMLoadResString(4834)
Else
   MsgBox FMLoadResString(4835)
End If
End Sub

Private Sub tmrHora_Timer()
'*********************************************************
'Objetivo:  Actualiza el panel con la hora cada minuto
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  M.Davila            Emisión Inicial
'*********************************************************
    pnlHora.Caption = Format$(Now, FMLoadResString(988))
End Sub
Private Sub tmrMail_Timer()
'*********************************************************
'Objetivo:  Ejecuta el stored procedure sp_mail el cual
'           retorna si existe mail para el usuario. El
'           intervalo de poleo depende de la variable
'           global VGTimerMail%
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR               RAZON
'01/Nov/93  J.Uria              Emisión Inicial
'*********************************************************
   ' FPrincipal!tmrMail.Enabled = False
   ' FPrincipal!tmrMail.Interval = 0
   ' ReDim Mail(1) As String
    ' If SqlRPCInit%(SqlConn&, "cobis.sp_mail", 0) = False Then
   '     FPrincipal!pnlTransaccionLine.Caption = FMLoadResString(989)
   ' Else
    '     If SQLRPCSend%(SqlConn&) = False Then
   '         FPrincipal!pnlTransaccionLine.Caption = FMLoadResString(990)
   '     Else
    '         If SQLOk%(SqlConn&) = False Then
   '             FPrincipal!pnlTransaccionLine.Caption = FMLoadResString(991)
   '         Else
   '             VTContador% = 0
    '             Do While SQLResults%(SqlConn&) = 1
    '                 Do While SqlNextRow%(SqlConn&) = -1
   '                     If VTContador% = 0 Then
    '                         VGFromServer$ = LTrim$(RTrim$(SqlData$(SqlConn&, 1)))
    '                         VGServer$ = LTrim$(RTrim$(SqlData$(SqlConn&, 3)))
   '                     Else
    '                         ReDim Mail(SqlNumCols%(SqlConn&))
    '                         For i% = 1 To SqlNumCols%(SqlConn&)
    '                             Mail(i%) = LTrim$(RTrim$(SqlData$(SqlConn&, i%)))
   '                         Next i%
   '                     End If
   '                     VTContador% = VTContador% + 1
   '                 Loop
   '             Loop
   '             If Mail(1) <> "" Then
   '                 Select Case Mail(1)
   '                 Case "I"
   '                     MsgBox FMLoadResString(992) + VGServer$ + Chr$(13) + FMLoadResString(993) + VGFromServer$ + Chr$(13) + FMLoadResString(994) + Mail(2), 0, FMLoadResString(995)
   '                 Case "MA"
   '                 Case "MM"
   '                 Case "F"
   '                     Beep
   '                     Beep
   '                     Beep
   '                     Beep
   '                     MsgBox FMLoadResString(992) + VGServer$ + Chr$(13) + FMLoadResString(993) + VGFromServer$ + Chr$(13) + FMLoadResString(994) + FMLoadResString(998), 0, FMLoadResString(995)
   '                     'FMail.Show 1
   '                 Case "P"
   '                 Case "T"
   '                 Case Else
   '                     MsgBox FMLoadResString(999), 0 + 16, FMLoadResString(76)
   '                 End Select
   '                 VTFileNum% = FreeFile
   '                 Open VLLogTran$ For Append As VTFileNum%
   '                 Print #VTFileNum%, Format$(Now, "mm/dd/yy"), Time$, Mail(1) ' , Mail(2)
   '                 Close VTFileNum%
   '             End If
   '         End If
   '     End If
   ' End If
   ' ReDim Mail(1)
   ' FPrincipal.tmrMail.Enabled = True
   ' FPrincipal.tmrMail.Interval = VGTimerMail%
End Sub

Private Sub VGHook_Timeout()
   Dim VTForm As Form
   Dim ban As Boolean
On Error GoTo Manejo_errores
ban = False
   For Each VTForm In Forms
      If UCase$(VTForm.Name) = UCase$("FPrincipal") Then
         If VTForm.Enabled = False Then 'Existe algún formulario como modal
            ban = True
            Exit For
         End If
      End If
   Next
   If ban = True Then
      For Each VTForm In Forms
         If VTForm.Enabled = True And VTForm.Visible = True Then
            Unload VTForm
            Exit For
         End If
      Next
   End If
   
   If VGTipoDesconexion Then
      mnuLogoff_Click
   Else
      If Not VGBloqueo Then
         VGBloqueo = True
         PMPasoValores SqlConn&, "@t_trn", 0, SQLINT2, "15955"
         PMPasoValores SqlConn&, "@i_operacion", 0, SQLCHAR, "I"
         PMPasoValores SqlConn&, "@i_app", 0, SQLVARCHAR, App.Title
         If FMTransmitirRPC(SqlConn&, ServerName$, "cobis", "sp_log_desconexion", True, "Ok.. Registro de Desconexion") Then
            PMChequea SqlConn&
         End If
         mnuBloquear_Click
      End If
   End If
   Exit Sub
Manejo_errores:
   'DescargarFormas 1
   End
End Sub
Private Sub mnuCatalogoRC_Click()
'*********************************************************
'Objetivo:  Llama a la forma FMantenimiento
'Input   :  ninguno
'Output  :  ninguno
'*********************************************************
'                    MODIFICACIONES
'FECHA      AUTOR             RAZON
'20/Feb/2016  E.Lopez           RFC-201509-2622 Emisión Inicial
'*********************************************************
    'FMantenimiento.Show
    
End Sub

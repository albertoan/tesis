USE [DB_SISCOSE]
GO
/****** Object:  User [admin]    Script Date: 06/12/2021 22:51:06 ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [Cnfg]    Script Date: 06/12/2021 22:51:06 ******/
CREATE SCHEMA [Cnfg]
GO
/****** Object:  Schema [Core]    Script Date: 06/12/2021 22:51:06 ******/
CREATE SCHEMA [Core]
GO
/****** Object:  Table [Cnfg].[Departamento]    Script Date: 06/12/2021 22:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cnfg].[Departamento](
	[IdDepartamento] [int] NOT NULL,
	[Departamento] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cnfg].[Distrito]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cnfg].[Distrito](
	[IdDistrito] [int] NOT NULL,
	[Distrito] [varchar](50) NULL,
	[IdProvincia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cnfg].[Maestra]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cnfg].[Maestra](
	[Id] [int] NOT NULL,
	[IdTipo] [varchar](25) NULL,
	[Descripcion1] [varchar](25) NULL,
	[Descripcion2] [varchar](25) NULL,
	[Descripcion3] [varchar](25) NULL,
	[Estado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Cnfg].[Personal]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cnfg].[Personal](
	[IdCoordinador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Estado] [int] NULL,
	[IdZona] [int] NULL,
	[Asignado] [int] NULL,
	[Cargo] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCoordinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cnfg].[Provincia]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cnfg].[Provincia](
	[IdProvincia] [int] NOT NULL,
	[Provincia] [varchar](50) NULL,
	[IdDepartamento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cnfg].[Zonas]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cnfg].[Zonas](
	[IdZona] [int] NOT NULL,
	[Zona] [varchar](25) NULL,
	[IdDepartament] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Cronograma]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Cronograma](
	[IdCronograma] [int] IDENTITY(1,1) NOT NULL,
	[Idproyecto] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Nombre] [varchar](max) NULL,
	[FechaInicio] [varchar](10) NULL,
	[FechaFin] [varchar](10) NULL,
	[Seguimiento] [int] NULL,
	[Estado] [int] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_Cronograma] PRIMARY KEY CLUSTERED 
(
	[IdCronograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Core].[InsumosProyecto]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[InsumosProyecto](
	[IdInsumoObra] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NULL,
	[MaderaTipoA] [int] NULL,
	[MaderaTipoB] [int] NULL,
	[Concreto] [int] NULL,
	[Aluminio] [int] NULL,
	[PIN3] [int] NULL,
	[PIN4] [int] NULL,
	[Suspencion] [int] NULL,
	[PAT1] [int] NULL,
	[PAT2] [int] NULL,
	[Pernos] [int] NULL,
	[Abrazaderas] [int] NULL,
	[Aisladores] [int] NULL,
	[Monofasicos] [int] NULL,
	[Bifasicos] [int] NULL,
	[Trifasicos] [int] NULL,
	[Transformadores] [int] NULL,
	[Interruptores] [int] NULL,
	[Contactores] [int] NULL,
	[Medidores] [int] NULL,
	[Fusibles] [int] NULL,
	[Pararrayos] [int] NULL,
	[Lotes] [int] NULL,
	[MaderaSecundarioTipoA] [int] NULL,
	[ConcretoSecundarioTipoA] [int] NULL,
	[ConcretoSecundarioTipoB] [int] NULL,
	[AluminioSecundario] [int] NULL,
	[Alumbrado] [int] NULL,
	[Retenidas] [int] NULL,
	[PuestaTierra] [int] NULL,
	[GrapaSuspencion] [int] NULL,
	[GrapaAnclaje] [int] NULL,
	[PernosSecundarios] [int] NULL,
	[Conexiones] [int] NULL,
	[PanelesSolares] [int] NULL,
	[Celdas] [int] NULL,
	[Inversor] [int] NULL,
	[Soporte] [int] NULL,
	[Estructura] [int] NULL,
	[Cableado] [int] NULL,
	[TipoRegistro] [int] NULL,
	[TipoObra] [int] NULL,
 CONSTRAINT [PK_InsumosProyecto] PRIMARY KEY CLUSTERED 
(
	[IdInsumoObra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Perfiles]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Perfiles](
	[IdOption] [int] NULL,
	[OptionName] [varchar](25) NULL,
	[OptionUrl] [varchar](25) NULL,
	[OptionIcon] [varchar](25) NULL,
	[Descripcion] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Programacion]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Programacion](
	[IdProgramacion] [int] IDENTITY(1,1) NOT NULL,
	[IdProyecto] [int] NULL,
	[IdCoordinador] [int] NULL,
	[FechaRegistro] [datetime] NULL,
	[Estado] [int] NULL,
	[FechaInicio] [varchar](10) NULL,
	[FechaFin] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProgramacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Proyectos]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Proyectos](
	[IdProyecto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](25) NULL,
	[Nombre] [varchar](max) NULL,
	[Transferencia] [varchar](5) NULL,
	[IdTipoInversion] [int] NULL,
	[IdCicloInversion] [int] NULL,
	[IdNaturaleza] [int] NULL,
	[IdDepartamento] [int] NULL,
	[IdProvincia] [int] NULL,
	[IdDistrito] [int] NULL,
	[Programa] [varchar](10) NULL,
	[IdModalidad] [int] NULL,
	[Costo] [varchar](max) NULL,
	[Estado] [int] NULL,
	[IdZona] [int] NULL,
	[Asignado] [int] NULL,
	[IdTipoProyecto] [int] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_Proyectos] PRIMARY KEY CLUSTERED 
(
	[IdProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Core].[Usuario]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[correo] [nvarchar](50) NULL,
	[estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (1, N'AMAZONAS')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (2, N'ANCASH')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (3, N'APURIMAC')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (4, N'AREQUIPA')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (5, N'AYACUCHO')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (6, N'CAJAMARCA')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (7, N'CALLAO')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (8, N'CUSCO')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (9, N'HUANCAVELICA')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (10, N'HUANUCO')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (11, N'ICA')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (12, N'JUNIN')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (13, N'LA LIBERTAD')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (14, N'LAMBAYEQUE')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (15, N'LIMA')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (16, N'LORETO')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (17, N'MADRE DE DIOS')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (18, N'MOQUEGUA')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (19, N'PASCO')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (20, N'PIURA')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (21, N'PUNO')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (22, N'SAN MARTIN')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (23, N'TACNA')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (24, N'TUMBES')
GO
INSERT [Cnfg].[Departamento] ([IdDepartamento], [Departamento]) VALUES (25, N'UCAYALI')
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1, N'CHACHAPOYAS', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (2, N'ASUNCION', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (3, N'BALSAS', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (4, N'CHETO', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (5, N'CHILIQUIN', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (6, N'CHUQUIBAMBA', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (7, N'GRANADA', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (8, N'HUANCAS', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (9, N'LA JALCA', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (10, N'LEIMEBAMBA', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (11, N'LEVANTO', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (12, N'MAGDALENA', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (13, N'MARISCAL CASTILLA', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (14, N'MOLINOPAMPA', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (15, N'MONTEVIDEO', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (16, N'OLLEROS', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (17, N'QUINJALCA', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (18, N'SAN FRANCISCO DE DAGUAS', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (19, N'SAN ISIDRO DE MAINO', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (20, N'SOLOCO', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (21, N'SONCHE', 1)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (22, N'LA PECA', 2)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (23, N'ARAMANGO', 2)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (24, N'COPALLIN', 2)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (25, N'EL PARCO', 2)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (26, N'IMAZA', 2)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (27, N'JUMBILLA', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (28, N'CHISQUILLA', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (29, N'CHURUJA', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (30, N'COROSHA', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (31, N'CUISPES', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (32, N'FLORIDA', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (33, N'JAZAN', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (34, N'RECTA', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (35, N'SAN CARLOS', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (36, N'SHIPASBAMBA', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (37, N'VALERA', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (38, N'YAMBRASBAMBA', 3)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (39, N'NIEVA', 4)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (40, N'EL CENEPA', 4)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (41, N'RIO SANTIAGO', 4)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (42, N'LAMUD', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (43, N'CAMPORREDONDO', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (44, N'COCABAMBA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (45, N'COLCAMAR', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (46, N'CONILA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (47, N'INGUILPATA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (48, N'LONGUITA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (49, N'LONYA CHICO', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (50, N'LUYA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (51, N'LUYA VIEJO', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (52, N'MARIA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (53, N'OCALLI', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (54, N'OCUMAL', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (55, N'PISUQUIA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (56, N'PROVIDENCIA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (57, N'SAN CRISTOBAL', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (58, N'SAN FRANCISCO DEL YESO', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (59, N'SAN JERONIMO', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (60, N'SAN JUAN DE LOPECANCHA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (61, N'SANTA CATALINA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (62, N'SANTO TOMAS', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (63, N'TINGO', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (64, N'TRITA', 5)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (65, N'SAN NICOLAS', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (66, N'CHIRIMOTO', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (67, N'COCHAMAL', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (68, N'HUAMBO', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (69, N'LIMABAMBA', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (70, N'LONGAR', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (71, N'MARISCAL BENAVIDES', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (72, N'MILPUC', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (73, N'OMIA', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (74, N'SANTA ROSA', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (75, N'TOTORA', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (76, N'VISTA ALEGRE', 6)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (77, N'BAGUA GRANDE', 7)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (78, N'CAJARURO', 7)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (79, N'CUMBA', 7)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (80, N'EL MILAGRO', 7)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (81, N'JAMALCA', 7)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (82, N'LONYA GRANDE', 7)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (83, N'YAMON', 7)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (84, N'HUARAZ', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (85, N'COCHABAMBA', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (86, N'COLCABAMBA', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (87, N'HUANCHAY', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (88, N'INDEPENDENCIA', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (89, N'JANGAS', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (90, N'LA LIBERTAD', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (91, N'OLLEROS', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (92, N'PAMPAS', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (93, N'PARIACOTO', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (94, N'PIRA', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (95, N'TARICA', 8)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (96, N'AIJA', 9)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (97, N'CORIS', 9)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (98, N'HUACLLAN', 9)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (99, N'LA MERCED', 9)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (100, N'SUCCHA', 9)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (101, N'LLAMELLIN', 10)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (102, N'ACZO', 10)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (103, N'CHACCHO', 10)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (104, N'CHINGAS', 10)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (105, N'MIRGAS', 10)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (106, N'SAN JUAN DE RONTOY', 10)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (107, N'CHACAS', 11)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (108, N'ACOCHACA', 11)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (109, N'CHIQUIAN', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (110, N'ABELARDO PARDO LEZAMETA', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (111, N'ANTONIO RAYMONDI', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (112, N'AQUIA', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (113, N'CAJACAY', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (114, N'CANIS', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (115, N'COLQUIOC', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (116, N'HUALLANCA', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (117, N'HUASTA', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (118, N'HUAYLLACAYAN', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (119, N'LA PRIMAVERA', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (120, N'MANGAS', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (121, N'PACLLON', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (122, N'SAN MIGUEL DE CORPANQUI', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (123, N'TICLLOS', 12)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (124, N'CARHUAZ', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (125, N'ACOPAMPA', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (126, N'AMASHCA', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (127, N'ANTA', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (128, N'ATAQUERO', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (129, N'MARCARA', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (130, N'PARIAHUANCA', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (131, N'SAN MIGUEL DE ACO', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (132, N'SHILLA', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (133, N'TINCO', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (134, N'YUNGAR', 13)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (135, N'SAN LUIS', 14)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (136, N'SAN NICOLAS', 14)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (137, N'YAUYA', 14)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (138, N'CASMA', 15)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (139, N'BUENA VISTA ALTA', 15)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (140, N'COMANDANTE NOEL', 15)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (141, N'YAUTAN', 15)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (142, N'CORONGO', 16)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (143, N'ACO', 16)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (144, N'BAMBAS', 16)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (145, N'CUSCA', 16)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (146, N'LA PAMPA', 16)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (147, N'YANAC', 16)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (148, N'YUPAN', 16)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (149, N'HUARI', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (150, N'ANRA', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (151, N'CAJAY', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (152, N'CHAVIN DE HUANTAR', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (153, N'HUACACHI', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (154, N'HUACCHIS', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (155, N'HUACHIS', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (156, N'HUANTAR', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (157, N'MASIN', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (158, N'PAUCAS', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (159, N'PONTO', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (160, N'RAHUAPAMPA', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (161, N'RAPAYAN', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (162, N'SAN MARCOS', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (163, N'SAN PEDRO DE CHANA', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (164, N'UCO', 17)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (165, N'HUARMEY', 18)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (166, N'COCHAPETI', 18)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (167, N'CULEBRAS', 18)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (168, N'HUAYAN', 18)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (169, N'MALVAS', 18)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (170, N'CARAZ', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (171, N'HUALLANCA', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (172, N'HUATA', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (173, N'HUAYLAS', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (174, N'MATO', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (175, N'PAMPAROMAS', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (176, N'PUEBLO LIBRE', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (177, N'SANTA CRUZ', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (178, N'SANTO TORIBIO', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (179, N'YURACMARCA', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (180, N'PISCOBAMBA', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (181, N'CASCA', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (182, N'ELEAZAR GUZMAN BARRON', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (183, N'FIDEL OLIVAS ESCUDERO', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (184, N'LLAMA', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (185, N'LLUMPA', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (186, N'LUCMA', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (187, N'MUSGA', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (188, N'OCROS', 21)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (189, N'ACAS', 21)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (190, N'CAJAMARQUILLA', 21)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (191, N'CARHUAPAMPA', 21)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (192, N'COCHAS', 21)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (193, N'CONGAS', 21)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (194, N'LLIPA', 21)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (195, N'SAN CRISTOBAL DE RAJAN', 21)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (196, N'SAN PEDRO', 21)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (197, N'SANTIAGO DE CHILCAS', 21)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (198, N'CABANA', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (199, N'BOLOGNESI', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (200, N'CONCHUCOS', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (201, N'HUACASCHUQUE', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (202, N'HUANDOVAL', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (203, N'LACABAMBA', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (204, N'LLAPO', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (205, N'PALLASCA', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (206, N'PAMPAS', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (207, N'SANTA ROSA', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (208, N'TAUCA', 22)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (209, N'POMABAMBA', 23)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (210, N'HUAYLLAN', 23)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (211, N'PAROBAMBA', 23)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (212, N'QUINUABAMBA', 23)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (213, N'RECUAY', 24)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (214, N'CATAC', 24)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (215, N'COTAPARACO', 24)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (216, N'HUAYLLAPAMPA', 24)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (217, N'LLACLLIN', 24)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (218, N'MARCA', 24)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (219, N'PAMPAS CHICO', 24)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (220, N'PARARIN', 24)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (221, N'TAPACOCHA', 24)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (222, N'TICAPAMPA', 24)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (223, N'CHIMBOTE', 25)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (224, N'CACERES DEL PERU', 25)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (225, N'COISHCO', 25)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (226, N'MACATE', 25)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (227, N'MORO', 25)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (228, N'NEPE&Ntilde;A', 25)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (229, N'SAMANCO', 25)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (230, N'SANTA', 25)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (231, N'NUEVO CHIMBOTE', 25)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (232, N'SIHUAS', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (233, N'ACOBAMBA', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (234, N'ALFONSO UGARTE', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (235, N'CASHAPAMPA', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (236, N'CHINGALPO', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (237, N'HUAYLLABAMBA', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (238, N'QUICHES', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (239, N'RAGASH', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (240, N'SAN JUAN', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (241, N'SICSIBAMBA', 26)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (242, N'YUNGAY', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (243, N'CASCAPARA', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (244, N'MANCOS', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (245, N'MATACOTO', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (246, N'QUILLO', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (247, N'RANRAHIRCA', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (248, N'SHUPLUY', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (249, N'YANAMA', 27)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (250, N'ABANCAY', 28)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (251, N'CHACOCHE', 28)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (252, N'CIRCA', 28)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (253, N'CURAHUASI', 28)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (254, N'HUANIPACA', 28)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (255, N'LAMBRAMA', 28)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (256, N'PICHIRHUA', 28)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (257, N'SAN PEDRO DE CACHORA', 28)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (258, N'TAMBURCO', 28)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (259, N'ANDAHUAYLAS', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (260, N'ANDARAPA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (261, N'CHIARA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (262, N'HUANCARAMA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (263, N'HUANCARAY', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (264, N'HUAYANA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (265, N'KISHUARA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (266, N'PACOBAMBA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (267, N'PACUCHA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (268, N'PAMPACHIRI', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (269, N'POMACOCHA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (270, N'SAN ANTONIO DE CACHI', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (271, N'SAN JERONIMO', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (272, N'SAN MIGUEL DE CHACCRAMPA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (273, N'SANTA MARIA DE CHICMO', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (274, N'TALAVERA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (275, N'TUMAY HUARACA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (276, N'TURPO', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (277, N'KAQUIABAMBA', 29)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (278, N'ANTABAMBA', 30)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (279, N'EL ORO', 30)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (280, N'HUAQUIRCA', 30)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (281, N'JUAN ESPINOZA MEDRANO', 30)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (282, N'OROPESA', 30)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (283, N'PACHACONAS', 30)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (284, N'SABAINO', 30)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (285, N'CHALHUANCA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (286, N'CAPAYA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (287, N'CARAYBAMBA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (288, N'CHAPIMARCA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (289, N'COLCABAMBA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (290, N'COTARUSE', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (291, N'HUAYLLO', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (292, N'JUSTO APU SAHUARAURA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (293, N'LUCRE', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (294, N'POCOHUANCA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (295, N'SAN JUAN DE CHAC&Ntilde;A', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (296, N'SA&Ntilde;AYCA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (297, N'SORAYA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (298, N'TAPAIRIHUA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (299, N'TINTAY', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (300, N'TORAYA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (301, N'YANACA', 31)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (302, N'TAMBOBAMBA', 32)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (303, N'COTABAMBAS', 32)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (304, N'COYLLURQUI', 32)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (305, N'HAQUIRA', 32)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (306, N'MARA', 32)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (307, N'CHALLHUAHUACHO', 32)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (308, N'CHINCHEROS', 33)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (309, N'ANCO-HUALLO', 33)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (310, N'COCHARCAS', 33)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (311, N'HUACCANA', 33)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (312, N'OCOBAMBA', 33)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (313, N'ONGOY', 33)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (314, N'URANMARCA', 33)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (315, N'RANRACANCHA', 33)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (316, N'CHUQUIBAMBILLA', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (317, N'CURPAHUASI', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (318, N'GAMARRA', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (319, N'HUAYLLATI', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (320, N'MAMARA', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (321, N'MICAELA BASTIDAS', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (322, N'PATAYPAMPA', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (323, N'PROGRESO', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (324, N'SAN ANTONIO', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (325, N'SANTA ROSA', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (326, N'TURPAY', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (327, N'VILCABAMBA', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (328, N'VIRUNDO', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (329, N'CURASCO', 34)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (330, N'AREQUIPA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (331, N'ALTO SELVA ALEGRE', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (332, N'CAYMA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (333, N'CERRO COLORADO', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (334, N'CHARACATO', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (335, N'CHIGUATA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (336, N'JACOBO HUNTER', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (337, N'LA JOYA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (338, N'MARIANO MELGAR', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (339, N'MIRAFLORES', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (340, N'MOLLEBAYA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (341, N'PAUCARPATA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (342, N'POCSI', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (343, N'POLOBAYA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (344, N'QUEQUE&Ntilde;A', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (345, N'SABANDIA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (346, N'SACHACA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (347, N'SAN JUAN DE SIGUAS', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (348, N'SAN JUAN DE TARUCANI', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (349, N'SANTA ISABEL DE SIGUAS', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (350, N'SANTA RITA DE SIGUAS', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (351, N'SOCABAYA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (352, N'TIABAYA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (353, N'UCHUMAYO', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (354, N'VITOR', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (355, N'YANAHUARA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (356, N'YARABAMBA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (357, N'YURA', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (358, N'JOSE LUIS BUSTAMANTE Y RIVERO', 35)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (359, N'CAMANA', 36)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (360, N'JOSE MARIA QUIMPER', 36)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (361, N'MARIANO NICOLAS VALCARCEL', 36)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (362, N'MARISCAL CACERES', 36)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (363, N'NICOLAS DE PIEROLA', 36)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (364, N'OCO&Ntilde;A', 36)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (365, N'QUILCA', 36)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (366, N'SAMUEL PASTOR', 36)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (367, N'CARAVELI', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (368, N'ACARI', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (369, N'ATICO', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (370, N'ATIQUIPA', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (371, N'BELLA UNION', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (372, N'CAHUACHO', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (373, N'CHALA', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (374, N'CHAPARRA', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (375, N'HUANUHUANU', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (376, N'JAQUI', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (377, N'LOMAS', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (378, N'QUICACHA', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (379, N'YAUCA', 37)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (380, N'APLAO', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (381, N'ANDAGUA', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (382, N'AYO', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (383, N'CHACHAS', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (384, N'CHILCAYMARCA', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (385, N'CHOCO', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (386, N'HUANCARQUI', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (387, N'MACHAGUAY', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (388, N'ORCOPAMPA', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (389, N'PAMPACOLCA', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (390, N'TIPAN', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (391, N'U&Ntilde;ON', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (392, N'URACA', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (393, N'VIRACO', 38)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (394, N'CHIVAY', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (395, N'ACHOMA', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (396, N'CABANACONDE', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (397, N'CALLALLI', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (398, N'CAYLLOMA', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (399, N'COPORAQUE', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (400, N'HUAMBO', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (401, N'HUANCA', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (402, N'ICHUPAMPA', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (403, N'LARI', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (404, N'LLUTA', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (405, N'MACA', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (406, N'MADRIGAL', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (407, N'SAN ANTONIO DE CHUCA', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (408, N'SIBAYO', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (409, N'TAPAY', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (410, N'TISCO', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (411, N'TUTI', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (412, N'YANQUE', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (413, N'MAJES', 39)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (414, N'CHUQUIBAMBA', 40)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (415, N'ANDARAY', 40)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (416, N'CAYARANI', 40)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (417, N'CHICHAS', 40)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (418, N'IRAY', 40)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (419, N'RIO GRANDE', 40)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (420, N'SALAMANCA', 40)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (421, N'YANAQUIHUA', 40)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (422, N'MOLLENDO', 41)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (423, N'COCACHACRA', 41)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (424, N'DEAN VALDIVIA', 41)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (425, N'ISLAY', 41)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (426, N'MEJIA', 41)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (427, N'PUNTA DE BOMBON', 41)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (428, N'COTAHUASI', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (429, N'ALCA', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (430, N'CHARCANA', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (431, N'HUAYNACOTAS', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (432, N'PAMPAMARCA', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (433, N'PUYCA', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (434, N'QUECHUALLA', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (435, N'SAYLA', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (436, N'TAURIA', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (437, N'TOMEPAMPA', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (438, N'TORO', 42)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (439, N'AYACUCHO', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (440, N'ACOCRO', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (441, N'ACOS VINCHOS', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (442, N'CARMEN ALTO', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (443, N'CHIARA', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (444, N'OCROS', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (445, N'PACAYCASA', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (446, N'QUINUA', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (447, N'SAN JOSE DE TICLLAS', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (448, N'SAN JUAN BAUTISTA', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (449, N'SANTIAGO DE PISCHA', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (450, N'SOCOS', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (451, N'TAMBILLO', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (452, N'VINCHOS', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (453, N'JESUS NAZARENO', 43)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (454, N'CANGALLO', 44)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (455, N'CHUSCHI', 44)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (456, N'LOS MOROCHUCOS', 44)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (457, N'MARIA PARADO DE BELLIDO', 44)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (458, N'PARAS', 44)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (459, N'TOTOS', 44)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (460, N'SANCOS', 45)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (461, N'CARAPO', 45)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (462, N'SACSAMARCA', 45)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (463, N'SANTIAGO DE LUCANAMARCA', 45)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (464, N'HUANTA', 46)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (465, N'AYAHUANCO', 46)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (466, N'HUAMANGUILLA', 46)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (467, N'IGUAIN', 46)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (468, N'LURICOCHA', 46)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (469, N'SANTILLANA', 46)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (470, N'SIVIA', 46)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (471, N'LLOCHEGUA', 46)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (472, N'SAN MIGUEL', 47)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (473, N'ANCO', 47)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (474, N'AYNA', 47)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (475, N'CHILCAS', 47)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (476, N'CHUNGUI', 47)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (477, N'LUIS CARRANZA', 47)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (478, N'SANTA ROSA', 47)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (479, N'TAMBO', 47)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (480, N'PUQUIO', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (481, N'AUCARA', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (482, N'CABANA', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (483, N'CARMEN SALCEDO', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (484, N'CHAVI&Ntilde;A', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (485, N'CHIPAO', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (486, N'HUAC-HUAS', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (487, N'LARAMATE', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (488, N'LEONCIO PRADO', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (489, N'LLAUTA', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (490, N'LUCANAS', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (491, N'OCA&Ntilde;A', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (492, N'OTOCA', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (493, N'SAISA', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (494, N'SAN CRISTOBAL', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (495, N'SAN JUAN', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (496, N'SAN PEDRO', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (497, N'SAN PEDRO DE PALCO', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (498, N'SANCOS', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (499, N'SANTA ANA DE HUAYCAHUACHO', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (500, N'SANTA LUCIA', 48)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (501, N'CORACORA', 49)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (502, N'CHUMPI', 49)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (503, N'CORONEL CASTA&Ntilde;EDA', 49)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (504, N'PACAPAUSA', 49)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (505, N'PULLO', 49)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (506, N'PUYUSCA', 49)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (507, N'SAN FRANCISCO DE RAVACAYCO', 49)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (508, N'UPAHUACHO', 49)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (509, N'PAUSA', 50)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (510, N'COLTA', 50)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (511, N'CORCULLA', 50)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (512, N'LAMPA', 50)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (513, N'MARCABAMBA', 50)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (514, N'OYOLO', 50)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (515, N'PARARCA', 50)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (516, N'SAN JAVIER DE ALPABAMBA', 50)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (517, N'SAN JOSE DE USHUA', 50)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (518, N'SARA SARA', 50)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (519, N'QUEROBAMBA', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (520, N'BELEN', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (521, N'CHALCOS', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (522, N'CHILCAYOC', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (523, N'HUACA&Ntilde;A', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (524, N'MORCOLLA', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (525, N'PAICO', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (526, N'SAN PEDRO DE LARCAY', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (527, N'SAN SALVADOR DE QUIJE', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (528, N'SANTIAGO DE PAUCARAY', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (529, N'SORAS', 51)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (530, N'HUANCAPI', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (531, N'ALCAMENCA', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (532, N'APONGO', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (533, N'ASQUIPATA', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (534, N'CANARIA', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (535, N'CAYARA', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (536, N'COLCA', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (537, N'HUAMANQUIQUIA', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (538, N'HUANCARAYLLA', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (539, N'HUAYA', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (540, N'SARHUA', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (541, N'VILCANCHOS', 52)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (542, N'VILCAS HUAMAN', 53)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (543, N'ACCOMARCA', 53)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (544, N'CARHUANCA', 53)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (545, N'CONCEPCION', 53)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (546, N'HUAMBALPA', 53)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (547, N'INDEPENDENCIA', 53)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (548, N'SAURAMA', 53)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (549, N'VISCHONGO', 53)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (550, N'CAJAMARCA', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (551, N'CAJAMARCA', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (552, N'ASUNCION', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (553, N'CHETILLA', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (554, N'COSPAN', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (555, N'ENCA&Ntilde;ADA', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (556, N'JESUS', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (557, N'LLACANORA', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (558, N'LOS BA&Ntilde;OS DEL INCA', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (559, N'MAGDALENA', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (560, N'MATARA', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (561, N'NAMORA', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (562, N'SAN JUAN', 54)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (563, N'CAJABAMBA', 55)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (564, N'CACHACHI', 55)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (565, N'CONDEBAMBA', 55)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (566, N'SITACOCHA', 55)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (567, N'CELENDIN', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (568, N'CHUMUCH', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (569, N'CORTEGANA', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (570, N'HUASMIN', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (571, N'JORGE CHAVEZ', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (572, N'JOSE GALVEZ', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (573, N'MIGUEL IGLESIAS', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (574, N'OXAMARCA', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (575, N'SOROCHUCO', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (576, N'SUCRE', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (577, N'UTCO', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (578, N'LA LIBERTAD DE PALLAN', 56)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (579, N'CHOTA', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (580, N'ANGUIA', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (581, N'CHADIN', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (582, N'CHIGUIRIP', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (583, N'CHIMBAN', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (584, N'CHOROPAMPA', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (585, N'COCHABAMBA', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (586, N'CONCHAN', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (587, N'HUAMBOS', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (588, N'LAJAS', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (589, N'LLAMA', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (590, N'MIRACOSTA', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (591, N'PACCHA', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (592, N'PION', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (593, N'QUEROCOTO', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (594, N'SAN JUAN DE LICUPIS', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (595, N'TACABAMBA', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (596, N'TOCMOCHE', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (597, N'CHALAMARCA', 57)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (598, N'CONTUMAZA', 58)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (599, N'CHILETE', 58)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (600, N'CUPISNIQUE', 58)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (601, N'GUZMANGO', 58)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (602, N'SAN BENITO', 58)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (603, N'SANTA CRUZ DE TOLED', 58)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (604, N'TANTARICA', 58)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (605, N'YONAN', 58)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (606, N'CUTERVO', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (607, N'CALLAYUC', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (608, N'CHOROS', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (609, N'CUJILLO', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (610, N'LA RAMADA', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (611, N'PIMPINGOS', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (612, N'QUEROCOTILLO', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (613, N'SAN ANDRES DE CUTERVO', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (614, N'SAN JUAN DE CUTERVO', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (615, N'SAN LUIS DE LUCMA', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (616, N'SANTA CRUZ', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (617, N'SANTO DOMINGO DE LA CAPILLA', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (618, N'SANTO TOMAS', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (619, N'SOCOTA', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (620, N'TORIBIO CASANOVA', 59)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (621, N'BAMBAMARCA', 60)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (622, N'CHUGUR', 60)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (623, N'HUALGAYOC', 60)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (624, N'JAEN', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (625, N'BELLAVISTA', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (626, N'CHONTALI', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (627, N'COLASAY', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (628, N'HUABAL', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (629, N'LAS PIRIAS', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (630, N'POMAHUACA', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (631, N'PUCARA', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (632, N'SALLIQUE', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (633, N'SAN FELIPE', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (634, N'SAN JOSE DEL ALTO', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (635, N'SANTA ROSA', 61)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (636, N'SAN IGNACIO', 62)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (637, N'CHIRINOS', 62)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (638, N'HUARANGO', 62)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (639, N'LA COIPA', 62)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (640, N'NAMBALLE', 62)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (641, N'SAN JOSE DE LOURDES', 62)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (642, N'TABACONAS', 62)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (643, N'PEDRO GALVEZ', 63)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (644, N'CHANCAY', 63)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (645, N'EDUARDO VILLANUEVA', 63)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (646, N'GREGORIO PITA', 63)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (647, N'ICHOCAN', 63)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (648, N'JOSE MANUEL QUIROZ', 63)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (649, N'JOSE SABOGAL', 63)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (650, N'SAN MIGUEL', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (651, N'SAN MIGUEL', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (652, N'BOLIVAR', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (653, N'CALQUIS', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (654, N'CATILLUC', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (655, N'EL PRADO', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (656, N'LA FLORIDA', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (657, N'LLAPA', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (658, N'NANCHOC', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (659, N'NIEPOS', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (660, N'SAN GREGORIO', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (661, N'SAN SILVESTRE DE COCHAN', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (662, N'TONGOD', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (663, N'UNION AGUA BLANCA', 64)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (664, N'SAN PABLO', 65)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (665, N'SAN BERNARDINO', 65)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (666, N'SAN LUIS', 65)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (667, N'TUMBADEN', 65)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (668, N'SANTA CRUZ', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (669, N'ANDABAMBA', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (670, N'CATACHE', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (671, N'CHANCAYBA&Ntilde;OS', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (672, N'LA ESPERANZA', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (673, N'NINABAMBA', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (674, N'PULAN', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (675, N'SAUCEPAMPA', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (676, N'SEXI', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (677, N'UTICYACU', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (678, N'YAUYUCAN', 66)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (679, N'CALLAO', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (680, N'BELLAVISTA', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (681, N'CARMEN DE LA LEGUA REYNOSO', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (682, N'LA PERLA', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (683, N'LA PUNTA', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (684, N'VENTANILLA', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (685, N'CUSCO', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (686, N'CCORCA', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (687, N'POROY', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (688, N'SAN JERONIMO', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (689, N'SAN SEBASTIAN', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (690, N'SANTIAGO', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (691, N'SAYLLA', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (692, N'WANCHAQ', 67)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (693, N'ACOMAYO', 68)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (694, N'ACOPIA', 68)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (695, N'ACOS', 68)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (696, N'MOSOC LLACTA', 68)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (697, N'POMACANCHI', 68)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (698, N'RONDOCAN', 68)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (699, N'SANGARARA', 68)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (700, N'ANTA', 69)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (701, N'ANCAHUASI', 69)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (702, N'CACHIMAYO', 69)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (703, N'CHINCHAYPUJIO', 69)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (704, N'HUAROCONDO', 69)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (705, N'LIMATAMBO', 69)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (706, N'MOLLEPATA', 69)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (707, N'PUCYURA', 69)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (708, N'ZURITE', 69)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (709, N'CALCA', 70)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (710, N'COYA', 70)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (711, N'LAMAY', 70)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (712, N'LARES', 70)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (713, N'PISAC', 70)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (714, N'SAN SALVADOR', 70)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (715, N'TARAY', 70)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (716, N'YANATILE', 70)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (717, N'YANAOCA', 71)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (718, N'CHECCA', 71)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (719, N'KUNTURKANKI', 71)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (720, N'LANGUI', 71)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (721, N'LAYO', 71)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (722, N'PAMPAMARCA', 71)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (723, N'QUEHUE', 71)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (724, N'TUPAC AMARU', 71)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (725, N'SICUANI', 72)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (726, N'CHECACUPE', 72)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (727, N'COMBAPATA', 72)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (728, N'MARANGANI', 72)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (729, N'PITUMARCA', 72)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (730, N'SAN PABLO', 72)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (731, N'SAN PEDRO', 72)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (732, N'TINTA', 72)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (733, N'SANTO TOMAS', 73)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (734, N'CAPACMARCA', 73)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (735, N'CHAMACA', 73)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (736, N'COLQUEMARCA', 73)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (737, N'LIVITACA', 73)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (738, N'LLUSCO', 73)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (739, N'QUI&Ntilde;OTA', 73)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (740, N'VELILLE', 73)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (741, N'ESPINAR', 74)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (742, N'CONDOROMA', 74)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (743, N'COPORAQUE', 74)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (744, N'OCORURO', 74)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (745, N'PALLPATA', 74)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (746, N'PICHIGUA', 74)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (747, N'SUYCKUTAMBO', 74)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (748, N'ALTO PICHIGUA', 74)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (749, N'SANTA ANA', 75)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (750, N'ECHARATE', 75)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (751, N'HUAYOPATA', 75)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (752, N'MARANURA', 75)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (753, N'OCOBAMBA', 75)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (754, N'QUELLOUNO', 75)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (755, N'KIMBIRI', 75)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (756, N'SANTA TERESA', 75)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (757, N'VILCABAMBA', 75)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (758, N'PICHARI', 75)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (759, N'PARURO', 76)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (760, N'ACCHA', 76)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (761, N'CCAPI', 76)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (762, N'COLCHA', 76)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (763, N'HUANOQUITE', 76)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (764, N'OMACHA', 76)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (765, N'PACCARITAMBO', 76)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (766, N'PILLPINTO', 76)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (767, N'YAURISQUE', 76)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (768, N'PAUCARTAMBO', 77)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (769, N'CAICAY', 77)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (770, N'CHALLABAMBA', 77)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (771, N'COLQUEPATA', 77)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (772, N'HUANCARANI', 77)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (773, N'KOS&Ntilde;IPATA', 77)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (774, N'URCOS', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (775, N'ANDAHUAYLILLAS', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (776, N'CAMANTI', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (777, N'CCARHUAYO', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (778, N'CCATCA', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (779, N'CUSIPATA', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (780, N'HUARO', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (781, N'LUCRE', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (782, N'MARCAPATA', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (783, N'OCONGATE', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (784, N'OROPESA', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (785, N'QUIQUIJANA', 78)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (786, N'URUBAMBA', 79)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (787, N'CHINCHERO', 79)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (788, N'HUAYLLABAMBA', 79)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (789, N'MACHUPICCHU', 79)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (790, N'MARAS', 79)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (791, N'OLLANTAYTAMBO', 79)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (792, N'YUCAY', 79)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (793, N'HUANCAVELICA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (794, N'ACOBAMBILLA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (795, N'ACORIA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (796, N'CONAYCA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (797, N'CUENCA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (798, N'HUACHOCOLPA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (799, N'HUAYLLAHUARA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (800, N'IZCUCHACA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (801, N'LARIA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (802, N'MANTA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (803, N'MARISCAL CACERES', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (804, N'MOYA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (805, N'NUEVO OCCORO', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (806, N'PALCA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (807, N'PILCHACA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (808, N'VILCA', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (809, N'YAULI', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (810, N'ASCENSION', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (811, N'HUANDO', 80)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (812, N'ACOBAMBA', 81)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (813, N'ANDABAMBA', 81)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (814, N'ANTA', 81)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (815, N'CAJA', 81)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (816, N'MARCAS', 81)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (817, N'PAUCARA', 81)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (818, N'POMACOCHA', 81)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (819, N'ROSARIO', 81)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (820, N'LIRCAY', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (821, N'ANCHONGA', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (822, N'CALLANMARCA', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (823, N'CCOCHACCASA', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (824, N'CHINCHO', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (825, N'CONGALLA', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (826, N'HUANCA-HUANCA', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (827, N'HUAYLLAY GRANDE', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (828, N'JULCAMARCA', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (829, N'SAN ANTONIO DE ANTAPARCO', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (830, N'SANTO TOMAS DE PATA', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (831, N'SECCLLA', 82)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (832, N'CASTROVIRREYNA', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (833, N'ARMA', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (834, N'AURAHUA', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (835, N'CAPILLAS', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (836, N'CHUPAMARCA', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (837, N'COCAS', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (838, N'HUACHOS', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (839, N'HUAMATAMBO', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (840, N'MOLLEPAMPA', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (841, N'SAN JUAN', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (842, N'SANTA ANA', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (843, N'TANTARA', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (844, N'TICRAPO', 83)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (845, N'CHURCAMPA', 84)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (846, N'ANCO', 84)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (847, N'CHINCHIHUASI', 84)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (848, N'EL CARMEN', 84)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (849, N'LA MERCED', 84)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (850, N'LOCROJA', 84)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (851, N'PAUCARBAMBA', 84)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (852, N'SAN MIGUEL DE MAYOCC', 84)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (853, N'SAN PEDRO DE CORIS', 84)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (854, N'PACHAMARCA', 84)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (855, N'HUAYTARA', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (856, N'AYAVI', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (857, N'CORDOVA', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (858, N'HUAYACUNDO ARMA', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (859, N'LARAMARCA', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (860, N'OCOYO', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (861, N'PILPICHACA', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (862, N'QUERCO', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (863, N'QUITO-ARMA', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (864, N'SAN ANTONIO DE CUSICANCHA', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (865, N'SAN FRANCISCO DE SANGAYAICO', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (866, N'SAN ISIDRO', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (867, N'SANTIAGO DE CHOCORVOS', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (868, N'SANTIAGO DE QUIRAHUARA', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (869, N'SANTO DOMINGO DE CAPILLAS', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (870, N'TAMBO', 85)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (871, N'PAMPAS', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (872, N'ACOSTAMBO', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (873, N'ACRAQUIA', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (874, N'AHUAYCHA', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (875, N'COLCABAMBA', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (876, N'DANIEL HERNANDEZ', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (877, N'HUACHOCOLPA', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (878, N'HUARIBAMBA', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (879, N'&Ntilde;AHUIMPUQUIO', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (880, N'PAZOS', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (881, N'QUISHUAR', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (882, N'SALCABAMBA', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (883, N'SALCAHUASI', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (884, N'SAN MARCOS DE ROCCHAC', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (885, N'SURCUBAMBA', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (886, N'TINTAY PUNCU', 86)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (887, N'HUANUCO', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (888, N'AMARILIS', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (889, N'CHINCHAO', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (890, N'CHURUBAMBA', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (891, N'MARGOS', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (892, N'QUISQUI', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (893, N'SAN FRANCISCO DE CAYRAN', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (894, N'SAN PEDRO DE CHAULAN', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (895, N'SANTA MARIA DEL VALLE', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (896, N'YARUMAYO', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (897, N'PILLCO MARCA', 87)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (898, N'AMBO', 88)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (899, N'CAYNA', 88)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (900, N'COLPAS', 88)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (901, N'CONCHAMARCA', 88)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (902, N'HUACAR', 88)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (903, N'SAN FRANCISCO', 88)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (904, N'SAN RAFAEL', 88)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (905, N'TOMAY KICHWA', 88)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (906, N'LA UNION', 89)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (907, N'CHUQUIS', 89)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (908, N'MARIAS', 89)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (909, N'PACHAS', 89)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (910, N'QUIVILLA', 89)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (911, N'RIPAN', 89)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (912, N'SHUNQUI', 89)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (913, N'SILLAPATA', 89)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (914, N'YANAS', 89)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (915, N'HUACAYBAMBA', 90)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (916, N'CANCHABAMBA', 90)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (917, N'COCHABAMBA', 90)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (918, N'PINRA', 90)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (919, N'LLATA', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (920, N'ARANCAY', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (921, N'CHAVIN DE PARIARCA', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (922, N'JACAS GRANDE', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (923, N'JIRCAN', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (924, N'MIRAFLORES', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (925, N'MONZON', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (926, N'PUNCHAO', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (927, N'PU&Ntilde;OS', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (928, N'SINGA', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (929, N'TANTAMAYO', 91)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (930, N'RUPA-RUPA', 92)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (931, N'DANIEL ALOMIA ROBLES', 92)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (932, N'HERMILIO VALDIZAN', 92)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (933, N'JOSE CRESPO Y CASTILLO', 92)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (934, N'LUYANDO', 92)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (935, N'MARIANO DAMASO BERAUN', 92)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (936, N'HUACRACHUCO', 93)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (937, N'CHOLON', 93)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (938, N'SAN BUENAVENTURA', 93)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (939, N'PANAO', 94)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (940, N'CHAGLLA', 94)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (941, N'MOLINO', 94)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (942, N'UMARI', 94)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (943, N'PUERTO INCA', 95)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (944, N'CODO DEL POZUZO', 95)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (945, N'HONORIA', 95)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (946, N'TOURNAVISTA', 95)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (947, N'YUYAPICHIS', 95)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (948, N'JESUS', 96)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (949, N'BA&Ntilde;OS', 96)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (950, N'JIVIA', 96)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (951, N'QUEROPALCA', 96)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (952, N'RONDOS', 96)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (953, N'SAN FRANCISCO DE ASIS', 96)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (954, N'SAN MIGUEL DE CAURI', 96)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (955, N'CHAVINILLO', 97)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (956, N'CAHUAC', 97)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (957, N'CHACABAMBA', 97)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (958, N'APARICIO POMARES', 97)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (959, N'JACAS CHICO', 97)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (960, N'OBAS', 97)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (961, N'PAMPAMARCA', 97)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (962, N'CHORAS', 97)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (963, N'ICA', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (964, N'LA TINGUI&Ntilde;A', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (965, N'LOS AQUIJES', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (966, N'OCUCAJE', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (967, N'PACHACUTEC', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (968, N'PARCONA', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (969, N'PUEBLO NUEVO', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (970, N'SALAS', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (971, N'SAN JOSE DE LOS MOLINOS', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (972, N'SAN JUAN BAUTISTA', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (973, N'SANTIAGO', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (974, N'SUBTANJALLA', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (975, N'TATE', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (976, N'YAUCA DEL ROSARIO', 98)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (977, N'CHINCHA ALTA', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (978, N'ALTO LARAN', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (979, N'CHAVIN', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (980, N'CHINCHA BAJA', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (981, N'EL CARMEN', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (982, N'GROCIO PRADO', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (983, N'PUEBLO NUEVO', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (984, N'SAN JUAN DE YANAC', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (985, N'SAN PEDRO DE HUACARPANA', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (986, N'SUNAMPE', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (987, N'TAMBO DE MORA', 99)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (988, N'NAZCA', 100)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (989, N'CHANGUILLO', 100)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (990, N'EL INGENIO', 100)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (991, N'MARCONA', 100)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (992, N'VISTA ALEGRE', 100)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (993, N'PALPA', 101)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (994, N'LLIPATA', 101)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (995, N'RIO GRANDE', 101)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (996, N'SANTA CRUZ', 101)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (997, N'TIBILLO', 101)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (998, N'PISCO', 102)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (999, N'HUANCANO', 102)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1000, N'HUMAY', 102)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1001, N'INDEPENDENCIA', 102)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1002, N'PARACAS', 102)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1003, N'SAN ANDRES', 102)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1004, N'SAN CLEMENTE', 102)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1005, N'TUPAC AMARU INCA', 102)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1006, N'HUANCAYO', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1007, N'CARHUACALLANGA', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1008, N'CHACAPAMPA', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1009, N'CHICCHE', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1010, N'CHILCA', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1011, N'CHONGOS ALTO', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1012, N'CHUPURO', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1013, N'COLCA', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1014, N'CULLHUAS', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1015, N'EL TAMBO', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1016, N'HUACRAPUQUIO', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1017, N'HUALHUAS', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1018, N'HUANCAN', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1019, N'HUASICANCHA', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1020, N'HUAYUCACHI', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1021, N'INGENIO', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1022, N'PARIAHUANCA', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1023, N'PILCOMAYO', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1024, N'PUCARA', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1025, N'QUICHUAY', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1026, N'QUILCAS', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1027, N'SAN AGUSTIN', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1028, N'SAN JERONIMO DE TUNAN', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1029, N'SA&Ntilde;O', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1030, N'SAPALLANGA', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1031, N'SICAYA', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1032, N'SANTO DOMINGO DE ACOBAMBA', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1033, N'VIQUES', 103)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1034, N'CONCEPCION', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1035, N'ACO', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1036, N'ANDAMARCA', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1037, N'CHAMBARA', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1038, N'COCHAS', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1039, N'COMAS', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1040, N'HEROINAS TOLEDO', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1041, N'MANZANARES', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1042, N'MARISCAL CASTILLA', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1043, N'MATAHUASI', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1044, N'MITO', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1045, N'NUEVE DE JULIO', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1046, N'ORCOTUNA', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1047, N'SAN JOSE DE QUERO', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1048, N'SANTA ROSA DE OCOPA', 104)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1049, N'CHANCHAMAYO', 105)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1050, N'PERENE', 105)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1051, N'PICHANAQUI', 105)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1052, N'SAN LUIS DE SHUARO', 105)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1053, N'SAN RAMON', 105)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1054, N'VITOC', 105)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1055, N'JAUJA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1056, N'ACOLLA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1057, N'APATA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1058, N'ATAURA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1059, N'CANCHAYLLO', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1060, N'CURICACA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1061, N'EL MANTARO', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1062, N'HUAMALI', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1063, N'HUARIPAMPA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1064, N'HUERTAS', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1065, N'JANJAILLO', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1066, N'JULCAN', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1067, N'LEONOR ORDO&Ntilde;EZ', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1068, N'LLOCLLAPAMPA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1069, N'MARCO', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1070, N'MASMA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1071, N'MASMA CHICCHE', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1072, N'MOLINOS', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1073, N'MONOBAMBA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1074, N'MUQUI', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1075, N'MUQUIYAUYO', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1076, N'PACA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1077, N'PACCHA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1078, N'PANCAN', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1079, N'PARCO', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1080, N'POMACANCHA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1081, N'RICRAN', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1082, N'SAN LORENZO', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1083, N'SAN PEDRO DE CHUNAN', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1084, N'SAUSA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1085, N'SINCOS', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1086, N'TUNAN MARCA', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1087, N'YAULI', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1088, N'YAUYOS', 106)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1089, N'JUNIN', 107)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1090, N'CARHUAMAYO', 107)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1091, N'ONDORES', 107)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1092, N'ULCUMAYO', 107)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1093, N'SATIPO', 108)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1094, N'COVIRIALI', 108)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1095, N'LLAYLLA', 108)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1096, N'MAZAMARI', 108)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1097, N'PAMPA HERMOSA', 108)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1098, N'PANGOA', 108)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1099, N'RIO NEGRO', 108)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1100, N'RIO TAMBO', 108)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1101, N'TARMA', 109)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1102, N'ACOBAMBA', 109)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1103, N'HUARICOLCA', 109)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1104, N'HUASAHUASI', 109)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1105, N'LA UNION', 109)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1106, N'PALCA', 109)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1107, N'PALCAMAYO', 109)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1108, N'SAN PEDRO DE CAJAS', 109)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1109, N'TAPO', 109)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1110, N'LA OROYA', 110)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1111, N'CHACAPALPA', 110)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1112, N'HUAY-HUAY', 110)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1113, N'MARCAPOMACOCHA', 110)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1114, N'MOROCOCHA', 110)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1115, N'PACCHA', 110)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1116, N'SANTA BARBARA DE CARHUACAYAN', 110)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1117, N'SANTA ROSA DE SACCO', 110)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1118, N'SUITUCANCHA', 110)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1119, N'YAULI', 110)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1120, N'CHUPACA', 111)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1121, N'AHUAC', 111)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1122, N'CHONGOS BAJO', 111)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1123, N'HUACHAC', 111)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1124, N'HUAMANCACA CHICO', 111)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1125, N'SAN JUAN DE ISCOS', 111)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1126, N'SAN JUAN DE JARPA', 111)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1127, N'TRES DE DICIEMBRE', 111)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1128, N'YANACANCHA', 111)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1129, N'TRUJILLO', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1130, N'EL PORVENIR', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1131, N'FLORENCIA DE MORA', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1132, N'HUANCHACO', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1133, N'LA ESPERANZA', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1134, N'LAREDO', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1135, N'MOCHE', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1136, N'POROTO', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1137, N'SALAVERRY', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1138, N'SIMBAL', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1139, N'VICTOR LARCO HERRERA', 112)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1140, N'ASCOPE', 113)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1141, N'CHICAMA', 113)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1142, N'CHOCOPE', 113)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1143, N'MAGDALENA DE CAO', 113)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1144, N'PAIJAN', 113)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1145, N'RAZURI', 113)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1146, N'SANTIAGO DE CAO', 113)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1147, N'CASA GRANDE', 113)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1148, N'BOLIVAR', 114)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1149, N'BAMBAMARCA', 114)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1150, N'CONDORMARCA', 114)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1151, N'LONGOTEA', 114)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1152, N'UCHUMARCA', 114)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1153, N'UCUNCHA', 114)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1154, N'CHEPEN', 115)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1155, N'PACANGA', 115)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1156, N'PUEBLO NUEVO', 115)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1157, N'JULCAN', 116)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1158, N'CALAMARCA', 116)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1159, N'CARABAMBA', 116)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1160, N'HUASO', 116)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1161, N'OTUZCO', 117)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1162, N'AGALLPAMPA', 117)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1163, N'CHARAT', 117)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1164, N'HUARANCHAL', 117)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1165, N'LA CUESTA', 117)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1166, N'MACHE', 117)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1167, N'PARANDAY', 117)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1168, N'SALPO', 117)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1169, N'SINSICAP', 117)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1170, N'USQUIL', 117)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1171, N'SAN PEDRO DE LLOC', 118)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1172, N'GUADALUPE', 118)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1173, N'JEQUETEPEQUE', 118)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1174, N'PACASMAYO', 118)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1175, N'SAN JOSE', 118)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1176, N'TAYABAMBA', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1177, N'BULDIBUYO', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1178, N'CHILLIA', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1179, N'HUANCASPATA', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1180, N'HUAYLILLAS', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1181, N'HUAYO', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1182, N'ONGON', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1183, N'PARCOY', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1184, N'PATAZ', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1185, N'PIAS', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1186, N'SANTIAGO DE CHALLAS', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1187, N'TAURIJA', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1188, N'URPAY', 119)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1189, N'HUAMACHUCO', 120)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1190, N'CHUGAY', 120)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1191, N'COCHORCO', 120)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1192, N'CURGOS', 120)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1193, N'MARCABAL', 120)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1194, N'SANAGORAN', 120)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1195, N'SARIN', 120)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1196, N'SARTIMBAMBA', 120)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1197, N'SANTIAGO DE CHUCO', 121)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1198, N'ANGASMARCA', 121)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1199, N'CACHICADAN', 121)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1200, N'MOLLEBAMBA', 121)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1201, N'MOLLEPATA', 121)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1202, N'QUIRUVILCA', 121)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1203, N'SANTA CRUZ DE CHUCA', 121)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1204, N'SITABAMBA', 121)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1205, N'GRAN CHIMU', 122)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1206, N'CASCAS', 122)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1207, N'LUCMA', 122)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1208, N'MARMOT', 122)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1209, N'SAYAPULLO', 122)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1210, N'VIRU', 123)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1211, N'CHAO', 123)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1212, N'GUADALUPITO', 123)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1213, N'CHICLAYO', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1214, N'CHONGOYAPE', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1215, N'ETEN', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1216, N'ETEN PUERTO', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1217, N'JOSE LEONARDO ORTIZ', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1218, N'LA VICTORIA', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1219, N'LAGUNAS', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1220, N'MONSEFU', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1221, N'NUEVA ARICA', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1222, N'OYOTUN', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1223, N'PICSI', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1224, N'PIMENTEL', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1225, N'REQUE', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1226, N'SANTA ROSA', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1227, N'SA&Ntilde;A', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1228, N'CAYALTI', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1229, N'PATAPO', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1230, N'POMALCA', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1231, N'PUCALA', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1232, N'TUMAN', 124)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1233, N'FERRE&Ntilde;AFE', 125)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1234, N'CA&Ntilde;ARIS', 125)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1235, N'INCAHUASI', 125)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1236, N'MANUEL ANTONIO MESONES MURO', 125)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1237, N'PITIPO', 125)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1238, N'PUEBLO NUEVO', 125)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1239, N'LAMBAYEQUE', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1240, N'CHOCHOPE', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1241, N'ILLIMO', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1242, N'JAYANCA', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1243, N'MOCHUMI', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1244, N'MORROPE', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1245, N'MOTUPE', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1246, N'OLMOS', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1247, N'PACORA', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1248, N'SALAS', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1249, N'SAN JOSE', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1250, N'TUCUME', 126)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1251, N'LIMA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1252, N'ANCON', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1253, N'ATE', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1254, N'BARRANCO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1255, N'BRE&Ntilde;A', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1256, N'CARABAYLLO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1257, N'CHACLACAYO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1258, N'CHORRILLOS', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1259, N'CIENEGUILLA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1260, N'COMAS', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1261, N'EL AGUSTINO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1262, N'INDEPENDENCIA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1263, N'JESUS MARIA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1264, N'LA MOLINA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1265, N'LA VICTORIA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1266, N'LINCE', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1267, N'LOS OLIVOS', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1268, N'LURIGANCHO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1269, N'LURIN', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1270, N'MAGDALENA DEL MAR', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1271, N'MAGDALENA VIEJA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1272, N'MIRAFLORES', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1273, N'PACHACAMAC', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1274, N'PUCUSANA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1275, N'PUENTE PIEDRA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1276, N'PUNTA HERMOSA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1277, N'PUNTA NEGRA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1278, N'RIMAC', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1279, N'SAN BARTOLO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1280, N'SAN BORJA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1281, N'SAN ISIDRO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1282, N'SAN JUAN DE LURIGANCHO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1283, N'SAN JUAN DE MIRAFLORES', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1284, N'SAN LUIS', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1285, N'SAN MARTIN DE PORRES', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1286, N'SAN MIGUEL', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1287, N'SANTA ANITA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1288, N'SANTA MARIA DEL MAR', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1289, N'SANTA ROSA', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1290, N'SANTIAGO DE SURCO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1291, N'SURQUILLO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1292, N'VILLA EL SALVADOR', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1293, N'VILLA MARIA DEL TRIUNFO', 127)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1294, N'BARRANCA', 128)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1295, N'PARAMONGA', 128)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1296, N'PATIVILCA', 128)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1297, N'SUPE', 128)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1298, N'SUPE PUERTO', 128)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1299, N'CAJATAMBO', 129)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1300, N'COPA', 129)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1301, N'GORGOR', 129)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1302, N'HUANCAPON', 129)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1303, N'MANAS', 129)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1304, N'CANTA', 130)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1305, N'ARAHUAY', 130)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1306, N'HUAMANTANGA', 130)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1307, N'HUAROS', 130)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1308, N'LACHAQUI', 130)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1309, N'SAN BUENAVENTURA', 130)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1310, N'SANTA ROSA DE QUIVES', 130)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1311, N'SAN VICENTE DE CA&Ntilde;ETE', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1312, N'ASIA', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1313, N'CALANGO', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1314, N'CERRO AZUL', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1315, N'CHILCA', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1316, N'COAYLLO', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1317, N'IMPERIAL', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1318, N'LUNAHUANA', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1319, N'MALA', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1320, N'NUEVO IMPERIAL', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1321, N'PACARAN', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1322, N'QUILMANA', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1323, N'SAN ANTONIO', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1324, N'SAN LUIS', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1325, N'SANTA CRUZ DE FLORES', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1326, N'ZU&Ntilde;IGA', 131)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1327, N'HUARAL', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1328, N'ATAVILLOS ALTO', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1329, N'ATAVILLOS BAJO', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1330, N'AUCALLAMA', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1331, N'CHANCAY', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1332, N'IHUARI', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1333, N'LAMPIAN', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1334, N'PACARAOS', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1335, N'SAN MIGUEL DE ACOS', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1336, N'SANTA CRUZ DE ANDAMARCA', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1337, N'SUMBILCA', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1338, N'VEINTISIETE DE NOVIEMBRE', 132)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1339, N'MATUCANA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1340, N'ANTIOQUIA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1341, N'CALLAHUANCA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1342, N'CARAMPOMA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1343, N'CHICLA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1344, N'CUENCA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1345, N'HUACHUPAMPA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1346, N'HUANZA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1347, N'HUAROCHIRI', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1348, N'LAHUAYTAMBO', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1349, N'LANGA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1350, N'LARAOS', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1351, N'MARIATANA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1352, N'RICARDO PALMA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1353, N'SAN ANDRES DE TUPICOCHA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1354, N'SAN ANTONIO', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1355, N'SAN BARTOLOME', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1356, N'SAN DAMIAN', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1357, N'SAN JUAN DE IRIS', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1358, N'SAN JUAN DE TANTARANCHE', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1359, N'SAN LORENZO DE QUINTI', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1360, N'SAN MATEO', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1361, N'SAN MATEO DE OTAO', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1362, N'SAN PEDRO DE CASTA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1363, N'SAN PEDRO DE HUANCAYRE', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1364, N'SANGALLAYA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1365, N'SANTA CRUZ DE COCACHACRA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1366, N'SANTA EULALIA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1367, N'SANTIAGO DE ANCHUCAYA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1368, N'SANTIAGO DE TUNA', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1369, N'SANTO DOMINGO DE LOS OLLEROS', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1370, N'SURCO', 133)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1371, N'HUACHO', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1372, N'AMBAR', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1373, N'CALETA DE CARQUIN', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1374, N'CHECRAS', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1375, N'HUALMAY', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1376, N'HUAURA', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1377, N'LEONCIO PRADO', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1378, N'PACCHO', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1379, N'SANTA LEONOR', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1380, N'SANTA MARIA', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1381, N'SAYAN', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1382, N'VEGUETA', 134)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1383, N'OYON', 135)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1384, N'ANDAJES', 135)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1385, N'CAUJUL', 135)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1386, N'COCHAMARCA', 135)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1387, N'NAVAN', 135)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1388, N'PACHANGARA', 135)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1389, N'YAUYOS', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1390, N'ALIS', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1391, N'AYAUCA', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1392, N'AYAVIRI', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1393, N'AZANGARO', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1394, N'CACRA', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1395, N'CARANIA', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1396, N'CATAHUASI', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1397, N'CHOCOS', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1398, N'COCHAS', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1399, N'COLONIA', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1400, N'HONGOS', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1401, N'HUAMPARA', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1402, N'HUANCAYA', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1403, N'HUANGASCAR', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1404, N'HUANTAN', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1405, N'HUA&Ntilde;EC', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1406, N'LARAOS', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1407, N'LINCHA', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1408, N'MADEAN', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1409, N'MIRAFLORES', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1410, N'OMAS', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1411, N'PUTINZA', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1412, N'QUINCHES', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1413, N'QUINOCAY', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1414, N'SAN JOAQUIN', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1415, N'SAN PEDRO DE PILAS', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1416, N'TANTA', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1417, N'TAURIPAMPA', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1418, N'TOMAS', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1419, N'TUPE', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1420, N'VI&Ntilde;AC', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1421, N'VITIS', 136)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1422, N'IQUITOS', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1423, N'ALTO NANAY', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1424, N'FERNANDO LORES', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1425, N'INDIANA', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1426, N'LAS AMAZONAS', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1427, N'MAZAN', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1428, N'NAPO', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1429, N'PUNCHANA', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1430, N'PUTUMAYO', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1431, N'TORRES CAUSANA', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1432, N'BELEN', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1433, N'SAN JUAN BAUTISTA', 137)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1434, N'YURIMAGUAS', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1435, N'BALSAPUERTO', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1436, N'BARRANCA', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1437, N'CAHUAPANAS', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1438, N'JEBEROS', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1439, N'LAGUNAS', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1440, N'MANSERICHE', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1441, N'MORONA', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1442, N'PASTAZA', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1443, N'SANTA CRUZ', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1444, N'TENIENTE CESAR LOPEZ ROJAS', 138)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1445, N'NAUTA', 139)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1446, N'PARINARI', 139)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1447, N'TIGRE', 139)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1448, N'TROMPETEROS', 139)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1449, N'URARINAS', 139)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1450, N'RAMON CASTILLA', 140)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1451, N'PEBAS', 140)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1452, N'YAVARI', 140)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1453, N'SAN PABLO', 140)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1454, N'REQUENA', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1455, N'ALTO TAPICHE', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1456, N'CAPELO', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1457, N'EMILIO SAN MARTIN', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1458, N'MAQUIA', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1459, N'PUINAHUA', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1460, N'SAQUENA', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1461, N'SOPLIN', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1462, N'TAPICHE', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1463, N'JENARO HERRERA', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1464, N'YAQUERANA', 141)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1465, N'CONTAMANA', 142)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1466, N'INAHUAYA', 142)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1467, N'PADRE MARQUEZ', 142)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1468, N'PAMPA HERMOSA', 142)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1469, N'SARAYACU', 142)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1470, N'VARGAS GUERRA', 142)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1471, N'TAMBOPATA', 143)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1472, N'INAMBARI', 143)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1473, N'LAS PIEDRAS', 143)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1474, N'LABERINTO', 143)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1475, N'MANU', 144)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1476, N'FITZCARRALD', 144)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1477, N'MADRE DE DIOS', 144)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1478, N'HUEPETUHE', 144)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1479, N'I&Ntilde;APARI', 145)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1480, N'IBERIA', 145)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1481, N'TAHUAMANU', 145)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1482, N'MOQUEGUA', 146)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1483, N'CARUMAS', 146)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1484, N'CUCHUMBAYA', 146)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1485, N'SAMEGUA', 146)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1486, N'SAN CRISTOBAL', 146)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1487, N'TORATA', 146)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1488, N'OMATE', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1489, N'CHOJATA', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1490, N'COALAQUE', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1491, N'ICHU&Ntilde;A', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1492, N'LA CAPILLA', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1493, N'LLOQUE', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1494, N'MATALAQUE', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1495, N'PUQUINA', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1496, N'QUINISTAQUILLAS', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1497, N'UBINAS', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1498, N'YUNGA', 147)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1499, N'ILO', 148)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1500, N'EL ALGARROBAL', 148)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1501, N'PACOCHA', 148)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1502, N'CHAUPIMARCA', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1503, N'HUACHON', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1504, N'HUARIACA', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1505, N'HUAYLLAY', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1506, N'NINACACA', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1507, N'PALLANCHACRA', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1508, N'PAUCARTAMBO', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1509, N'SAN FCO.DE ASIS DE YARUSYACAN', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1510, N'SIMON BOLIVAR', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1511, N'TICLACAYAN', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1512, N'TINYAHUARCO', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1513, N'VICCO', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1514, N'YANACANCHA', 149)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1515, N'YANAHUANCA', 150)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1516, N'CHACAYAN', 150)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1517, N'GOYLLARISQUIZGA', 150)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1518, N'PAUCAR', 150)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1519, N'SAN PEDRO DE PILLAO', 150)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1520, N'SANTA ANA DE TUSI', 150)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1521, N'TAPUC', 150)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1522, N'VILCABAMBA', 150)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1523, N'OXAPAMPA', 151)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1524, N'CHONTABAMBA', 151)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1525, N'HUANCABAMBA', 151)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1526, N'PALCAZU', 151)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1527, N'POZUZO', 151)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1528, N'PUERTO BERMUDEZ', 151)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1529, N'VILLA RICA', 151)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1530, N'PIURA', 152)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1531, N'CASTILLA', 152)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1532, N'CATACAOS', 152)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1533, N'CURA MORI', 152)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1534, N'EL TALLAN', 152)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1535, N'LA ARENA', 152)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1536, N'LA UNION', 152)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1537, N'LAS LOMAS', 152)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1538, N'TAMBO GRANDE', 152)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1539, N'AYABACA', 153)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1540, N'FRIAS', 153)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1541, N'JILILI', 153)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1542, N'LAGUNAS', 153)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1543, N'MONTERO', 153)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1544, N'PACAIPAMPA', 153)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1545, N'PAIMAS', 153)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1546, N'SAPILLICA', 153)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1547, N'SICCHEZ', 153)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1548, N'SUYO', 153)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1549, N'HUANCABAMBA', 154)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1550, N'CANCHAQUE', 154)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1551, N'EL CARMEN DE LA FRONTERA', 154)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1552, N'HUARMACA', 154)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1553, N'LALAQUIZ', 154)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1554, N'SAN MIGUEL DE EL FAIQUE', 154)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1555, N'SONDOR', 154)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1556, N'SONDORILLO', 154)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1557, N'CHULUCANAS', 155)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1558, N'BUENOS AIRES', 155)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1559, N'CHALACO', 155)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1560, N'LA MATANZA', 155)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1561, N'MORROPON', 155)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1562, N'SALITRAL', 155)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1563, N'SAN JUAN DE BIGOTE', 155)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1564, N'SANTA CATALINA DE MOSSA', 155)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1565, N'SANTO DOMINGO', 155)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1566, N'YAMANGO', 155)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1567, N'PAITA', 156)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1568, N'AMOTAPE', 156)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1569, N'ARENAL', 156)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1570, N'COLAN', 156)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1571, N'LA HUACA', 156)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1572, N'TAMARINDO', 156)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1573, N'VICHAYAL', 156)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1574, N'SULLANA', 157)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1575, N'BELLAVISTA', 157)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1576, N'IGNACIO ESCUDERO', 157)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1577, N'LANCONES', 157)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1578, N'MARCAVELICA', 157)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1579, N'MIGUEL CHECA', 157)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1580, N'QUERECOTILLO', 157)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1581, N'SALITRAL', 157)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1582, N'PARI&Ntilde;AS', 158)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1583, N'EL ALTO', 158)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1584, N'LA BREA', 158)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1585, N'LOBITOS', 158)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1586, N'LOS ORGANOS', 158)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1587, N'MANCORA', 158)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1588, N'SECHURA', 159)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1589, N'BELLAVISTA DE LA UNION', 159)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1590, N'BERNAL', 159)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1591, N'CRISTO NOS VALGA', 159)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1592, N'VICE', 159)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1593, N'RINCONADA LLICUAR', 159)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1594, N'PUNO', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1595, N'ACORA', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1596, N'AMANTANI', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1597, N'ATUNCOLLA', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1598, N'CAPACHICA', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1599, N'CHUCUITO', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1600, N'COATA', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1601, N'HUATA', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1602, N'MA&Ntilde;AZO', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1603, N'PAUCARCOLLA', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1604, N'PICHACANI', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1605, N'PLATERIA', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1606, N'SAN ANTONIO', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1607, N'TIQUILLACA', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1608, N'VILQUE', 160)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1609, N'AZANGARO', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1610, N'ACHAYA', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1611, N'ARAPA', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1612, N'ASILLO', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1613, N'CAMINACA', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1614, N'CHUPA', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1615, N'JOSE DOMINGO CHOQUEHUANCA', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1616, N'MU&Ntilde;ANI', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1617, N'POTONI', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1618, N'SAMAN', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1619, N'SAN ANTON', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1620, N'SAN JOSE', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1621, N'SAN JUAN DE SALINAS', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1622, N'SANTIAGO DE PUPUJA', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1623, N'TIRAPATA', 161)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1624, N'MACUSANI', 162)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1625, N'AJOYANI', 162)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1626, N'AYAPATA', 162)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1627, N'COASA', 162)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1628, N'CORANI', 162)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1629, N'CRUCERO', 162)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1630, N'ITUATA', 162)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1631, N'OLLACHEA', 162)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1632, N'SAN GABAN', 162)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1633, N'USICAYOS', 162)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1634, N'JULI', 163)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1635, N'DESAGUADERO', 163)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1636, N'HUACULLANI', 163)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1637, N'KELLUYO', 163)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1638, N'PISACOMA', 163)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1639, N'POMATA', 163)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1640, N'ZEPITA', 163)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1641, N'ILAVE', 164)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1642, N'CAPAZO', 164)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1643, N'PILCUYO', 164)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1644, N'SANTA ROSA', 164)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1645, N'CONDURIRI', 164)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1646, N'HUANCANE', 165)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1647, N'COJATA', 165)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1648, N'HUATASANI', 165)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1649, N'INCHUPALLA', 165)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1650, N'PUSI', 165)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1651, N'ROSASPATA', 165)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1652, N'TARACO', 165)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1653, N'VILQUE CHICO', 165)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1654, N'LAMPA', 166)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1655, N'CABANILLA', 166)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1656, N'CALAPUJA', 166)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1657, N'NICASIO', 166)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1658, N'OCUVIRI', 166)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1659, N'PALCA', 166)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1660, N'PARATIA', 166)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1661, N'PUCARA', 166)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1662, N'SANTA LUCIA', 166)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1663, N'VILAVILA', 166)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1664, N'AYAVIRI', 167)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1665, N'ANTAUTA', 167)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1666, N'CUPI', 167)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1667, N'LLALLI', 167)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1668, N'MACARI', 167)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1669, N'NU&Ntilde;OA', 167)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1670, N'ORURILLO', 167)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1671, N'SANTA ROSA', 167)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1672, N'UMACHIRI', 167)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1673, N'MOHO', 168)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1674, N'CONIMA', 168)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1675, N'HUAYRAPATA', 168)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1676, N'TILALI', 168)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1677, N'PUTINA', 169)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1678, N'ANANEA', 169)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1679, N'PEDRO VILCA APAZA', 169)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1680, N'QUILCAPUNCU', 169)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1681, N'SINA', 169)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1682, N'JULIACA', 170)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1683, N'CABANA', 170)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1684, N'CABANILLAS', 170)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1685, N'CARACOTO', 170)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1686, N'SANDIA', 171)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1687, N'CUYOCUYO', 171)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1688, N'LIMBANI', 171)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1689, N'PATAMBUCO', 171)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1690, N'PHARA', 171)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1691, N'QUIACA', 171)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1692, N'SAN JUAN DEL ORO', 171)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1693, N'YANAHUAYA', 171)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1694, N'ALTO INAMBARI', 171)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1695, N'YUNGUYO', 172)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1696, N'ANAPIA', 172)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1697, N'COPANI', 172)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1698, N'CUTURAPI', 172)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1699, N'OLLARAYA', 172)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1700, N'TINICACHI', 172)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1701, N'UNICACHI', 172)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1702, N'MOYOBAMBA', 173)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1703, N'CALZADA', 173)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1704, N'HABANA', 173)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1705, N'JEPELACIO', 173)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1706, N'SORITOR', 173)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1707, N'YANTALO', 173)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1708, N'BELLAVISTA', 174)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1709, N'ALTO BIAVO', 174)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1710, N'BAJO BIAVO', 174)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1711, N'HUALLAGA', 174)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1712, N'SAN PABLO', 174)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1713, N'SAN RAFAEL', 174)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1714, N'SAN JOSE DE SISA', 175)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1715, N'AGUA BLANCA', 175)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1716, N'SAN MARTIN', 175)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1717, N'SANTA ROSA', 175)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1718, N'SHATOJA', 175)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1719, N'SAPOSOA', 176)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1720, N'ALTO SAPOSOA', 176)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1721, N'EL ESLABON', 176)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1722, N'PISCOYACU', 176)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1723, N'SACANCHE', 176)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1724, N'TINGO DE SAPOSOA', 176)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1725, N'LAMAS', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1726, N'ALONSO DE ALVARADO', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1727, N'BARRANQUITA', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1728, N'CAYNARACHI', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1729, N'CU&Ntilde;UMBUQUI', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1730, N'PINTO RECODO', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1731, N'RUMISAPA', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1732, N'SAN ROQUE DE CUMBAZA', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1733, N'SHANAO', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1734, N'TABALOSOS', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1735, N'ZAPATERO', 177)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1736, N'JUANJUI', 178)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1737, N'CAMPANILLA', 178)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1738, N'HUICUNGO', 178)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1739, N'PACHIZA', 178)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1740, N'PAJARILLO', 178)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1741, N'PICOTA', 179)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1742, N'BUENOS AIRES', 179)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1743, N'CASPISAPA', 179)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1744, N'PILLUANA', 179)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1745, N'PUCACACA', 179)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1746, N'SAN CRISTOBAL', 179)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1747, N'SAN HILARION', 179)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1748, N'SHAMBOYACU', 179)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1749, N'TINGO DE PONASA', 179)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1750, N'TRES UNIDOS', 179)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1751, N'RIOJA', 180)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1752, N'AWAJUN', 180)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1753, N'ELIAS SOPLIN VARGAS', 180)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1754, N'NUEVA CAJAMARCA', 180)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1755, N'PARDO MIGUEL', 180)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1756, N'POSIC', 180)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1757, N'SAN FERNANDO', 180)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1758, N'YORONGOS', 180)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1759, N'YURACYACU', 180)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1760, N'TARAPOTO', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1761, N'ALBERTO LEVEAU', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1762, N'CACATACHI', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1763, N'CHAZUTA', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1764, N'CHIPURANA', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1765, N'EL PORVENIR', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1766, N'HUIMBAYOC', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1767, N'JUAN GUERRA', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1768, N'LA BANDA DE SHILCAYO', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1769, N'MORALES', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1770, N'PAPAPLAYA', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1771, N'SAN ANTONIO', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1772, N'SAUCE', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1773, N'SHAPAJA', 181)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1774, N'TOCACHE', 182)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1775, N'NUEVO PROGRESO', 182)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1776, N'POLVORA', 182)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1777, N'SHUNTE', 182)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1778, N'UCHIZA', 182)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1779, N'TACNA', 183)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1780, N'ALTO DE LA ALIANZA', 183)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1781, N'CALANA', 183)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1782, N'CIUDAD NUEVA', 183)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1783, N'INCLAN', 183)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1784, N'PACHIA', 183)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1785, N'PALCA', 183)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1786, N'POCOLLAY', 183)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1787, N'SAMA', 183)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1788, N'CORONEL GREGORIO ALBARRACIN LANCHIPA', 183)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1789, N'CANDARAVE', 184)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1790, N'CAIRANI', 184)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1791, N'CAMILACA', 184)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1792, N'CURIBAYA', 184)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1793, N'HUANUARA', 184)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1794, N'QUILAHUANI', 184)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1795, N'LOCUMBA', 185)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1796, N'ILABAYA', 185)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1797, N'ITE', 185)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1798, N'TARATA', 186)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1799, N'CHUCATAMANI', 186)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1800, N'ESTIQUE', 186)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1801, N'ESTIQUE-PAMPA', 186)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1802, N'SITAJARA', 186)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1803, N'SUSAPAYA', 186)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1804, N'TARUCACHI', 186)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1805, N'TICACO', 186)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1806, N'TUMBES', 187)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1807, N'CORRALES', 187)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1808, N'LA CRUZ', 187)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1809, N'PAMPAS DE HOSPITAL', 187)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1810, N'SAN JACINTO', 187)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1811, N'SAN JUAN DE LA VIRGEN', 187)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1812, N'ZORRITOS', 188)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1813, N'CASITAS', 188)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1814, N'ZARUMILLA', 189)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1815, N'AGUAS VERDES', 189)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1816, N'MATAPALO', 189)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1817, N'PAPAYAL', 189)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1818, N'CALLERIA', 190)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1819, N'CAMPOVERDE', 190)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1820, N'IPARIA', 190)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1821, N'MASISEA', 190)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1822, N'YARINACOCHA', 190)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1823, N'NUEVA REQUENA', 190)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1824, N'RAYMONDI', 191)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1825, N'SEPAHUA', 191)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1826, N'TAHUANIA', 191)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1827, N'YURUA', 191)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1828, N'PADRE ABAD', 192)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1829, N'IRAZOLA', 192)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1830, N'CURIMANA', 192)
GO
INSERT [Cnfg].[Distrito] ([IdDistrito], [Distrito], [IdProvincia]) VALUES (1831, N'PURUS', 193)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (100, N'', N'Tipo de Inversión', NULL, NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (101, N'100', N'1. Proyecto de Inversión', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (102, N'100', N'2. Ampliación Marginal', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (103, N'100', N'3. Reposición', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (104, N'100', N'4. Optimización', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (105, N'100', N'5. Rehabilitación', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (106, N'100', N'6. Programa de Inversión', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (107, N'100', N'7. Conglomerado', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (200, N'', N'Ciclo de Inversión', NULL, NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (201, N'200', N'1. Idea', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (202, N'200', N'2. Formulación', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (203, N'200', N'3. Viable o aprobado', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (204, N'200', N'4. Expediente Técnico', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (205, N'200', N'5. Ejecución', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (300, N'', N'Naturaleza', NULL, NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (301, N'300', N'1. Creación', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (302, N'300', N'2. Ampliación', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (303, N'300', N'3. Mejoramiento', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (304, N'300', N'4. Recuperación', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (305, N'300', N'5. Ampliación Marginal', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (306, N'300', N'6. Optimización', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (307, N'300', N'7. Reposición', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (308, N'300', N'8. Rehabilitación', N'1', NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (400, N'', N'Modalidad', NULL, NULL, 1)
GO
INSERT [Cnfg].[Maestra] ([Id], [IdTipo], [Descripcion1], [Descripcion2], [Descripcion3], [Estado]) VALUES (401, N'400', N'1. Administración Directa', N'1', NULL, 1)
GO
SET IDENTITY_INSERT [Cnfg].[Personal] ON 
GO
INSERT [Cnfg].[Personal] ([IdCoordinador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Correo], [Telefono], [Estado], [IdZona], [Asignado], [Cargo]) VALUES (1, N'Luis Carlos', N'Perez', N'Vasquez', N'luis.perez@gmail.com', N'999999999', 1, 1, 1, N'C')
GO
INSERT [Cnfg].[Personal] ([IdCoordinador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Correo], [Telefono], [Estado], [IdZona], [Asignado], [Cargo]) VALUES (2, N'Jose ', N'Sanchez', N'Alvarez', N'jose.sanchez@gmail.com', N'999999999', 1, 1, 1, N'C')
GO
INSERT [Cnfg].[Personal] ([IdCoordinador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Correo], [Telefono], [Estado], [IdZona], [Asignado], [Cargo]) VALUES (3, N'Avelardo', N'Catacora', N'Quispe', N'avelardo.catacora@gmail.com', N'999999999', 1, 2, 1, N'C')
GO
INSERT [Cnfg].[Personal] ([IdCoordinador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Correo], [Telefono], [Estado], [IdZona], [Asignado], [Cargo]) VALUES (4, N'Alexis', N'Alvarez', N'Contreras', N'alexis.alvarez@gmail.com', N'999999999', 1, 2, 0, N'C')
GO
INSERT [Cnfg].[Personal] ([IdCoordinador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Correo], [Telefono], [Estado], [IdZona], [Asignado], [Cargo]) VALUES (5, N'Gino', N'Maguiña', N'Perez', N'gino.maguina@gmail.com', N'999999999', 1, 3, 1, N'C')
GO
INSERT [Cnfg].[Personal] ([IdCoordinador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Correo], [Telefono], [Estado], [IdZona], [Asignado], [Cargo]) VALUES (1002, N'Daniel', N'Alegre', N'Nontol', N'daniel.alegre@gmail.com', N'999999999', 1, 3, 0, N'C')
GO
INSERT [Cnfg].[Personal] ([IdCoordinador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Correo], [Telefono], [Estado], [IdZona], [Asignado], [Cargo]) VALUES (1003, N'Fernando', N'Sanchez', N'Valdez', N'fernando.sanchez@gmail.com', N'999999999', 1, 4, 1, N'C')
GO
INSERT [Cnfg].[Personal] ([IdCoordinador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Correo], [Telefono], [Estado], [IdZona], [Asignado], [Cargo]) VALUES (1004, N'Andy', N'Carmona', N'Flores', N'andy.carmona@gmail.com', N'999999999', 1, 4, 1, N'C')
GO
INSERT [Cnfg].[Personal] ([IdCoordinador], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Correo], [Telefono], [Estado], [IdZona], [Asignado], [Cargo]) VALUES (1005, N'Alberto', N'Alcarraz', N'Núñez', N'aalcarraznunnez@gmail.com', N'960284030', 1, 0, 0, N'A')
GO
SET IDENTITY_INSERT [Cnfg].[Personal] OFF
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (1, N'CHACHAPOYAS ', 1)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (2, N'BAGUA', 1)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (3, N'BONGARA', 1)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (4, N'CONDORCANQUI', 1)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (5, N'LUYA', 1)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (6, N'RODRIGUEZ DE MENDOZA', 1)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (7, N'UTCUBAMBA', 1)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (8, N'HUARAZ', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (9, N'AIJA', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (10, N'ANTONIO RAYMONDI', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (11, N'ASUNCION', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (12, N'BOLOGNESI', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (13, N'CARHUAZ', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (14, N'CARLOS FERMIN FITZCARRALD', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (15, N'CASMA', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (16, N'CORONGO', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (17, N'HUARI', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (18, N'HUARMEY', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (19, N'HUAYLAS', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (20, N'MARISCAL LUZURIAGA', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (21, N'OCROS', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (22, N'PALLASCA', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (23, N'POMABAMBA', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (24, N'RECUAY', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (25, N'SANTA', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (26, N'SIHUAS', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (27, N'YUNGAY', 2)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (28, N'ABANCAY', 3)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (29, N'ANDAHUAYLAS', 3)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (30, N'ANTABAMBA', 3)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (31, N'AYMARAES', 3)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (32, N'COTABAMBAS', 3)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (33, N'CHINCHEROS', 3)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (34, N'GRAU', 3)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (35, N'AREQUIPA', 4)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (36, N'CAMANA', 4)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (37, N'CARAVELI', 4)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (38, N'CASTILLA', 4)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (39, N'CAYLLOMA', 4)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (40, N'CONDESUYOS', 4)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (41, N'ISLAY', 4)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (42, N'LA UNION', 4)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (43, N'HUAMANGA', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (44, N'CANGALLO', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (45, N'HUANCA SANCOS', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (46, N'HUANTA', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (47, N'LA MAR', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (48, N'LUCANAS', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (49, N'PARINACOCHAS', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (50, N'PAUCAR DEL SARA SARA', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (51, N'SUCRE', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (52, N'VICTOR FAJARDO', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (53, N'VILCAS HUAMAN', 5)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (54, N'CAJAMARCA', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (55, N'CAJABAMBA', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (56, N'CELENDIN', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (57, N'CHOTA ', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (58, N'CONTUMAZA', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (59, N'CUTERVO', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (60, N'HUALGAYOC', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (61, N'JAEN', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (62, N'SAN IGNACIO', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (63, N'SAN MARCOS', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (64, N'SAN PABLO', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (65, N'SANTA CRUZ', 6)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (66, N'CALLAO', 7)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (67, N'CUSCO', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (68, N'ACOMAYO', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (69, N'ANTA', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (70, N'CALCA', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (71, N'CANAS', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (72, N'CANCHIS', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (73, N'CHUMBIVILCAS', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (74, N'ESPINAR', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (75, N'LA CONVENCION', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (76, N'PARURO', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (77, N'PAUCARTAMBO', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (78, N'QUISPICANCHI', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (79, N'URUBAMBA', 8)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (80, N'HUANCAVELICA', 9)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (81, N'ACOBAMBA', 9)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (82, N'ANGARAES', 9)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (83, N'CASTROVIRREYNA', 9)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (84, N'CHURCAMPA', 9)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (85, N'HUAYTARA', 9)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (86, N'TAYACAJA', 9)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (87, N'HUANUCO', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (88, N'AMBO', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (89, N'DOS DE MAYO', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (90, N'HUACAYBAMBA', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (91, N'HUAMALIES', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (92, N'LEONCIO PRADO', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (93, N'MARA&Ntilde;ON', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (94, N'PACHITEA', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (95, N'PUERTO INCA', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (96, N'LAURICOCHA', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (97, N'YAROWILCA', 10)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (98, N'ICA', 11)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (99, N'CHINCHA', 11)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (100, N'NAZCA', 11)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (101, N'PALPA', 11)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (102, N'PISCO', 11)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (103, N'HUANCAYO', 12)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (104, N'CONCEPCION', 12)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (105, N'CHANCHAMAYO', 12)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (106, N'JAUJA', 12)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (107, N'JUNIN', 12)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (108, N'SATIPO', 12)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (109, N'TARMA', 12)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (110, N'YAULI', 12)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (111, N'CHUPACA', 12)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (112, N'TRUJILLO', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (113, N'ASCOPE', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (114, N'BOLIVAR', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (115, N'CHEPEN', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (116, N'JULCAN', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (117, N'OTUZCO', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (118, N'PACASMAYO', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (119, N'PATAZ', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (120, N'SANCHEZ CARRION', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (121, N'SANTIAGO DE CHUCO', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (122, N'GRAN CHIMU', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (123, N'VIRU', 13)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (124, N'CHICLAYO', 14)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (125, N'FERREÑAFE', 14)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (126, N'LAMBAYEQUE', 14)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (127, N'LIMA', 15)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (128, N'BARRANCA', 15)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (129, N'CAJATAMBO', 15)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (130, N'CANTA', 15)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (131, N'CAÑETE', 15)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (132, N'HUARAL', 15)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (133, N'HUAROCHIRI', 15)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (134, N'HUAURA', 15)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (135, N'OYON', 15)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (136, N'YAUYOS', 15)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (137, N'MAYNAS', 16)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (138, N'ALTO AMAZONAS', 16)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (139, N'LORETO', 16)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (140, N'MARISCAL RAMON CASTILLA', 16)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (141, N'REQUENA', 16)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (142, N'UCAYALI', 16)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (143, N'TAMBOPATA', 17)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (144, N'MANU', 17)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (145, N'TAHUAMANU', 17)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (146, N'MARISCAL NIETO', 18)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (147, N'GENERAL SANCHEZ CERRO', 18)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (148, N'ILO', 18)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (149, N'PASCO', 19)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (150, N'DANIEL ALCIDES CARRION', 19)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (151, N'OXAPAMPA', 19)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (152, N'PIURA', 20)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (153, N'AYABACA', 20)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (154, N'HUANCABAMBA', 20)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (155, N'MORROPON', 20)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (156, N'PAITA', 20)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (157, N'SULLANA', 20)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (158, N'TALARA', 20)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (159, N'SECHURA', 20)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (160, N'PUNO', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (161, N'AZANGARO', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (162, N'CARABAYA', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (163, N'CHUCUITO', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (164, N'EL COLLAO', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (165, N'HUANCANE', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (166, N'LAMPA', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (167, N'MELGAR', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (168, N'MOHO', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (169, N'SAN ANTONIO DE PUTINA', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (170, N'SAN ROMAN', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (171, N'SANDIA', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (172, N'YUNGUYO', 21)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (173, N'MOYOBAMBA', 22)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (174, N'BELLAVISTA', 22)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (175, N'EL DORADO', 22)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (176, N'HUALLAGA', 22)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (177, N'LAMAS', 22)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (178, N'MARISCAL CACERES', 22)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (179, N'PICOTA', 22)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (180, N'RIOJA', 22)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (181, N'SAN MARTIN', 22)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (182, N'TOCACHE', 22)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (183, N'TACNA', 23)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (184, N'CANDARAVE', 23)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (185, N'JORGE BASADRE', 23)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (186, N'TARATA', 23)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (187, N'TUMBES', 24)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (188, N'CONTRALMIRANTE VILLAR', 24)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (189, N'ZARUMILLA', 24)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (190, N'CORONEL PORTILLO', 25)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (191, N'ATALAYA', 25)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (192, N'PADRE ABAD', 25)
GO
INSERT [Cnfg].[Provincia] ([IdProvincia], [Provincia], [IdDepartamento]) VALUES (193, N'PURUS', 25)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (1, N'CENTRO', 2)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (1, N'CENTRO', 7)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (1, N'CENTRO', 9)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (1, N'CENTRO', 10)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (1, N'CENTRO', 11)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (1, N'CENTRO', 12)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (1, N'CENTRO', 15)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (1, N'CENTRO', 19)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (1, N'CENTRO', 22)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (1, N'CENTRO', 25)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (2, N'NORESTE', 16)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (3, N'NORTE', 1)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (3, N'NORTE', 6)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (3, N'NORTE', 13)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (3, N'NORTE', 14)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (3, N'NORTE', 20)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (3, N'NORTE', 24)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (4, N'SUR', 3)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (4, N'SUR', 4)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (4, N'SUR', 5)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (4, N'SUR', 8)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (4, N'SUR', 17)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (4, N'SUR', 18)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (4, N'SUR', 21)
GO
INSERT [Cnfg].[Zonas] ([IdZona], [Zona], [IdDepartament]) VALUES (4, N'SUR', 23)
GO
SET IDENTITY_INSERT [Core].[Cronograma] ON 
GO
INSERT [Core].[Cronograma] ([IdCronograma], [Idproyecto], [Orden], [Nombre], [FechaInicio], [FechaFin], [Seguimiento], [Estado], [FechaRegistro]) VALUES (1, 26, 1, N'aassdfasdfasdf', N'29/10/2021', N'31/10/2021', 0, 1, CAST(N'2021-10-20T15:00:01.483' AS DateTime))
GO
INSERT [Core].[Cronograma] ([IdCronograma], [Idproyecto], [Orden], [Nombre], [FechaInicio], [FechaFin], [Seguimiento], [Estado], [FechaRegistro]) VALUES (2, 26, 2, N'asdfasdfasd', N'14/10/2021', N'28/10/2021', 0, 1, CAST(N'2021-10-20T15:00:01.493' AS DateTime))
GO
INSERT [Core].[Cronograma] ([IdCronograma], [Idproyecto], [Orden], [Nombre], [FechaInicio], [FechaFin], [Seguimiento], [Estado], [FechaRegistro]) VALUES (3, 27, 1, N'prueba 1', N'18/11/2021', N'24/11/2021', 0, 1, CAST(N'2021-11-29T04:35:25.763' AS DateTime))
GO
INSERT [Core].[Cronograma] ([IdCronograma], [Idproyecto], [Orden], [Nombre], [FechaInicio], [FechaFin], [Seguimiento], [Estado], [FechaRegistro]) VALUES (4, 27, 2, N'prueba 2', N'24/11/2021', N'30/11/2021', 0, 1, CAST(N'2021-11-29T04:35:25.763' AS DateTime))
GO
SET IDENTITY_INSERT [Core].[Cronograma] OFF
GO
SET IDENTITY_INSERT [Core].[InsumosProyecto] ON 
GO
INSERT [Core].[InsumosProyecto] ([IdInsumoObra], [IdProyecto], [MaderaTipoA], [MaderaTipoB], [Concreto], [Aluminio], [PIN3], [PIN4], [Suspencion], [PAT1], [PAT2], [Pernos], [Abrazaderas], [Aisladores], [Monofasicos], [Bifasicos], [Trifasicos], [Transformadores], [Interruptores], [Contactores], [Medidores], [Fusibles], [Pararrayos], [Lotes], [MaderaSecundarioTipoA], [ConcretoSecundarioTipoA], [ConcretoSecundarioTipoB], [AluminioSecundario], [Alumbrado], [Retenidas], [PuestaTierra], [GrapaSuspencion], [GrapaAnclaje], [PernosSecundarios], [Conexiones], [PanelesSolares], [Celdas], [Inversor], [Soporte], [Estructura], [Cableado], [TipoRegistro], [TipoObra]) VALUES (7, 18, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
GO
INSERT [Core].[InsumosProyecto] ([IdInsumoObra], [IdProyecto], [MaderaTipoA], [MaderaTipoB], [Concreto], [Aluminio], [PIN3], [PIN4], [Suspencion], [PAT1], [PAT2], [Pernos], [Abrazaderas], [Aisladores], [Monofasicos], [Bifasicos], [Trifasicos], [Transformadores], [Interruptores], [Contactores], [Medidores], [Fusibles], [Pararrayos], [Lotes], [MaderaSecundarioTipoA], [ConcretoSecundarioTipoA], [ConcretoSecundarioTipoB], [AluminioSecundario], [Alumbrado], [Retenidas], [PuestaTierra], [GrapaSuspencion], [GrapaAnclaje], [PernosSecundarios], [Conexiones], [PanelesSolares], [Celdas], [Inversor], [Soporte], [Estructura], [Cableado], [TipoRegistro], [TipoObra]) VALUES (8, 19, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
GO
INSERT [Core].[InsumosProyecto] ([IdInsumoObra], [IdProyecto], [MaderaTipoA], [MaderaTipoB], [Concreto], [Aluminio], [PIN3], [PIN4], [Suspencion], [PAT1], [PAT2], [Pernos], [Abrazaderas], [Aisladores], [Monofasicos], [Bifasicos], [Trifasicos], [Transformadores], [Interruptores], [Contactores], [Medidores], [Fusibles], [Pararrayos], [Lotes], [MaderaSecundarioTipoA], [ConcretoSecundarioTipoA], [ConcretoSecundarioTipoB], [AluminioSecundario], [Alumbrado], [Retenidas], [PuestaTierra], [GrapaSuspencion], [GrapaAnclaje], [PernosSecundarios], [Conexiones], [PanelesSolares], [Celdas], [Inversor], [Soporte], [Estructura], [Cableado], [TipoRegistro], [TipoObra]) VALUES (9, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, 3, 3, 3, 1, 1, 1, 3, 3, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2)
GO
INSERT [Core].[InsumosProyecto] ([IdInsumoObra], [IdProyecto], [MaderaTipoA], [MaderaTipoB], [Concreto], [Aluminio], [PIN3], [PIN4], [Suspencion], [PAT1], [PAT2], [Pernos], [Abrazaderas], [Aisladores], [Monofasicos], [Bifasicos], [Trifasicos], [Transformadores], [Interruptores], [Contactores], [Medidores], [Fusibles], [Pararrayos], [Lotes], [MaderaSecundarioTipoA], [ConcretoSecundarioTipoA], [ConcretoSecundarioTipoB], [AluminioSecundario], [Alumbrado], [Retenidas], [PuestaTierra], [GrapaSuspencion], [GrapaAnclaje], [PernosSecundarios], [Conexiones], [PanelesSolares], [Celdas], [Inversor], [Soporte], [Estructura], [Cableado], [TipoRegistro], [TipoObra]) VALUES (10, 22, 9, 9, NULL, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
GO
INSERT [Core].[InsumosProyecto] ([IdInsumoObra], [IdProyecto], [MaderaTipoA], [MaderaTipoB], [Concreto], [Aluminio], [PIN3], [PIN4], [Suspencion], [PAT1], [PAT2], [Pernos], [Abrazaderas], [Aisladores], [Monofasicos], [Bifasicos], [Trifasicos], [Transformadores], [Interruptores], [Contactores], [Medidores], [Fusibles], [Pararrayos], [Lotes], [MaderaSecundarioTipoA], [ConcretoSecundarioTipoA], [ConcretoSecundarioTipoB], [AluminioSecundario], [Alumbrado], [Retenidas], [PuestaTierra], [GrapaSuspencion], [GrapaAnclaje], [PernosSecundarios], [Conexiones], [PanelesSolares], [Celdas], [Inversor], [Soporte], [Estructura], [Cableado], [TipoRegistro], [TipoObra]) VALUES (11, 23, 8, 8, 6, 4, 1, 5, 8, 8, 8, 7, 8, 8, 5, 1, 6, 7, 8, 7, 7, 8, 8, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
GO
INSERT [Core].[InsumosProyecto] ([IdInsumoObra], [IdProyecto], [MaderaTipoA], [MaderaTipoB], [Concreto], [Aluminio], [PIN3], [PIN4], [Suspencion], [PAT1], [PAT2], [Pernos], [Abrazaderas], [Aisladores], [Monofasicos], [Bifasicos], [Trifasicos], [Transformadores], [Interruptores], [Contactores], [Medidores], [Fusibles], [Pararrayos], [Lotes], [MaderaSecundarioTipoA], [ConcretoSecundarioTipoA], [ConcretoSecundarioTipoB], [AluminioSecundario], [Alumbrado], [Retenidas], [PuestaTierra], [GrapaSuspencion], [GrapaAnclaje], [PernosSecundarios], [Conexiones], [PanelesSolares], [Celdas], [Inversor], [Soporte], [Estructura], [Cableado], [TipoRegistro], [TipoObra]) VALUES (12, 24, 7, 7, 7, 7, 7, 7, NULL, 7, 7, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
GO
INSERT [Core].[InsumosProyecto] ([IdInsumoObra], [IdProyecto], [MaderaTipoA], [MaderaTipoB], [Concreto], [Aluminio], [PIN3], [PIN4], [Suspencion], [PAT1], [PAT2], [Pernos], [Abrazaderas], [Aisladores], [Monofasicos], [Bifasicos], [Trifasicos], [Transformadores], [Interruptores], [Contactores], [Medidores], [Fusibles], [Pararrayos], [Lotes], [MaderaSecundarioTipoA], [ConcretoSecundarioTipoA], [ConcretoSecundarioTipoB], [AluminioSecundario], [Alumbrado], [Retenidas], [PuestaTierra], [GrapaSuspencion], [GrapaAnclaje], [PernosSecundarios], [Conexiones], [PanelesSolares], [Celdas], [Inversor], [Soporte], [Estructura], [Cableado], [TipoRegistro], [TipoObra]) VALUES (14, 26, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
GO
INSERT [Core].[InsumosProyecto] ([IdInsumoObra], [IdProyecto], [MaderaTipoA], [MaderaTipoB], [Concreto], [Aluminio], [PIN3], [PIN4], [Suspencion], [PAT1], [PAT2], [Pernos], [Abrazaderas], [Aisladores], [Monofasicos], [Bifasicos], [Trifasicos], [Transformadores], [Interruptores], [Contactores], [Medidores], [Fusibles], [Pararrayos], [Lotes], [MaderaSecundarioTipoA], [ConcretoSecundarioTipoA], [ConcretoSecundarioTipoB], [AluminioSecundario], [Alumbrado], [Retenidas], [PuestaTierra], [GrapaSuspencion], [GrapaAnclaje], [PernosSecundarios], [Conexiones], [PanelesSolares], [Celdas], [Inversor], [Soporte], [Estructura], [Cableado], [TipoRegistro], [TipoObra]) VALUES (15, 27, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
GO
SET IDENTITY_INSERT [Core].[InsumosProyecto] OFF
GO
INSERT [Core].[Perfiles] ([IdOption], [OptionName], [OptionUrl], [OptionIcon], [Descripcion]) VALUES (1, N'Cartera de Proyectos', N'cartera', N'fa fa-folder-open', N'A')
GO
INSERT [Core].[Perfiles] ([IdOption], [OptionName], [OptionUrl], [OptionIcon], [Descripcion]) VALUES (2, N'Programar Visita', N'programar', N'far fa-address-book', N'A')
GO
INSERT [Core].[Perfiles] ([IdOption], [OptionName], [OptionUrl], [OptionIcon], [Descripcion]) VALUES (3, N'Registrar Informe', N'registrar', N'fa fa-edit', N'A')
GO
INSERT [Core].[Perfiles] ([IdOption], [OptionName], [OptionUrl], [OptionIcon], [Descripcion]) VALUES (4, N'Reportes', N'reportes', N'fas fa-copy', N'A')
GO
INSERT [Core].[Perfiles] ([IdOption], [OptionName], [OptionUrl], [OptionIcon], [Descripcion]) VALUES (5, N'Cronograma', N'actividades', N'fas fa-calendar-check', N'A')
GO
SET IDENTITY_INSERT [Core].[Programacion] ON 
GO
INSERT [Core].[Programacion] ([IdProgramacion], [IdProyecto], [IdCoordinador], [FechaRegistro], [Estado], [FechaInicio], [FechaFin]) VALUES (1010, 1, 2, CAST(N'2021-09-04T00:00:00.000' AS DateTime), 1, N'08/09/2021', N'29/09/2021')
GO
INSERT [Core].[Programacion] ([IdProgramacion], [IdProyecto], [IdCoordinador], [FechaRegistro], [Estado], [FechaInicio], [FechaFin]) VALUES (1011, 6, 1, CAST(N'2021-09-04T00:00:00.000' AS DateTime), 1, N'01/09/2021', N'30/09/2021')
GO
INSERT [Core].[Programacion] ([IdProgramacion], [IdProyecto], [IdCoordinador], [FechaRegistro], [Estado], [FechaInicio], [FechaFin]) VALUES (1012, 4, 5, CAST(N'2021-09-04T00:00:00.000' AS DateTime), 1, N'08/09/2021', N'30/09/2021')
GO
INSERT [Core].[Programacion] ([IdProgramacion], [IdProyecto], [IdCoordinador], [FechaRegistro], [Estado], [FechaInicio], [FechaFin]) VALUES (1013, 23, 1004, CAST(N'2021-10-09T00:00:00.000' AS DateTime), 1, N'05/10/2021', N'30/10/2021')
GO
INSERT [Core].[Programacion] ([IdProgramacion], [IdProyecto], [IdCoordinador], [FechaRegistro], [Estado], [FechaInicio], [FechaFin]) VALUES (1014, 24, 1003, CAST(N'2021-10-09T00:00:00.000' AS DateTime), 1, N'28/10/2021', N'11/11/2021')
GO
INSERT [Core].[Programacion] ([IdProgramacion], [IdProyecto], [IdCoordinador], [FechaRegistro], [Estado], [FechaInicio], [FechaFin]) VALUES (1015, 27, 3, CAST(N'2021-11-29T00:00:00.000' AS DateTime), 1, N'01/11/2021', N'30/11/2021')
GO
SET IDENTITY_INSERT [Core].[Programacion] OFF
GO
SET IDENTITY_INSERT [Core].[Proyectos] ON 
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (1, N'2229590', N'INSTALACION DEL SERVICIO PUBLICO DE ELECTRICIDAD EN 08 LOCALIDADES DEL VALLE DE CAYNARACHI Y EL BAJO HUALLAGA, DISTRITOS DE BARRANQUITA Y EL PORVENIR, PROVINCIA DE LAMAS Y SAN MARTIN, DEPARTAMENTO DE SAN MARTIN', N'NO', 101, 205, 301, 22, 177, 1727, N'PP0046', 401, N'1,902,416', 1, 1, 1, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (2, N'2095022', N'SER SANTA CRUZ-CHOTA-BAMBAMARCA IV ETAPA- II FASE', N'NO', 101, 205, 301, 6, 57, NULL, N'PP0046', 401, N'31,015,895', 1, 3, 0, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (3, N'2132592', N'SISTEMA ELÉCTRICO RURAL JIMBE – PAMPAROMAS IV ETAPA', N'NO', 101, 205, 301, 2, 19, NULL, N'PP0046', 401, N'5,795,248', 1, 1, 0, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (4, N'2132591', N'SISTEMA ELECTRICO RURAL CHEPEN-GUADALUPE II ETAPA', N'NO', 101, 205, 301, 13, 115, NULL, N'PP0046', 401, N'7,476,177', 1, 3, 1, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (5, N'2132588', N'SISTEMA ELECTRICO RURAL HUAMACHUCO III ETAPA', N'NO', 101, 205, 301, 13, 120, NULL, N'PP0046', 401, N'10,297,034', 1, 3, 0, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (6, N'2132584', N'SISTEMA ELECTRICO RURAL TOCACHE III ETAPA ', N'NO', 101, 201, 301, 22, 182, NULL, N'PP0046', 401, N'3,871,840', 1, 1, 1, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (18, N'6969', N'proyecto de prueba', N'NO', 102, 202, 303, 2, 10, 103, N'test', 401, N'6969696969', 1, 2, 0, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (19, N'464646', N'adfasdf', N'SI', 101, 202, 302, 4, 37, 370, N'asasdf', 401, N'1646461', 1, 2, 0, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (20, N'45454545', N'test 2', N'NO', 104, 205, 304, 3, 31, 297, N'aaaa', 401, N'10,297,034', 1, 2, 0, 2, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (21, N'7887878', N'test 3', N'NO', 102, 205, 303, 3, 31, 297, N'eeee', 401, N'10,297,034', 1, 3, 0, 2, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (22, N'151515', N'proyecto de prueba 13', N'NO', 101, 205, 303, 15, 127, 1266, N'prueba', 401, N'7,476,177', 1, 1, 0, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (23, N'1313', N'proyecto prueba 26', N'NO', 101, 205, 302, 5, 43, 450, N'5', 401, N'7,476,177', 1, 4, 1, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (24, N'45646', N'test', N'NO', 101, 205, 303, 5, 48, 492, N'789', 401, N'10,297,034', 1, 4, 1, 1, NULL)
GO
INSERT [Core].[Proyectos] ([IdProyecto], [Codigo], [Nombre], [Transferencia], [IdTipoInversion], [IdCicloInversion], [IdNaturaleza], [IdDepartamento], [IdProvincia], [IdDistrito], [Programa], [IdModalidad], [Costo], [Estado], [IdZona], [Asignado], [IdTipoProyecto], [FechaRegistro]) VALUES (26, N'13131313', N'proyecto de prueba', N'SI', 104, 203, 306, 2, 12, 114, N'adfsaf', 401, N'66666666666666666', 1, 1, 0, 1, NULL)
GO
SET IDENTITY_INSERT [Core].[Proyectos] OFF
GO
SET IDENTITY_INSERT [Core].[Usuario] ON 
GO
INSERT [Core].[Usuario] ([IdUsuario], [correo], [estado]) VALUES (1, N'aalcarraznunnez@gmail.com', 1)
GO
SET IDENTITY_INSERT [Core].[Usuario] OFF
GO
ALTER TABLE [Cnfg].[Departamento] ADD  DEFAULT (NULL) FOR [Departamento]
GO
ALTER TABLE [Cnfg].[Distrito] ADD  DEFAULT (NULL) FOR [Distrito]
GO
ALTER TABLE [Cnfg].[Distrito] ADD  DEFAULT (NULL) FOR [IdProvincia]
GO
ALTER TABLE [Cnfg].[Maestra] ADD  DEFAULT (NULL) FOR [IdTipo]
GO
ALTER TABLE [Cnfg].[Maestra] ADD  DEFAULT (NULL) FOR [Descripcion1]
GO
ALTER TABLE [Cnfg].[Maestra] ADD  DEFAULT (NULL) FOR [Descripcion2]
GO
ALTER TABLE [Cnfg].[Maestra] ADD  DEFAULT (NULL) FOR [Descripcion3]
GO
ALTER TABLE [Cnfg].[Maestra] ADD  DEFAULT (NULL) FOR [Estado]
GO
ALTER TABLE [Cnfg].[Provincia] ADD  DEFAULT (NULL) FOR [Provincia]
GO
ALTER TABLE [Cnfg].[Provincia] ADD  DEFAULT (NULL) FOR [IdDepartamento]
GO
ALTER TABLE [Cnfg].[Zonas] ADD  DEFAULT (NULL) FOR [Zona]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [Codigo]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [Nombre]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [Transferencia]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [IdTipoInversion]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [IdCicloInversion]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [IdNaturaleza]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [IdDepartamento]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [IdProvincia]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [IdDistrito]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [Programa]
GO
ALTER TABLE [Core].[Proyectos] ADD  DEFAULT (NULL) FOR [IdModalidad]
GO
/****** Object:  StoredProcedure [Core].[USP_GET_CronogramaByIdProyecto]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene el detalle de un proyecto
--Change:	   -
--Example:     [Core].[USP_GET_CronogramaByIdProyecto]   25

--================================================= 
CREATE PROC [Core].[USP_GET_CronogramaByIdProyecto]     
@IdProyecto INT
AS    
 SET FMTONLY OFF;    
 SET NOCOUNT ON;    

SELECT 

IdCronograma,
IdProyecto,
Orden,
Nombre,
FechaInicio,
FechaFin,
Seguimiento,
Estado

FROM [Core].[Cronograma]
WHERE IdProyecto = @IdProyecto
GO
/****** Object:  StoredProcedure [Core].[USP_GET_PersonByEmail]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene listado de trabajadores
--Change:	   -
--Example:     [Core].[USP_GET_PersonByEmail]  

--================================================= 
CREATE PROC [Core].[USP_GET_PersonByEmail]      
@Email VARCHAR(MAX)
AS

 SET FMTONLY OFF;    
 SET NOCOUNT ON;   

SELECT 
CONCAT(Nombre,' ',ApellidoPaterno,' ',ApellidoMaterno) AS [User],
Correo as Email,
Cargo as UserEdit
FROM [Cnfg].[Personal]
WHERE Correo = @Email


  
GO
/****** Object:  StoredProcedure [Core].[USP_GET_PersonByPerfil]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene listado de trabajadores
--Change:	   -
--Example: [Core].[USP_GET_PersonByPerfil]    

--================================================= 
CREATE PROC [Core].[USP_GET_PersonByPerfil]      
@Descripcion CHAR(1)
AS

 SET FMTONLY OFF;    
 SET NOCOUNT ON;   

SELECT 
OptionName,
OptionUrl,
OptionIcon
FROM [Core].[Perfiles]
WHERE Descripcion = @Descripcion


  
GO
/****** Object:  StoredProcedure [Core].[USP_GET_ProyectoById]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene el detalle de un proyecto
--Change:	   -
--Example:     [Core].[USP_GET_ProyectoById]  25

--================================================= 
CREATE PROC [Core].[USP_GET_ProyectoById]     
@IdProyecto INT
AS    
 SET FMTONLY OFF;    
 SET NOCOUNT ON;    

SELECT 
	proy.IdProyecto,
	Codigo,
	proy.Nombre,
	Transferencia,
	proy.IdDepartamento,
	mi.Descripcion1 AS InversionDescripcion,
	mc.Descripcion1 AS CicloDescripcion,
	mn.Descripcion1 AS NaturalezaDescripcion,
	mm.Descripcion1 AS Modalidad,
	dep.Departamento,
	pro.Provincia,
	ISNULL(dis.Distrito,'Varios') AS Distrito,
	Costo,
	CONCAT(prog.FechaInicio,' - ',prog.FechaFin) AS FechaVisita,
	CONCAT(per.Nombre,' ',per.ApellidoPaterno,' ',per.ApellidoMaterno) AS NombresCompleto

FROM Core.Proyectos proy 
		INNER JOIN Cnfg.Maestra mi
	ON proy.IdTipoInversion = mi.Id
		INNER JOIN Cnfg.Maestra mc
	ON proy.IdCicloInversion = mc.Id
		INNER JOIN Cnfg.Maestra mn
	ON proy.IdNaturaleza = mn.Id
		INNER JOIN Cnfg.Maestra mm
	ON proy.IdModalidad = mm.Id
		INNER JOIN Cnfg.Departamento dep
	ON proy.IdDepartamento = dep.IdDepartamento
		INNER JOIN Cnfg.Provincia pro
	ON proy.IdProvincia = pro.IdProvincia
		LEFT JOIN Cnfg.Distrito dis
	ON proy.IdDistrito = dis.IdDistrito
		LEFT JOIN [Core].[Programacion] prog 
	ON proy.IdProyecto = prog.IdProyecto
		LEFT JOIN [Cnfg].[Personal] per
	ON prog.IdCoordinador = per.IdCoordinador

WHERE proy.IdProyecto = @IdProyecto



GO
/****** Object:  StoredProcedure [Core].[USP_LIST_Master]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene el listado de la tabla maestra
--Change:	   -
--Example:     [Core].[USP_LIST_Master]  

--================================================= 
CREATE PROC [Core].[USP_LIST_Master]     
AS

 SET FMTONLY OFF;    
 SET NOCOUNT ON;   

SELECT 
	Id,
	IdTipo,
	Descripcion1
FROM [Cnfg].[Maestra]
WHERE Descripcion2 = 1 AND Estado = 1



GO
/****** Object:  StoredProcedure [Core].[USP_LIST_Programacion]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene listado de trabajadores
--Change:	   -
--Example:     [Core].[USP_LIST_Programacion]  

--================================================= 
CREATE PROC [Core].[USP_LIST_Programacion]      
AS

 SET FMTONLY OFF;    
 SET NOCOUNT ON;   

SELECT 
	IdProgramacion,
	pro.IdProyecto,
	pry.Codigo,
	pry.Nombre,
	pro.IdCoordinador,
	CONCAT(per.Nombre,' ',per.ApellidoPaterno,' ',per.ApellidoMaterno) AS NombreCompleto,
	CONVERT(VARCHAR(10),pro.FechaRegistro,103) AS FechaRegistro,
	CASE pro.Estado WHEN 1 THEN 'Activo' END AS Estado,
	CASE pry.Asignado WHEN 1 THEN 'Asignado' END As Asignado
FROM [Core].[Programacion] pro
	INNER JOIN [Core].[Proyectos] pry ON pro.IdProyecto = pry.idProyecto
	INNER JOIN [Cnfg].[Personal] per ON pro.IdCoordinador = per.IdCoordinador
WHERE pro.Estado = 1





GO
/****** Object:  StoredProcedure [Core].[USP_LIST_Proyectos]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene el listado de Proyectos
--Change:	   -
--Example:     [Core].[USP_LIST_Proyectos]  

--================================================= 
CREATE PROC [Core].[USP_LIST_Proyectos]     
AS

 SET FMTONLY OFF;    
 SET NOCOUNT ON;   

SELECT 
	proy.IdProyecto,
	Codigo,
	proy.Nombre,
	Transferencia,
	mi.Descripcion1 AS InversionDescripcion,
	mc.Descripcion1 AS CicloDescripcion,
	mn.Descripcion1 AS NaturalezaDescripcion,
	dep.Departamento,
	Costo

FROM Core.Proyectos proy 
	INNER JOIN Cnfg.Maestra mi
	ON proy.IdTipoInversion = mi.Id
	INNER JOIN Cnfg.Maestra mc
	ON proy.IdCicloInversion = mc.Id
	INNER JOIN Cnfg.Maestra mn
	ON proy.IdNaturaleza = mn.Id
	INNER JOIN Cnfg.Departamento dep
	ON proy.IdDepartamento = dep.IdDepartamento



GO
/****** Object:  StoredProcedure [Core].[USP_LIST_ProyectosCodigo]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene los codigos de Proyectos
--Change:	   -
--Example:     [Core].[USP_LIST_ProyectosCodigo]  

--================================================= 
CREATE PROC [Core].[USP_LIST_ProyectosCodigo]     
AS

 SET FMTONLY OFF;    
 SET NOCOUNT ON;   

SELECT 
	IdProyecto
	,Codigo
FROM Core.Proyectos 
WHERE Estado = 1 AND Asignado <> 1
GO
/****** Object:  StoredProcedure [Core].[USP_LIST_ProyectosCronograma]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene el listado de Proyectos
--Change:	   -
--Example:     [Core].[USP_LIST_ProyectosCronograma]

--================================================= 
CREATE PROC [Core].[USP_LIST_ProyectosCronograma]   
--@IdProyecto INT
AS

 SET FMTONLY OFF;    
 SET NOCOUNT ON;   

	SELECT 
		IdCronograma,
		Idproyecto,
		Orden,
		Nombre,
		FechaInicio,
		FechaFin,
		Seguimiento,
		Estado
	FROM [Core].[Cronograma] cro
	--WHERE Idproyecto = @IdProyecto
GO
/****** Object:  StoredProcedure [Core].[USP_LIST_ProyectosInsumos]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene el listado de Proyectos
--Change:	   -
--Example:  exec   [Core].[USP_LIST_ProyectosInsumos]

--================================================= 
CREATE PROC [Core].[USP_LIST_ProyectosInsumos]     
AS

 SET FMTONLY OFF;    
 SET NOCOUNT ON;   

SELECT 
	   ins.IdProyecto
	  ,proy.Codigo
      ,MaderaTipoA
      ,MaderaTipoB
      ,Concreto
      ,Aluminio
      ,PIN3
      ,PIN4
      ,Suspencion
      ,PAT1
      ,PAT2
      ,Pernos
      ,Abrazaderas
      ,Aisladores
      ,Monofasicos
      ,Bifasicos
      ,Trifasicos
      ,Transformadores
      ,Interruptores
      ,Contactores
      ,Medidores
      ,Fusibles
      ,Pararrayos
      ,Lotes
      ,MaderaSecundarioTipoA
      ,ConcretoSecundarioTipoA
      ,ConcretoSecundarioTipoB
      ,AluminioSecundario
      ,Alumbrado
      ,Retenidas
      ,PuestaTierra
      ,GrapaSuspencion
      ,GrapaAnclaje
      ,PernosSecundarios
      ,Conexiones
      ,PanelesSolares
      ,Celdas
      ,Inversor
      ,Soporte
      ,Estructura
      ,Cableado
      ,TipoRegistro
      ,TipoObra

FROM [Core].[InsumosProyecto] ins 
	INNER JOIN [Core].[Proyectos] proy
	ON proy.IdProyecto = ins.IdProyecto


	SELECT 
		IdCronograma,
		Idproyecto,
		Orden,
		Nombre,
		FechaInicio,
		FechaFin,
		Seguimiento,
		Estado
	FROM [Core].[Cronograma] cro
GO
/****** Object:  StoredProcedure [Core].[USP_LIST_ProyectosRpt]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Core].[USP_LIST_ProyectosRpt]
--=================================================
--Author:      Alberto Alcarraz
--CREATE Date: 22/11/2021
--Description: Obtiene el listado de Reporte
--Change:	   -
--Example:     exec  [Core].[USP_LIST_ProyectosRpt]
--=================================================
AS
BEGIN
	SET NOCOUNT ON;
	SELECT	
	Codigo AS CODIGO,
	Nombre AS PROYECTO,
	Transferencia AS TRANSFERENCIA,
	ti.Descripcion1 AS TIPO_INVERSION,
	ci.Descripcion1 AS CICLO_INVERSION,
	na.Descripcion1 AS NATURALEZA,
	im.Descripcion1 AS MODALIDAD,
	--tp.Descripcion1,
	iz.Zona AS ZONA,
	Costo AS COSTO,
	dp.Departamento AS DEPARTAMENTO,
	pr.Provincia AS PROVINCIA,
	ISNULL(di.Distrito,'') AS DISTRITO

	FROM [Core].[Proyectos] py
	INNER JOIN Cnfg.Maestra ti ON ti.Id = py.IdTipoInversion
	INNER JOIN Cnfg.Maestra ci ON ci.Id = py.IdCicloInversion
	INNER JOIN Cnfg.Maestra na ON na.Id = py.IdNaturaleza
	INNER JOIN Cnfg.Maestra im ON im.Id = py.IdModalidad
	--INNER JOIN Cnfg.Maestra tp ON tp.Id = py.IdTipoProyecto
	INNER JOIN Cnfg.Zonas iz ON iz.IdDepartament = py.IdDepartamento
	INNER JOIN Cnfg.Departamento dp ON dp.IdDepartamento = py.IdDepartamento
	INNER JOIN Cnfg.Provincia pr ON pr.IdProvincia  = py.IdProvincia
	LEFT JOIN Cnfg.Distrito di ON di.IdDistrito = py.IdDistrito

END
GO
/****** Object:  StoredProcedure [Core].[USP_LIST_Ubigeo]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene Ubigeo
--Change:	   -
--Example:     [Core].[USP_LIST_Ubigeo]  

--================================================= 
CREATE PROC [Core].[USP_LIST_Ubigeo]     
AS

 SET FMTONLY OFF;    
 SET NOCOUNT ON;   

SELECT 
	IdDepartamento,
	Departamento
FROM [Cnfg].[Departamento]

SELECT 
	IdProvincia,
	Provincia,
	IdDepartamento
FROM [Cnfg].[Provincia]

SELECT 
	IdDistrito,
	Distrito,
	IdProvincia
FROM [Cnfg].[Distrito]

SELECT 
	IdProyecto,
	Codigo,
	Nombre,
	IdDepartamento,
	IdProvincia,
	ISNULL(IdDistrito,'-1') AS IdDistrito,
	IdZona
FROM Core.Proyectos proy 
WHERE proy.Estado = 1

SELECT 
	IdCoordinador,
	Nombre,
	ApellidoPaterno,
	ApellidoMaterno,
	CONCAT(Nombre,' ',ApellidoPaterno,' ',ApellidoMaterno) AS NombreCompleto,
	Correo,
	Telefono,
	Estado,
	IdZona
FROM [Cnfg].[Personal]
WHERE Estado = 1 AND Asignado <> 1

SELECT 
	IdZona,
	Zona,
	IdDepartament
FROM [Cnfg].[Zonas]

SELECT 
	Id,
	IdTipo,
	Descripcion1
FROM [Cnfg].[Maestra]
WHERE Descripcion2 = 1 AND Estado = 1




GO
/****** Object:  StoredProcedure [Core].[USP_REG_Cronograma]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene listado de trabajadores
--Change:	   -
--Example:     [Core].[USP_REG_Cronograma]  

--================================================= 
CREATE PROC [Core].[USP_REG_Cronograma]      

 @IdCronograma	INT
,@Idproyecto	INT
,@Orden	INT
,@Nombre VARCHAR(MAX)
,@FechaInicio VARCHAR(10)
,@FechaFin VARCHAR(10)
,@Seguimiento INT
,@Estado INT

AS
BEGIN

	MERGE Core.Cronograma	AS	TARGET
	USING(
		SELECT   @IdCronograma
				,@Idproyecto	
				,@Orden	
				,@Nombre 
				,@FechaInicio 
				,@FechaFin 
				,@Seguimiento 
				,@Estado 
				
		)	AS SOURCE	(
				 IdCronograma
				,Idproyecto	
				,Orden	
				,Nombre 
				,FechaInicio 
				,FechaFin 
				,Seguimiento 
				,Estado
		)
	ON (TARGET.IdCronograma = SOURCE.IdCronograma)
	WHEN NOT MATCHED THEN
		INSERT 
		(	 
			 Idproyecto	
			,Orden	
			,Nombre 
			,FechaInicio 
			,FechaFin 
			,Seguimiento 
			,Estado
			,FechaRegistro
		)
		VALUES
		(	
	
			 SOURCE.Idproyecto
			,SOURCE.Orden
			,SOURCE.Nombre
			,SOURCE.FechaInicio
			,SOURCE.FechaFin
			,SOURCE.Seguimiento
			,SOURCE.Estado
			,GETDATE()
		)
	
	OUTPUT
		inserted.IdCronograma;
END





GO
/****** Object:  StoredProcedure [Core].[USP_REG_Insumos]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================  
--Author: Alberto Alcarraz Núñez  
--Create Date: 13/08/2021  
--Description: registra los insumos por proyecto  
--Change:    -  
--Example:   [Core].[USP_REG_Insumos] 
  
--=================================================   
CREATE PROC [Core].[USP_REG_Insumos]        
	@IdInsumoObra INT,
	@IdProyecto INT,
	@MaderaTipoA INT,
	@MaderaTipoB INT,
	@Concreto INT,
	@Aluminio INT,
	@PIN3 INT,
	@PIN4 INT,
	@Suspencion INT,
	@PAT1 INT,
	@PAT2 INT,
	@Pernos INT,
	@Abrazaderas INT,
	@Aisladores INT,
	@Monofasicos INT,
	@Bifasicos INT,
	@Trifasicos INT,
	@Transformadores INT,
	@Interruptores INT,
	@Contactores INT,
	@Medidores INT,
	@Fusibles INT,
	@Pararrayos INT,
	@Lotes INT,
	@MaderaSecundarioTipoA INT,
	@ConcretoSecundarioTipoA INT,
	@ConcretoSecundarioTipoB INT,
	@AluminioSecundario INT,
	@Alumbrado INT,
	@Retenidas INT,
	@PuestaTierra INT,
	@GrapaSuspencion INT,
	@GrapaAnclaje INT,
	@PernosSecundarios INT,
	@Conexiones INT,
	@PanelesSolares INT,
	@Celdas INT,
	@Inversor INT,
	@Soporte INT,
	@Estructura INT,
	@Cableado INT,
	@TipoRegistro INT,
	@TipoObra INT
AS  
BEGIN  
  
 MERGE [Core].[InsumosProyecto] AS TARGET  
 USING(  
  SELECT
	 @IdInsumoObra
	,@IdProyecto
	,@MaderaTipoA
	,@MaderaTipoB
	,@Concreto
	,@Aluminio
	,@PIN3
	,@PIN4
	,@Suspencion
	,@PAT1
	,@PAT2
	,@Pernos
	,@Abrazaderas 
	,@Aisladores
	,@Monofasicos
	,@Bifasicos
	,@Trifasicos 
	,@Transformadores 
	,@Interruptores 
	,@Contactores
	,@Medidores 
	,@Fusibles 
	,@Pararrayos 
	,@Lotes
	,@MaderaSecundarioTipoA 
	,@ConcretoSecundarioTipoA 
	,@ConcretoSecundarioTipoB 
	,@AluminioSecundario 
	,@Alumbrado 
	,@Retenidas 
	,@PuestaTierra 
	,@GrapaSuspencion
	,@GrapaAnclaje 
	,@PernosSecundarios
	,@Conexiones 
	,@PanelesSolares 
	,@Celdas
	,@Inversor 
	,@Soporte
	,@Estructura
	,@Cableado
	,@TipoRegistro
	,@TipoObra
      
  ) AS SOURCE (
     IdInsumoObra
	,IdProyecto
	,MaderaTipoA
	,MaderaTipoB
	,Concreto
	,Aluminio
	,PIN3
	,PIN4
	,Suspencion
	,PAT1
	,PAT2
	,Pernos
	,Abrazaderas 
	,Aisladores
	,Monofasicos
	,Bifasicos
	,Trifasicos 
	,Transformadores 
	,Interruptores 
	,Contactores
	,Medidores 
	,Fusibles 
	,Pararrayos 
	,Lotes
	,MaderaSecundarioTipoA 
	,ConcretoSecundarioTipoA 
	,ConcretoSecundarioTipoB 
	,AluminioSecundario 
	,Alumbrado 
	,Retenidas 
	,PuestaTierra 
	,GrapaSuspencion
	,GrapaAnclaje 
	,PernosSecundarios
	,Conexiones 
	,PanelesSolares 
	,Celdas
	,Inversor 
	,Soporte
	,Estructura
	,Cableado
	,TipoRegistro
	,TipoObra
  )  
 ON (TARGET.IdInsumoObra = SOURCE.IdInsumoObra)  
 WHEN NOT MATCHED THEN  
  INSERT   
  ( 
	 IdProyecto
	,MaderaTipoA
	,MaderaTipoB
	,Concreto
	,Aluminio
	,PIN3
	,PIN4
	,Suspencion
	,PAT1
	,PAT2
	,Pernos
	,Abrazaderas 
	,Aisladores
	,Monofasicos
	,Bifasicos
	,Trifasicos 
	,Transformadores 
	,Interruptores 
	,Contactores
	,Medidores 
	,Fusibles 
	,Pararrayos 
	,Lotes
	,MaderaSecundarioTipoA 
	,ConcretoSecundarioTipoA 
	,ConcretoSecundarioTipoB 
	,AluminioSecundario 
	,Alumbrado 
	,Retenidas 
	,PuestaTierra 
	,GrapaSuspencion
	,GrapaAnclaje 
	,PernosSecundarios
	,Conexiones 
	,PanelesSolares 
	,Celdas
	,Inversor 
	,Soporte
	,Estructura
	,Cableado
	,TipoRegistro
	,TipoObra
  )  
  VALUES  
  (   
	 SOURCE.IdProyecto
	,SOURCE.MaderaTipoA
	,SOURCE.MaderaTipoB
	,SOURCE.Concreto
	,SOURCE.Aluminio
	,SOURCE.PIN3
	,SOURCE.PIN4
	,SOURCE.Suspencion
	,SOURCE.PAT1
	,SOURCE.PAT2
	,SOURCE.Pernos
	,SOURCE.Abrazaderas 
	,SOURCE.Aisladores
	,SOURCE.Monofasicos
	,SOURCE.Bifasicos
	,SOURCE.Trifasicos 
	,SOURCE.Transformadores 
	,SOURCE.Interruptores 
	,SOURCE.Contactores
	,SOURCE.Medidores 
	,SOURCE.Fusibles 
	,SOURCE.Pararrayos 
	,SOURCE.Lotes
	,SOURCE.MaderaSecundarioTipoA 
	,SOURCE.ConcretoSecundarioTipoA 
	,SOURCE.ConcretoSecundarioTipoB 
	,SOURCE.AluminioSecundario 
	,SOURCE.Alumbrado 
	,SOURCE.Retenidas 
	,SOURCE.PuestaTierra 
	,SOURCE.GrapaSuspencion
	,SOURCE.GrapaAnclaje 
	,SOURCE.PernosSecundarios
	,SOURCE.Conexiones 
	,SOURCE.PanelesSolares 
	,SOURCE.Celdas
	,SOURCE.Inversor 
	,SOURCE.Soporte
	,SOURCE.Estructura
	,SOURCE.Cableado
	,SOURCE.TipoRegistro
	,SOURCE.TipoObra
  )  
   
 OUTPUT
  inserted.IdInsumoObra;
END  
  
GO
/****** Object:  StoredProcedure [Core].[USP_REG_Programacion]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene listado de trabajadores
--Change:	   -
--Example:     [Core].[USP_REG_Programacion]  

--================================================= 
CREATE PROC [Core].[USP_REG_Programacion]      

 @IdProyecto	INT
,@IdCoordinador	INT
,@FechaRegistro	DATE
,@Estado INT
,@FechaInicio VARCHAR(10)
,@FechaFin VARCHAR(10)

AS
BEGIN

	MERGE	[Core].[Programacion]	AS	TARGET
	USING(
		SELECT	 @IdProyecto		
				,@IdCoordinador
				,@FechaRegistro		
				,@Estado
				,@FechaInicio
				,@FechaFin
				
		)	AS SOURCE	(
				 IdProyecto		
				,IdCoordinador
				,FechaRegistro		
				,Estado
				,FechaInicio
				,FechaFin
		)
	ON (TARGET.IdProyecto = SOURCE.IdProyecto AND TARGET.IdCoordinador = SOURCE.IdCoordinador)
	WHEN NOT MATCHED THEN
		INSERT 
		(	IdProyecto		
			,IdCoordinador
			,FechaRegistro		
			,Estado
			,FechaInicio
			,FechaFin
		)
		VALUES
		(	
			 SOURCE.IdProyecto
			,SOURCE.IdCoordinador
			,SOURCE.FechaRegistro
			,SOURCE.Estado
			,SOURCE.FechaInicio
			,SOURCE.FechaFin
		)
	
	OUTPUT
		inserted.IdProgramacion;
	
END





GO
/****** Object:  StoredProcedure [Core].[USP_REG_Proyecto]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================  
--Author: Alberto Alcarraz Núñez  
--Create Date: 13/08/2021  
--Description: registra un nuevo proyecto  
--Change:    -  
--Example:     [Core].[USP_REG_Proyecto]    
  
--=================================================   
CREATE PROC [Core].[USP_REG_Proyecto]        
 @IdProyecto INT 
,@Codigo VARCHAR(25)  
,@Nombre VARCHAR(MAX)  
,@Transferencia VARCHAR(5)  
,@IdTipoInversion INT
,@IdCicloInversion INT
,@IdNaturaleza INT
,@IdDepartamento INT
,@IdProvincia INT
,@IdDistrito INT
,@Programa VARCHAR(10)  
,@IdModalidad INT
,@Costo VARCHAR(MAX)  
,@Estado INT
,@IdZona INT
,@Asignado INT
,@IdTipoProyecto INT

  
AS  
BEGIN  
  
 MERGE [Core].[Proyectos] AS TARGET  
 USING(  
  SELECT
	 @IdProyecto
	,@Codigo
	,@Nombre
	,@Transferencia
	,@IdTipoInversion
	,@IdCicloInversion
	,@IdNaturaleza
	,@IdDepartamento
	,@IdProvincia
	,@IdDistrito
	,@Programa
	,@IdModalidad
	,@Costo
	,@Estado
	,@IdZona
	,@Asignado
	,@IdTipoProyecto
      
  ) AS SOURCE (
	 IdProyecto
	,Codigo
	,Nombre
	,Transferencia
	,IdTipoInversion
	,IdCicloInversion
	,IdNaturaleza
	,IdDepartamento
	,IdProvincia
	,IdDistrito
	,Programa
	,IdModalidad
	,Costo
	,Estado
	,IdZona
	,Asignado
	,IdTipoProyecto
  )  
 ON (TARGET.IdProyecto = SOURCE.IdProyecto)  
 WHEN NOT MATCHED THEN  
  INSERT   
  ( 
	 Codigo
	,Nombre
	,Transferencia
	,IdTipoInversion
	,IdCicloInversion
	,IdNaturaleza
	,IdDepartamento
	,IdProvincia
	,IdDistrito
	,Programa
	,IdModalidad
	,Costo
	,Estado
	,IdZona
	,Asignado
	,IdTipoProyecto
  )  
  VALUES  
  (   
	SOURCE.Codigo  
   ,SOURCE.Nombre  
   ,SOURCE.Transferencia  
   ,SOURCE.IdTipoInversion  
   ,SOURCE.IdCicloInversion  
   ,SOURCE.IdNaturaleza  
   ,SOURCE.IdDepartamento
   ,SOURCE.IdProvincia
   ,SOURCE.IdDistrito
   ,SOURCE.Programa
   ,SOURCE.IdModalidad
   ,SOURCE.Costo
   ,SOURCE.Estado
   ,SOURCE.IdZona
   ,SOURCE.Asignado
   ,SOURCE.IdTipoProyecto
  )  
   
 OUTPUT
  inserted.IdProyecto;
END  
  
GO
/****** Object:  StoredProcedure [Core].[USP_UPD_Proyecto]    Script Date: 06/12/2021 22:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=================================================
--Author:	Alberto Alcarraz Núñez
--Create Date: 13/08/2021
--Description: Obtiene listado de trabajadores
--Change:	   -
--Example:     [Core].[USP_UPD_Proyecto]   2

--================================================= 
CREATE PROC [Core].[USP_UPD_Proyecto]      

@IdProyecto	INT,
@IdCoordinador INT
 
AS
BEGIN

UPDATE [Core].[Proyectos] SET Asignado = 1
WHERE IdProyecto = @IdProyecto

UPDATE [Cnfg].[Personal] SET Asignado = 1
WHERE IdCoordinador = @IdCoordinador

RETURN 1

END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene los departamentos del perú' , @level0type=N'SCHEMA',@level0name=N'Cnfg', @level1type=N'TABLE',@level1name=N'Departamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene todos los distritos por provincia del perú' , @level0type=N'SCHEMA',@level0name=N'Cnfg', @level1type=N'TABLE',@level1name=N'Distrito'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene todos los datos que se usan para cargan valores generales' , @level0type=N'SCHEMA',@level0name=N'Cnfg', @level1type=N'TABLE',@level1name=N'Maestra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene a todos los trabajadores involucrados con el sistema ' , @level0type=N'SCHEMA',@level0name=N'Cnfg', @level1type=N'TABLE',@level1name=N'Personal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene todas las provincias por departamento del perú' , @level0type=N'SCHEMA',@level0name=N'Cnfg', @level1type=N'TABLE',@level1name=N'Provincia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene la agrupación de departamentos por zonas' , @level0type=N'SCHEMA',@level0name=N'Cnfg', @level1type=N'TABLE',@level1name=N'Zonas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene las actividades a realizar por tipo de proyecto' , @level0type=N'SCHEMA',@level0name=N'Core', @level1type=N'TABLE',@level1name=N'Cronograma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene los insumos por tipo de proyecto, primario, secundario, paneles solares' , @level0type=N'SCHEMA',@level0name=N'Core', @level1type=N'TABLE',@level1name=N'InsumosProyecto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene los perfiles por usuario del sistema' , @level0type=N'SCHEMA',@level0name=N'Core', @level1type=N'TABLE',@level1name=N'Perfiles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene las visitas programadas a campo para los coordinadores' , @level0type=N'SCHEMA',@level0name=N'Core', @level1type=N'TABLE',@level1name=N'Programacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene todos los proyectos del estado que se encuentran en ejecución' , @level0type=N'SCHEMA',@level0name=N'Core', @level1type=N'TABLE',@level1name=N'Proyectos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene a los usuarios registrados por aws' , @level0type=N'SCHEMA',@level0name=N'Core', @level1type=N'TABLE',@level1name=N'Usuario'
GO

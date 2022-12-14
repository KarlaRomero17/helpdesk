USE [master]
GO
/****** Object:  Database [helpdesk]    Script Date: 15/11/2022 11:19:09 ******/
CREATE DATABASE [helpdesk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'helpdesk', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\helpdesk.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'helpdesk_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\helpdesk_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [helpdesk] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [helpdesk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [helpdesk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [helpdesk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [helpdesk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [helpdesk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [helpdesk] SET ARITHABORT OFF 
GO
ALTER DATABASE [helpdesk] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [helpdesk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [helpdesk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [helpdesk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [helpdesk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [helpdesk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [helpdesk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [helpdesk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [helpdesk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [helpdesk] SET  DISABLE_BROKER 
GO
ALTER DATABASE [helpdesk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [helpdesk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [helpdesk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [helpdesk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [helpdesk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [helpdesk] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [helpdesk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [helpdesk] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [helpdesk] SET  MULTI_USER 
GO
ALTER DATABASE [helpdesk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [helpdesk] SET DB_CHAINING OFF 
GO
ALTER DATABASE [helpdesk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [helpdesk] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [helpdesk] SET DELAYED_DURABILITY = DISABLED 
GO
USE [helpdesk]
GO
/****** Object:  Table [dbo].[archivo]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[archivo](
	[id_archivo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[direccion] [varchar](200) NULL,
	[id_ticket] [int] NULL,
	[fecha_ingreso] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[id_archivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](100) NULL,
	[activo] [int] NULL DEFAULT ((1)),
	[fecha_registro] [datetime] NULL DEFAULT (getdate()),
	[estado] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estado]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estado](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[activo] [int] NULL DEFAULT ((1)),
	[fecha_registro] [datetime] NULL DEFAULT (getdate()),
	[estado_logico] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[evaluacion]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[evaluacion](
	[id_evaluacion] [int] IDENTITY(1,1) NOT NULL,
	[calificacion] [varchar](50) NULL,
	[comentarios] [varchar](200) NULL,
	[fecha_ingreso] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_evaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[menu]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menu](
	[id_menu] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[icono] [varchar](100) NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[id_menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[permiso](
	[id_permiso] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NOT NULL,
	[id_submenu] [int] NOT NULL,
	[Activo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[prioridad]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prioridad](
	[id_prioridad] [int] IDENTITY(1,1) NOT NULL,
	[prioridad] [varchar](100) NOT NULL,
	[activo] [int] NULL DEFAULT ((1)),
	[fecha_registro] [datetime] NULL DEFAULT (getdate()),
	[estado] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id_prioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[rol] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[submenu]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[submenu](
	[id_submenu] [int] IDENTITY(1,1) NOT NULL,
	[id_menu] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[nombre_form] [varchar](100) NOT NULL,
 CONSTRAINT [PK_submenu] PRIMARY KEY CLUSTERED 
(
	[id_submenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ticket](
	[id_ticket] [int] IDENTITY(1,1) NOT NULL,
	[id_prioridad] [int] NULL,
	[id_estado] [int] NULL,
	[id_categoria] [int] NULL,
	[id_user] [int] NULL,
	[id_evaluacion] [int] NULL,
	[titulo] [varchar](100) NULL,
	[descripcion] [text] NULL,
	[fecha_ingreso] [datetime2](7) NULL,
	[fecha_completado] [datetime2](7) NULL,
	[estado] [int] NULL DEFAULT ((1)),
	[id_soporte] [int] NULL,
 CONSTRAINT [PK__ticket__48C6F523E9A83DA9] PRIMARY KEY CLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[usuario] [varchar](150) NOT NULL,
	[clave] [varchar](100) NOT NULL,
	[fecha_ingreso] [datetime] NULL,
	[estado] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[archivo] ON 

INSERT [dbo].[archivo] ([id_archivo], [nombre], [direccion], [id_ticket], [fecha_ingreso]) VALUES (1, N'Screenshot_3-20221114162848.jpg', N'C:\SavedImages\Screenshot_3-20221114162848.jpg', 1, CAST(N'2022-11-14 16:28:52.977' AS DateTime))
INSERT [dbo].[archivo] ([id_archivo], [nombre], [direccion], [id_ticket], [fecha_ingreso]) VALUES (2, N'png-20221114162913.png', N'C:\SavedImages\png-20221114162913.png', 2, CAST(N'2022-11-14 16:29:16.537' AS DateTime))
INSERT [dbo].[archivo] ([id_archivo], [nombre], [direccion], [id_ticket], [fecha_ingreso]) VALUES (3, N'prueba 22-20221114162913.png', N'C:\SavedImages\prueba 22-20221114162913.png', 2, CAST(N'2022-11-14 16:29:16.540' AS DateTime))
INSERT [dbo].[archivo] ([id_archivo], [nombre], [direccion], [id_ticket], [fecha_ingreso]) VALUES (4, N'png-20221114212241.png', N'C:\SavedImages\png-20221114212241.png', 3, CAST(N'2022-11-14 21:22:48.483' AS DateTime))
INSERT [dbo].[archivo] ([id_archivo], [nombre], [direccion], [id_ticket], [fecha_ingreso]) VALUES (5, N'prueba 22-20221114212241.png', N'C:\SavedImages\prueba 22-20221114212241.png', 3, CAST(N'2022-11-14 21:22:48.490' AS DateTime))
SET IDENTITY_INSERT [dbo].[archivo] OFF
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([id_categoria], [categoria], [activo], [fecha_registro], [estado]) VALUES (1, N'Software', 1, CAST(N'2022-11-11 00:03:16.150' AS DateTime), 1)
INSERT [dbo].[categoria] ([id_categoria], [categoria], [activo], [fecha_registro], [estado]) VALUES (2, N'Hardware', 1, CAST(N'2022-11-11 00:03:24.913' AS DateTime), 1)
INSERT [dbo].[categoria] ([id_categoria], [categoria], [activo], [fecha_registro], [estado]) VALUES (3, N'Test eliminar', 0, CAST(N'2022-11-11 00:03:43.577' AS DateTime), 2)
INSERT [dbo].[categoria] ([id_categoria], [categoria], [activo], [fecha_registro], [estado]) VALUES (4, N'test', 0, CAST(N'2022-11-11 11:22:41.683' AS DateTime), 1)
INSERT [dbo].[categoria] ([id_categoria], [categoria], [activo], [fecha_registro], [estado]) VALUES (5, N'test eliminar', 0, CAST(N'2022-11-11 11:23:08.980' AS DateTime), 2)
INSERT [dbo].[categoria] ([id_categoria], [categoria], [activo], [fecha_registro], [estado]) VALUES (6, N'Network problem', 1, CAST(N'2022-11-11 18:39:15.717' AS DateTime), 1)
INSERT [dbo].[categoria] ([id_categoria], [categoria], [activo], [fecha_registro], [estado]) VALUES (7, N'error', 0, CAST(N'2022-11-11 18:47:42.167' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[categoria] OFF
SET IDENTITY_INSERT [dbo].[estado] ON 

INSERT [dbo].[estado] ([id_estado], [nombre], [activo], [fecha_registro], [estado_logico]) VALUES (1, N'Open', 1, CAST(N'2022-11-11 11:20:41.530' AS DateTime), 1)
INSERT [dbo].[estado] ([id_estado], [nombre], [activo], [fecha_registro], [estado_logico]) VALUES (2, N'Close', 1, CAST(N'2022-11-11 11:20:57.283' AS DateTime), 1)
INSERT [dbo].[estado] ([id_estado], [nombre], [activo], [fecha_registro], [estado_logico]) VALUES (3, N'test', 0, CAST(N'2022-11-11 11:22:00.773' AS DateTime), 2)
INSERT [dbo].[estado] ([id_estado], [nombre], [activo], [fecha_registro], [estado_logico]) VALUES (4, N'test eliminar', 0, CAST(N'2022-11-11 11:22:10.020' AS DateTime), 2)
INSERT [dbo].[estado] ([id_estado], [nombre], [activo], [fecha_registro], [estado_logico]) VALUES (5, N'In process', 1, CAST(N'2022-11-11 13:43:53.460' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[estado] OFF
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([id_menu], [nombre], [icono]) VALUES (1, N'Ticket', N'\icon\ticket.png')
INSERT [dbo].[menu] ([id_menu], [nombre], [icono]) VALUES (2, N'Prioridad', N'\icon\prioridad.png')
INSERT [dbo].[menu] ([id_menu], [nombre], [icono]) VALUES (3, N'Categoria', N'\icon\categoria.png')
INSERT [dbo].[menu] ([id_menu], [nombre], [icono]) VALUES (4, N'Estado', N'\icon\estado.png')
SET IDENTITY_INSERT [dbo].[menu] OFF
SET IDENTITY_INSERT [dbo].[permiso] ON 

INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (2, 1, 1, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (3, 1, 2, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (5, 1, 3, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (6, 1, 5, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (7, 1, 6, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (8, 2, 1, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (10, 2, 2, N'0')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (12, 2, 3, N'0')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (13, 2, 5, N'0')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (14, 2, 6, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (16, 3, 1, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (17, 3, 2, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (18, 3, 3, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (20, 3, 5, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (21, 3, 6, N'1')
SET IDENTITY_INSERT [dbo].[permiso] OFF
SET IDENTITY_INSERT [dbo].[prioridad] ON 

INSERT [dbo].[prioridad] ([id_prioridad], [prioridad], [activo], [fecha_registro], [estado]) VALUES (1, N'High', 1, CAST(N'2022-11-09 19:18:06.660' AS DateTime), 2)
INSERT [dbo].[prioridad] ([id_prioridad], [prioridad], [activo], [fecha_registro], [estado]) VALUES (2, N'Low', 1, CAST(N'2022-11-09 23:34:32.520' AS DateTime), 1)
INSERT [dbo].[prioridad] ([id_prioridad], [prioridad], [activo], [fecha_registro], [estado]) VALUES (3, N'Medium', 1, CAST(N'2022-11-10 11:20:04.857' AS DateTime), 1)
INSERT [dbo].[prioridad] ([id_prioridad], [prioridad], [activo], [fecha_registro], [estado]) VALUES (4, N'High', 1, CAST(N'2022-11-10 14:51:39.370' AS DateTime), 1)
INSERT [dbo].[prioridad] ([id_prioridad], [prioridad], [activo], [fecha_registro], [estado]) VALUES (5, N'test eliminar', 0, CAST(N'2022-11-11 11:23:36.423' AS DateTime), 2)
INSERT [dbo].[prioridad] ([id_prioridad], [prioridad], [activo], [fecha_registro], [estado]) VALUES (6, N'Uasdfsaxsf', 0, CAST(N'2022-11-11 13:44:55.670' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[prioridad] OFF
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (1, N'Soporte')
INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (2, N'Empleado')
INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[rol] OFF
SET IDENTITY_INSERT [dbo].[submenu] ON 

INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (1, 1, N'Crear Ticket', N'FrmCrearTicket')
INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (2, 2, N'Crear Prioridad', N'FrmCrearPrioridad')
INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (3, 3, N'Crear Categoria', N'FrmCrearCategoria')
INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (5, 4, N'Crear Estado', N'FrmCrearEstado')
INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (6, 1, N'Consultar Ticket', N'FrmConsultarTicket')
INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (10, 1, N'Test', N'FrmAlgo')
SET IDENTITY_INSERT [dbo].[submenu] OFF
SET IDENTITY_INSERT [dbo].[ticket] ON 

INSERT [dbo].[ticket] ([id_ticket], [id_prioridad], [id_estado], [id_categoria], [id_user], [id_evaluacion], [titulo], [descripcion], [fecha_ingreso], [fecha_completado], [estado], [id_soporte]) VALUES (1, 3, 5, 2, 1, NULL, N'Error ', N'error', CAST(N'2022-11-14 16:28:48.2100000' AS DateTime2), NULL, 1, 5)
INSERT [dbo].[ticket] ([id_ticket], [id_prioridad], [id_estado], [id_categoria], [id_user], [id_evaluacion], [titulo], [descripcion], [fecha_ingreso], [fecha_completado], [estado], [id_soporte]) VALUES (2, 3, 1, 1, 1, NULL, N'No funciona', N'No funciona ', CAST(N'2022-11-14 16:29:13.1600000' AS DateTime2), NULL, 2, 1)
INSERT [dbo].[ticket] ([id_ticket], [id_prioridad], [id_estado], [id_categoria], [id_user], [id_evaluacion], [titulo], [descripcion], [fecha_ingreso], [fecha_completado], [estado], [id_soporte]) VALUES (3, 3, 2, 4, 1, NULL, N'df', N'gsd', CAST(N'2022-11-14 21:22:41.9270000' AS DateTime2), NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[ticket] OFF
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id_user], [id_rol], [nombre], [apellido], [usuario], [clave], [fecha_ingreso], [estado]) VALUES (1, 1, N'Soporte', N'Uno', N'sop', N'123', CAST(N'2022-11-05 10:50:00.000' AS DateTime), N'A  ')
INSERT [dbo].[usuario] ([id_user], [id_rol], [nombre], [apellido], [usuario], [clave], [fecha_ingreso], [estado]) VALUES (3, 2, N'User', N'Uno', N'user', N'123', CAST(N'2022-11-05 11:30:00.000' AS DateTime), N'A  ')
INSERT [dbo].[usuario] ([id_user], [id_rol], [nombre], [apellido], [usuario], [clave], [fecha_ingreso], [estado]) VALUES (5, 3, N'Admin', N'Admin', N'admin', N'123', CAST(N'2022-11-05 11:30:00.000' AS DateTime), N'A  ')
SET IDENTITY_INSERT [dbo].[usuario] OFF
ALTER TABLE [dbo].[archivo]  WITH CHECK ADD  CONSTRAINT [FK_archivo_ticket] FOREIGN KEY([id_ticket])
REFERENCES [dbo].[ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[archivo] CHECK CONSTRAINT [FK_archivo_ticket]
GO
ALTER TABLE [dbo].[permiso]  WITH CHECK ADD  CONSTRAINT [FK_permiso_submenu] FOREIGN KEY([id_submenu])
REFERENCES [dbo].[submenu] ([id_submenu])
GO
ALTER TABLE [dbo].[permiso] CHECK CONSTRAINT [FK_permiso_submenu]
GO
ALTER TABLE [dbo].[permiso]  WITH CHECK ADD  CONSTRAINT [FK_rol_permiso] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id_rol])
GO
ALTER TABLE [dbo].[permiso] CHECK CONSTRAINT [FK_rol_permiso]
GO
ALTER TABLE [dbo].[submenu]  WITH CHECK ADD  CONSTRAINT [FK_submenu_menu] FOREIGN KEY([id_menu])
REFERENCES [dbo].[menu] ([id_menu])
GO
ALTER TABLE [dbo].[submenu] CHECK CONSTRAINT [FK_submenu_menu]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_categoria]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id_estado])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_estado]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_evaluacion] FOREIGN KEY([id_evaluacion])
REFERENCES [dbo].[evaluacion] ([id_evaluacion])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_evaluacion]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_prioridad] FOREIGN KEY([id_prioridad])
REFERENCES [dbo].[prioridad] ([id_prioridad])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_prioridad]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_usuario] FOREIGN KEY([id_user])
REFERENCES [dbo].[usuario] ([id_user])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_usuario]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_permiso] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id_rol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_permiso]
GO
/****** Object:  StoredProcedure [dbo].[proc_asignarme_ticket]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_asignarme_ticket]
	-- Add the parameters for the stored procedure here
	@id_ticket int,
	@id_soporte int,
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @resultado = 1
	IF NOT EXISTS (SELECT * FROM ticket  WHERE id_soporte is not null  and id_ticket=@id_ticket)
		Update ticket
		SET id_soporte = @id_soporte 
		where id_ticket=@id_ticket
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_crear_ticket]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_crear_ticket]
	-- Add the parameters for the stored procedure here
	@id_prioridad int,
	@id_estado int,
	@id_categoria int,
	@id_user int,
	@titulo varchar(200),
	@descripcion varchar(500),
	--@resultado int output
	@id int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	begin
	insert into ticket(id_prioridad, id_estado, id_categoria, id_user, titulo, descripcion, fecha_ingreso)
			VALUES(@id_prioridad, @id_estado, @id_categoria, @id_user, @titulo, @descripcion,GETDATE() )
			--obtenemos el id del ticket
			set @id = SCOPE_IDENTITY()
			
		return @id
			END
END

GO
/****** Object:  StoredProcedure [dbo].[proc_editar_categoria]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_editar_categoria]
	-- Add the parameters for the stored procedure here
	@id_categoria int,
	@categoria varchar(100),
	@activo int,
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @resultado = 1
	IF NOT EXISTS (SELECT * FROM categoria WHERE categoria =@categoria and id_categoria != @id_categoria and estado != 2)
		
		update categoria set 
		categoria = @categoria,
		activo = @activo
		where id_categoria = @id_categoria
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_editar_estado]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_editar_estado]
	-- Add the parameters for the stored procedure here
	@id_estado int,
	@nombre varchar(100),
	@activo int,
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @resultado = 1
	IF NOT EXISTS (SELECT * FROM estado WHERE nombre =@nombre and id_estado!= @id_estado and estado_logico !=2)
		
		update estado set 
		nombre = @nombre,
		activo = @activo
		where id_estado = @id_estado
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_editar_prioridad]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_editar_prioridad]
	-- Add the parameters for the stored procedure here
	@id_prioridad int,
@prioridad varchar(50),
@activo int,
@Resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM prioridad WHERE prioridad =@prioridad and id_prioridad != @id_prioridad and estado!=2)
		
		update prioridad set 
		prioridad = @prioridad,
		activo = @activo
		where id_prioridad = @id_prioridad
	ELSE
		SET @Resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_eliminar_categoria]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		kromero
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_eliminar_categoria]
	-- Add the parameters for the stored procedure here
	@id_categoria int,
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @resultado = 1
	IF  EXISTS (select * from categoria where id_categoria = @id_categoria)
	begin	
		
		update categoria set 
		estado = 2
		where id_categoria = @id_categoria
	end
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_eliminar_estado]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		kromero
-- Create date: <Create Date,,>
-- Description:	Crear un eliminado logico
-- =============================================
CREATE PROCEDURE [dbo].[proc_eliminar_estado] 
	-- Add the parameters for the stored procedure here
	
	@id_estado int,
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure 
	SET @resultado = 1

	IF  EXISTS (select * from estado where id_estado = @id_estado)
	begin	
		
		update estado set 
		estado_logico = 2
		where id_estado = @id_estado
	end
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_eliminar_prioridad]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_eliminar_prioridad]
	-- Add the parameters for the stored procedure here
	@id_prioridad int,
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SET @Resultado = 1

	IF  EXISTS (select * from prioridad where id_prioridad = @id_prioridad)
	begin	
		
		update prioridad set 
		estado = 2
		where id_prioridad = @id_prioridad
	end
	ELSE
		SET @Resultado = 0

END

GO
/****** Object:  StoredProcedure [dbo].[proc_eliminar_ticket]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_eliminar_ticket]
	-- Add the parameters for the stored procedure here
	@id_ticket int,
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @resultado = 1
	IF  EXISTS (select * from ticket where id_ticket= @id_ticket)
	begin	
		
		update ticket set 
		estado = 2
		where id_ticket= @id_ticket
	end
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_iniciar_sesion]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_iniciar_sesion] 
	-- Add the parameters for the stored procedure here
	@usuario varchar(80),
	@clave varchar(80),
	@id_user int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	set @id_user = 0 
	IF EXISTS(
	SELECT * FROM usuario 
	WHERE usuario COLLATE Latin1_General_CS_AS = @usuario 
	AND clave COLLATE Latin1_General_CS_AS = @clave
	)

	set @id_user = (
	SELECT id_user FROM usuario 
	WHERE usuario COLLATE Latin1_General_CS_AS = @usuario
	AND clave COLLATE Latin1_General_CS_AS = @clave
	)
END

GO
/****** Object:  StoredProcedure [dbo].[proc_lista_categoria]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		kromero
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_lista_categoria]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_categoria, categoria, activo, fecha_registro FROM categoria 
	where estado =1
END

GO
/****** Object:  StoredProcedure [dbo].[proc_lista_estado]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_lista_estado]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT id_estado, nombre, activo, fecha_registro FROM estado 
	where estado_logico =1
END

GO
/****** Object:  StoredProcedure [dbo].[proc_lista_prioridad]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_lista_prioridad]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_prioridad, prioridad, activo, fecha_registro FROM prioridad 
	where estado =1
END

GO
/****** Object:  StoredProcedure [dbo].[proc_lista_ticket]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_lista_ticket]
-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.id_ticket, e.prioridad , c.nombre estado, d.categoria,
	  concat(f.nombre,' ', f.apellido) usuario,  a.titulo, a.descripcion,a.fecha_ingreso, concat(g.nombre,' ', g.apellido) soporte,
	  a.id_prioridad, a.id_estado, a.id_categoria, a.id_user, a.id_soporte
	FROM ticket a
		--JOIN archivo b on a.id_ticket = b.id_ticket
		join estado c on c.id_estado = a.id_estado
		join categoria d on d.id_categoria = a.id_categoria
		join prioridad e on e.id_prioridad = a.id_prioridad
		join usuario f on f.id_user= a.id_user
		left join usuario g on g.id_user= a.id_soporte
		where a.estado=1
END

GO
/****** Object:  StoredProcedure [dbo].[proc_lista_usuarios]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[proc_lista_usuarios] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_user, nombre, apellido, id_rol, concat(nombre,' ', apellido) nombre_completo FROM usuario 
	where estado ='A'
END

GO
/****** Object:  StoredProcedure [dbo].[proc_modificar_ticket]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_modificar_ticket]
	-- Add the parameters for the stored procedure here
	@id_ticket int,
	@id_prioridad int,
	@id_estado int,
	@id_categoria int,
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @resultado = 1
	IF EXISTS (select * from ticket where id_ticket= @id_ticket)
	begin	
		
		update ticket set 
		id_prioridad = @id_prioridad,
		id_estado= @id_estado,
		id_categoria = @id_categoria
		where id_ticket= @id_ticket
	end
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_obtener_permisos]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_obtener_permisos] 
	-- Add the parameters for the stored procedure here
	@id_user int
AS
BEGIN
    -- Insert statements for procedure here
	select *,
	--(select * from usuario u
--FOR XML PATH (''),TYPE) AS 'DetalleUser',
(select * from rol r
 where r.id_rol = usuar.id_rol
FOR XML PATH (''),TYPE) AS 'DetalleRol'
,
	(SELECT  vistamenu.*,--vistamenu.nombre, vistamenu.icono,
		(select  sm.nombre[NombreSubMenu], sm.nombre_form[NombreFormulario], p.activo[Activo]
		from permiso p
		join rol r on r.id_rol = p.id_rol
		join submenu sm on sm.id_submenu=p.id_submenu
		join menu m on m.id_menu = sm.id_menu
		join usuario u on u.id_rol = r.id_rol and p.Activo=1
		where u.id_user=usuar.id_user and sm.id_menu = vistamenu.id_menu
		for xml path ('SubMenu'),TYPE) AS 'DetalleSubMenu'
	FROM(
	select distinct m.nombre[NombreMenu], m.icono[Icono], m.id_menu
	from permiso p
	join rol r on r.id_rol = p.id_rol
	join submenu sm on sm.id_submenu=p.id_submenu
	join menu m on m.id_menu = sm.id_menu
	join usuario u on u.id_rol = r.id_rol and p.Activo=1
	where u.id_user= usuar.id_user )vistamenu
	for xml path ('Menu'),TYPE) AS 'DetalleMenu'
	
FROM usuario usuar
WHERE id_user = @id_user
for xml path (''), root('PERMISOS')
END

GO
/****** Object:  StoredProcedure [dbo].[proc_reasignar_ticket]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_reasignar_ticket] 
	-- Add the parameters for the stored procedure here
	
	@id_ticket int,
	--@id_prioridad int,
	--@id_estado int,
	--@id_categoria int,
	@id_soporte int,
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SET @resultado = 1
	IF EXISTS (select * from ticket where id_ticket= @id_ticket /* and  id_estado!=2*/)
	begin	
		
		update ticket set 
		--id_prioridad = @id_prioridad,
		--id_estado= @id_estado,
		--id_categoria = @id_categoria,
		id_soporte = @id_soporte
		where id_ticket= @id_ticket
	end
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_archivo]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_registrar_archivo]
	-- Add the parameters for the stored procedure here
	@nombre varchar (200),
	@direccion varchar(100),
	@id_ticket int,
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET DATEFORMAT dmy;
	SET @resultado = 1
	IF NOT EXISTS (SELECT * FROM archivo  WHERE nombre = @nombre)
		INSERT INTO archivo(nombre,direccion,id_ticket)
		values(
			@nombre,
			@direccion,
			@id_ticket
		)
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_categoria]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		kromero
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_registrar_categoria] 
	-- Add the parameters for the stored procedure here
	@categoria varchar(100),
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET DATEFORMAT dmy;
	SET @resultado = 1
	IF NOT EXISTS (SELECT * FROM categoria  WHERE categoria = @categoria and estado !=2)
		INSERT INTO categoria(categoria)
		values(
			@categoria
		)
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_estado]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_registrar_estado]
	-- Add the parameters for the stored procedure here
	@nombre varchar(100),
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET DATEFORMAT dmy;
	SET @resultado = 1
	IF NOT EXISTS (SELECT * FROM estado  WHERE nombre = @nombre and estado_logico !=2)
		INSERT INTO estado(nombre)
		values(
			@nombre
		)
	ELSE
		SET @resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_prioridad]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_registrar_prioridad] 
	-- Add the parameters for the stored procedure here
	@Prioridad varchar(100),
	@Resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET DATEFORMAT dmy;
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM prioridad WHERE prioridad = @Prioridad and estado!=2)
		INSERT INTO prioridad(Prioridad)
		values(
			@Prioridad
		)
	ELSE
		SET @Resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_registrar_ticket]    Script Date: 15/11/2022 11:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_registrar_ticket] 
	-- Add the parameters for the stored procedure here
	@id_prioridad int,
	@id_estado int,
	@id_categoria int,
	@id_user int,
	@titulo varchar(200),
	@descripcion varchar(500),
	@nombre_archivo varchar(200),
	@direccion_archivo varchar(300),
	@resultado int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET @resultado = 1
	IF NOT EXISTS(SELECT * FROM ticket where id_ticket!=1)
		BEGIN
		--creamos id para el ticket
		declare @id_ticket int =0
			--insertamos datos del ticket
			insert into ticket(id_prioridad, id_estado, id_categoria, titulo, descripcion, fecha_ingreso)
			VALUES(@id_prioridad, @id_estado, @id_categoria, @titulo, @descripcion,GETDATE() )
			--obtenemos el id del ticket
			set @id_ticket = SCOPE_IDENTITY()
			--insertamos los archivos del ticket
			insert into archivo(nombre, direccion, id_ticket)
			VALUES(@nombre_archivo, @direccion_archivo, @id_ticket)
			
		END
	ELSE
		set @resultado = 0
END

GO
USE [master]
GO
ALTER DATABASE [helpdesk] SET  READ_WRITE 
GO

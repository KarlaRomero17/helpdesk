USE [master]
GO
/****** Object:  Database [helpdesk]    Script Date: 10/11/2022 12:25:03 ******/
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
/****** Object:  Table [dbo].[archivo]    Script Date: 10/11/2022 12:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[archivo](
	[id_archivo] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[direccion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_archivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 10/11/2022 12:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estado]    Script Date: 10/11/2022 12:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estado](
	[id_estado] [int] NOT NULL,
	[estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[evaluacion]    Script Date: 10/11/2022 12:25:04 ******/
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
/****** Object:  Table [dbo].[menu]    Script Date: 10/11/2022 12:25:04 ******/
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
/****** Object:  Table [dbo].[permiso]    Script Date: 10/11/2022 12:25:04 ******/
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
/****** Object:  Table [dbo].[prioridad]    Script Date: 10/11/2022 12:25:04 ******/
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
/****** Object:  Table [dbo].[rol]    Script Date: 10/11/2022 12:25:04 ******/
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
/****** Object:  Table [dbo].[submenu]    Script Date: 10/11/2022 12:25:04 ******/
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
/****** Object:  Table [dbo].[ticket]    Script Date: 10/11/2022 12:25:04 ******/
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
	[id_archivo] [int] NULL,
	[id_evaluacion] [int] NULL,
	[titulo] [varchar](100) NULL,
	[descripcion] [text] NULL,
	[fecha_ingreso] [datetime2](7) NULL,
	[estado] [varchar](2) NULL,
	[fecha_completado] [datetime2](7) NULL,
 CONSTRAINT [PK__ticket__48C6F523E9A83DA9] PRIMARY KEY CLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 10/11/2022 12:25:04 ******/
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
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([id_menu], [nombre], [icono]) VALUES (1, N'Ticket', N'\icon\ticket.png')
INSERT [dbo].[menu] ([id_menu], [nombre], [icono]) VALUES (2, N'Prioridad', N'\icon\prioridad.png')
INSERT [dbo].[menu] ([id_menu], [nombre], [icono]) VALUES (3, N'Categoria', N'\icon\categoria.png')
SET IDENTITY_INSERT [dbo].[menu] OFF
SET IDENTITY_INSERT [dbo].[permiso] ON 

INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (2, 1, 1, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (3, 1, 2, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (5, 1, 3, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (6, 2, 1, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (7, 2, 2, N'0')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (8, 2, 3, N'0')
SET IDENTITY_INSERT [dbo].[permiso] OFF
SET IDENTITY_INSERT [dbo].[prioridad] ON 

INSERT [dbo].[prioridad] ([id_prioridad], [prioridad], [activo], [fecha_registro], [estado]) VALUES (1, N'High', 1, CAST(N'2022-11-09 19:18:06.660' AS DateTime), 1)
INSERT [dbo].[prioridad] ([id_prioridad], [prioridad], [activo], [fecha_registro], [estado]) VALUES (2, N'Low', 1, CAST(N'2022-11-09 23:34:32.520' AS DateTime), 1)
INSERT [dbo].[prioridad] ([id_prioridad], [prioridad], [activo], [fecha_registro], [estado]) VALUES (3, N'Medium', 1, CAST(N'2022-11-10 11:20:04.857' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[prioridad] OFF
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (1, N'Soporte')
INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (2, N'Empleado')
SET IDENTITY_INSERT [dbo].[rol] OFF
SET IDENTITY_INSERT [dbo].[submenu] ON 

INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (1, 1, N'Crear Ticket', N'FrmCrearTicket')
INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (2, 2, N'Crear Prioridad', N'FrmCrearPrioridad')
INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (3, 3, N'Crear Categoria', N'FrmCrearCategoria')
SET IDENTITY_INSERT [dbo].[submenu] OFF
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id_user], [id_rol], [nombre], [apellido], [usuario], [clave], [fecha_ingreso], [estado]) VALUES (1, 1, N'Soporte', N'Uno', N'admin', N'123', CAST(N'2022-11-05 10:50:00.000' AS DateTime), N'A  ')
INSERT [dbo].[usuario] ([id_user], [id_rol], [nombre], [apellido], [usuario], [clave], [fecha_ingreso], [estado]) VALUES (3, 2, N'User', N'Uno', N'user', N'321', CAST(N'2022-11-05 11:30:00.000' AS DateTime), N'A  ')
SET IDENTITY_INSERT [dbo].[usuario] OFF
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
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_archivo] FOREIGN KEY([id_archivo])
REFERENCES [dbo].[archivo] ([id_archivo])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_archivo]
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
/****** Object:  StoredProcedure [dbo].[proc_editar_prioridad]    Script Date: 10/11/2022 12:25:04 ******/
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
	IF NOT EXISTS (SELECT * FROM prioridad WHERE prioridad =@prioridad and id_prioridad != @id_prioridad)
		
		update prioridad set 
		prioridad = @prioridad,
		activo = @activo
		where id_prioridad = @id_prioridad
	ELSE
		SET @Resultado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_eliminar_prioridad]    Script Date: 10/11/2022 12:25:04 ******/
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

	IF not EXISTS (select * from prioridad where id_prioridad = @id_prioridad)
	begin	
		
		update prioridad set 
		estado = 2
		where id_prioridad = @id_prioridad
	end
	ELSE
		SET @Resultado = 0

END

GO
/****** Object:  StoredProcedure [dbo].[proc_iniciar_sesion]    Script Date: 10/11/2022 12:25:04 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_lista_prioridad]    Script Date: 10/11/2022 12:25:04 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_obtener_permisos]    Script Date: 10/11/2022 12:25:04 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_registrar_prioridad]    Script Date: 10/11/2022 12:25:04 ******/
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
	IF NOT EXISTS (SELECT * FROM prioridad WHERE prioridad = @Prioridad )
		INSERT INTO prioridad(Prioridad)
		values(
			@Prioridad
		)
	ELSE
		SET @Resultado = 0
END

GO
USE [master]
GO
ALTER DATABASE [helpdesk] SET  READ_WRITE 
GO

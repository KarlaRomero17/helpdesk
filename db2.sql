USE [helpdesk]
GO
/****** Object:  Table [dbo].[archivo]    Script Date: 07/11/2022 15:13:42 ******/
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
/****** Object:  Table [dbo].[categoria]    Script Date: 07/11/2022 15:13:42 ******/
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
/****** Object:  Table [dbo].[estado]    Script Date: 07/11/2022 15:13:42 ******/
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
/****** Object:  Table [dbo].[evaluacion]    Script Date: 07/11/2022 15:13:42 ******/
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
/****** Object:  Table [dbo].[menu]    Script Date: 07/11/2022 15:13:42 ******/
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
/****** Object:  Table [dbo].[permiso]    Script Date: 07/11/2022 15:13:42 ******/
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
/****** Object:  Table [dbo].[prioridad]    Script Date: 07/11/2022 15:13:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prioridad](
	[id_prioridad] [int] IDENTITY(1,1) NOT NULL,
	[prioridad] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_prioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol]    Script Date: 07/11/2022 15:13:42 ******/
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
/****** Object:  Table [dbo].[submenu]    Script Date: 07/11/2022 15:13:42 ******/
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
/****** Object:  Table [dbo].[ticket]    Script Date: 07/11/2022 15:13:42 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 07/11/2022 15:13:42 ******/
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

INSERT [dbo].[menu] ([id_menu], [nombre], [icono]) VALUES (1, N'Ticket', N'\icon\priority.png')
INSERT [dbo].[menu] ([id_menu], [nombre], [icono]) VALUES (2, N'Prioridad', N'\icon\priority.png')
SET IDENTITY_INSERT [dbo].[menu] OFF
SET IDENTITY_INSERT [dbo].[permiso] ON 

INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (2, 1, 1, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (3, 1, 2, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (5, 2, 1, N'1')
INSERT [dbo].[permiso] ([id_permiso], [id_rol], [id_submenu], [Activo]) VALUES (6, 2, 2, N'0')
SET IDENTITY_INSERT [dbo].[permiso] OFF
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (1, N'Soporte')
INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (2, N'Empleado')
SET IDENTITY_INSERT [dbo].[rol] OFF
SET IDENTITY_INSERT [dbo].[submenu] ON 

INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (1, 1, N'Crear', N'frmCrearUsuario')
INSERT [dbo].[submenu] ([id_submenu], [id_menu], [nombre], [nombre_form]) VALUES (2, 2, N'Crear', N'frmCrearPrioridad')
SET IDENTITY_INSERT [dbo].[submenu] OFF
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id_user], [id_rol], [nombre], [apellido], [usuario], [clave], [fecha_ingreso], [estado]) VALUES (1, 1, N'Soporte', N'Uno', N'admin', N'123', CAST(N'2022-11-05 10:50:00.000' AS DateTime), N'A  ')
INSERT [dbo].[usuario] ([id_user], [id_rol], [nombre], [apellido], [usuario], [clave], [fecha_ingreso], [estado]) VALUES (3, 2, N'User', N'1', N'user', N'321', CAST(N'2022-11-05 11:30:00.000' AS DateTime), N'A  ')
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
/****** Object:  StoredProcedure [dbo].[proc_iniciar_sesion]    Script Date: 07/11/2022 15:13:42 ******/
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
/****** Object:  StoredProcedure [dbo].[proc_obtener_permisos]    Script Date: 07/11/2022 15:13:42 ******/
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
	SELECT 
	(SELECT vistamenu.nombre, vistamenu.icono,
		(select  sm.nombre, sm.nombre_form from permiso p
		join rol r on r.id_rol = p.id_rol
		join submenu sm on sm.id_submenu=p.id_submenu
		join menu m on m.id_menu = sm.id_menu
		join usuario u on u.id_rol = r.id_rol and p.Activo=1
		where u.id_user=usuar.id_user and sm.id_menu = vistamenu.id_menu
		for xml path ('Submenu'),TYPE) AS 'Detalle_submenu'
	
	FROM
	(
	select distinct m.* from permiso p
	join rol r on r.id_rol = p.id_rol
	join submenu sm on sm.id_submenu=p.id_submenu
	join menu m on m.id_menu = sm.id_menu
	join usuario u on u.id_rol = r.id_rol and p.Activo=1
	where u.id_user= usuar.id_user

	)vistamenu
	for xml path ('Menu'),TYPE) AS 'Detalle_menu'
FROM usuario usuar
WHERE id_user = @id_user
for xml path (''), root('PERMISOS')
END

GO

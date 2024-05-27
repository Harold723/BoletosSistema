USE [master]
GO
/****** Object:  Database [SistemadeBoletos]    Script Date: 26/05/2024 21:22:56 ******/
CREATE DATABASE [SistemadeBoletos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemadeBoletos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SistemadeBoletos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemadeBoletos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SistemadeBoletos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SistemadeBoletos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemadeBoletos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemadeBoletos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SistemadeBoletos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemadeBoletos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemadeBoletos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistemadeBoletos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemadeBoletos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SistemadeBoletos] SET  MULTI_USER 
GO
ALTER DATABASE [SistemadeBoletos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemadeBoletos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemadeBoletos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemadeBoletos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemadeBoletos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemadeBoletos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SistemadeBoletos] SET QUERY_STORE = OFF
GO
USE [SistemadeBoletos]
GO
/****** Object:  User [login]    Script Date: 26/05/2024 21:22:56 ******/
CREATE USER [login] FOR LOGIN [login] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Icono] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS](
	[IdPermisos] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NULL,
	[IdSubMenu] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPermisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBMENU]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBMENU](
	[IdSubMenu] [int] IDENTITY(1,1) NOT NULL,
	[IdMenu] [int] NULL,
	[Nombre] [varchar](60) NULL,
	[NombreFormulario] [varchar](60) NULL,
	[Accion] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSubMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[IdRol] [int] NULL,
	[LoginUsuario] [varchar](50) NULL,
	[LoginClave] [varchar](50) NULL,
	[DescripcionReferencia] [varchar](50) NULL,
	[IdReferencia] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (1, N'Usuarios', N'', 1, CAST(N'2024-05-26T16:43:22.860' AS DateTime))
SET IDENTITY_INSERT [dbo].[MENU] OFF
GO
SET IDENTITY_INSERT [dbo].[PERMISOS] ON 

INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1, 1, 1, 1, CAST(N'2024-05-26T16:44:15.387' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2, 1, 2, 1, CAST(N'2024-05-26T16:44:15.387' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (3, 1, 3, 1, CAST(N'2024-05-26T16:44:15.387' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (4, 2, 1, 1, CAST(N'2024-05-26T16:44:15.393' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (5, 2, 2, 1, CAST(N'2024-05-26T16:44:15.393' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (6, 2, 3, 1, CAST(N'2024-05-26T16:44:15.393' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (7, 3, 1, 0, CAST(N'2024-05-26T16:44:15.407' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (8, 3, 2, 0, CAST(N'2024-05-26T16:44:15.407' AS DateTime))
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (9, 3, 3, 0, CAST(N'2024-05-26T16:44:15.407' AS DateTime))
SET IDENTITY_INSERT [dbo].[PERMISOS] OFF
GO
SET IDENTITY_INSERT [dbo].[ROL] ON 

INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'ADMINISTRADOR', 1, CAST(N'2024-05-26T16:42:51.030' AS DateTime))
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'Piloto', 1, CAST(N'2024-05-26T16:42:51.030' AS DateTime))
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'Atención al Cliente', 1, CAST(N'2024-05-26T16:42:51.030' AS DateTime))
SET IDENTITY_INSERT [dbo].[ROL] OFF
GO
SET IDENTITY_INSERT [dbo].[SUBMENU] ON 

INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Accion], [Activo], [FechaRegistro]) VALUES (1, 1, N'Crear Usuario', N'Usuario', N'Crear', 1, CAST(N'2024-05-26T16:43:44.580' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Accion], [Activo], [FechaRegistro]) VALUES (2, 1, N'Crear Rol', N'Rol', N'Crear', 1, CAST(N'2024-05-26T16:43:44.580' AS DateTime))
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Accion], [Activo], [FechaRegistro]) VALUES (3, 1, N'Asignar rol permisos', N'RolPermiso', N'Crear', 1, CAST(N'2024-05-26T16:43:44.580' AS DateTime))
SET IDENTITY_INSERT [dbo].[SUBMENU] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [IdRol], [LoginUsuario], [LoginClave], [DescripcionReferencia], [IdReferencia], [Activo], [FechaRegistro]) VALUES (1, N'Harold', N'Ochaeta', 1, N'Admin', N'Admin123', N'NINGUNA', 0, 1, CAST(N'2024-05-26T16:43:52.910' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [IdRol], [LoginUsuario], [LoginClave], [DescripcionReferencia], [IdReferencia], [Activo], [FechaRegistro]) VALUES (2, N'lorna', N'juarez', 2, N'lorna', N'123456', N'NINGUNA', 0, 1, CAST(N'2024-05-26T16:51:46.513' AS DateTime))
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[SUBMENU] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[SUBMENU] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD FOREIGN KEY([IdSubMenu])
REFERENCES [dbo].[SUBMENU] ([IdSubMenu])
GO
ALTER TABLE [dbo].[SUBMENU]  WITH CHECK ADD FOREIGN KEY([IdMenu])
REFERENCES [dbo].[MENU] ([IdMenu])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarPermisos]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ACTUALIZAR PERMISOS
create procedure [dbo].[usp_ActualizarPermisos](
@Detalle xml,
@Resultado bit output
)
as
begin
begin try

	BEGIN TRANSACTION
	declare @permisos table(idpermisos int,activo bit)

	insert into @permisos(idpermisos,activo)
	select 
	idpermisos = Node.Data.value('(IdPermisos)[1]','int'),
	activo = Node.Data.value('(Activo)[1]','bit')
	FROM @Detalle.nodes('/DETALLE/PERMISO') Node(Data)

	select * from @permisos

	update p set p.Activo = pe.activo from PERMISOS p
	inner join @permisos pe on pe.idpermisos = p.IdPermisos

	COMMIT
	set @Resultado = 1

end try
begin catch
	ROLLBACK
	set @Resultado = 0
end catch
end


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarRol]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR ROL
create procedure [dbo].[usp_EliminarRol](
@IdRol int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que el rol no se encuentre asignado a algun usuario
	IF not EXISTS (select * from USUARIO u
	inner join ROL r on r.IdRol  = u.IdRol
	where r.IdRol = @IdRol)
	begin	
		delete from PERMISOS where IdRol = @IdRol
		delete from ROL where IdRol = @IdRol
	end
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarUsuario]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR USUARIO
create procedure [dbo].[usp_EliminarUsuario](
@IdUsuario int,
@Resultado bit output
)
as
begin

	delete from USUARIO where IdUsuario = @IdUsuario
	SET @Resultado = 1
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ListarAlumno]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER USUARIOS
CREATE PROC [dbo].[usp_ListarAlumno]
as
begin
 select IdAlumno,Codigo,Nombres,Apellidos,DocumentoIdentidad,FechaNacimiento,Sexo,Ciudad,Direccion,Activo from ALUMNO
end


GO
/****** Object:  StoredProcedure [dbo].[usp_LoginUsuario]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIO

create procedure [dbo].[usp_LoginUsuario](
@Usuario varchar(60),
@Clave varchar(60),
@IdUsuario int output
)
as
begin
	set @IdUsuario = 0
	if exists(select * from USUARIO where [LoginUsuario] COLLATE Latin1_General_CS_AS = @Usuario and LoginClave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
		set @IdUsuario = (select top 1 IdUsuario from USUARIO where [LoginUsuario]  COLLATE Latin1_General_CS_AS = @Usuario and LoginClave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarRol]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR ROLES
create procedure [dbo].[usp_ModificarRol](
@IdRol int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion =@Descripcion and IdRol != @IdRol)
		
		update ROL set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdRol = @IdRol
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarUsuario]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR USUARIO
create procedure [dbo].[usp_ModificarUsuario](
@IdUsuario int,
@Nombres varchar(50),
@Apellidos varchar(50),
@IdRol int,
@Usuario varchar(50),
@Clave varchar(50),
@DescripcionReferencia varchar(50),
@IdReferencia int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE LoginUsuario = @Usuario and IdUsuario != @IdUsuario)
		
		update USUARIO set 
		Nombres = @Nombres,
		Apellidos = @Apellidos,
		IdRol = @IdRol,
		LoginUsuario = @Usuario,
		LoginClave = @Clave,
		DescripcionReferencia = @DescripcionReferencia,
		IdReferencia = @IdReferencia,
		Activo = @Activo
		where IdUsuario = @IdUsuario

	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleUsuario]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE USUARIO
create proc [dbo].[usp_ObtenerDetalleUsuario](
@IdUsuario int
)
as
begin
 select *,
(select * from ROL r
 where r.IdRol = up.IdRol
FOR XML PATH (''),TYPE) AS 'DetalleRol'
,
 (
 select t.NombreMenu,t.Icono,
 (select sm.Nombre[NombreSubMenu],sm.NombreFormulario,sm.Accion,p.Activo
	 from PERMISOS p
	 inner join ROL r on r.IdRol = p.IdRol
	 inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
	 inner join MENU m on m.IdMenu = sm.IdMenu
	 inner join USUARIO u on u.IdRol = r.IdRol and u.IdUsuario = up.IdUsuario
	where sm.IdMenu = t.IdMenu
  FOR XML PATH ('SubMenu'),TYPE) AS 'DetalleSubMenu' 

 from (
 select distinct m.Nombre[NombreMenu],m.IdMenu,m.Icono
 from PERMISOS p
 inner join ROL r on r.IdRol = p.IdRol
 inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
 inner join MENU m on m.IdMenu = sm.IdMenu
 inner join USUARIO u on u.IdRol = r.IdRol and u.IdUsuario = up.IdUsuario
 where p.Activo = 1) t
 FOR XML PATH ('Menu'),TYPE) AS 'DetalleMenu'  
 from USUARIO up
 where UP.IdUsuario = @IdUsuario
 FOR XML PATH(''), ROOT('Usuario')  

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerPermisos]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER PERMISOS
create procedure [dbo].[usp_ObtenerPermisos](
@IdRol int)
as
begin
select p.IdPermisos,m.Nombre[Menu],sm.Nombre[SubMenu],p.Activo from PERMISOS p
inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
inner join MENU m on m.IdMenu = sm.IdMenu
where p.IdRol = @IdRol
end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerRoles]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA OBTENER ROLES
CREATE PROC [dbo].[usp_ObtenerRoles]
as
begin
 select IdRol, Descripcion,Activo from ROL
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerUsuario]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIOS
CREATE PROC [dbo].[usp_ObtenerUsuario]
as
begin
 select u.IdUsuario,u.Nombres,u.Apellidos,u.LoginUsuario,u.LoginClave,u.IdRol,u.Activo,u.DescripcionReferencia,r.Descripcion[DescripcionRol],u.Activo from USUARIO u
 inner join ROL r on r.IdRol = u.IdRol
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarRol]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA GUARDAR ROL
CREATE PROC [dbo].[usp_RegistrarRol](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion = @Descripcion)
	begin
		declare @idrol int = 0
		insert into ROL(Descripcion) values (
		@Descripcion
		)
		set @idrol  = Scope_identity()

		insert into PERMISOS(IdRol,IdSubMenu,Activo)
		select @idrol, IdSubMenu,0 from SUBMENU
	end
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarUsuario]    Script Date: 26/05/2024 21:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA REGISTRAR USUARIO
CREATE PROC [dbo].[usp_RegistrarUsuario](
@Nombres varchar(50),
@Apellidos varchar(50),
@IdRol int,
@Usuario varchar(50),
@Clave varchar(50),
@DescripcionReferencia varchar(50),
@IdReferencia int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE LoginUsuario = @Usuario)

		insert into USUARIO(Nombres,Apellidos,IdRol,LoginUsuario,LoginClave,DescripcionReferencia,IdReferencia) values (
		@Nombres,@Apellidos,@IdRol,@Usuario,@Clave,@DescripcionReferencia,@IdReferencia)
	ELSE
		SET @Resultado = 0
	
end

GO
USE [master]
GO
ALTER DATABASE [SistemadeBoletos] SET  READ_WRITE 
GO

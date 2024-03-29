USE [master]
GO
/****** Object:  Database [Fabrica]    Script Date: 17/6/2019 23:52:33 ******/
CREATE DATABASE [Fabrica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fabrica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Fabrica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fabrica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Fabrica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Fabrica] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fabrica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fabrica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fabrica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fabrica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fabrica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fabrica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fabrica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fabrica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fabrica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fabrica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fabrica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fabrica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fabrica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fabrica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fabrica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fabrica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fabrica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fabrica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fabrica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fabrica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fabrica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fabrica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fabrica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fabrica] SET RECOVERY FULL 
GO
ALTER DATABASE [Fabrica] SET  MULTI_USER 
GO
ALTER DATABASE [Fabrica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fabrica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fabrica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fabrica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fabrica] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Fabrica', N'ON'
GO
ALTER DATABASE [Fabrica] SET QUERY_STORE = OFF
GO
USE [Fabrica]
GO
/****** Object:  User [global_admin]    Script Date: 17/6/2019 23:52:34 ******/
CREATE USER [global_admin] FOR LOGIN [global_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Cliente]    Script Date: 17/6/2019 23:52:34 ******/
CREATE USER [Cliente] FOR LOGIN [Cliente] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [global_admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [global_admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [global_admin]
GO
/****** Object:  Table [dbo].[Automovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automovil](
	[idAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[idTipoAutomovil] [int] NOT NULL,
	[idTipoCombustible] [int] NOT NULL,
	[placa] [varchar](20) NOT NULL,
	[precioBase] [money] NOT NULL,
	[consignacion] [bit] NOT NULL,
	[anno] [int] NOT NULL,
 CONSTRAINT [PK_Automovil] PRIMARY KEY CLUSTERED 
(
	[idAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Caracteristicas]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caracteristicas](
	[idCaracteristica] [int] IDENTITY(1,1) NOT NULL,
	[color] [varchar](20) NOT NULL,
	[marca] [varchar](20) NOT NULL,
	[cantidadPasajeros] [int] NOT NULL,
	[nPuertas] [int] NOT NULL,
 CONSTRAINT [PK_Caracteristicas] PRIMARY KEY CLUSTERED 
(
	[idCaracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaracteristicasxAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaracteristicasxAutomovil](
	[idCaracteristicasxAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[idCaracteristica] [int] NOT NULL,
	[idAutomovil] [int] NOT NULL,
 CONSTRAINT [PK_CaracteristicasxAutomovil] PRIMARY KEY CLUSTERED 
(
	[idCaracteristicasxAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido1] [varchar](20) NOT NULL,
	[apellido2] [varchar](20) NOT NULL,
	[cedula] [int] NOT NULL,
	[edad] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteUbicacion]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteUbicacion](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](20) NOT NULL,
	[contrasenna] [varchar](20) NOT NULL,
	[ubicacion] [geometry] NOT NULL,
 CONSTRAINT [PK_ClienteUbicacion] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comision]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comision](
	[idComision] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idAutomovil] [int] NOT NULL,
	[comision] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idComision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DespachoSucursal1]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DespachoSucursal1](
	[idDespacho] [int] IDENTITY(1,1) NOT NULL,
	[fechaDespacho] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDespacho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DespachoSucursal2]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DespachoSucursal2](
	[idDespacho] [int] IDENTITY(1,1) NOT NULL,
	[fechaDespacho] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDespacho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DespachoSucursal3]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DespachoSucursal3](
	[idDespacho] [int] IDENTITY(1,1) NOT NULL,
	[fechaDespacho] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDespacho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadoFabrica]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadoFabrica](
	[idEmpleadoFabrica] [int] IDENTITY(1,1) NOT NULL,
	[idFabrica] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[cedula] [int] NOT NULL,
	[telefono] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EmpleadoFabrica] PRIMARY KEY CLUSTERED 
(
	[idEmpleadoFabrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Extra]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Extra](
	[idExtra] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[precio] [money] NOT NULL,
 CONSTRAINT [PK_Extra] PRIMARY KEY CLUSTERED 
(
	[idExtra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtraxAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraxAutomovil](
	[idExtraxAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[idExtra] [int] NOT NULL,
	[idAutomovil] [int] NOT NULL,
 CONSTRAINT [PK_ExtraxAutomovil] PRIMARY KEY CLUSTERED 
(
	[idExtraxAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fabrica]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fabrica](
	[idFabrica] [int] IDENTITY(1,1) NOT NULL,
	[direccion] [varchar](20) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Fabrica] PRIMARY KEY CLUSTERED 
(
	[idFabrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foto]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foto](
	[idFoto] [int] IDENTITY(1,1) NOT NULL,
	[foto] [image] NOT NULL,
 CONSTRAINT [PK_Foto] PRIMARY KEY CLUSTERED 
(
	[idFoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FotoxAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FotoxAutomovil](
	[idFotoxAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[idFoto] [int] NOT NULL,
	[idAutomovil] [int] NOT NULL,
 CONSTRAINT [PK_FotoxAutomovil] PRIMARY KEY CLUSTERED 
(
	[idFotoxAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoSucursal1]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoSucursal1](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idFabrica] [int] NOT NULL,
	[idAutomovilxSucursal] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[fechaPedido] [date] NOT NULL,
	[fechaEntrega] [date] NOT NULL,
 CONSTRAINT [PK_PedidoSucursal1] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoSucursal2]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoSucursal2](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idFabrica] [int] NOT NULL,
	[idAutomovilxSucursal] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[fechaPedido] [date] NOT NULL,
	[fechaEntrega] [date] NOT NULL,
 CONSTRAINT [PK_PedidoSucursal2] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoSucursal3]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoSucursal3](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[idFabrica] [int] NOT NULL,
	[idAutomovilxSucursal] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[fechaPedido] [date] NOT NULL,
	[fechaEntrega] [date] NOT NULL,
 CONSTRAINT [PK_PedidoSucursal3] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoxDespacho1]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoxDespacho1](
	[idPedidoxDespacho] [int] IDENTITY(1,1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[idDespacho] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPedidoxDespacho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoxDespacho2]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoxDespacho2](
	[idPedidoxDespacho] [int] IDENTITY(1,1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[idDespacho] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPedidoxDespacho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidoxDespacho3]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoxDespacho3](
	[idPedidoxDespacho] [int] IDENTITY(1,1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[idDespacho] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPedidoxDespacho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAutomovil](
	[idTipoAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoAutomovil] PRIMARY KEY CLUSTERED 
(
	[idTipoAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCombustible]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCombustible](
	[idTipoCombustible] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoCombustible] PRIMARY KEY CLUSTERED 
(
	[idTipoCombustible] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Automovil]  WITH CHECK ADD  CONSTRAINT [FK_Automovil_TipoAutomovil] FOREIGN KEY([idTipoAutomovil])
REFERENCES [dbo].[TipoAutomovil] ([idTipoAutomovil])
GO
ALTER TABLE [dbo].[Automovil] CHECK CONSTRAINT [FK_Automovil_TipoAutomovil]
GO
ALTER TABLE [dbo].[Automovil]  WITH CHECK ADD  CONSTRAINT [FK_Automovil_TipoCombustible] FOREIGN KEY([idTipoCombustible])
REFERENCES [dbo].[TipoCombustible] ([idTipoCombustible])
GO
ALTER TABLE [dbo].[Automovil] CHECK CONSTRAINT [FK_Automovil_TipoCombustible]
GO
ALTER TABLE [dbo].[CaracteristicasxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_CaracteristicasxAutomovil_Automovil] FOREIGN KEY([idAutomovil])
REFERENCES [dbo].[Automovil] ([idAutomovil])
GO
ALTER TABLE [dbo].[CaracteristicasxAutomovil] CHECK CONSTRAINT [FK_CaracteristicasxAutomovil_Automovil]
GO
ALTER TABLE [dbo].[CaracteristicasxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_CaracteristicasxAutomovil_Caracteristicas] FOREIGN KEY([idCaracteristica])
REFERENCES [dbo].[Caracteristicas] ([idCaracteristica])
GO
ALTER TABLE [dbo].[CaracteristicasxAutomovil] CHECK CONSTRAINT [FK_CaracteristicasxAutomovil_Caracteristicas]
GO
ALTER TABLE [dbo].[comision]  WITH CHECK ADD FOREIGN KEY([idAutomovil])
REFERENCES [dbo].[Automovil] ([idAutomovil])
GO
ALTER TABLE [dbo].[comision]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[EmpleadoFabrica]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoFabrica_Fabrica] FOREIGN KEY([idFabrica])
REFERENCES [dbo].[Fabrica] ([idFabrica])
GO
ALTER TABLE [dbo].[EmpleadoFabrica] CHECK CONSTRAINT [FK_EmpleadoFabrica_Fabrica]
GO
ALTER TABLE [dbo].[ExtraxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_ExtraxAutomovil_Automovil] FOREIGN KEY([idAutomovil])
REFERENCES [dbo].[Automovil] ([idAutomovil])
GO
ALTER TABLE [dbo].[ExtraxAutomovil] CHECK CONSTRAINT [FK_ExtraxAutomovil_Automovil]
GO
ALTER TABLE [dbo].[ExtraxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_ExtraxAutomovil_Extra] FOREIGN KEY([idExtra])
REFERENCES [dbo].[Extra] ([idExtra])
GO
ALTER TABLE [dbo].[ExtraxAutomovil] CHECK CONSTRAINT [FK_ExtraxAutomovil_Extra]
GO
ALTER TABLE [dbo].[FotoxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_FotoxAutomovil_Automovil] FOREIGN KEY([idAutomovil])
REFERENCES [dbo].[Automovil] ([idAutomovil])
GO
ALTER TABLE [dbo].[FotoxAutomovil] CHECK CONSTRAINT [FK_FotoxAutomovil_Automovil]
GO
ALTER TABLE [dbo].[FotoxAutomovil]  WITH CHECK ADD  CONSTRAINT [FK_FotoxAutomovil_Foto] FOREIGN KEY([idFoto])
REFERENCES [dbo].[Foto] ([idFoto])
GO
ALTER TABLE [dbo].[FotoxAutomovil] CHECK CONSTRAINT [FK_FotoxAutomovil_Foto]
GO
ALTER TABLE [dbo].[PedidoSucursal1]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal1_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[PedidoSucursal1] CHECK CONSTRAINT [FK_PedidoSucursal1_Cliente]
GO
ALTER TABLE [dbo].[PedidoSucursal1]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal1_Fabrica] FOREIGN KEY([idFabrica])
REFERENCES [dbo].[Fabrica] ([idFabrica])
GO
ALTER TABLE [dbo].[PedidoSucursal1] CHECK CONSTRAINT [FK_PedidoSucursal1_Fabrica]
GO
ALTER TABLE [dbo].[PedidoSucursal2]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal2_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[PedidoSucursal2] CHECK CONSTRAINT [FK_PedidoSucursal2_Cliente]
GO
ALTER TABLE [dbo].[PedidoSucursal2]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal2_Fabrica] FOREIGN KEY([idFabrica])
REFERENCES [dbo].[Fabrica] ([idFabrica])
GO
ALTER TABLE [dbo].[PedidoSucursal2] CHECK CONSTRAINT [FK_PedidoSucursal2_Fabrica]
GO
ALTER TABLE [dbo].[PedidoSucursal3]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal3_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[PedidoSucursal3] CHECK CONSTRAINT [FK_PedidoSucursal3_Cliente]
GO
ALTER TABLE [dbo].[PedidoSucursal3]  WITH CHECK ADD  CONSTRAINT [FK_PedidoSucursal3_Fabrica] FOREIGN KEY([idFabrica])
REFERENCES [dbo].[Fabrica] ([idFabrica])
GO
ALTER TABLE [dbo].[PedidoSucursal3] CHECK CONSTRAINT [FK_PedidoSucursal3_Fabrica]
GO
ALTER TABLE [dbo].[PedidoxDespacho1]  WITH CHECK ADD FOREIGN KEY([idDespacho])
REFERENCES [dbo].[DespachoSucursal1] ([idDespacho])
GO
ALTER TABLE [dbo].[PedidoxDespacho1]  WITH CHECK ADD FOREIGN KEY([idPedido])
REFERENCES [dbo].[PedidoSucursal1] ([idPedido])
GO
ALTER TABLE [dbo].[PedidoxDespacho2]  WITH CHECK ADD FOREIGN KEY([idDespacho])
REFERENCES [dbo].[DespachoSucursal2] ([idDespacho])
GO
ALTER TABLE [dbo].[PedidoxDespacho2]  WITH CHECK ADD FOREIGN KEY([idPedido])
REFERENCES [dbo].[PedidoSucursal2] ([idPedido])
GO
ALTER TABLE [dbo].[PedidoxDespacho3]  WITH CHECK ADD FOREIGN KEY([idDespacho])
REFERENCES [dbo].[DespachoSucursal3] ([idDespacho])
GO
ALTER TABLE [dbo].[PedidoxDespacho3]  WITH CHECK ADD FOREIGN KEY([idPedido])
REFERENCES [dbo].[PedidoSucursal3] ([idPedido])
GO
/****** Object:  StoredProcedure [dbo].[agregarFoto]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[agregarFoto]
@foto image
as
begin

	begin transaction
	insert into Foto(foto)values(@foto)
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[autenticarUsuario]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[autenticarUsuario] (@usuario varchar(20), @contrasenna varchar(20))
as
begin
	if EXISTS(Select usuario from ClienteUbicacion where usuario=@usuario and contrasenna=@contrasenna)
		Select idCliente from ClienteUbicacion where usuario=@usuario and contrasenna=@contrasenna
	else
		Select -1
end
GO
/****** Object:  StoredProcedure [dbo].[calcularExtras]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[calcularExtras]
@idAutomovil int
as
begin
	declare @extras money
	 
	set @extras = isnull((select sum(precio) from Extra inner join ExtraxAutomovil on Extra.idExtra = ExtraxAutomovil.idExtra
	where ExtraxAutomovil.idAutomovil=@idAutomovil),0)
	select @extras


end
GO
/****** Object:  StoredProcedure [dbo].[despachar]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[despachar]
@idSucursal int,
@fecha date=null
as
begin
	declare @cont int,@lim int,@idPedido int
	if @idSucursal =1
	begin
		
		set @lim = (select count(*) from PedidoSucursal1)
		set @cont=1
		while(@cont<=@lim)
		begin
			if exists(select idPedido from PedidoSucursal1 where fechaEntrega= ISNULL(@fecha,GETDATE()) and idPedido=@cont)
			begin
				set @idPedido = (select idPedido from PedidoSucursal1 where fechaEntrega= ISNULL(@fecha,GETDATE()) and idPedido=@cont)
				begin transaction
				insert into DespachoSucursal1(fechaDespacho)values(ISNULL(@fecha,GETDATE()))
				commit transaction


				begin transaction
				insert into PedidoxDespacho1(idPedido,idDespacho)values(@idPedido,IDENT_CURRENT('DespachoSucursal1'))
				commit transaction
				set @cont=@cont+1
			end
			else
				set @cont=@cont+1

		end
	end
	else
		if @idSucursal =2
		begin
			set @lim = (select count(*) from PedidoSucursal2)
			set @cont=1
			while(@cont<=@lim)
			begin
				if exists(select idPedido from PedidoSucursal2 where fechaEntrega= ISNULL(@fecha,GETDATE()) and idPedido=@cont)
				begin
					set @idPedido = (select idPedido from PedidoSucursal2 where fechaEntrega= ISNULL(@fecha,GETDATE()) and idPedido=@cont)
					begin transaction
					insert into DespachoSucursal2(fechaDespacho)values(ISNULL(@fecha,GETDATE()))
					commit transaction


					begin transaction
					insert into PedidoxDespacho2(idPedido,idDespacho)values(@idPedido,IDENT_CURRENT('DespachoSucursal2'))

					commit transaction
					set @cont=@cont+1
				end
				else
					set @cont=@cont+1
			end

		end
		else
			if @idSucursal =3
			begin
				set @lim = (select count(*) from PedidoSucursal3)
				set @cont=1
				while(@cont<=@lim)
				begin
					if exists(select idPedido from PedidoSucursal3 where fechaEntrega= ISNULL(@fecha,GETDATE()) and idPedido=@cont)
					begin
						set @idPedido = (select idPedido from PedidoSucursal3 where fechaEntrega= ISNULL(@fecha,GETDATE()) and idPedido=@cont)
						begin transaction
						insert into DespachoSucursal3(fechaDespacho)values(ISNULL(@fecha,GETDATE()))
						commit transaction


						begin transaction
						insert into PedidoxDespacho3(idPedido,idDespacho)values(@idPedido,IDENT_CURRENT('DespachoSucursal3'))
						commit transaction
						set @cont=@cont+1
					end
					else
						set @cont=@cont+1

				end

			end
end
GO
/****** Object:  StoredProcedure [dbo].[eliminarAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[eliminarAutomovil]
@idAutomovil int,
@sucursal int
as
begin
	begin try
		begin transaction
			if exists (select idAutomovil from CaracteristicasxAutomovil where idAutomovil=@idAutomovil)
			begin
				delete from CaracteristicasxAutomovil
				where idAutomovil = @idAutomovil
				commit transaction
			end
			else
				select('No existe caracteristicas relacionadas al auto')
		commit transaction

		if @sucursal=1
		begin
			if exists (select idAutomovil from Sucursal_1.dbo.AutomovilxSucursal where idAutomovil=@idAutomovil)
			begin
				begin transaction
				
				delete from Sucursal_1.dbo.AutomovilxSucursal
				where idAutomovil = @idAutomovil
				commit transaction
			end
			else
				select('No existe el auto en Sucursal 1')

		end

		else 
			if @sucursal=2
			begin
				if exists (select idAutomovil from Sucursal_2.dbo.AutomovilxSucursal where idAutomovil=@idAutomovil)
				begin
					begin transaction
					delete from Sucursal_2.dbo.AutomovilxSucursal
					where idAutomovil = @idAutomovil
					commit transaction
				end
				else
					select('No existe el auto en Sucursal 2')

			end

			else
				if @sucursal=3
				begin
					if exists (select idAutomovil from Sucursal_3.dbo.AutomovilxSucursal where idAutomovil=@idAutomovil)
					begin
						begin transaction
				
						delete from Sucursal_3.dbo.AutomovilxSucursal
						where idAutomovil = @idAutomovil
						commit transaction
					end
					else
						select('No existe el auto en Sucursal 3')

				end



		
		if exists (select idAutomovil from ExtraxAutomovil where idAutomovil=@idAutomovil)
		begin
			begin transaction
			delete from ExtraxAutomovil
			where idAutomovil = @idAutomovil
			commit transaction
		end

		
		if exists (select idAutomovil from FotoxAutomovil where idAutomovil=@idAutomovil)
		begin

			delete from FotoxAutomovil
			where idAutomovil = @idAutomovil
			commit transaction
		end


		if exists (select idAutomovil from Automovil where idAutomovil=@idAutomovil)
		begin
			begin transaction
			delete from Automovil
			where idAutomovil = @idAutomovil
			select('Borrado')
			commit transaction
		end

	

	end try
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
        print('ERROR:'+@errorMsg)
        return -1*@@ERROR
	end catch


end
GO
/****** Object:  StoredProcedure [dbo].[eliminarComision]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarComision] 
@idComision int 
as
begin
	begin transaction
	delete from comision
	where idComision=@idComision
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[eliminarEmpleadoFabrica]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarEmpleadoFabrica]
@idEmpleado int
as
begin
	if exists (select idEmpleadoFabrica from EmpleadoFabrica where idEmpleadoFabrica=@idEmpleado)
	begin
		begin transaction
		delete from EmpleadoFabrica where idEmpleadoFabrica=@idEmpleado
		commit transaction

	end


end
GO
/****** Object:  StoredProcedure [dbo].[eliminarExtra]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarExtra]
@idExtra int

as
begin
	if exists (select idExtra from ExtraxAutomovil where idExtra=@idExtra)
	begin
		begin transaction
		delete from ExtraxAutomovil where idExtra=@idExtra
		commit transaction

	end

	if exists (select idExtra from Extra where idExtra=@idExtra)

	begin
		begin transaction
		delete from Extra where idExtra=@idExtra
		select('Borrado')
		commit transaction

	end
end
GO
/****** Object:  StoredProcedure [dbo].[masVendidosGlobal]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[masVendidosGlobal]
as
begin
	create table #ventas1(marca varchar(50),cantidad int)
	insert into #ventas1
	exec Sucursal_1.dbo.masVendidosSucursal

	insert into #ventas1
	exec Sucursal_2.dbo.masVendidosSucursal

	insert into #ventas1
	exec Sucursal_3.dbo.masVendidosSucursal

	select marca,sum(cantidad) as cantidad from #ventas1
	group by marca
	order by marca DESC

	drop table #ventas1

end
GO
/****** Object:  StoredProcedure [dbo].[modificarAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[modificarAutomovil]
@idAutomovil int,
@placa varchar(20) = null,
@precioBase money = null,
@consignacion bit = null,
@color varchar(20) = null,
@marca varchar(20) = null,
@año int = null,
@cantidadPasajeros int = null,
@puertas int = null,
@foto image = null,
@tipoAuto int = null,
@tipoCombustible int = null


as
begin
	begin transaction
	update Automovil
	set placa = isnull(@placa,placa), precioBase = isnull(@precioBase,precioBase),consignacion = isnull(@consignacion,consignacion),
	idTipoAutomovil = isnull(@tipoAuto,idTipoAutomovil),idTipoCombustible = isnull(@tipoCombustible,idTipoCombustible),anno = isnull(@año,anno)
	where idAutomovil = @idAutomovil
	commit transaction

	declare @carac int
	set @carac = (select CaracteristicasxAutomovil.idCaracteristica from CaracteristicasxAutomovil where @idAutomovil = CaracteristicasxAutomovil.idAutomovil)
	
	begin transaction
	update Caracteristicas
	set color = isnull(@color,color),marca = isnull(@marca,marca), cantidadPasajeros=isnull(@cantidadPasajeros,cantidadPasajeros),
	nPuertas = isnull(@puertas,nPuertas)
	where idCaracteristica = @carac
	commit transaction

	declare @pic int
	set @pic = (select FotoxAutomovil.idFoto from FotoxAutomovil where @idAutomovil = FotoxAutomovil.idAutomovil)

	begin transaction
	update Foto
	set foto = isnull(@foto,foto)
	where idFoto = @pic
	commit transaction


	select('Actualizado!')
	
end
GO
/****** Object:  StoredProcedure [dbo].[modificarCaracteristica]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[modificarCaracteristica]
@color varchar(20)=null,
@marca varchar(20)=null,
@cantidadPasajeros int = null,
@nPuertas int = null,
@idCaracteristica int
as 
begin

	begin transaction
	update Caracteristicas
	set color = isnull(@color,color), marca = isnull(@marca,marca),cantidadPasajeros = isnull(@cantidadPasajeros,cantidadPasajeros),
	nPuertas = isnull(@nPuertas,nPuertas)
	where idCaracteristica = @idCaracteristica
	commit transaction


end
GO
/****** Object:  StoredProcedure [dbo].[modificarCliente]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificarCliente]
@idCliente int,
@nombre varchar(20)=null,
@apellido1 varchar(20)=null,
@apellido2 varchar(20) = null,
@cedula int = null,
@edad int = null,
@usuario varchar(20)=null,
@contrasenna varchar(20)=null,
@ubicacion geometry=null

as 
begin

	begin transaction
	update Cliente
	set nombre = isnull(@nombre,nombre), apellido1 = isnull(@apellido1,apellido1),apellido2 = isnull(@apellido2,apellido2),
	cedula = isnull(@cedula,cedula),edad = isnull(@edad,edad)
	where idCliente = @idCliente
	commit transaction

	begin transaction
	update ClienteUbicacion
	set usuario = isnull(@usuario,usuario),contrasenna = isnull(@contrasenna,contrasenna),
	ubicacion = isnull(@ubicacion,ubicacion)
	where idCliente = @idCliente
	commit transaction


end
GO
/****** Object:  StoredProcedure [dbo].[modificarComision]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[modificarComision] 
@idAutomovil int,
@idCliente int =null,
@comision money =null
as

begin
	begin transaction
	update comision
	set idCliente=isnull(@idCliente,idCliente),comision=isnull(@comision,comision)
	where idAutomovil=@idAutomovil
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[modificarDespacho]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificarDespacho]
@idSucursal int,
@idDespacho int,
@fecha date=null

as
begin
	if @idSucursal=1
	begin
		update DespachoSucursal1
		set fechaDespacho=ISNULL(@fecha,fechaDespacho)
		where idDespacho=@idDespacho
	end
	else
		if @idSucursal=2
		begin
			update DespachoSucursal2
			set fechaDespacho=ISNULL(@fecha,fechaDespacho)
			where idDespacho=@idDespacho
		end
		else
			if @idSucursal=3
			begin
				update DespachoSucursal3
				set fechaDespacho=ISNULL(@fecha,fechaDespacho)
				where idDespacho=@idDespacho
			end


end
GO
/****** Object:  StoredProcedure [dbo].[modificarEmpleadoFabrica]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificarEmpleadoFabrica]
@idFabrica int,
@nombre varchar(20)=null,
@cedula int = null,
@telefono int = null,
@email varchar(20)=null
as
begin

	begin transaction
	update EmpleadoFabrica
	set nombre = isnull(@nombre,nombre),cedula = isnull(@cedula,cedula),telefono = isnull(@telefono,telefono),email=isnull(@email,email)
	where idFabrica = @idFabrica
	commit transaction

	


end
GO
/****** Object:  StoredProcedure [dbo].[modificarExtra]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificarExtra]
@idExtra int,
@nombre varchar(20) = null,
@precio money=null
as
begin

	begin transaction
	update Extra
	set nombre = isnull(@nombre,nombre),precio=isnull(@precio,precio)
	where idExtra = @idExtra
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[modificarFabrica]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificarFabrica]
@idFabrica int,
@direccion varchar(20) = null,
@nombre varchar(20)=null
as
begin

	begin transaction
	update Fabrica
	set direccion = isnull(@direccion,direccion),nombre=isnull(@nombre,nombre)
	where idFabrica = @idFabrica
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[modificarFoto]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificarFoto]
@idFoto int,
@foto image
as
begin

	begin transaction
	update Foto
	set foto = isnull(@foto,foto)
	where idFoto = @idFoto
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[modificarPedido]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificarPedido]
@idSucursal int,
@idPedido int,
@idCliente int =null,
@fechaPedido date =null,
@fechaEntregado date =null

as
begin
	if @idSucursal=1
	begin
		update PedidoSucursal1
		set idCliente=ISNULL(@idCliente,idCliente), fechaPedido=ISNULL(@fechaPedido,fechaPedido),fechaEntrega=isnull(@fechaEntregado,fechaEntrega)
		where idPedido=@idPedido
	end
	else
		if @idSucursal=2
		begin
			update PedidoSucursal2
			set idCliente=ISNULL(@idCliente,idCliente), fechaPedido=ISNULL(@fechaPedido,fechaPedido),fechaEntrega=isnull(@fechaEntregado,fechaEntrega)
			where idPedido=@idPedido
		end
		else
			if @idSucursal=3
			begin
				update PedidoSucursal3
				set idCliente=ISNULL(@idCliente,idCliente), fechaPedido=ISNULL(@fechaPedido,fechaPedido),fechaEntrega=isnull(@fechaEntregado,fechaEntrega)
				where idPedido=@idPedido
			end


end
GO
/****** Object:  StoredProcedure [dbo].[obtenerFinaciamiento]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtenerFinaciamiento](@idAutomovil int,@idSucursal int, @idCliente int)
as
begin
	if @idSucursal=1
		Select CF.idFinanciamiento from Sucursal_1.dbo.ClientexFinanciamiento CF
		inner join Sucursal_1.dbo.FinanciamientoxVenta FV on FV.idFinanciamiento=CF.idFinanciamiento
		inner join Sucursal_1.dbo.VentaxCliente CV on CV.idVenta = FV.idVenta
		inner join Sucursal_1.dbo.AutxSucxVentxCli ASVT on ASVT.idVentaxCliente = CV.idVentaxCliente
		inner join Sucursal_1.dbo.AutomovilxSucursal AxS on AxS.idAutomovilxSucursal = asvt.idAutomovilxSucursal and AxS.idAutomovil=@idAutomovil
		where CF.idCliente=@idCliente
	else if @idSucursal=2
			Select CF.idFinanciamiento from Sucursal_2.dbo.ClientexFinanciamiento CF
			inner join Sucursal_2.dbo.FinanciamientoxVenta FV on FV.idFinanciamiento=CF.idFinanciamiento
			inner join Sucursal_2.dbo.VentaxCliente CV on CV.idVenta = FV.idVenta
			inner join Sucursal_2.dbo.AutxSucxVentxCli ASVT on ASVT.idVentaxCliente = CV.idVentaxCliente
			inner join Sucursal_2.dbo.AutomovilxSucursal AxS on AxS.idAutomovilxSucursal = asvt.idAutomovilxSucursal and AxS.idAutomovil=@idAutomovil
			where CF.idCliente=@idCliente
		else if @idSucursal=3
			Select CF.idFinanciamiento from Sucursal_2.dbo.ClientexFinanciamiento CF
			inner join Sucursal_2.dbo.FinanciamientoxVenta FV on FV.idFinanciamiento=CF.idFinanciamiento
			inner join Sucursal_2.dbo.VentaxCliente CV on CV.idVenta = FV.idVenta
			inner join Sucursal_2.dbo.AutxSucxVentxCli ASVT on ASVT.idVentaxCliente = CV.idVentaxCliente
			inner join Sucursal_2.dbo.AutomovilxSucursal AxS on AxS.idAutomovilxSucursal = asvt.idAutomovilxSucursal and AxS.idAutomovil=@idAutomovil
			where CF.idCliente=@idCliente
			
end

GO
/****** Object:  StoredProcedure [dbo].[pedirFabrica]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pedirFabrica] (@pidSucursal int, @pidAutomovil int, @pidCliente int)
as
BEGIN
	if @pidSucursal=1 
		exec realizarPedidoSucursal1 @idSucursal= @pidSucursal, @idCliente=@pidCliente, @idAutomovil=@pidAutomovil
	else
		begin
			if @pidSucursal=2
				exec realizarPedidoSucursal2 @idSucursal= @pidSucursal,@idCliente=@pidCliente, @idAutomovil=@pidAutomovil
			else
				exec realizarPedidoSucursal3 @idSucursal= @pidSucursal,@idCliente=@pidCliente, @idAutomovil=@pidAutomovil
		end
END
GO
/****** Object:  StoredProcedure [dbo].[pedirFinanciamiento]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[pedirFinanciamiento]
@idCliente int,
@plazo int,
@idAutomovil int,
@idSucursal int
as
begin
	declare @tasa float,@totalCompra money,@prima money
	if @plazo <= 24
		set @tasa = 0.08
	else
		set @tasa = 0.05
		if @idSucursal =1
			begin
			set @totalCompra = (select monto from Sucursal_1.dbo.Venta v inner join Sucursal_1.dbo.VentaxCliente VxC on VxC.idVenta=v.idVenta
			inner join Sucursal_1.dbo.AutxSucxVentxCli asvc on asvc.idVentaxCliente = VxC.idVentaxCliente inner join Sucursal_1.dbo.AutomovilxSucursal AxS
			on AxS.idAutomovilxSucursal = asvc.idAutomovilxSucursal
			where AxS.idAutomovil = @idAutomovil)

			begin transaction
			insert into Sucursal_1.dbo.Financiamiento(tasaInteres,plazo,prima)values(@tasa,@plazo,@totalCompra*0.20)
			commit transaction

			begin transaction
			insert into Sucursal_1.dbo.ClientexFinanciamiento(idCliente,idFinanciamiento)values(@idCliente,IDENT_CURRENT('Sucursal_1.dbo.Financiamiento'))
			commit transaction
			end
		else
			if @idSucursal =2
				begin
				set @totalCompra = (select monto from Sucursal_2.dbo.Venta v inner join Sucursal_2.dbo.VentaxCliente VxC on VxC.idVenta=v.idVenta
				inner join Sucursal_2.dbo.AutxSucxVentxCli asvc on asvc.idVentaxCliente = VxC.idVentaxCliente inner join Sucursal_2.dbo.AutomovilxSucursal AxS
				on AxS.idAutomovilxSucursal = asvc.idAutomovilxSucursal 
				where AxS.idAutomovil = @idAutomovil)

				begin transaction
				insert into Sucursal_2.dbo.Financiamiento(tasaInteres,plazo,prima)values(@tasa,@plazo,@totalCompra*0.20)
				commit transaction
				begin transaction
				
				insert into Sucursal_2.dbo.ClientexFinanciamiento(idFinanciamiento,idCliente)values(IDENT_CURRENT('Sucursal_2.dbo.Financiamiento'),@idCliente)
				commit transaction
				end
			else
				if @idSucursal =3
					begin
					set @totalCompra = (select monto from Sucursal_3.dbo.Venta v inner join Sucursal_3.dbo.VentaxCliente VxC on VxC.idVenta=v.idVenta
					inner join Sucursal_3.dbo.AutxSucxVentxCli asvc on asvc.idVentaxCliente = VxC.idVentaxCliente inner join Sucursal_3.dbo.AutomovilxSucursal AxS
					on AxS.idAutomovilxSucursal = asvc.idAutomovilxSucursal 
					where AxS.idAutomovil = @idAutomovil)

					begin transaction
					insert into Sucursal_3.dbo.Financiamiento(tasaInteres,plazo,prima)values(@tasa,@plazo,@totalCompra*0.20)
					commit transaction
					begin transaction
					insert into Sucursal_3.dbo.ClientexFinanciamiento(idFinanciamiento,idCliente)values(IDENT_CURRENT('Sucursal_3.dbo.Financiamiento'),@idCliente)
					commit transaction
					end
		declare @mensual money,@total money,@intereses money
		set @mensual = @totalCompra/CONVERT(decimal(4,2), @plazo)
		set @intereses = @mensual*@tasa
		set @total = @mensual+@intereses
		declare @resultado varchar(150)
		set @resultado = 'Su financiamiento se otorgo con los siguientes datos.'+CHAR(13)+CHAR(10)+'Prima:'+cast(@totalCompra*0.20 as varchar(50))
		+CHAR(13)+CHAR(10)+'Plazo:'+cast(@plazo as varchar(50))+CHAR(13)+CHAR(10)+'Mensualidad:'+cast(@mensual as varchar(50))+
		+CHAR(13)+CHAR(10)+'Intereses:'+cast(@intereses as varchar(50))+CHAR(13)+CHAR(10)+'Total:'+cast(@total as varchar(50))

		select (@resultado)

end
GO
/****** Object:  StoredProcedure [dbo].[realizarPedidoSucursal1]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[realizarPedidoSucursal1](@idSucursal int, @idAutomovil int, @idCliente int)
as
BEGIN
	begin try
		declare @idAutomovilxSucursal int, @fechaEntrega date
		set @fechaEntrega= DATEADD(month, 1, GETDATE())
		Select @idAutomovilxSucursal=idAutomovilxSucursal from [Sucursal_1].[dbo].AutomovilxSucursal 
		where idAutomovil= @idAutomovil and idSucursal=@idSucursal
		set transaction isolation level read uncommitted
		begin transaction
		Insert into PedidoSucursal1
		Select 1, @idAutomovilxSucursal, @idCliente, GETDATE(),@fechaEntrega,0 --O significa no despachado	
		commit 
	END TRY
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
END
GO
/****** Object:  StoredProcedure [dbo].[realizarPedidoSucursal2]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[realizarPedidoSucursal2](@idSucursal int, @idAutomovil int, @idCliente int)
as
BEGIN
	begin try
		declare @idAutomovilxSucursal int, @fechaEntrega date
		set @fechaEntrega= DATEADD(month, 1, GETDATE())
		Select @idAutomovilxSucursal=idAutomovilxSucursal from [Sucursal_2].[dbo].AutomovilxSucursal 
		where idAutomovil= @idAutomovil and idSucursal=@idSucursal
		set transaction isolation level read uncommitted
		begin transaction
		Insert into PedidoSucursal2
		Select 1, @idAutomovilxSucursal, @idCliente, GETDATE(),@fechaEntrega,0 --O significa no despachado	
		commit 
	END TRY
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
END
GO
/****** Object:  StoredProcedure [dbo].[realizarPedidoSucursal3]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[realizarPedidoSucursal3](@idSucursal int, @idAutomovil int, @idCliente int)
as
BEGIN
	begin try
		declare @idAutomovilxSucursal int, @fechaEntrega date
		set @fechaEntrega= DATEADD(month, 1, GETDATE())
		Select @idAutomovilxSucursal=idAutomovilxSucursal from [Sucursal_2].[dbo].AutomovilxSucursal 
		where idAutomovil= @idAutomovil and idSucursal=@idSucursal
		set transaction isolation level read uncommitted
		begin transaction
		Insert into PedidoSucursal3
		Select 1, @idAutomovilxSucursal, @idCliente, GETDATE(),@fechaEntrega,0 --O significa no despachado	
		commit 
	END TRY
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
END
GO
/****** Object:  StoredProcedure [dbo].[registrarUsuario]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[registrarUsuario] (@usuario varchar(20), @contrasenna varchar(20), @ubicacion geometry, 
@nombre varchar(20), @apellido1 varchar(20), @apellido2 varchar(20), @cedula int, @edad int)
as
begin
	begin try
		set transaction isolation level read uncommitted
		begin transaction

		Insert into Cliente(nombre, apellido1, apellido2, cedula, edad)
		values (@nombre, @apellido1, @apellido2, @cedula, @edad)
		Insert into ClienteUbicacion (usuario, contrasenna, ubicacion)
		values(@usuario,@contrasenna, @ubicacion)
		commit
	end try
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[selectIdAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectIdAutomovil] (@idAutomovilxSucursal int, @idSucursal int)
AS
BEGIN
	if @idSucursal=1
		Select idAutomovil from Sucursal_1.dbo.AutomovilxSucursal AxS where AxS.idAutomovilxSucursal=@idAutomovilxSucursal
	else
		if @idSucursal=2
			Select idAutomovil from Sucursal_2.dbo.AutomovilxSucursal AxS where AxS.idAutomovilxSucursal=@idAutomovilxSucursal
		else
			if @idSucursal=3
				Select idAutomovil from Sucursal_3.dbo.AutomovilxSucursal AxS where AxS.idAutomovilxSucursal=@idAutomovilxSucursal
		
			 
END
GO
/****** Object:  StoredProcedure [dbo].[SelectIdAutomovil1]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectIdAutomovil1] (@placa varchar(20))
AS
BEGIN
	Select idAutomovil from Automovil where placa=@placa
			 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsignarCarro]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ConsignarCarro](@idSucursal int,@idTipoAutomovil int, @idTipoCombustible int, @placa varchar(20), @precioBase money, @anno int, @color varchar(20),@marca varchar(20),
@cantidadPasajeros int, @nPuertas int,@idCliente int)
as
begin
	begin try
		declare @idCaracteristica int, @idAutomovil int
		begin transaction 
			Insert into Automovil(idTipoAutomovil, idTipoCombustible,placa,precioBase,consignacion,anno)
			values(@idTipoAutomovil,@idTipoCombustible,@placa,@precioBase,1,@anno)
		commit transaction
		set @idAutomovil = IDENT_CURRENT('Automovil')
		begin transaction
			Insert into Caracteristicas(color,marca,cantidadPasajeros,nPuertas)
			values(@color,@marca,@cantidadPasajeros,@nPuertas)
		commit transaction
		set @idCaracteristica = IDENT_CURRENT('Caracteristicas')
		begin transaction
			Insert into CaracteristicasxAutomovil(idCaracteristica,idAutomovil)
			values(@idCaracteristica,@idAutomovil)
		commit transaction
		begin transaction
		insert into comision(idCliente,idAutomovil,comision)values(@idCliente,@idAutomovil,0)
		commit transaction
		if @idSucursal=1
			begin transaction
				Insert into Sucursal_1.dbo.AutomovilxSucursal(idAutomovil,idSucursal)
				values(@idAutomovil,@idSucursal)
			commit transaction
		if @idSucursal=2
			begin transaction
				Insert into Sucursal_2.dbo.AutomovilxSucursal(idAutomovil,idSucursal)
				values (@idAutomovil,@idSucursal)
			commit transaction
		if @idSucursal=3
			begin transaction
				Insert into Sucursal_3.dbo.AutomovilxSucursal(idAutomovil,idSucursal)
				values(@idAutomovil,@idSucursal)
			commit transaction
	end try
	begin catch
		declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
		print('ERROR:'+@errorMsg)
		return -1*@@ERROR
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[spAgregarAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAgregarAutomovil] @idTipoAutomovil int, @idTipoCombustible int, @placa varchar(20), @precioBase money,
			@consignacion bit, @anno int, @idCaracteristicas int, @idSucursal int
as
BEGIN
    BEGIN TRY
		BEGIN TRANSACTION
			insert into Automovil(idTipoAutomovil,idTipoCombustible,placa,precioBase,consignacion,anno)
            values(@idTipoAutomovil,@idTipoCombustible,@placa,@precioBase,@consignacion,@anno);

			declare @idAutomovil int;
			set @idAutomovil = (select @@IDENTITY);
			insert into CaracteristicasxAutomovil(idAutomovil,idCaracteristica)
			values(@idAutomovil,@idCaracteristicas);

			if(@idSucursal = 1)
				insert into Sucursal_1.dbo.AutomovilxSucursal(idSucursal,idAutomovil,estado)
				values(1,@idAutomovil,0)
			else if(@idSucursal = 2)
				insert into Sucursal_2.dbo.AutomovilxSucursal(idSucursal,idAutomovil,estado)
				values(1,@idAutomovil,0)
			else if(@idSucursal = 3)
				insert into Sucursal_3.dbo.AutomovilxSucursal(idSucursal,idAutomovil,estado)
				values(1,@idAutomovil,0)
            COMMIT
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarCaracteristica]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spAgregarCaracteristica] @color varchar(20), @marca varchar(20), @cantidadPasajeros int, @nPuertas int
as
BEGIN
    BEGIN TRY
		BEGIN TRANSACTION
			insert into Caracteristicas(color,marca,cantidadPasajeros,nPuertas)
            values(@color,@marca,@cantidadPasajeros,@nPuertas);
		COMMIT
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarComision]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spAgregarComision] 
@idCliente int,
@idAutomovil int,
@comision money =null
as


begin
	begin transaction
	insert into Comision(idCliente,idAutomovil,comision)values(@idCliente,@idAutomovil,isnull(@comision,0))
	select('Agregado')
	commit transaction



end
GO
/****** Object:  StoredProcedure [dbo].[spAgregarEmpleadoFabrica]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spAgregarEmpleadoFabrica]
@nombre varchar(20),
@cedula int ,
@telefono int ,
@email varchar(20)
as
begin

	begin transaction
	insert into EmpleadoFabrica(nombre,cedula,telefono,email)values(@nombre,@cedula,@telefono,@email)
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[spAgregarExtra]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[spAgregarExtra] @nombre varchar(20), @precio money
as
BEGIN
    BEGIN TRY
		BEGIN TRANSACTION
			insert into Extra(nombre,precio)
            values(@nombre,@precio);
            COMMIT
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarExtraxAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create  procedure [dbo].[spAgregarExtraxAutomovil] @idAutomovil int, @idExra int
as
BEGIN
    BEGIN TRY
		BEGIN TRANSACTION
			insert into ExtraxAutomovil(idAutomovil,idExtra)
            values(@idAutomovil,@idExra);
            COMMIT
			Select 1
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = 'Se ha producido un error al intentar agregar el extra'
            print('ERROR:'+@errorMsg)
			Select @errorMsg
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarTipoAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[spAgregarTipoAutomovil] @tipo varchar(50)
as
BEGIN
    BEGIN TRY
		BEGIN TRANSACTION
			insert into TipoAutomovil(tipo)
            values(@tipo);
		COMMIT
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarTipoCombustible]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[spAgregarTipoCombustible] @tipo varchar(50)
as
BEGIN
    BEGIN TRY
		BEGIN TRANSACTION
			insert into TipoCombustible(tipo)
            values(@tipo);
		COMMIT
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarDescuento10P]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spConsultarDescuento10P] @idCliente int, @idSucursal int
as
BEGIN
    BEGIN TRY
		declare @countFecha int;
		if (@idSucursal = 1)
			set @countFecha = (Select count (V.fecha) from Sucursal_1.dbo.Venta V
			inner join Sucursal_1.dbo.VentaxCliente VC
			on @idCliente = VC.idCliente
			where VC.idVenta = V.idVenta and V.fecha >= DATEADD(year,-5,GETDATE()));
			
			if(@countFecha >= 3)
				return 1;
			else
				return 0;
		if (@idSucursal = 2)
			set @countFecha = (Select count (V.fecha) from Sucursal_2.dbo.Venta V
			inner join Sucursal_2.dbo.VentasxCliente VC
			on @idCliente = VC.idCliente
			where VC.idVenta = V.idVenta and V.fecha >= DATEADD(year,-5,GETDATE()));
			
			if(@countFecha >= 3)
				return 1;
			else
				return 0;
		if (@idSucursal = 3)
			set @countFecha = (Select count (V.fecha) from Sucursal_3.dbo.Venta V
			inner join Sucursal_3.dbo.VentasxCliente VC
			on @idCliente = VC.idCliente
			where VC.idVenta = V.idVenta and V.fecha >= DATEADD(year,-5,GETDATE()));
			
			if(@countFecha >= 3)
				return 1;
			else
				return 0;
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarPrecioAutomovil]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[spConsultarPrecioAutomovil] @idAutomovil int
as
BEGIN
    BEGIN TRY
		Select precioBase from Automovil
		where @idAutomovil = idAutomovil
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarPrecioExtra]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spConsultarPrecioExtra] @idExtra int 
as
BEGIN
    BEGIN TRY
		Select precio from Extra
		where @idExtra = idExtra
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spVerAutoNoSalidaxSucursal]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spVerAutoNoSalidaxSucursal] @idSucursal int
as
BEGIN
    BEGIN TRY
		if(@idSucursal = 1)
			Select CA.idCaracteristica from CaracteristicasxAutomovil CA
			inner join Sucursal_1.dbo.AutomovilxSucursal ASuc
			on CA.idAutomovil = ASuc.idAutomovil and ASuc.estado = 0
			where ASuc.idAutomovilxSucursal not in (select idAutomovilxSucursal from Sucursal_1.dbo.AutoxSucxVentaxCli)
		else if (@idSucursal = 2)
			Select CA.idCaracteristica from CaracteristicasxAutomovil CA
			inner join Sucursal_2.dbo.AutomovilxSucursal ASuc
			on CA.idAutomovil = ASuc.idAutomovil and ASuc.estado = 0
			where ASuc.idAutomovilxSucursal not in (select idAutomovilxSucursal from Sucursal_2.dbo.AutxSucxVentxCli)
		else if (@idSucursal = 3)
			Select CA.idCaracteristica from CaracteristicasxAutomovil CA
			inner join Sucursal_3.dbo.AutomovilxSucursal ASuc
			on CA.idAutomovil = ASuc.idAutomovil and ASuc.estado = 0
			where ASuc.idAutomovilxSucursal not in (select idAutomovilxSucursal from Sucursal_3.dbo.AutxSucxVentxCli)
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[venderCarro]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[venderCarro]
@idAutomovil int,
@idCliente int,
@sucursal int,
@idTipoPago int,
@financiamiento bit,
@plazo int = null
as
begin 
	declare @precioBase money,@precioExtras money,@precioTotal money,@descuento int
	if @sucursal = 1 
		begin
		set @precioBase = isnull((select Automovil.precioBase from Automovil inner join Sucursal_1.dbo.AutomovilxSucursal AxS on Automovil.idAutomovil =AxS.idAutomovil
							where AxS.estado = 0 and AxS.idAutomovil=@idAutomovil),0)
		if @precioBase = 0
			begin
			declare @errorMsg varchar(100) = 'El carro no existe en la sucursal'
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
			end
		else
			print 'Precio Base:'+cast(@precioBase as varchar(30))
			select 'Precio Base:'+cast(@precioBase as varchar(30))
			exec @precioExtras = calcularExtras @idAutomovil = @idAutomovil
			print 'Precio Extras:'+cast(@precioExtras as varchar(30))
			select 'Precio Extras:'+cast(@precioExtras as varchar(30))
			exec @descuento = spConsultarDescuento10P @idCliente = @idCliente,@idSucursal = @sucursal
			print 'Descuento:'+cast(@descuento as varchar(30))
			select 'Descuento:'+cast(@descuento as varchar(30))
			if @descuento = 1
				begin
				begin transaction
				set @precioTotal = (@precioBase+@precioExtras)-((@precioBase+@precioExtras)*0.10)
				insert into Sucursal_1.dbo.Venta(fecha,monto,idTipoPago)values(GETDATE(),@precioTotal,@idTipoPago)
				print 'Precio Total:'+cast(@precioTotal as varchar(30))
				select 'Precio Total:'+cast(@precioTotal as varchar(30))
				commit transaction
				end
			else
				begin transaction
				set @precioTotal = (@precioBase+@precioExtras)
				insert into Sucursal_1.dbo.Venta(fecha,monto,idTipoPago)values(GETDATE(),@precioTotal,@idTipoPago)
				print 'Precio Total:'+cast(@precioTotal as varchar(30))
				select 'Precio Total:'+cast(@precioTotal as varchar(30))
				commit transaction

			begin transaction
			insert into Sucursal_1.dbo.VentaxCliente(idCliente,idVenta)values(@idCliente,IDENT_CURRENT('Sucursal_1.dbo.Venta'))
			commit transaction


			begin transaction
			declare @idAutxSuc int
			set @idAutxSuc = (select AxS.idAutomovilxSucursal from Sucursal_1.dbo.AutomovilxSucursal AxS where AxS.idAutomovil=@idAutomovil)
			insert into Sucursal_1.dbo.AutxSucxVentxCli(idVentaxCliente,idAutomovilxSucursal)values(IDENT_CURRENT('Sucursal_1.dbo.VentaxCliente'),@idAutxSuc)
			commit transaction

			begin transaction
			update Sucursal_1.dbo.AutomovilxSucursal
			set estado = 1
			where Sucursal_1.dbo.AutomovilxSucursal.idAutomovilxSucursal = @idAutxSuc
			commit transaction
			select ('Venta Registrada!')
		end
	else
		if @sucursal =2 
			begin
			set @precioBase = isnull((select Automovil.precioBase from Automovil inner join Sucursal_2.dbo.AutomovilxSucursal AxS on Automovil.idAutomovil =AxS.idAutomovil
								where AxS.estado = 0 and AxS.idAutomovil=@idAutomovil),0)
			if @precioBase = 0
				begin
				declare @errorMsg2 varchar(100) = 'El carro no existe en la sucursal'
				print('ERROR:'+@errorMsg2)
				return -1*@@ERROR
				end
			else
				print 'Precio Base:'+cast(@precioBase as varchar(30))
				select 'Precio Base:'+cast(@precioBase as varchar(30))
				exec @precioExtras = calcularExtras @idAutomovil = @idAutomovil
				print 'Precio Extras:'+cast(@precioExtras as varchar(30))
				select 'Precio Extras:'+cast(@precioExtras as varchar(30))
				exec @descuento = spConsultarDescuento10P @idCliente = @idCliente,@idSucursal = @sucursal
				print 'Descuento:'+cast(@descuento as varchar(30))
				select 'Descuento:'+cast(@descuento as varchar(30))
				if @descuento = 1
					begin
					begin transaction
					
					set @precioTotal = (@precioBase+@precioExtras)-((@precioBase+@precioExtras)*0.10)
					insert into Sucursal_2.dbo.Venta(fecha,monto,idTipoPago)values(GETDATE(),@precioTotal,@idTipoPago)
					print 'Precio Total:'+cast(@precioTotal as varchar(30))
					select 'Precio Total:'+cast(@precioTotal as varchar(30))
					commit transaction
					end
				else
					begin transaction
					set @precioTotal = (@precioBase+@precioExtras)
					insert into Sucursal_2.dbo.Venta(fecha,monto,idTipoPago)values(GETDATE(),@precioTotal,@idTipoPago)
					print 'Precio Total:'+cast(@precioTotal as varchar(30))
					select 'Precio Total:'+cast(@precioTotal as varchar(30))
					commit transaction

			
				begin transaction
				insert into Sucursal_2.dbo.VentaxCliente(idCliente,idVenta)values(@idCliente,IDENT_CURRENT('Sucursal_2.dbo.Venta'))
				commit transaction


				begin transaction
				declare @idAutxSuc2 int
				set @idAutxSuc2 = (select AxS.idAutomovilxSucursal from Sucursal_2.dbo.AutomovilxSucursal AxS where AxS.idAutomovil=@idAutomovil)
				insert into Sucursal_2.dbo.AutxSucxVentxCli(idVentaxCliente,idAutomovilxSucursal)values(IDENT_CURRENT('Sucursal_2.dbo.VentaxCliente'),@idAutxSuc2)
				commit transaction

				begin transaction
				update Sucursal_2.dbo.AutomovilxSucursal
				set estado = 1
				where Sucursal_2.dbo.AutomovilxSucursal.idAutomovilxSucursal = @idAutxSuc2
				commit transaction

				select ('Venta Registrada!')
			end
		else
			if @sucursal =3
				begin
				set @precioBase = isnull((select Automovil.precioBase from Automovil inner join Sucursal_3.dbo.AutomovilxSucursal AxS on Automovil.idAutomovil =AxS.idAutomovil
									where AxS.estado = 0 and AxS.idAutomovil=@idAutomovil),0)
				if @precioBase = 0
					begin
					declare @errorMsg3 varchar(100) = 'El carro no existe en la sucursal'
					print('ERROR:'+@errorMsg3)
					return -1*@@ERROR
					end
				else
			
					print 'Precio Base:'+cast(@precioBase as varchar(30))
					select 'Precio Base:'+cast(@precioBase as varchar(30))
					exec @precioExtras = calcularExtras @idAutomovil = @idAutomovil
					print 'Precio Extras:'+cast(@precioExtras as varchar(30))
					select 'Precio Extras:'+cast(@precioExtras as varchar(30))
					exec @descuento = spConsultarDescuento10P @idCliente = @idCliente,@idSucursal = @sucursal
					print 'Descuento:'+cast(@descuento as varchar(30))
					select 'Descuento:'+cast(@descuento as varchar(30))
					if @descuento = 1
					begin
						begin transaction
						set @precioTotal = (@precioBase+@precioExtras)-((@precioBase+@precioExtras)*0.10)
						insert into Sucursal_3.dbo.Venta(fecha,monto,idTipoPago)values(GETDATE(),@precioTotal,@idTipoPago)
						print 'Precio Total:'+cast(@precioTotal as varchar(30))
						select 'Precio Total:'+cast(@precioTotal as varchar(30))
						commit transaction
					end
					else
						begin transaction
						set @precioTotal = (@precioBase+@precioExtras)
						insert into Sucursal_3.dbo.Venta(fecha,monto,idTipoPago)values(GETDATE(),@precioTotal,@idTipoPago)
						print 'Precio Total:'+cast(@precioTotal as varchar(30))
						select 'Precio Total:'+cast(@precioTotal as varchar(30))
						commit transaction

					begin transaction
					insert into Sucursal_3.dbo.VentaxCliente(idCliente,idVenta)values(@idCliente,IDENT_CURRENT('Sucursal_3.dbo.Venta'))
					commit transaction


					begin transaction
					declare @idAutxSuc3 int
					set @idAutxSuc3 = (select AxS.idAutomovilxSucursal from Sucursal_3.dbo.AutomovilxSucursal AxS where AxS.idAutomovil=@idAutomovil)
					insert into Sucursal_3.dbo.AutxSucxVentxCli(idVentaxCliente,idAutomovilxSucursal)values(IDENT_CURRENT('Sucursal_3.dbo.VentaxCliente'),@idAutxSuc3)
					commit transaction

					begin transaction
					update Sucursal_3.dbo.AutomovilxSucursal
					set estado = 1
					where Sucursal_3.dbo.AutomovilxSucursal.idAutomovilxSucursal = @idAutxSuc3
					commit transaction
					select ('Venta Registrada!')
				end

	if @financiamiento = 1
		begin
		declare @res varchar(150)
		
		exec @res = pedirFinanciamiento @idCliente = @idCliente, @plazo = @plazo,@idAutomovil = @idAutomovil,@idSucursal = @sucursal
		select @res
		end
	else
		select 'No se solicito financiamiento'
	
	declare @consignado bit
	set @consignado=(select consignacion from Automovil where idAutomovil=@idAutomovil)

	if @consignado =1
	begin
		declare @comision money
		set @comision=@precioTotal*0.2						--Comision por consignacion del 20%
		exec modificarComision @idAutomovil=@idAutomovil,@comision=@comision
	end

end
GO
/****** Object:  StoredProcedure [dbo].[ventas1]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ventas1]
@idSucursal int = null,
@tipoAutomovil varchar(30) =null,
@pais varchar(30) = null,
@fechaIni date = null,
@fechaFin date = null


as
begin
	declare @ventas1 money,@ventas2 money,@ventas3 money
	set @ventas1 = (select sum(monto) from Sucursal_1.dbo.Venta v 
					inner join Sucursal_1.dbo.VentaxCliente VxC on VxC.idVenta=v.idVenta inner join Sucursal_1.dbo.AutxSucxVentxCli ASVC on ASVC.idVentaxCliente = 
					VxC.idVentaxCliente inner join Sucursal_1.dbo.AutomovilxSucursal AxS on ASVC.idAutomovilxSucursal = AxS.idAutomovilxSucursal inner join 
					Sucursal_1.dbo.Sucursal s on S.idSucursal=AxS.idSucursal inner join Sucursal_1.dbo.SucursalUbicacion SU on SU.idSucursal = S.idSucursal inner join
					Automovil a on a.idAutomovil = AxS.idAutomovil inner join TipoAutomovil TA on TA.idTipoAutomovil = a.idTipoAutomovil
					where s.idSucursal = isnull(@idSucursal,s.idSucursal) and TA.tipo = isnull(@tipoAutomovil,TA.tipo) and SU.pais = isnull(@pais,SU.pais) and
					v.fecha between isnull(@fechaIni,v.fecha) and isnull(@fechaFin,v.fecha))

	set @ventas2 = (select sum(monto) from Sucursal_2.dbo.Venta v 
					inner join Sucursal_2.dbo.VentaxCliente VxC on VxC.idVenta=v.idVenta inner join Sucursal_2.dbo.AutxSucxVentxCli ASVC on ASVC.idVentaxCliente = 
					VxC.idVentaxCliente inner join Sucursal_2.dbo.AutomovilxSucursal AxS on ASVC.idAutomovilxSucursal = AxS.idAutomovilxSucursal inner join 
					Sucursal_2.dbo.Sucursal s on S.idSucursal=AxS.idSucursal inner join Sucursal_2.dbo.SucursalUbicacion SU on SU.idSucursal = S.idSucursal inner join
					Automovil a on a.idAutomovil = AxS.idAutomovil inner join TipoAutomovil TA on TA.idTipoAutomovil = a.idTipoAutomovil
					where s.idSucursal = isnull(@idSucursal,s.idSucursal) and TA.tipo = isnull(@tipoAutomovil,TA.tipo) and SU.pais = isnull(@pais,SU.pais) and
					v.fecha between isnull(@fechaIni,v.fecha) and isnull(@fechaFin,v.fecha))

	set @ventas3 = (select sum(monto) from Sucursal_3.dbo.Venta v 
					inner join Sucursal_3.dbo.VentaxCliente VxC on VxC.idVenta=v.idVenta inner join Sucursal_3.dbo.AutxSucxVentxCli ASVC on ASVC.idVentaxCliente = 
					VxC.idVentaxCliente inner join Sucursal_3.dbo.AutomovilxSucursal AxS on ASVC.idAutomovilxSucursal = AxS.idAutomovilxSucursal inner join 
					Sucursal_3.dbo.Sucursal s on S.idSucursal=AxS.idSucursal inner join Sucursal_3.dbo.SucursalUbicacion SU on SU.idSucursal = S.idSucursal inner join
					Automovil a on a.idAutomovil = AxS.idAutomovil inner join TipoAutomovil TA on TA.idTipoAutomovil = a.idTipoAutomovil
					where s.idSucursal = isnull(@idSucursal,s.idSucursal) and TA.tipo = isnull(@tipoAutomovil,TA.tipo) and SU.pais = isnull(@pais,SU.pais) and
					v.fecha between isnull(@fechaIni,v.fecha) and isnull(@fechaFin,v.fecha))



	select (@ventas1+@ventas2+@ventas3)


end
GO
/****** Object:  StoredProcedure [dbo].[ventas2]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[ventas2]
@idSucursal int = null,
@tipoPago varchar(50)=null,
@fechaIni date = null,
@fechaFin date = null


as
begin
	declare @ventas1 money,@ventas2 money,@ventas3 money
	set @ventas1 = (select sum(monto) from Sucursal_1.dbo.Venta v inner join Sucursal_1.dbo.TipoPago tp on v.idTipoPago=tp.idTipoPago
					inner join Sucursal_1.dbo.VentaxCliente VxC on VxC.idVenta=v.idVenta inner join Sucursal_1.dbo.AutxSucxVentxCli ASVC on ASVC.idVentaxCliente = 
					VxC.idVentaxCliente inner join Sucursal_1.dbo.AutomovilxSucursal AxS on ASVC.idAutomovilxSucursal = AxS.idAutomovilxSucursal inner join 
					Sucursal_1.dbo.Sucursal s on S.idSucursal=AxS.idSucursal 
					where s.idSucursal = isnull(@idSucursal,s.idSucursal) and tp.tipo=ISNULL(@tipoPago,tipo)and v.fecha between isnull(@fechaIni,v.fecha) and isnull(@fechaFin,v.fecha))

	set @ventas2 = (select sum(monto) from Sucursal_2.dbo.Venta v inner join Sucursal_2.dbo.TipoPago tp on v.idTipoPago=tp.idTipoPago
					inner join Sucursal_2.dbo.VentaxCliente VxC on VxC.idVenta=v.idVenta inner join Sucursal_2.dbo.AutxSucxVentxCli ASVC on ASVC.idVentaxCliente = 
					VxC.idVentaxCliente inner join Sucursal_2.dbo.AutomovilxSucursal AxS on ASVC.idAutomovilxSucursal = AxS.idAutomovilxSucursal inner join 
					Sucursal_2.dbo.Sucursal s on S.idSucursal=AxS.idSucursal 
					where s.idSucursal = isnull(@idSucursal,s.idSucursal) and tp.tipo=ISNULL(@tipoPago,tipo)and v.fecha between isnull(@fechaIni,v.fecha) and isnull(@fechaFin,v.fecha))

	set @ventas3 = (select sum(monto) from Sucursal_3.dbo.Venta v inner join Sucursal_3.dbo.TipoPago tp on v.idTipoPago=tp.idTipoPago
					inner join Sucursal_3.dbo.VentaxCliente VxC on VxC.idVenta=v.idVenta inner join Sucursal_3.dbo.AutxSucxVentxCli ASVC on ASVC.idVentaxCliente = 
					VxC.idVentaxCliente inner join Sucursal_3.dbo.AutomovilxSucursal AxS on ASVC.idAutomovilxSucursal = AxS.idAutomovilxSucursal inner join 
					Sucursal_3.dbo.Sucursal s on S.idSucursal=AxS.idSucursal 
					where s.idSucursal = isnull(@idSucursal,s.idSucursal) and tp.tipo=ISNULL(@tipoPago,tipo)and v.fecha between isnull(@fechaIni,v.fecha) and isnull(@fechaFin,v.fecha))



	select (@ventas1+@ventas2+@ventas3)


end




GO
/****** Object:  StoredProcedure [dbo].[verAutosDisponibles]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Se ven las caracteristicas principales de los automoviles disponibles si el usuario desea ver
--fotos y extras debe seleccionar un automovil
CREATE procedure [dbo].[verAutosDisponibles](@idSucursal int)
as
begin
if @idSucursal=1
	Select placa, precioBase as precio, anno as año, color, marca, cantidadPasajeros, nPuertas, TA.tipo, TC.tipo as combustible
	from [Sucursal_1].[dbo].AutomovilxSucursal AxS
	inner join Automovil A on A.idAutomovil= AxS.idAutomovil
	inner join TipoAutomovil TA on TA.idTipoAutomovil = A.idTipoAutomovil
	inner join TipoCombustible TC on TC.idTipoCombustible = A.idTipoCombustible
	inner join CaracteristicasxAutomovil CA on A.idAutomovil= CA.idAutomovil
	inner join Caracteristicas C on C.idCaracteristica = CA.idCaracteristica
	where AxS.estado=0
if @idSucursal=2
	Select placa, precioBase as precio, anno as año, color, marca, cantidadPasajeros, nPuertas, TA.tipo, TC.tipo as combustible
	from [Sucursal_2].[dbo].AutomovilxSucursal AxS
	inner join Automovil A on A.idAutomovil= AxS.idAutomovil
	inner join TipoAutomovil TA on TA.idTipoAutomovil = A.idTipoAutomovil
	inner join TipoCombustible TC on TC.idTipoCombustible = A.idTipoCombustible
	inner join CaracteristicasxAutomovil CA on A.idAutomovil= CA.idAutomovil
	inner join Caracteristicas C on C.idCaracteristica = CA.idCaracteristica
	where AxS.estado=0
if @idSucursal=3
	Select placa, precioBase as precio, anno as año, color, marca, cantidadPasajeros, nPuertas, TA.tipo, TC.tipo as combustible
	from [Sucursal_3].[dbo].AutomovilxSucursal AxS
	inner join Automovil A on A.idAutomovil= AxS.idAutomovil
	inner join TipoAutomovil TA on TA.idTipoAutomovil = A.idTipoAutomovil
	inner join TipoCombustible TC on TC.idTipoCombustible = A.idTipoCombustible
	inner join CaracteristicasxAutomovil CA on A.idAutomovil= CA.idAutomovil
	inner join Caracteristicas C on C.idCaracteristica = CA.idCaracteristica
	where AxS.estado=0
end
GO
/****** Object:  StoredProcedure [dbo].[verAutosDisponiblesGlobal]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verAutosDisponiblesGlobal]
as
begin
	Select sucursal=1,placa, precioBase as precio, anno as año, color, marca, cantidadPasajeros, nPuertas, TA.tipo, TC.tipo as combustible
	from [Sucursal_1].[dbo].AutomovilxSucursal AxS
	inner join Automovil A on A.idAutomovil= AxS.idAutomovil
	inner join TipoAutomovil TA on TA.idTipoAutomovil = A.idTipoAutomovil
	inner join TipoCombustible TC on TC.idTipoCombustible = A.idTipoCombustible
	inner join CaracteristicasxAutomovil CA on A.idAutomovil= CA.idAutomovil
	inner join Caracteristicas C on C.idCaracteristica = CA.idCaracteristica
	where AxS.estado=0
	union
	Select sucursal=2, placa, precioBase as precio, anno as año, color, marca, cantidadPasajeros, nPuertas, TA.tipo, TC.tipo as combustible
	from [Sucursal_2].[dbo].AutomovilxSucursal AxS
	inner join Automovil A on A.idAutomovil= AxS.idAutomovil
	inner join TipoAutomovil TA on TA.idTipoAutomovil = A.idTipoAutomovil
	inner join TipoCombustible TC on TC.idTipoCombustible = A.idTipoCombustible
	inner join CaracteristicasxAutomovil CA on A.idAutomovil= CA.idAutomovil
	inner join Caracteristicas C on C.idCaracteristica = CA.idCaracteristica
	where AxS.estado=0
	union
	Select sucursal=3,placa, precioBase as precio, anno as año, color, marca, cantidadPasajeros, nPuertas, TA.tipo, TC.tipo as combustible
	from [Sucursal_3].[dbo].AutomovilxSucursal AxS
	inner join Automovil A on A.idAutomovil= AxS.idAutomovil
	inner join TipoAutomovil TA on TA.idTipoAutomovil = A.idTipoAutomovil
	inner join TipoCombustible TC on TC.idTipoCombustible = A.idTipoCombustible
	inner join CaracteristicasxAutomovil CA on A.idAutomovil= CA.idAutomovil
	inner join Caracteristicas C on C.idCaracteristica = CA.idCaracteristica
	where AxS.estado=0


end
GO
/****** Object:  StoredProcedure [dbo].[verCaracteristicas]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[verCaracteristicas]
as 
begin

	begin transaction
		select idCaracteristica,color, marca, cantidadPasajeros, nPuertas 
		from Caracteristicas
	commit transaction


end
GO
/****** Object:  StoredProcedure [dbo].[verComision]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verComision] 
@idCliente int=null,
@idAutomovil int =null
as
begin
	begin transaction
	select * from comision where idCliente=isnull(@idCliente,idCliente) and idAutomovil=isnull(@idAutomovil,idAutomovil)
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[verDespachoSucursal]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verDespachoSucursal]
@idDespacho int

as
begin
	
	if @idDespacho=1
	begin
		select * from DespachoSucursal1
	end
	else
		if @idDespacho=2
		begin
			select * from DespachoSucursal2
		end
		else
			if @idDespacho=3
			begin
				select * from DespachoSucursal3
			end

end
GO
/****** Object:  StoredProcedure [dbo].[verEmpleadosFabrica]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[verEmpleadosFabrica]
as
begin
	select * from EmpleadoFabrica

end
GO
/****** Object:  StoredProcedure [dbo].[verEmpleadosSucursal]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verEmpleadosSucursal] (@idSucursal int)
as
begin
if @idSucursal=1
	Select nombre, apellido1, apellido2 from [Sucursal_1].[dbo].[Empleado]
if @idSucursal=2
	Select nombre, apellido1, apellido2 from [Sucursal_2].[dbo].[Empleado]
if @idSucursal=3
	Select nombre, apellido1, apellido2 from [Sucursal_3].[dbo].[Empleado]
END
GO
/****** Object:  StoredProcedure [dbo].[verExtrasAutosDisponibles]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verExtrasAutosDisponibles](@idAutomovil int)
as
BEGIN
	Select nombre, precio
	from ExtraxAutomovil EX 
	inner join Extra E on E.idExtra= EX.idExtra
	where idAutomovil=@idAutomovil
END
GO
/****** Object:  StoredProcedure [dbo].[verFotosAutosDisponibles]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verFotosAutosDisponibles](@idAutomovil int)
as
BEGIN
	Select foto 
	from FotoxAutomovil FA
	inner join Foto F on F.idFoto= FA.idFoto
	where idAutomovil=@idAutomovil
END
GO
/****** Object:  StoredProcedure [dbo].[verHorarioSucursal]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verHorarioSucursal] (@idSucursal int)
as
begin
if @idSucursal=1 	
	Select horaEntrada as entrada, horaEntrada as salida from [Sucursal_1].[dbo].[Sucursal] S
	
if @idSucursal=2
	Select horaEntrada as entrada, horaSalida as salida from [Sucursal_2].[dbo].[Sucursal]
	
if @idSucursal=3
	Select horaEntrada as entrada, horaSalida as salida from [Sucursal_3].[dbo].[Sucursal] 
	
end
GO
/****** Object:  StoredProcedure [dbo].[verPedidosSucursal]    Script Date: 17/6/2019 23:52:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[verPedidosSucursal]
@idSucursal int

as
begin
	
	if @idSucursal=1
	begin
		select * from PedidoSucursal1
	end
	else
		if @idSucursal=2
		begin
			select * from PedidoSucursal2
		end
		else
			if @idSucursal=3
			begin
				select * from PedidoSucursal3
			end

end
GO
USE [master]
GO
ALTER DATABASE [Fabrica] SET  READ_WRITE 
GO

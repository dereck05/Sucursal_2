USE [master]
GO
/****** Object:  Database [Sucursal_1]    Script Date: 17/6/2019 23:53:07 ******/
CREATE DATABASE [Sucursal_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sucursal_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sucursal_1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sucursal_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sucursal_1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Sucursal_1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sucursal_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sucursal_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sucursal_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sucursal_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sucursal_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sucursal_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sucursal_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sucursal_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sucursal_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sucursal_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sucursal_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sucursal_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sucursal_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sucursal_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sucursal_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sucursal_1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sucursal_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sucursal_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sucursal_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sucursal_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sucursal_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sucursal_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sucursal_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sucursal_1] SET RECOVERY FULL 
GO
ALTER DATABASE [Sucursal_1] SET  MULTI_USER 
GO
ALTER DATABASE [Sucursal_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sucursal_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sucursal_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sucursal_1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sucursal_1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sucursal_1', N'ON'
GO
ALTER DATABASE [Sucursal_1] SET QUERY_STORE = OFF
GO
USE [Sucursal_1]
GO
/****** Object:  User [global_admin]    Script Date: 17/6/2019 23:53:07 ******/
CREATE USER [global_admin] FOR LOGIN [global_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Cliente]    Script Date: 17/6/2019 23:53:07 ******/
CREATE USER [Cliente] FOR LOGIN [Cliente] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin_1]    Script Date: 17/6/2019 23:53:07 ******/
CREATE USER [admin_1] FOR LOGIN [admin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [global_admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [global_admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [global_admin]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin_1]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin_1]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin_1]
GO
/****** Object:  Table [dbo].[AutomovilxSucursal]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutomovilxSucursal](
	[idAutomovilxSucursal] [int] IDENTITY(1,1) NOT NULL,
	[idSucursal] [int] NULL,
	[idAutomovil] [int] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_AutomovilxSucursal] PRIMARY KEY CLUSTERED 
(
	[idAutomovilxSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutxSucxVentxCli]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutxSucxVentxCli](
	[idAutoxSucxVentaXCli] [int] IDENTITY(1,1) NOT NULL,
	[idVentaxCliente] [int] NOT NULL,
	[idAutomovilxSucursal] [int] NOT NULL,
 CONSTRAINT [PK_AutoxSucxVentaxCli] PRIMARY KEY CLUSTERED 
(
	[idAutoxSucxVentaXCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientexFinanciamiento]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientexFinanciamiento](
	[idClientexFinanciamiento] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[idFinanciamiento] [int] NULL,
 CONSTRAINT [PK_ClientexFinanciamiento] PRIMARY KEY CLUSTERED 
(
	[idClientexFinanciamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[idAutoxSucxVentaxCli] [int] NULL,
 CONSTRAINT [PK_Detalle] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallexFactura]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallexFactura](
	[idDetallexFactura] [int] IDENTITY(1,1) NOT NULL,
	[idFactura] [int] NULL,
	[idDetalle] [int] NULL,
 CONSTRAINT [PK_DetallexFactura] PRIMARY KEY CLUSTERED 
(
	[idDetallexFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[apellido1] [varchar](30) NULL,
	[apellido2] [varchar](30) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadoxSucursal]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadoxSucursal](
	[idEmpleadoxSucursal] [int] IDENTITY(1,1) NOT NULL,
	[idEmpleado] [int] NULL,
	[idSucursal] [int] NULL,
	[fechaContratacion] [date] NULL,
 CONSTRAINT [PK_EmpleadoxSucursal] PRIMARY KEY CLUSTERED 
(
	[idEmpleadoxSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[montoTotal] [money] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Financiamiento]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Financiamiento](
	[idFinanciamiento] [int] IDENTITY(1,1) NOT NULL,
	[tasaInteres] [float] NULL,
	[plazo] [int] NULL,
	[prima] [money] NOT NULL,
 CONSTRAINT [PK_Financiamiento] PRIMARY KEY CLUSTERED 
(
	[idFinanciamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinanciamientoxVenta]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinanciamientoxVenta](
	[idFinanciamientoxVenta] [int] IDENTITY(1,1) NOT NULL,
	[idFinanciamiento] [int] NOT NULL,
	[idVenta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFinanciamientoxVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Impuesto]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impuesto](
	[idImpuesto] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
 CONSTRAINT [PK_Impuesto] PRIMARY KEY CLUSTERED 
(
	[idImpuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[monto] [money] NULL,
	[fecha] [date] NULL,
	[idTipoPago] [int] NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoxClientexFinanciamiento]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoxClientexFinanciamiento](
	[idPagoxClientexFinanciamiento] [int] IDENTITY(1,1) NOT NULL,
	[idPago] [int] NULL,
	[idClientexFinanciamiento] [int] NULL,
 CONSTRAINT [PK_PagoxClientexFinanciamiento] PRIMARY KEY CLUSTERED 
(
	[idPagoxClientexFinanciamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [int] IDENTITY(1,1) NOT NULL,
	[horaEntrada] [time](4) NULL,
	[horaSalida] [time](4) NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SucursalUbicacion]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SucursalUbicacion](
	[idSucursalUbicacion] [int] IDENTITY(1,1) NOT NULL,
	[ubicacion] [geometry] NULL,
	[pais] [varchar](30) NULL,
	[idSucursal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idSucursalUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPago](
	[idTipoPago] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](20) NULL,
 CONSTRAINT [PK_TipoPago] PRIMARY KEY CLUSTERED 
(
	[idTipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[monto] [money] NULL,
	[idTipoPago] [int] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaxCliente]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaxCliente](
	[idVentaxCliente] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[idVenta] [int] NULL,
 CONSTRAINT [PK_VentaxCliente] PRIMARY KEY CLUSTERED 
(
	[idVentaxCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AutomovilxSucursal]  WITH CHECK ADD  CONSTRAINT [FK_AutomovilxSucursal_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[AutomovilxSucursal] CHECK CONSTRAINT [FK_AutomovilxSucursal_Sucursal]
GO
ALTER TABLE [dbo].[AutxSucxVentxCli]  WITH CHECK ADD  CONSTRAINT [FK_AutxSucsVentxCli_VentaxCliente] FOREIGN KEY([idVentaxCliente])
REFERENCES [dbo].[VentaxCliente] ([idVentaxCliente])
GO
ALTER TABLE [dbo].[AutxSucxVentxCli] CHECK CONSTRAINT [FK_AutxSucsVentxCli_VentaxCliente]
GO
ALTER TABLE [dbo].[AutxSucxVentxCli]  WITH CHECK ADD  CONSTRAINT [FK_AutxSucxVentxCli_AutomovilxSucursal] FOREIGN KEY([idAutomovilxSucursal])
REFERENCES [dbo].[AutomovilxSucursal] ([idAutomovilxSucursal])
GO
ALTER TABLE [dbo].[AutxSucxVentxCli] CHECK CONSTRAINT [FK_AutxSucxVentxCli_AutomovilxSucursal]
GO
ALTER TABLE [dbo].[ClientexFinanciamiento]  WITH CHECK ADD  CONSTRAINT [FK_ClientexFinanciamiento_Financiamiento] FOREIGN KEY([idFinanciamiento])
REFERENCES [dbo].[Financiamiento] ([idFinanciamiento])
GO
ALTER TABLE [dbo].[ClientexFinanciamiento] CHECK CONSTRAINT [FK_ClientexFinanciamiento_Financiamiento]
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_AutoxSucxVentaxCli] FOREIGN KEY([idAutoxSucxVentaxCli])
REFERENCES [dbo].[AutxSucxVentxCli] ([idAutoxSucxVentaXCli])
GO
ALTER TABLE [dbo].[Detalle] CHECK CONSTRAINT [FK_Detalle_AutoxSucxVentaxCli]
GO
ALTER TABLE [dbo].[DetallexFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetallexFactura_Detalle] FOREIGN KEY([idDetalle])
REFERENCES [dbo].[Detalle] ([idDetalle])
GO
ALTER TABLE [dbo].[DetallexFactura] CHECK CONSTRAINT [FK_DetallexFactura_Detalle]
GO
ALTER TABLE [dbo].[DetallexFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetallexFactura_Factura] FOREIGN KEY([idFactura])
REFERENCES [dbo].[Factura] ([idFactura])
GO
ALTER TABLE [dbo].[DetallexFactura] CHECK CONSTRAINT [FK_DetallexFactura_Factura]
GO
ALTER TABLE [dbo].[EmpleadoxSucursal]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoxSucursal_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[EmpleadoxSucursal] CHECK CONSTRAINT [FK_EmpleadoxSucursal_Empleado]
GO
ALTER TABLE [dbo].[EmpleadoxSucursal]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoxSucursal_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[EmpleadoxSucursal] CHECK CONSTRAINT [FK_EmpleadoxSucursal_Sucursal]
GO
ALTER TABLE [dbo].[FinanciamientoxVenta]  WITH CHECK ADD FOREIGN KEY([idFinanciamiento])
REFERENCES [dbo].[Financiamiento] ([idFinanciamiento])
GO
ALTER TABLE [dbo].[FinanciamientoxVenta]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[Impuesto]  WITH CHECK ADD  CONSTRAINT [FK_Impuesto_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Impuesto] CHECK CONSTRAINT [FK_Impuesto_Sucursal]
GO
ALTER TABLE [dbo].[PagoxClientexFinanciamiento]  WITH CHECK ADD  CONSTRAINT [FK_PagoxClientexFinanciamiento_ClientexFinanciamiento] FOREIGN KEY([idClientexFinanciamiento])
REFERENCES [dbo].[ClientexFinanciamiento] ([idClientexFinanciamiento])
GO
ALTER TABLE [dbo].[PagoxClientexFinanciamiento] CHECK CONSTRAINT [FK_PagoxClientexFinanciamiento_ClientexFinanciamiento]
GO
ALTER TABLE [dbo].[PagoxClientexFinanciamiento]  WITH CHECK ADD  CONSTRAINT [FK_PagoxClientexFinanciamiento_Pago] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pago] ([idPago])
GO
ALTER TABLE [dbo].[PagoxClientexFinanciamiento] CHECK CONSTRAINT [FK_PagoxClientexFinanciamiento_Pago]
GO
ALTER TABLE [dbo].[SucursalUbicacion]  WITH CHECK ADD FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_TipoPago] FOREIGN KEY([idTipoPago])
REFERENCES [dbo].[TipoPago] ([idTipoPago])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_TipoPago]
GO
ALTER TABLE [dbo].[VentaxCliente]  WITH CHECK ADD  CONSTRAINT [FK_VentaxCliente_Venta] FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[VentaxCliente] CHECK CONSTRAINT [FK_VentaxCliente_Venta]
GO
/****** Object:  StoredProcedure [dbo].[consultarCarros]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[consultarCarros]
@marca varchar(20) = null,
@precioIni money = null,
@precioFin money = null,
@color varchar(20) = null,
@cantidadPasajeros int = null,
@puertas int = null,
@año int = null

as
begin
	
	select marca,precioBase,color,cantidadPasajeros,nPuertas as puertas,anno as año from Fabrica.dbo.Caracteristicas as FC inner join
	Fabrica.dbo.CaracteristicasxAutomovil CxA on CxA.idCaracteristica = FC.idCaracteristica inner join Fabrica.dbo.Automovil FA on FA.idAutomovil = CxA.idAutomovil
	inner join Sucursal_1.dbo.AutomovilxSucursal on Sucursal_1.dbo.AutomovilxSucursal.idAutomovil = FA.idAutomovil
	where FC.marca = isnull(@marca,FC.marca) and FA.precioBase between isnull(@precioIni,FA.precioBase) and isnull(@precioFin,FA.precioBase) and FC.color = isnull(@color,FC.color) and
	FC.cantidadPasajeros = isnull(@cantidadPasajeros,FC.cantidadPasajeros) and FC.nPuertas = isnull(@puertas,FC.nPuertas) and FA.anno = isnull(@año,FA.anno)
	group by marca,anno,color,nPuertas,cantidadPasajeros,precioBase
end

GO
/****** Object:  StoredProcedure [dbo].[consultarModelo]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[consultarModelo](@marca varchar(20),@anno int, @idCliente int)
as
begin
	CREATE TABLE #H
	( 
	marca varchar(20) NULL,
	precioBase money NULL,
	color varchar(20) NULL,
	cantidadPasajeros int NULL,
	nPuertas int NULL,
	anno int NULL,
	);
	--Exec consultarCarros @marca=@marca, @año=@anno
	INSERT INTO #H Exec dbo.consultarCarros @marca=@marca, @año=@anno
	--Select * from #TempTable
	if EXISTS(Select top 1 marca from #H)
	begin
		Select 1
		drop table #H
	end
	else
		Select -1
		drop table #H
		CREATE TABLE #TempTable1
		( 
		marca varchar(20) NULL,
		precioBase money NULL,
		color varchar(20) NULL,
		cantidadPasajeros int NULL,
		nPuertas int NULL,
		anno int NULL,
		);
		--INSERT INTO #TempTable1 Exec dbo.verAutosDisponibls @idSucursal=1
		declare @ubicacionCliente geometry,@distancia1 float, @ubicacionSucursal1 geometry, @datos varchar(MAX)
		declare @ubicacionSucursal2 geometry, @ubicacionSucursal3 geometry, @distancia2 float, @distancia3 float, @nombre varchar(20)
		Select @ubicacionCliente= ubicacion from Fabrica.dbo.ClienteUbicacion where idCliente=@idCliente
		Select @ubicacionSucursal1 = ubicacion from Sucursal_1.dbo.SucursalUbicacion
		Select @ubicacionSucursal2 = ubicacion from Sucursal_2.dbo.SucursalUbicacion
		Select @ubicacionSucursal3 = ubicacion from Sucursal_3.dbo.SucursalUbicacion
		set @distancia1 = @ubicacionCliente.STDistance(@ubicacionSucursal1)
		set @distancia2 = @ubicacionCliente.STDistance(@ubicacionSucursal2)
		set @distancia3= @ubicacionCliente.STDistance(@ubicacionSucursal3)
		
		if ((@distancia1<@distancia2) or (@distancia1<@distancia3))
		begin
			INSERT INTO #TempTable1 Exec dbo.verAutosDisponibles @idSucursal=1
			if (EXISTS(Select marca from #TempTable1))
				BEGIN
					SET @datos= 'Dirijase a la sucursal 1'
					Select @datos
				END
		end
		else 
			if((@distancia2<@distancia1)or(@distancia2<@distancia3))
			begin
				INSERT INTO #TempTable1 Exec dbo.VerAutosDisponibles @idSucursal=2
				if(EXISTS(Select marca from #TempTable1))
					begin
						set @datos = 'Dirijase a la sucursal 2'
						Select @datos
					end
			end
		else 
			if((@distancia3<@distancia1)and (@distancia3<@distancia2))
			begin
				Insert into #TempTable1 Exec VerAutosDisponibles @idSucursal=3
				if(EXISTS(Select marca from #TempTable1))
					begin
						set @datos = 'Dirijase a la sucursal 3'
						Select @datos
					end
			end
			else
				Select -1
	DROP TABLE #TempTable1
end
GO
/****** Object:  StoredProcedure [dbo].[crearEmpleado]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[crearEmpleado]
@nombre varchar(30),
@apellido1 varchar(30),
@apellido2 varchar(30)

as
begin

	begin transaction
	insert into Empleado(nombre,apellido1,apellido2)values(@nombre,@apellido1,@apellido2)
	commit transaction

	begin transaction
	insert into EmpleadoxSucursal(idEmpleado,idSucursal,fechaContratacion)values(IDENT_CURRENT('Empleado'),1,GetDate())
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[eliminarEmpleado]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[eliminarEmpleado]
@idEmpleado int
as
begin
	if exists (select idEmpleado from EmpleadoxSucursal where idEmpleado=@idEmpleado)
	begin
		begin transaction
		delete from EmpleadoxSucursal where idEmpleado=@idEmpleado
		commit transaction
	end

	if exists (select idEmpleado from Empleado where idEmpleado=@idEmpleado)
	begin
		begin transaction
		delete from Empleado where idEmpleado=@idEmpleado
		commit transaction
	end

end
GO
/****** Object:  StoredProcedure [dbo].[facturar]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[facturar]
@idCliente int



as
begin
	declare @montoTotal money,@nombre varchar(50),@apellido1 varchar(50),@apellido2 varchar(50),@nombreCompleto varchar(150)
	
	set @nombre = (select nombre from Fabrica.dbo.Cliente where idCliente = @idCliente)
	set @apellido1 = (select apellido1 from Fabrica.dbo.Cliente where idCliente = @idCliente)
	set @apellido2 = (select apellido2 from Fabrica.dbo.Cliente where idCliente = @idCliente)
	set @nombreCompleto = @nombre+' '+@apellido1+' '+@apellido2
	set @montoTotal = (select sum(monto) from Venta inner join VentaxCliente on Venta.idVenta = VentaxCliente.idVenta
	where VentaxCliente.idCliente = @idCliente and Venta.fecha=GETDATE())

	begin transaction
	insert into Factura(montoTotal)values(@montoTotal)
	commit transaction
	declare @id int 
	set @id=0
	
	create table #temp(
	id int,
	idASVC int,
	marca varchar(30),
	anno int,
	precio money
	)
	insert into #temp
	select @id+1,idAutoxSucxVentaxCli,marca,anno,monto from Venta v,Fabrica.dbo.Caracteristicas c inner join Fabrica.dbo.CaracteristicasxAutomovil CxA on CxA.idCaracteristica = c.idCaracteristica
	inner join Fabrica.dbo.Automovil a on a.idAutomovil = CxA.idAutomovil inner join AutomovilxSucursal AxS on AxS.idAutomovil = A.idAutomovil inner join AutxSucxVentxCli
	asvc on asvc.idAutomovilxSucursal=AxS.idAutomovilxSucursal inner join VentaxCliente VxC on VxC.idVentaxCliente = asvc.idVentaxCliente
	where VxC.idCliente = @idCliente
	
	declare @x int,@cont int,@datos varchar(250),@marca varchar(30),@año int,@monto money,@idASVC int

	set @x = (select count(*) from #temp)
	set @cont = 1
	set @datos='Factura #'+cast(IDENT_CURRENT('Factura') as varchar(10))+CHAR(13)+CHAR(10)+'Fecha:'+cast(GETDATE() as varchar(50))+CHAR(13)+CHAR(10)+'Cliente:'+@nombreCompleto+CHAR(13)+CHAR(10)+CHAR(13)+CHAR(10)
	while @cont <= @x
	begin
		set @idASVC=(select idASVC from #temp where #temp.id = @cont)
		set @marca = (select marca from #temp where #temp.id = @cont)
		set @año = (select anno from #temp where #temp.id = @cont)
		set @monto = (select precio from #temp where #temp.id = @cont)
		set @datos= @datos+'Marca: '+@marca+'     Año: '+cast(@año as varchar(10))+'     Costo:'+cast(@monto as varchar(10))+CHAR(13)+CHAR(10)
		set @cont = @cont+1
		begin transaction
		insert into Detalle(descripcion,idAutoxSucxVentaxCli)values(@datos,@idASVC)
		commit transaction

		begin transaction
		insert into DetallexFactura(idFactura,idDetalle) values(IDENT_CURRENT('Factura'),IDENT_CURRENT('Detalle'))
		commit transaction

	end

	set @datos = @datos++CHAR(13)+CHAR(10)+'Total Final:'+cast(@montoTotal as varchar(50))
	drop table #temp
	print (@datos)
	select (@datos)

end
GO
/****** Object:  StoredProcedure [dbo].[masVendidosSucursal]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[masVendidosSucursal]

as
begin
	
	select marca,count(marca) as cantidad from Fabrica.dbo.Caracteristicas caract inner join
	Fabrica.dbo.CaracteristicasxAutomovil FxC on FxC.idCaracteristica = caract.idCaracteristica inner
	join Fabrica.dbo.Automovil A on A.idAutomovil = FxC.idAutomovil inner join AutomovilxSucursal
	AxS on AxS.idAutomovil = A.idAutomovil inner join AutxSucxVentxCli asvc on asvc.idAutomovilxSucursal =
	AxS.idAutomovilxSucursal
	group by marca
	order by marca DESC	
end
GO
/****** Object:  StoredProcedure [dbo].[modificarAutoxSucursal]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificarAutoxSucursal]
@idAutxSuc int,
@idSucursal int=null,
@idAutomovil int=null,
@estado bit=null
as
begin

	begin transaction
	update AutomovilxSucursal
	set idSucursal = isnull(@idSucursal,idSucursal),idAutomovil = isnull(@idAutomovil,idAutomovil),estado = isnull(@estado,estado)
	where idAutomovilxSucursal = @idAutxSuc
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[modificarEmpleado]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[modificarEmpleado]
@idEmpleado int,
@nombre varchar(30)=null,
@apellido1 varchar(30)=null,
@apellido2 varchar(30)=null
as
begin

	begin transaction
	update Empleado
	set nombre = isnull(@nombre,nombre),apellido1 = isnull(@apellido1,apellido1),apellido2 = isnull(@apellido2,apellido2)
	where idEmpleado = @idEmpleado
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[modificarFinanciamiento]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[modificarFinanciamiento]
@idFinanciamiento int,
@tasa float=null,
@plazo int=null,
@prima money=null
as
begin

	begin transaction
	update Financiamiento
	set tasaInteres = isnull(@tasa,tasaInteres),plazo = isnull(@plazo,plazo),prima = isnull(@prima,prima)
	where idFinanciamiento = @idFinanciamiento
	commit transaction

end
GO
/****** Object:  StoredProcedure [dbo].[pagarMensualidad]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[pagarMensualidad]
@idCliente int,
@idAutomovil int,
@idFinanciamiento int,
@monto money



as
begin
	declare @totalCompra money
	set @totalCompra = (select monto from Venta v inner join Sucursal_1.dbo.VentaxCliente VxC on VxC.idVenta=v.idVenta
			inner join AutxSucxVentxCli asvc on asvc.idVentaxCliente = VxC.idVentaxCliente inner join AutomovilxSucursal AxS
			on AxS.idAutomovilxSucursal = asvc.idAutomovilxSucursal
			where AxS.idAutomovil = @idAutomovil)

	declare @mensual money,@total money,@intereses money,@plazo int,@tasa float
	set @plazo = (select plazo from Financiamiento where Financiamiento.idFinanciamiento=@idFinanciamiento)
	set @tasa = (select tasaInteres from Financiamiento where Financiamiento.idFinanciamiento=@idFinanciamiento)
	set @mensual = @totalCompra/CONVERT(decimal(4,2), @plazo)
	set @intereses = @mensual*@tasa
	set @total = @mensual+@intereses

	if @monto < @total
		select('El pago minimo es de: '+ cast(@total as varchar(30)))
		
	else
		begin transaction
		insert into Pago(monto,fecha)values(@monto,GETDATE())
		commit transaction
		declare @idCxF int
		set @idCxF = (select idClientexFinanciamiento from ClientexFinanciamiento where ClientexFinanciamiento.idFinanciamiento = @idFinanciamiento)
		begin transaction
		insert into PagoxClientexFinanciamiento(idPago,idClientexFinanciamiento)values(IDENT_CURRENT('Pago'),@idCxF)
		commit transaction
		select('Pago realizado satisfactoriamente')


end
GO
/****** Object:  StoredProcedure [dbo].[spAgregarSucursal_1]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[spAgregarSucursal_1] @horaEntrada time, @horaSalida time
as
BEGIN
    BEGIN TRY
		BEGIN TRANSACTION
			insert into Sucursal(horaEntrada,horaSalida)
            values(@horaEntrada,@horaSalida);
        COMMIT
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spVerAutoNoSalidaxSucursal_1]    Script Date: 17/6/2019 23:53:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spVerAutoNoSalidaxSucursal_1]
as
BEGIN
    BEGIN TRY
			Select C.marca from Fabrica.dbo.Caracteristicas C
			inner join Fabrica.dbo.CaracteristicasxAutomovil CA
			on CA.idCaracteristica = C.idCaracteristica
			inner join AutomovilxSucursal ASuc
			on CA.idAutomovil = ASuc.idAutomovil and ASuc.estado = 0
			where ASuc.idAutomovilxSucursal not in (select idAutomovilxSucursal from AutxSucxVentxCli)
    END TRY
    BEGIN CATCH
            declare @errorMsg varchar(100) = (select ERROR_MESSAGE())
            print('ERROR:'+@errorMsg)
            return -1*@@ERROR
    END CATCH
END


GO
USE [master]
GO
ALTER DATABASE [Sucursal_1] SET  READ_WRITE 
GO

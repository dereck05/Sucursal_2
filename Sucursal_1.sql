USE [master]
GO
/****** Object:  Database [Sucursal_1]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[AutomovilxSucursal]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[AutxSucxVentxCli]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[ClientexFinanciamiento]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[Detalle]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[DetallexFactura]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[EmpleadoxSucursal]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[Factura]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[Financiamiento]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[FinanciamientoxVenta]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[Pago]    Script Date: 14/6/2019 16:13:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[monto] [money] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoxClientexFinanciamiento]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[SucursalUbicacion]    Script Date: 14/6/2019 16:13:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SucursalUbicacion](
	[idSucursalUbicacion] [int] IDENTITY(1,1) NOT NULL,
	[ubicacion] [int] NULL,
	[pais] [varchar](30) NULL,
	[idSucursal] [int] NULL,
 CONSTRAINT [PK_SucursalUbicacion] PRIMARY KEY CLUSTERED 
(
	[idSucursalUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  Table [dbo].[Venta]    Script Date: 14/6/2019 16:13:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[monto] [money] NULL,
	[idTipoPago] [int] NULL,
	[descuento] [float] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaxCliente]    Script Date: 14/6/2019 16:13:16 ******/
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
ALTER TABLE [dbo].[SucursalUbicacion]  WITH CHECK ADD  CONSTRAINT [FK_SucursalUbicacion_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[SucursalUbicacion] CHECK CONSTRAINT [FK_SucursalUbicacion_Sucursal]
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
/****** Object:  StoredProcedure [dbo].[consultarCarros]    Script Date: 14/6/2019 16:13:16 ******/
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
/****** Object:  StoredProcedure [dbo].[masVendidosSucursal]    Script Date: 14/6/2019 16:13:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[masVendidosSucursal]

as
begin
	
	select marca,count(marca) as cantidad from Fabrica.dbo.Caracteristicas caract inner join
	Fabrica.dbo.CaracteristicasxAutomovil FxC on FxC.idCaracteristica = caract.idCaracteristica inner
	join Fabrica.dbo.Automovil A on A.idAutomovil = FxC.idAutomovil inner join AutomovilxSucursal
	AxS on AxS.idAutomovil = A.idAutomovil inner join AutxSucxVentxCli asvc on asvc.idAutomovilxSucursal =
	AxS.idAutomovilxSucursal
	group by marca
		
end
GO
/****** Object:  StoredProcedure [dbo].[spAgregarSucursal_1]    Script Date: 14/6/2019 16:13:16 ******/
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
USE [master]
GO
ALTER DATABASE [Sucursal_1] SET  READ_WRITE 
GO

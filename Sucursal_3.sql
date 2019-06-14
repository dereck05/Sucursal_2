USE [master]
GO
/****** Object:  Database [Sucursal_3]    Script Date: 14/6/2019 16:12:03 ******/
CREATE DATABASE [Sucursal_3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sucursal_3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sucursal_3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sucursal_3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sucursal_3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Sucursal_3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sucursal_3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sucursal_3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sucursal_3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sucursal_3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sucursal_3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sucursal_3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sucursal_3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sucursal_3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sucursal_3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sucursal_3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sucursal_3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sucursal_3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sucursal_3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sucursal_3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sucursal_3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sucursal_3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sucursal_3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sucursal_3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sucursal_3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sucursal_3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sucursal_3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sucursal_3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sucursal_3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sucursal_3] SET RECOVERY FULL 
GO
ALTER DATABASE [Sucursal_3] SET  MULTI_USER 
GO
ALTER DATABASE [Sucursal_3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sucursal_3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sucursal_3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sucursal_3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sucursal_3] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sucursal_3', N'ON'
GO
ALTER DATABASE [Sucursal_3] SET QUERY_STORE = OFF
GO
USE [Sucursal_3]
GO
/****** Object:  Table [dbo].[AutomovilxSucursal]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutomovilxSucursal](
	[idAutomovilxSucursal] [int] IDENTITY(1,1) NOT NULL,
	[idSucursal] [int] NOT NULL,
	[estado] [bit] NOT NULL,
	[idAutomovil] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAutomovilxSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutxSucxVentxCli]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutxSucxVentxCli](
	[idAutxSucxVentxCli] [int] IDENTITY(1,1) NOT NULL,
	[idAutomovilxSucursal] [int] NOT NULL,
	[idVentaxCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAutxSucxVentxCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientexFinanciamiento]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientexFinanciamiento](
	[idClientexFinanciamiento] [int] IDENTITY(1,1) NOT NULL,
	[idFinanciamiento] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idClientexFinanciamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[idAutxSucVentxCli] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallexFactura]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallexFactura](
	[idDetallexFactura] [int] IDENTITY(1,1) NOT NULL,
	[idDetalle] [int] NOT NULL,
	[idFactura] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetallexFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido1] [varchar](20) NOT NULL,
	[apellido2] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadoxSucursal]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadoxSucursal](
	[idEmpleadoxSucursal] [int] IDENTITY(1,1) NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
	[fechaContratacion] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleadoxSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[descuento] [float] NOT NULL,
	[montoTotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Financiamiento]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Financiamiento](
	[idFinanciamiento] [int] IDENTITY(1,1) NOT NULL,
	[tasaInteres] [float] NOT NULL,
	[plazo] [int] NOT NULL,
	[prima] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFinanciamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinanciamientoxVenta]    Script Date: 14/6/2019 16:12:03 ******/
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
/****** Object:  Table [dbo].[Pago]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoxClientexFinanciamiento]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoxClientexFinanciamiento](
	[idPagoxClientexFinanciamiento] [int] IDENTITY(1,1) NOT NULL,
	[idPago] [int] NOT NULL,
	[idClientexFinanciamiento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPagoxClientexFinanciamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [int] IDENTITY(1,1) NOT NULL,
	[horaEntrada] [time](7) NOT NULL,
	[horaSalida] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SucursalUbicacion]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SucursalUbicacion](
	[idSucursalUbicacion] [int] IDENTITY(1,1) NOT NULL,
	[idSucursal] [int] NULL,
	[ubicacion] [geometry] NOT NULL,
	[pais] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSucursalUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoPago]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoPago](
	[idTipoPago] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[idTipoPago] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
	[descuento] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaxCliente]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaxCliente](
	[idVentaxCliente] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idVentaxCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AutomovilxSucursal]  WITH CHECK ADD FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[AutxSucxVentxCli]  WITH CHECK ADD FOREIGN KEY([idAutomovilxSucursal])
REFERENCES [dbo].[AutomovilxSucursal] ([idAutomovilxSucursal])
GO
ALTER TABLE [dbo].[AutxSucxVentxCli]  WITH CHECK ADD FOREIGN KEY([idVentaxCliente])
REFERENCES [dbo].[VentaxCliente] ([idVentaxCliente])
GO
ALTER TABLE [dbo].[ClientexFinanciamiento]  WITH CHECK ADD FOREIGN KEY([idFinanciamiento])
REFERENCES [dbo].[Financiamiento] ([idFinanciamiento])
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD FOREIGN KEY([idAutxSucVentxCli])
REFERENCES [dbo].[AutxSucxVentxCli] ([idAutxSucxVentxCli])
GO
ALTER TABLE [dbo].[DetallexFactura]  WITH CHECK ADD FOREIGN KEY([idDetalle])
REFERENCES [dbo].[Detalle] ([idDetalle])
GO
ALTER TABLE [dbo].[DetallexFactura]  WITH CHECK ADD FOREIGN KEY([idFactura])
REFERENCES [dbo].[Factura] ([idFactura])
GO
ALTER TABLE [dbo].[EmpleadoxSucursal]  WITH CHECK ADD FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[EmpleadoxSucursal]  WITH CHECK ADD FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[FinanciamientoxVenta]  WITH CHECK ADD FOREIGN KEY([idFinanciamiento])
REFERENCES [dbo].[Financiamiento] ([idFinanciamiento])
GO
ALTER TABLE [dbo].[FinanciamientoxVenta]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[PagoxClientexFinanciamiento]  WITH CHECK ADD FOREIGN KEY([idClientexFinanciamiento])
REFERENCES [dbo].[ClientexFinanciamiento] ([idClientexFinanciamiento])
GO
ALTER TABLE [dbo].[PagoxClientexFinanciamiento]  WITH CHECK ADD FOREIGN KEY([idPago])
REFERENCES [dbo].[Pago] ([idPago])
GO
ALTER TABLE [dbo].[SucursalUbicacion]  WITH CHECK ADD FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[VentaxCliente]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
/****** Object:  StoredProcedure [dbo].[consultarCarros]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[consultarCarros]
@marca varchar(20) = null,
@precioIni money = null,
@precioFin money = null,
@color varchar(20) = null,
@cantidadPasajeros int = null,
@puertas int = null,
@año int = null

as
begin
	
	select marca,precioBase,color,cantidadPasajeros,nPuertas as puertas,anno as año from Fabrica.dbo.Caracteristicas as FC,Fabrica.dbo.Automovil as FA
	inner join Sucursal_3.dbo.AutomovilxSucursal on Sucursal_3.dbo.AutomovilxSucursal.idAutomovil = FA.idAutomovil
	where FC.marca = isnull(@marca,FC.marca) and FA.precioBase between isnull(@precioIni,FA.precioBase) and isnull(@precioFin,FA.precioBase) and FC.color = isnull(@color,FC.color) and
	FC.cantidadPasajeros = isnull(@cantidadPasajeros,FC.cantidadPasajeros) and FC.nPuertas = isnull(@puertas,FC.nPuertas) and FA.anno = isnull(@año,FA.anno)
	group by marca,anno,color,nPuertas,cantidadPasajeros,precioBase
end
GO
/****** Object:  StoredProcedure [dbo].[masVendidosSucursal]    Script Date: 14/6/2019 16:12:03 ******/
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
/****** Object:  StoredProcedure [dbo].[spAgregarSucursal_3]    Script Date: 14/6/2019 16:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[spAgregarSucursal_3] @horaEntrada time, @horaSalida time
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
ALTER DATABASE [Sucursal_3] SET  READ_WRITE 
GO

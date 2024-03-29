USE [master]
GO
/****** Object:  Database [Sucursal_2]    Script Date: 17/6/2019 23:53:40 ******/
CREATE DATABASE [Sucursal_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sucursal_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sucursal_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sucursal_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Sucursal_2_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Sucursal_2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sucursal_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sucursal_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sucursal_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sucursal_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sucursal_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sucursal_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sucursal_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sucursal_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sucursal_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sucursal_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sucursal_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sucursal_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sucursal_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sucursal_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sucursal_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sucursal_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sucursal_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sucursal_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sucursal_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sucursal_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sucursal_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sucursal_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sucursal_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sucursal_2] SET RECOVERY FULL 
GO
ALTER DATABASE [Sucursal_2] SET  MULTI_USER 
GO
ALTER DATABASE [Sucursal_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sucursal_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sucursal_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sucursal_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sucursal_2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sucursal_2', N'ON'
GO
ALTER DATABASE [Sucursal_2] SET QUERY_STORE = OFF
GO
USE [Sucursal_2]
GO
/****** Object:  User [global_admin]    Script Date: 17/6/2019 23:53:41 ******/
CREATE USER [global_admin] FOR LOGIN [global_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [facturador_2]    Script Date: 17/6/2019 23:53:41 ******/
CREATE USER [facturador_2] FOR LOGIN [facturador_2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [facturador_1]    Script Date: 17/6/2019 23:53:41 ******/
CREATE USER [facturador_1] FOR LOGIN [facturador_1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Cliente]    Script Date: 17/6/2019 23:53:41 ******/
CREATE USER [Cliente] FOR LOGIN [Cliente] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin_2]    Script Date: 17/6/2019 23:53:41 ******/
CREATE USER [admin_2] FOR LOGIN [admin_2] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [global_admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [global_admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [global_admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [facturador_2]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [facturador_2]
GO
ALTER ROLE [db_datareader] ADD MEMBER [facturador_1]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [facturador_1]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin_2]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin_2]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin_2]
GO
/****** Object:  Table [dbo].[AutomovilxSucursal]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[AutxSucxVentxCli]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[ClientexFinanciamiento]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[Detalle]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[DetallexFactura]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[EmpleadoxSucursal]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[Factura]    Script Date: 17/6/2019 23:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[montoTotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Financiamiento]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[FinanciamientoxVenta]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[Impuesto]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[Pago]    Script Date: 17/6/2019 23:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
	[idTipoPago] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoxClientexFinanciamiento]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[SucursalUbicacion]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[tipoPago]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  Table [dbo].[Venta]    Script Date: 17/6/2019 23:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[idTipoPago] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaxCliente]    Script Date: 17/6/2019 23:53:41 ******/
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
ALTER TABLE [dbo].[Impuesto]  WITH CHECK ADD  CONSTRAINT [FK_Impuesto_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Impuesto] CHECK CONSTRAINT [FK_Impuesto_Sucursal]
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
/****** Object:  StoredProcedure [dbo].[consultarCarros]    Script Date: 17/6/2019 23:53:41 ******/
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
	
	select marca,precioBase,color,cantidadPasajeros,nPuertas as puertas,anno as año from Fabrica.dbo.Caracteristicas as FC,Fabrica.dbo.Automovil as FA
	inner join Sucursal_2.dbo.AutomovilxSucursal on Sucursal_2.dbo.AutomovilxSucursal.idAutomovil = FA.idAutomovil
	where FC.marca = isnull(@marca,FC.marca) and FA.precioBase between isnull(@precioIni,FA.precioBase) and isnull(@precioFin,FA.precioBase) and FC.color = isnull(@color,FC.color) and
	FC.cantidadPasajeros = isnull(@cantidadPasajeros,FC.cantidadPasajeros) and FC.nPuertas = isnull(@puertas,FC.nPuertas) and FA.anno = isnull(@año,FA.anno)
	group by marca,anno,color,nPuertas,cantidadPasajeros,precioBase
end
GO
/****** Object:  StoredProcedure [dbo].[consultarModelo]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[crearEmpleado]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[eliminarEmpleado]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[facturar]    Script Date: 17/6/2019 23:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[facturar]
@idCliente int


as
begin
	declare @montoTotal money,@nombre varchar(50),@apellido1 varchar(50),@apellido2 varchar(50),@nombreCompleto varchar(150),@fIni datetime,@fFin datetime
	set @fIni = GETDATE()-1
	set @fFin = GETDATE()
	set @nombre = (select nombre from Fabrica.dbo.Cliente where idCliente = @idCliente)
	set @apellido1 = (select apellido1 from Fabrica.dbo.Cliente where idCliente = @idCliente)
	set @apellido2 = (select apellido2 from Fabrica.dbo.Cliente where idCliente = @idCliente)
	set @nombreCompleto = @nombre+' '+@apellido1+' '+@apellido2
	set @montoTotal = (select sum(monto) from Venta inner join VentaxCliente on Venta.idVenta = VentaxCliente.idVenta
	where VentaxCliente.idCliente = @idCliente and Venta.fecha between @fIni and @fFin)
	begin transaction
	insert into Factura(montoTotal)values(@montoTotal)
	commit transaction
	

	
	create table #temp(
	idASVC int,
	marca varchar(30),
	anno int,
	precio money
	)
	insert into #temp
	select idAutxSucxVentxCli,marca,anno,monto from Fabrica.dbo.Caracteristicas c inner join Fabrica.dbo.CaracteristicasxAutomovil CxA on CxA.idCaracteristica = c.idCaracteristica
	inner join Fabrica.dbo.Automovil a on a.idAutomovil = CxA.idAutomovil inner join AutomovilxSucursal AxS on AxS.idAutomovil = A.idAutomovil inner join AutxSucxVentxCli
	asvc on asvc.idAutomovilxSucursal=AxS.idAutomovilxSucursal inner join VentaxCliente VxC on VxC.idVentaxCliente = asvc.idVentaxCliente inner join Venta v on v.idVenta=VxC.idVenta
	where VxC.idCliente = 1
	declare @datos varchar(MAX),@marca varchar(30),@año int,@monto money,@idASVC int

	set @datos='Factura #'+cast(IDENT_CURRENT('Factura') as varchar(10))+CHAR(13)+CHAR(10)+'Fecha:'+cast(GETDATE() as varchar(50))+CHAR(13)+CHAR(10)+'Cliente:'+@nombreCompleto+CHAR(13)+CHAR(10)+CHAR(13)+CHAR(10)
	declare cur CURSOR FOR
	SELECT idASVC,marca,anno,precio
	from #temp
	open cur
	fetch cur into @idASVC,@marca,@año,@monto
	while(@@FETCH_STATUS=0)
	begin
	
		set @datos= @datos+'Marca: '+@marca+'     Año: '+cast(@año as varchar(10))+'     Costo:'+cast(@monto as varchar(10))+CHAR(13)+CHAR(10)
		
		FETCH cur INTO @idASVC,@marca,@año,@monto

	end
	close cur
	deallocate cur
	set @datos = @datos++CHAR(13)+CHAR(10)+'Total Final:'+cast(@montoTotal as varchar(50))
	drop table #temp
	
	print (@datos)
	select (@datos)

end
GO
/****** Object:  StoredProcedure [dbo].[masVendidosSucursal]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[modificarAutoxSucursal]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[modificarEmpleado]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[modificarFinanciamiento]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[pagarMensualidad]    Script Date: 17/6/2019 23:53:41 ******/
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
/****** Object:  StoredProcedure [dbo].[spAgregarSucursal_2]    Script Date: 17/6/2019 23:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[spAgregarSucursal_2] @horaEntrada time, @horaSalida time
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
/****** Object:  StoredProcedure [dbo].[spVerAutoNoSalidaxSucursal_2]    Script Date: 17/6/2019 23:53:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spVerAutoNoSalidaxSucursal_2]
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
ALTER DATABASE [Sucursal_2] SET  READ_WRITE 
GO

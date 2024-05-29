create database LavadoV;
GO
CREATE TABLE Empleado (
    Id INT IDENTITY(1,1) PRIMARY KEY,
	Usuario VARCHAR(255) UNIQUE NOT NULL,
	Contraseña VARCHAR(255) NOT NULL,
    Nombres VARCHAR(255) NOT NULL,
    Apellidos VARCHAR(255) NOT NULL,
    DOI VARCHAR(255) UNIQUE NOT NULL,
    Cargo VARCHAR(255) NOT NULL,
    Correo VARCHAR(255) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    FechaContrato DATE DEFAULT GETDATE() NOT NULL,
    FechaDespido DATE DEFAULT NULL,
    Salario MONEY,
	Estado BIT DEFAULT(1)
);
GO
CREATE TABLE Administrador (
    Id INT IDENTITY(1,1) PRIMARY KEY,
	Usuario VARCHAR(255) UNIQUE NOT NULL,
	Contraseña VARCHAR(255) NOT NULL,
    Nombres VARCHAR(255) NOT NULL,
    Apellidos VARCHAR(255) NOT NULL,
    DOI VARCHAR(255) UNIQUE NOT NULL,
    Correo VARCHAR(255) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
	Estado BIT DEFAULT(1)
);
GO

CREATE TABLE Cliente (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Usuario VARCHAR(255) UNIQUE NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    Nombres VARCHAR(255) NOT NULL,
    Apellidos VARCHAR(255) NOT NULL,
    DOI VARCHAR(255) UNIQUE NOT NULL,
    Correo VARCHAR(255) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Direccion VARCHAR(255) NOT NULL,
	Estado BIT DEFAULT(1)
);
GO


CREATE TABLE Vehiculo (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Marca VARCHAR(100) NOT NULL,
    Modelo VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Placa VARCHAR(20) NOT NULL,
    Cliente_Id INT  NOT NULL FOREIGN KEY REFERENCES Cliente(id),
	Estado BIT DEFAULT(1)
);
GO

CREATE TABLE ServicioLavado (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Tipo_Vehiculo VARCHAR(50) NOT NULL,
    Tipo_Lavado VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(255) NOT NULL,
    Precio MONEY NOT NULL,
	Estado BIT DEFAULT(1)
);
GO

CREATE TABLE LavadoVehiculo (
    id INT IDENTITY(1,1) PRIMARY KEY,
	FechaEntrada DATETIME NOT NULL,
    FechaSalida DATETIME,
    Vehiculo_Id INT NOT NULL FOREIGN KEY REFERENCES Vehiculo(Id),
	Servicio_Id INT NOT NULL FOREIGN KEY REFERENCES ServicioLavado(Id),
	Estado BIT DEFAULT(1)
);
GO

CREATE TABLE Categoria (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
	Estado BIT DEFAULT(1),
);
GO

CREATE TABLE Proveedor (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    RUC VARCHAR(20) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Direccion VARCHAR(255) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    FechaIngreso DATE DEFAULT GETDATE(),
	FechaSalida DATE DEFAULT NULL,
	Estado BIT DEFAULT(1)
);
GO

CREATE TABLE Producto (
	Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    Marca VARCHAR(100) NOT NULL,
    FechaIngreso DATE DEFAULT GETDATE(),
    Stock INT NOT NULL,
    Precio MONEY NOT NULL,
	CategoriaId INT NOT NULL FOREIGN KEY REFERENCES Categoria(Id),
    ProveedorId INT NOT NULL FOREIGN KEY REFERENCES Proveedor(Id),
	Estado BIT DEFAULT(1)
);
GO

CREATE TABLE Compra (
    Id           INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    FechaCompra  DATETIME NOT NULL,
    ProveedorId  INT NOT NULL FOREIGN KEY REFERENCES Proveedor(Id),
    Total        MONEY NOT NULL,
	Estado BIT DEFAULT(1)
);
GO

CREATE TABLE DetalleCompra (
    Id              INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProductoId      INT NOT NULL FOREIGN KEY REFERENCES Producto(Id),
    Cantidad        INT NOT NULL,
    Precio          MONEY NOT NULL,
	Total			MONEY NOT NULL,
    CompraId        INT NOT NULL FOREIGN KEY REFERENCES Compra(Id),
	Estado BIT DEFAULT(1)
);
GO

CREATE TABLE Venta (
    Id              INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
	FechaVenta      DATETIME NOT NULL,
    DireccionFactura		VARCHAR(200) NOT NULL DEFAULT('Panamericana Sur, Ica 11004'),
	Total           MONEY NOT NULL,
	ClienteID            INT NOT NULL FOREIGN KEY REFERENCES dbo.Cliente(Id),
	Estado BIT DEFAULT(1)
);
GO

CREATE TABLE DetalleVenta (
    Id              INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ProductoId      INT NOT NULL FOREIGN KEY REFERENCES Producto(Id),
    Cantidad        INT NOT NULL,
    Precio          MONEY NOT NULL,
    Total           MONEY NOT NULL,
    VentaId         INT NOT NULL FOREIGN KEY REFERENCES Venta(Id),
	Estado BIT DEFAULT(1)
);

select * from dbo.Empleado;
select * from dbo.Administrador;
select * from dbo.Cliente;
select * from dbo.Vehiculo;
select * from dbo.LavadoVehiculo;
select * from dbo.ServicioLavado;
select * from dbo.Producto;
select * from dbo.Categoria;
select * from dbo.Proveedor;
select * from dbo.Compra
select * from dbo.DetalleCompra
select * from dbo.Venta
select * from dbo.DetalleVenta

drop table dbo.Empleado;
drop table dbo.Administrador;
drop table dbo.Cliente;
drop table dbo.Vehiculo;
drop table dbo.LavadoVehiculo;
drop table dbo.ServicioLavado;
drop table dbo.Producto;
drop table dbo.Categoria;
drop table dbo.Proveedor;
drop table dbo.Compra;
drop table dbo.DetalleCompra;
drop table dbo.Venta;
drop table dbo.DetalleVenta;

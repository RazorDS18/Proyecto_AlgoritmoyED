--Agregar Producto
CREATE PROCEDURE Pd_Agregar
    @nombre VARCHAR(100),
    @descripcion VARCHAR(255),
    @marca VARCHAR(100),
    @stock INT,
    @precio MONEY,
    @categoriaId INT,
    @proveedorId INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Producto (nombre, descripcion, marca, stock, precio, estado, categoriaId, proveedorId)
    VALUES (@nombre, @descripcion, @marca, @stock, @precio, 1, @categoriaId, @proveedorId);
END;

--Buscar Producto Por Nombre
CREATE PROCEDURE Pd_Buscar
    @nombre VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Producto
    WHERE nombre = @nombre;
END;

--Editar Producto
CREATE PROCEDURE Pd_Editar
    @id INT,
    @nombre VARCHAR(100),
    @descripcion VARCHAR(255),
    @marca VARCHAR(100),
    @stock INT,
    @precio MONEY,
    @categoriaId INT,
    @proveedorId INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Producto
    SET
        nombre = @nombre,
        descripcion = @descripcion,
        marca = @marca,
        stock = @stock,
        precio = @precio,
        categoriaId = @categoriaId,
        proveedorId = @proveedorId
    WHERE id = @id;
END;

--Eliminar Producto
CREATE PROCEDURE Pd_Eliminar
    @nombre INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Producto
    WHERE nombre = @nombre;
END;
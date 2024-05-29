--Agregar Proveedor
CREATE PROCEDURE Pv_Agregar
    @nombre VARCHAR(100),
    @descripcion VARCHAR(255),
    @ruc VARCHAR(20),
    @telefono VARCHAR(20),
    @direccion VARCHAR(255),
    @gmail VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Proveedor (nombre, descripcion, ruc, telefono, direccion, gmail)
    VALUES (@nombre, @descripcion, @ruc, @telefono, @direccion, @gmail);
END;

--Buscar Proveedor por RUC
CREATE PROCEDURE Pv_Buscar
    @ruc VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Proveedor
    WHERE ruc = @ruc;
END;

--Editar Proveedor
CREATE PROCEDURE Pv_Editar
    @id INT,
    @nombre VARCHAR(100),
    @descripcion VARCHAR(255),
    @ruc VARCHAR(20),
    @telefono VARCHAR(20),
    @direccion VARCHAR(255),
    @gmail VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Proveedor
    SET
        nombre = @nombre,
        descripcion = @descripcion,
        ruc = @ruc,
        telefono = @telefono,
        direccion = @direccion,
        gmail = @gmail
    WHERE id = @id;
END;

--Eliminar Proveedor por RUC
CREATE PROCEDURE Pv_Eliminar
    @ruc INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Proveedor
    WHERE ruc = @ruc;
END;

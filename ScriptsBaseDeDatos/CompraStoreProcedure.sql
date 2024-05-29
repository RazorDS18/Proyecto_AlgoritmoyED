-- Realizar Compra
CREATE PROCEDURE Compra_Realizar (
    @IDPRODUCTO INT,
    @CANTIDAD INT,
    @PRECIO MONEY,
    @PROVEEDORID INT, 
    @SALIDA INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DECLARE @IDCOMPRA INT = 0;
        BEGIN TRANSACTION;

        INSERT INTO Compra(FechaCompra, ProveedorID, Estado, Total)
        VALUES(GETDATE(), @PROVEEDORID, 1, @PRECIO * @CANTIDAD);

        SET @IDCOMPRA = SCOPE_IDENTITY();

        INSERT INTO DetalleCompra(ProductoID, Cantidad, Precio, Total, CompraID)
        VALUES(@IDPRODUCTO, @CANTIDAD, @PRECIO, @PRECIO * @CANTIDAD, @IDCOMPRA);

        UPDATE Producto
        SET stock = stock + @CANTIDAD
        WHERE id = @IDPRODUCTO;

        SET @SALIDA = 1;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF (@@TRANCOUNT > 0)
            ROLLBACK TRANSACTION;
        SET @SALIDA = 0;
    END CATCH;
END;
GO

-- Eliminar Compra
CREATE PROCEDURE Compra_Eliminar
    @CompraID INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Eliminar los detalles de la compra
        DELETE FROM DetalleCompra WHERE CompraID = @CompraID;
        
        -- Eliminar la compra
        DELETE FROM Compra WHERE id = @CompraID;

        -- Si todo va bien, confirmar la transacción
        COMMIT;
    END TRY
    BEGIN CATCH
        -- Si ocurre un error, revertir la transacción
        ROLLBACK;

        -- Opcional: Propagar el error
        THROW;
    END CATCH
END;
GO

--Buscar Compra
CREATE PROCEDURE Compra_Buscar
    @CompraID INT
AS
BEGIN
    SELECT 
        C.id AS ID, 
        C.FechaCompra AS Fecha, 
        C.Estado AS Estado,
        P.nombre AS NombreProducto, 
        DC.Cantidad, 
        DC.Precio, 
        DC.Total AS Total
    FROM 
        Compra C
    INNER JOIN 
        DetalleCompra DC ON C.id = DC.CompraID
    INNER JOIN 
        Producto P ON DC.ProductoID = P.id
    WHERE 
        C.id = @CompraID
    ORDER BY 
        DC.id;
END;
GO

select * from dbo.Compra;
go
select * from dbo.DetalleCompra;
go
select * from dbo.Producto;
go
select * from dbo.Proveedor;
go
drop procedure Compra_Realizar;
go
drop procedure Compra_Eliminar;
go
drop procedure Compra_Buscar;
go

DECLARE @SALIDA INT;
EXEC Compra_Realizar 
    @IDPRODUCTO = 2,     
    @CANTIDAD = 50,      
    @PRECIO = 20.99,     
    @PROVEEDORID = 2,     
    @SALIDA = @SALIDA OUTPUT;
-- Verificar el resultado de la ejecución
SELECT @SALIDA AS Resultado;
go

DECLARE @CompraID INT = 1;
EXEC Compra_Eliminar @CompraID;
go

DECLARE @CompraID INT = 1; -- ID de la compra a buscar

EXEC Compra_Buscar @CompraID;

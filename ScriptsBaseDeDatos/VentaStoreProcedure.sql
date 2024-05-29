--Realizar Venta
CREATE PROCEDURE Venta_Realizar (
    @IDPRODUCTO INT,
    @CANTIDAD INT,
    @PRECIO MONEY,
    @CLIENTEID INT,
    @DIRECCIONFACTURACION VARCHAR(200),
    @SALIDA INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DECLARE @IDVENTA INT = 0;
        DECLARE @TOTAL MONEY = @PRECIO * @CANTIDAD;
        BEGIN TRANSACTION;

        -- Insertar la venta
        INSERT INTO Venta (FechaVenta, Confirmacion, DireccionFacturacion, Total, Estado, ClienteID)
        VALUES (GETDATE(), 1, @DIRECCIONFACTURACION, @TOTAL, 1, @CLIENTEID);

        -- Obtener el ID de la venta recién insertada
        SET @IDVENTA = SCOPE_IDENTITY();

        -- Insertar los detalles de la venta
        INSERT INTO DetalleVenta (ProductoID, Cantidad, Precio, Total, VentaID)
        VALUES (@IDPRODUCTO, @CANTIDAD, @PRECIO, @TOTAL, @IDVENTA);

        -- Actualizar el stock de los productos
        UPDATE Producto
        SET stock = stock - @CANTIDAD
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

--Eliminar Venta
CREATE PROCEDURE Venta_Eliminar
    @VentaID INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Devolver el stock antes de eliminar los detalles de la venta
        UPDATE Producto
        SET stock = stock + DV.Cantidad
        FROM DetalleVenta DV
        WHERE DV.VentaID = @VentaID AND Producto.id = DV.ProductoID;

        -- Eliminar los detalles de la venta
        DELETE FROM DetalleVenta WHERE VentaID = @VentaID;

        -- Eliminar la venta
        DELETE FROM Venta WHERE id = @VentaID;

        -- Confirmar la transacción
        COMMIT;
    END TRY
    BEGIN CATCH
        -- Revertir la transacción en caso de error
        ROLLBACK;
        THROW;
    END CATCH
END;
GO

--Buscar Venta
CREATE PROCEDURE Venta_Buscar
    @VentaID INT
AS
BEGIN
    SELECT 
        V.id AS ID, 
        V.FechaVenta AS Fecha, 
        V.Confirmacion, 
        V.DireccionFacturacion,
        V.Total, 
        V.Estado,
        C.names + ' ' + C.lastnames AS Cliente,
        P.nombre AS NombreProducto, 
        DV.Cantidad, 
        DV.Precio, 
        DV.Total AS Total
    FROM 
        Venta V
    INNER JOIN 
        DetalleVenta DV ON V.id = DV.VentaID
    INNER JOIN 
        Producto P ON DV.ProductoID = P.id
    INNER JOIN 
        Cliente C ON V.ClienteID = C.id
    WHERE 
        V.id = @VentaID
    ORDER BY 
        DV.id
END;
GO

select * from dbo.Venta;
GO
select * from dbo.DetalleVenta;
GO
select * from dbo.Producto;
GO
select * from dbo.Cliente;
GO
drop procedure Venta_Buscar;
GO
drop procedure Venta_Eliminar;
GO
drop procedure Venta_Realizar;
GO

--Realizar venta
DECLARE @SALIDA INT;
EXEC Venta_Realizar 
    @IDPRODUCTO = 3,  
    @CANTIDAD = 5,    
    @PRECIO = 10.99,  
    @CLIENTEID = 3,       
    @DIRECCIONFACTURACION = 'Av. Principal #123',
    @SALIDA = @SALIDA OUTPUT;

-- Verificar el resultado de la ejecución
SELECT @SALIDA AS Resultado;
GO

-- Eliminar Venta
DECLARE @VentaID INT = 2;
EXEC Venta_Eliminar @VentaID;
GO

-- Buscar Venta
DECLARE @VentaID INT = 1;

EXEC Venta_Buscar @VentaID;

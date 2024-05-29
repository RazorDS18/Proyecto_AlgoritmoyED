--Realizar Nueva Compra
CREATE PROCEDURE sp_RealizarNuevaCompra (
    @PIDPRODUCTO INT,
    @PCANTIDAD INT,
    @PPRECIO MONEY,
    @PROVEEDORID INT, 
    @PSALIDA INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DECLARE @IDCOMPRA INT = 0;
        BEGIN TRANSACTION;

        INSERT INTO Compra(FechaCompra, ProveedorID, Estado, Total)
        VALUES(GETDATE(), @PROVEEDORID, 1, @PPRECIO * @PCANTIDAD);

        SET @IDCOMPRA = SCOPE_IDENTITY();

        INSERT INTO DetalleCompra(Cantidad, Precio, Total, CompraID, ProductoID)
        VALUES(@PCANTIDAD, @PPRECIO, @PPRECIO * @PCANTIDAD, @IDCOMPRA, @PIDPRODUCTO);

        UPDATE Producto
        SET stock = stock + @PCANTIDAD
        WHERE id = @PIDPRODUCTO;

        SET @PSALIDA = 1;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF (@@TRANCOUNT > 0)
            ROLLBACK TRANSACTION;
        SET @PSALIDA = 0;
    END CATCH;
END;
select * from Producto
select * from Proveedor


DECLARE @PSALIDA INT;
EXEC sp_RealizarNuevaCompra 
    @PIDPRODUCTO = 2,
    @PCANTIDAD = 50,
    @PPRECIO = 20.99,
    @PROVEEDORID = 2,
    @PSALIDA = @PSALIDA OUTPUT;

SELECT @PSALIDA AS 'Resultado';


SELECT 
    C.ID AS 'ID de Compra',
    C.FechaCompra,
    C.ProveedorID,
    P.Nombre AS 'Nombre del Producto',
    DC.Cantidad,
    DC.Precio,
    DC.Total AS 'Total por Producto'
FROM 
    Compra C
INNER JOIN 
    DetalleCompra DC ON C.ID = DC.CompraID
INNER JOIN 
    Producto P ON DC.ProductoID = P.ID

Select * from Producto
select * from DetalleCompra
select * from Compra
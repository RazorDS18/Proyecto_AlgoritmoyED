--Agregar Vehiculo
CREATE PROCEDURE Veh_Agregar
    @marca VARCHAR(100),
    @modelo VARCHAR(100),
    @tipo VARCHAR(50),
    @placa VARCHAR(20),
    @propietario_id INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Vehiculo(marca, modelo, tipo, placa, propietario_id)
    VALUES (@marca, @modelo, @tipo, @placa, @propietario_id);
END;

--Buscar Vehiculo
CREATE PROCEDURE Veh_Buscar
    @placa VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Vehiculo
    WHERE placa = @placa;
END;

--Editar Vehiculo
CREATE PROCEDURE Veh_Editar
    @id INT,
    @marca VARCHAR(100),
    @modelo VARCHAR(100),
    @tipo VARCHAR(50),
    @placa VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Vehiculo
    SET 
        marca = @marca,
        modelo = @modelo,
        tipo = @tipo,
        placa = @placa
    WHERE id = @id;
END;

--Eliminar Vehiculo
CREATE PROCEDURE Veh_Eliminar
    @placa VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Vehiculo
    WHERE placa = @placa;
END;

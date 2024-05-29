--Agregar Cliente
CREATE PROCEDURE Cli_Agregar
    @user VARCHAR(255),
    @pw VARCHAR(255),
    @names VARCHAR(255),
    @lastnames VARCHAR(255),
    @doi VARCHAR(255),
    @gmail VARCHAR(255),
    @telefono VARCHAR(20),
    @direccion VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Cliente(users, pw, names, lastnames, doi, gmail, telefono, direccion)
    VALUES (@user, @pw, @names, @lastnames, @doi, @gmail, @telefono, @direccion);
END;

--Buscar Cliente
CREATE PROCEDURE Cli_Buscar
    @doi VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Cliente
    WHERE doi = @doi;
END;

--Editar Cliente
CREATE PROCEDURE Cli_Editar
    @id INT,
    @user VARCHAR(255),
    @pw VARCHAR(255),
    @names VARCHAR(255),
    @lastnames VARCHAR(255),
    @doi VARCHAR(255),
    @gmail VARCHAR(255),
    @telefono VARCHAR(20),
    @direccion VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Cliente
    SET 
        users = @user,
        pw = @pw,
        names = @names,
        lastnames = @lastnames,
        doi = @doi,
        gmail = @gmail,
        telefono = @telefono,
        direccion = @direccion
    WHERE id = @id;
END;

--Eliminar Cliente
CREATE PROCEDURE Cli_Eliminar
    @doi VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Cliente
    WHERE doi = @doi;
END;

--Agregar Administrador

CREATE PROCEDURE Adm_Agregar
    @user NVARCHAR(50),
    @pw NVARCHAR(50),
    @names NVARCHAR(100),
    @lastnames NVARCHAR(100),
    @doi NVARCHAR(20),
    @gmail NVARCHAR(100),
    @telefono NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Administrador(Usuario, Contraseña, Nombres, Apellidos, DOI, Correo, Telefono)
    VALUES (@user, @pw, @names, @lastnames, @doi, @gmail, @telefono);
END;


--Buscar Administrador por DOI
CREATE PROCEDURE Adm_Buscar
    @doi NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Administrador
    WHERE doi = @doi;
END;

--Editar Administrador
CREATE PROCEDURE Adm_Editar
    @id INT,
    @user NVARCHAR(50),
    @pw NVARCHAR(50),
    @names NVARCHAR(100),
    @lastnames NVARCHAR(100),
    @doi NVARCHAR(20),
    @gmail NVARCHAR(100),
    @telefono NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Administrador
    SET 
        Usuario = @user,
        Contraseña = @pw,
        Nombres = @names,
        Apellidos = @lastnames,
        DOI = @doi,
        Correo = @gmail,
        Telefono = @telefono
    WHERE DOI = @doi;
END

--Eliminar Administrador 
CREATE PROCEDURE Adm_Eliminar
    @doi NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Administrador
    SET Estado = 0 
    WHERE doi = @doi;
END

select * from dbo.Administrador
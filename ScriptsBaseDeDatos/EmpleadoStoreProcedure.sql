--Agregar Empleado

CREATE PROCEDURE Emp_Agregar
    @user VARCHAR(255),
    @pw VARCHAR(255),
    @names VARCHAR(255),
    @lastnames VARCHAR(255),
    @doi VARCHAR(255),
    @cargo VARCHAR(255),
    @gmail VARCHAR(255),
    @telefono VARCHAR(20),
    @salario MONEY
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Empleado(users, pw, names, lastnames, doi, cargo, gmail, telefono, salario)
    VALUES (@user, @pw, @names, @lastnames, @doi, @cargo, @gmail, @telefono, @salario);
END;



--Buscar Empleado por DOI
CREATE PROCEDURE Emp_Buscar
    @doi VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Empleado
    WHERE doi = @doi;
END;


--Editar Empleado
CREATE PROCEDURE Emp_Editar
    @id INT,
    @user VARCHAR(255),
    @pw VARCHAR(255),
    @names VARCHAR(255),
    @lastnames VARCHAR(255),
    @doi VARCHAR(255),
    @cargo VARCHAR(255),
    @gmail VARCHAR(255),
    @telefono VARCHAR(20),
    @salario MONEY,
    @fDespido DATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Empleado
    SET 
        users = @user,
        pw = @pw,
        names = @names,
        lastnames = @lastnames,
        doi = @doi,
        cargo = @cargo,
        gmail = @gmail,
        telefono = @telefono,
        salario = @salario,
        fDespido = @fDespido
    WHERE id = @id;
END;



--Eliminar Empleado 
CREATE PROCEDURE Emp_Eliminar
    @doi VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Empleado
    WHERE doi = @doi;
END;


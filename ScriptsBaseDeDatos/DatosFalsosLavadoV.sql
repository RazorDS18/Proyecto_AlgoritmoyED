-- Insertar 10 datos falsos en la tabla Empleado
INSERT INTO Empleado (Usuario, Contrase�a, Nombres, Apellidos, DOI, Cargo, Correo, Telefono, Salario)
VALUES 
('usuario1', 'contrase�a1', 'Juan', 'Perez', '12345678', 'Gerente', 'juan.perez@example.com', '123456789',  5000.00),
('usuario2', 'contrase�a2', 'Ana', 'Lopez', '87654321', 'Asistente', 'ana.lopez@example.com', '987654321',  3000.00),
('usuario3', 'contrase�a3', 'Carlos', 'Gomez', '11223344', 'Contador', 'carlos.gomez@example.com', '456789123',  4500.00),
('usuario4', 'contrase�a4', 'Maria', 'Martinez', '44332211', 'Recepcionista', 'maria.martinez@example.com', '789123456', 2500.00),
('usuario5', 'contrase�a5', 'Luis', 'Garcia', '55667788', 'Supervisor', 'luis.garcia@example.com', '321654987', 4000.00),
('usuario6', 'contrase�a6', 'Elena', 'Rodriguez', '88776655', 'Vendedor', 'elena.rodriguez@example.com', '654987321',  3500.00),
('usuario7', 'contrase�a7', 'Jorge', 'Fernandez', '99887766', 'Jefe de IT', 'jorge.fernandez@example.com', '789456123',6000.00),
('usuario8', 'contrase�a8', 'Laura', 'Diaz', '66778899', 'Marketing', 'laura.diaz@example.com', '123789456',  3200.00),
('usuario9', 'contrase�a9', 'Pedro', 'Sanchez', '77665544', 'Log�stica', 'pedro.sanchez@example.com', '456123789',  3700.00),
('usuario10', 'contrase�a10', 'Sofia', 'Morales', '55443322', 'Recursos Humanos', 'sofia.morales@example.com', '987321654',  4300.00);
select * from dbo.Empleado;


-- Insertar 10 datos falsos en la tabla Administrador
INSERT INTO Administrador (Usuario, Contrase�a, Nombres, Apellidos, DOI, Correo, Telefono)
VALUES 
('admin1', 'adminpass1', 'Lucia', 'Ramirez', '11112222', 'lucia.ramirez@example.com', '123456789'),
('admin2', 'adminpass2', 'Miguel', 'Hernandez', '33334444', 'miguel.hernandez@example.com', '987654321'),
('admin3', 'adminpass3', 'Isabel', 'Castro', '55556666', 'isabel.castro@example.com', '456789123'),
('admin4', 'adminpass4', 'Alberto', 'Torres', '77778888', 'alberto.torres@example.com', '789123456'),
('admin5', 'adminpass5', 'Patricia', 'Santos', '99990000', 'patricia.santos@example.com', '321654987'),
('admin6', 'adminpass6', 'Daniel', 'Molina', '22221111', 'daniel.molina@example.com', '654987321'),
('admin7', 'adminpass7', 'Carmen', 'Ortega', '44443333', 'carmen.ortega@example.com', '789456123'),
('admin8', 'adminpass8', 'Rafael', 'Luna', '66665555', 'rafael.luna@example.com', '123789456'),
('admin9', 'adminpass9', 'Gloria', 'Ruiz', '88887777', 'gloria.ruiz@example.com', '456123789'),
('admin10', 'adminpass10', 'Enrique', 'Vargas', '00001111', 'enrique.vargas@example.com', '987321654');
select * from dbo.Administrador;

-- Insertar 10 datos falsos en la tabla Cliente
INSERT INTO Cliente (Usuario, Contrase�a, Nombres, Apellidos, DOI, Correo, Telefono, Direccion)
VALUES 
('cliente1', 'clientePass1', 'Javier', 'Suarez', '10101010', 'javier.suarez@example.com', '111222333', 'Calle Falsa 123'),
('cliente2', 'clientePass2', 'Andrea', 'Moreno', '20202020', 'andrea.moreno@example.com', '222333444', 'Avenida Siempre Viva 456'),
('cliente3', 'clientePass3', 'Carlos', 'Ortiz', '30303030', 'carlos.ortiz@example.com', '333444555', 'Boulevard del Sol 789'),
('cliente4', 'clientePass4', 'Valeria', 'Guzman', '40404040', 'valeria.guzman@example.com', '444555666', 'Calle Luna 101'),
('cliente5', 'clientePass5', 'Fernando', 'Mendoza', '50505050', 'fernando.mendoza@example.com', '555666777', 'Avenida Estrella 202'),
('cliente6', 'clientePass6', 'Sofia', 'Vega', '60606060', 'sofia.vega@example.com', '666777888', 'Paseo del Parque 303'),
('cliente7', 'clientePass7', 'Martin', 'Diaz', '70707070', 'martin.diaz@example.com', '777888999', 'Camino Real 404'),
('cliente8', 'clientePass8', 'Lucia', 'Paredes', '80808080', 'lucia.paredes@example.com', '888999000', 'Plaza Mayor 505'),
('cliente9', 'clientePass9', 'Raul', 'Rios', '90909090', 'raul.rios@example.com', '999000111', 'Jardines del Valle 606'),
('cliente10', 'clientePass10', 'Paola', 'Salazar', '100100100', 'paola.salazar@example.com', '000111222', 'V�a L�ctea 707');
select * from dbo.Cliente;

-- Insertar 10 datos falsos en la tabla Vehiculo
INSERT INTO Vehiculo (Marca, Modelo, Tipo, Placa, Cliente_Id)
VALUES 
('Toyota', 'Corolla', 'Sedan', 'ABC1234', 1),
('Honda', 'Civic', 'Sedan', 'DEF5678', 2),
('Ford', 'F-150', 'Camioneta', 'GHI9101', 3),
('Chevrolet', 'Tahoe', 'SUV', 'JKL1121', 4),
('Nissan', 'Altima', 'Sedan', 'MNO3141', 5),
('BMW', 'X5', 'SUV', 'PQR5161', 6),
('Audi', 'A4', 'Sedan', 'STU7181', 7),
('Mercedes-Benz', 'C-Class', 'Sedan', 'VWX9202', 8),
('Volkswagen', 'Jetta', 'Sedan', 'YZA1222', 9),
('Hyundai', 'Tucson', 'SUV', 'BCD3242', 10);
select * from dbo.Vehiculo;

-- Insertar datos espec�ficos en la tabla ServicioLavado
INSERT INTO ServicioLavado (Tipo_Vehiculo, Tipo_Lavado, Descripcion, Precio)
VALUES 
('moto', 'basico', 'Lavado b�sico para moto', 15.00),
('moto', 'premium', 'Lavado premium para moto con cera', 25.00),
('moto', 'lujo', 'Lavado de lujo para moto con detallado completo', 35.00),
('auto', 'basico', 'Lavado b�sico para auto', 20.00),
('auto', 'premium', 'Lavado premium para auto con cera y aspirado', 40.00),
('auto', 'lujo', 'Lavado de lujo para auto con detallado completo', 60.00),
('camioneta', 'basico', 'Lavado b�sico para camioneta', 30.00),
('camioneta', 'premium', 'Lavado premium para camioneta con cera y aspirado', 50.00),
('camioneta', 'lujo', 'Lavado de lujo para camioneta con detallado completo', 80.00);
select * from dbo.ServicioLavado;

-- Insertar 10 datos falsos en la tabla Categoria
INSERT INTO Categoria (Nombre, Descripcion)
VALUES 
('Lavado Exterior', 'Servicios de lavado y detallado exterior de veh�culos.'),
('Lavado Interior', 'Servicios de limpieza y detallado interior de veh�culos.'),
('Cera y Pulido', 'Aplicaci�n de cera y pulido para brillo y protecci�n.'),
('Lavado Completo', 'Lavado y detallado completo de veh�culos.'),
('Productos de Limpieza', 'Venta de productos de limpieza para veh�culos.'),
('Accesorios', 'Venta de accesorios para el mantenimiento y mejora de veh�culos.'),
('Lavado de Moto', 'Servicios de lavado espec�ficos para motos.'),
('Protecci�n de Pintura', 'Servicios para la protecci�n y restauraci�n de la pintura del veh�culo.'),
('Limpieza de Tapicer�a', 'Servicios de limpieza y mantenimiento de tapicer�a.'),
('Lavado Ecol�gico', 'Servicios de lavado con productos ecol�gicos y biodegradables.');
select * from dbo.Categoria;

-- Insertar 10 datos falsos en la tabla Proveedor
INSERT INTO Proveedor (Nombre, Descripcion, RUC, Telefono, Direccion, Correo)
VALUES 
('Proveedor1', 'Proveedor de productos de limpieza', '1234567890', '123456789', 'Calle Falsa 123', 'contacto1@proveedor.com'),
('Proveedor2', 'Proveedor de accesorios para autos', '0987654321', '987654321', 'Avenida Siempre Viva 456', 'contacto2@proveedor.com'),
('Proveedor3', 'Proveedor de repuestos', '1122334455', '456789123', 'Boulevard del Sol 789', 'contacto3@proveedor.com'),
('Proveedor4', 'Proveedor de productos ecol�gicos', '5566778899', '789123456', 'Calle Luna 101', 'contacto4@proveedor.com'),
('Proveedor5', 'Proveedor de equipos de lavado', '6677889900', '321654987', 'Avenida Estrella 202', 'contacto5@proveedor.com'),
('Proveedor6', 'Proveedor de herramientas', '7788990011', '654987321', 'Paseo del Parque 303', 'contacto6@proveedor.com'),
('Proveedor7', 'Proveedor de servicios de mantenimiento', '8899001122', '789456123', 'Camino Real 404', 'contacto7@proveedor.com'),
('Proveedor8', 'Proveedor de tecnolog�a para autos', '9900112233', '123789456', 'Plaza Mayor 505', 'contacto8@proveedor.com'),
('Proveedor9', 'Proveedor de productos de protecci�n de pintura', '1002003004', '456123789', 'Jardines del Valle 606', 'contacto9@proveedor.com'),
('Proveedor10', 'Proveedor de productos de limpieza interior', '2003004005', '987321654', 'V�a L�ctea 707', 'contacto10@proveedor.com');
select * from dbo.Proveedor

-- Insertar 10 datos falsos en la tabla Producto
INSERT INTO Producto (Nombre, Descripcion, Marca, Stock, Precio, CategoriaId, ProveedorId)
VALUES 
('Shampoo para autos', 'Shampoo concentrado para lavado de autos', 'Autobrite', 50, 15.00, 1, 1),
('Cera l�quida', 'Cera l�quida para protecci�n de la pintura', 'Meguiars', 30, 25.00, 3, 2),
('Aspiradora port�til', 'Aspiradora port�til para autos', 'Black & Decker', 20, 45.00, 6, 3),
('Ambientador', 'Ambientador para autos con aroma a vainilla', 'Little Trees', 100, 5.00, 6, 4),
('Cepillo de limpieza', 'Cepillo de cerdas suaves para tapicer�a', 'Chemical Guys', 40, 10.00, 9, 5),
('Protector de asientos', 'Protector de asientos impermeable', 'WeatherTech', 25, 35.00, 6, 6),
('Limpiador de vidrios', 'Limpiador de vidrios para autos', 'Stoner', 60, 8.00, 2, 7),
('Pa�os de microfibra', 'Pa�os de microfibra para detallado', 'Viking', 80, 12.00, 1, 8),
('Cera en pasta', 'Cera en pasta para brillo y protecci�n', 'Turtle Wax', 35, 20.00, 3, 9),
('Protector de llantas', 'Protector de llantas para evitar grietas', 'Armor All', 50, 15.00, 8, 10);
select * from dbo.Producto
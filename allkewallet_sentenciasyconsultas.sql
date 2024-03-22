-- se creó el esquema allkewallet con la interfaz
USE allkewallet;
-- Tabla de Usuarios
CREATE TABLE Usuarios (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    correo_electronico VARCHAR(255),
    contraseña VARCHAR(255),
    saldo DECIMAL(18, 2),
    currency_id INT,
    FOREIGN KEY (currency_id) REFERENCES Moneda(currency_id)
);
-- Tabla de Transacciones
CREATE TABLE Transacciones (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    senderuser_id INT,
    receiveruser_id INT,
    amount DECIMAL(18, 2),
    fecha TIMESTAMP,
    currency_id INT,
    FOREIGN KEY (senderuser_id) REFERENCES Usuarios(user_id),
    FOREIGN KEY (receiveruser_id) REFERENCES Usuarios(user_id),
    FOREIGN KEY (currency_id) REFERENCES Moneda(currency_id)
);

-- Tabla de Moneda , (Esta tabla debe crearse primero )
CREATE TABLE Moneda (
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    currency_name VARCHAR(255),
    currency_symbol VARCHAR(5)
);
-- creamos datos para probar las consultas
INSERT INTO Moneda (currency_name, currency_symbol) VALUES
    ('Dólar estadounidense', 'USD'),
    ('Euro', 'EUR'),
    ('Libra esterlina', 'GBP'),
    ('Bitcoin', 'BTC'),
    ('Yen japonés', 'JPY'),
    ('Peso chileno', 'CLP');


INSERT INTO Usuarios (nombre, correo_electronico, contraseña, saldo, currency_id) VALUES
    ('Juan Pérez', 'juan@example.com', 'contraseña123', 1000.00, 1),
    ('María García', 'maria@example.com', 'maria456', 500.00, 2),
    ('Carlos López', 'carlos@example.com', 'clavecarlos', 750.00, 3),
    ('Ana Martínez', 'ana@example.com', 'ana789', 1200.00, 4),
    ('Pedro Sánchez', 'pedro@example.com', 'pedro123', 900.00, 5);
    
INSERT INTO Transacciones (senderuser_id, receiveruser_id, amount, fecha, currency_id) VALUES
    (1, 2, 100.00, '2024-03-16 10:00:00', 7),
    (2, 3, 50.00, '2024-03-16 11:30:00', 9),
    (3, 1, 75.00, '2024-03-16 12:45:00', 10),
    (4, 5, 200.00, '2024-03-16 14:15:00', 4),
    (5, 1, 25.00, '2024-03-16 15:45:00', 5);
    -- debemos ver que ids estan disponibles para usuarios
SELECT user_id FROM Usuarios;
INSERT INTO Transacciones (senderuser_id, receiveruser_id, amount, fecha, currency_id) VALUES
    (6, 7, 100.00, '2024-03-16 10:00:00', 1),
    (7, 8, 75.00, '2024-03-16 11:30:00', 2),
    (8, 9, 50.00, '2024-03-16 12:45:00', 3),
    (9, 10, 200.00, '2024-03-16 14:15:00', 4),
    (10, 6, 25.00, '2024-03-16 15:45:00', 5);
-- Consulta para obtener el nombre de la moneda elegida por un usuario específico:
SELECT m.currency_name
FROM Usuarios u
JOIN Moneda m ON u.currency_id = m.currency_id
WHERE u.user_id = <ID_DEL_USUARIO>;
-- Consulta para obtener todas las transacciones registradas:
SELECT *
FROM Transacciones;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico:
SELECT *
FROM Transacciones
WHERE senderuser_id = <ID_DEL_USUARIO> OR receiveruser_id = <ID_DEL_USUARIO>;
-- Sentencia DML para modificar el campo correo electrónico de un usuario específico:
UPDATE Usuarios
SET correo_electronico = 'correoactual@correo.com'
WHERE user_id = <ID_DEL_USUARIO>;
-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa):
DELETE FROM Transacciones
WHERE transaction_id = <ID_DE_LA_TRANSACCION>;







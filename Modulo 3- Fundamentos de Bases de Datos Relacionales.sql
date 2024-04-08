CREATE DATABASE AlkeWallet;

USE AlkeWallet;

CREATE TABLE Usuario (
    user_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo_electronico VARCHAR(100),
    contrasena VARCHAR(100),
    saldo DECIMAL(10, 2)
);

CREATE TABLE Moneda (
    currency_id INT PRIMARY KEY,
    currency_name VARCHAR(50),
    currency_symbol VARCHAR(10)
);

CREATE TABLE Transaccion (
    transaction_id INT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    importe DECIMAL(10, 2),
    transaction_date DATE,
    currency_id INT,
    FOREIGN KEY (sender_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (currency_id) REFERENCES Moneda(currency_id)
);

 --  INSERT MONEDA
 INSERT INTO `alkewallet`.`moneda` (`currency_id`, `currency_name`, `currency_symbol`) VALUES ('1', 'DOLAR', '$');
 INSERT INTO `alkewallet`.`moneda` (`currency_id`, `currency_name`, `currency_symbol`) VALUES ('2', 'euro', '€');
 -- INSERT USUARIO 
 INSERT INTO `alkewallet`.`usuario` (`user_id`, `nombre`, `correo_electronico`, `contrasena`, `saldo`, `currency_id`) VALUES ('1', 'Juan', 'juan@correo', '123', '20000', '1');
INSERT INTO `alkewallet`.`usuario` (`user_id`, `nombre`, `correo_electronico`, `contrasena`, `saldo`, `currency_id`) VALUES ('2', 'Maria', 'maria@correo', '321', '40000', '2');
-- INSERT TRANSACCION
INSERT INTO `alkewallet`.`transaccion` (`transaction_id`, `sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id`) VALUES ('1', '1', '2', '4000', '2023-10-10', '1');
INSERT INTO `alkewallet`.`transaccion` (`transaction_id`, `sender_user_id`, `receiver_user_id`, `importe`, `transaction_date`, `currency_id`) VALUES ('2', '2', '1', '5000', '2024-01-02', '2');

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico
SELECT u.nombre AS nombre_usuario, m.currency_name AS nombre_moneda
FROM Usuario u
JOIN Transaccion t ON u.user_id = t.sender_user_id
JOIN Moneda m ON t.currency_id = m.currency_id
WHERE u.user_id = 1
ORDER BY t.transaction_date ASC
LIMIT 1;
 
 -- Consulta para obtener las transacciones realizadas por un usuario específico
SELECT *
FROM Transaccion
WHERE sender_user_id = 1;

-- Consulta para obtener todos los usuarios registrados:
SELECT *  FROM Usuario;

-- Consulta para obtener todas las monedas registradas
SELECT * FROM Moneda;

-- Consulta para obtener todas las transacciones registradas
SELECT * FROM Transaccion;

--  Consulta para obtener todas las transacciones realizadas por un usuario específico
SELECT * FROM Transaccion 
WHERE sender_user_id = 1 OR sender_user_id = 'user_id';

--  Consulta para obtener todas las transacciones recibidas por un usuario específico
SELECT * FROM Transaccion 
WHERE receiver_user_id = '2';

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
UPDATE Usuario 
SET correo_electronico = 'correo@modificado'
WHERE user_id = '1';
select * from usuario;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
DELETE FROM Transaccion 
WHERE transaction_id = '2';
select * from transaccion;

-- Sentencia para DDL modificar el nombre de la columna correo_electronico por email
select * from usuario;
ALTER TABLE Usuario CHANGE correo_electronico email VARCHAR(100);
select email from usuario;


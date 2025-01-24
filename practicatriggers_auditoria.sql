CREATE DATABASE prueba;
USE prueba;
CREATE TABLE clientes (
    id_cliente int not null auto_increment PRIMARY KEY,
    nombre varchar(100),
    seccion varchar(20)
);

CREATE TABLE auditoria_clientes (
    id int not null auto_increment PRIMARY KEY,  -- Define la columna 'id' como clave primaria, con valores enteros que se incrementan automáticamente y no pueden ser nulos
    nombre_anterior varchar(100),  -- Columna para almacenar el nombre previo del cliente, con un tamaño máximo de 100 caracteres
    seccion_anterior varchar(20),  -- Columna para guardar la sección previa del cliente, con un tamaño máximo de 20 caracteres
    id_cliente_nuevo int,  -- Columna para almacenar el identificador único del cliente actualizado o nuevo
    nombre_nuevo varchar(100),  -- Columna para guardar el nombre actualizado del cliente, con un tamaño máximo de 100 caracteres
    seccion_nueva varchar(20),  -- Columna para registrar la sección actualizada del cliente, con un tamaño máximo de 20 caracteres
    usuario varchar(40),  -- Columna para guardar el nombre del usuario que realizó el cambio, con un tamaño máximo de 40 caracteres
    modificado datetime,  -- Columna para registrar la fecha y hora exacta de la modificación
    proceso varchar(10)  -- Columna para describir que accion se va a realizar 
);



CREATE user 'com1'@'%' identified by '123';
CREATE user 'com2'@'%' identified by '321';
GRANT SELECT, INSERT, UPDATE, DELETE on prueba.clientes to 'com1'@'%',
'com2'@'%';
FLUSH PRIVILEGES;

drop trigger if exists auditoria_clientes_ai;
create trigger auditoria_clientes_ai after insert on clientes
for each row
insert into auditoria_clientes(id_cliente_nuevo, nombre_nuevo,
seccion_nueva, usuario, modificado, proceso) values(NEW.id_cliente,
NEW.nombre, NEW.seccion, USER(), NOW(), 'INSERT');

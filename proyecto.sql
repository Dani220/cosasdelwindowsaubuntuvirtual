CREATE DATABASE proyectofinal;
USE proyectofinal;

CREATE TABLE Equipos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Tipo VARCHAR(100) NOT NULL,
    Fecha_ingreso DATE NOT NULL
);


CREATE TABLE Clientes (
    DNI VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Contraseña VARCHAR(200) NOT NULL,
    Telefono CHAR (20) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Correo VARCHAR(200) NOT NULL,
    ID_Equipo INT,
    FOREIGN KEY (ID_Equipo) REFERENCES Equipos(ID)
);


CREATE TABLE Tecnicos (
    DNI VARCHAR(20) PRIMARY KEY ,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(12) NOT NULL,
    Especialidad VARCHAR(100) NOT NULL
);


CREATE TABLE Servicios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Fecha_Final DATE NOT NULL,
    Fecha_Inicio DATE NOT NULL,
    Coste INT NOT NULL,
    Cliente_DNI VARCHAR(20) NOT NULL,
    DNI_Tecnico VARCHAR(20) NOT NULL,
    FOREIGN KEY (Cliente_DNI) REFERENCES Clientes(DNI),
    FOREIGN KEY (DNI_Tecnico) REFERENCES Tecnicos(DNI)
);

CREATE TABLE Calificaciones (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    DNI_Cliente VARCHAR(20) NOT NULL,
    Texto TEXT NOT NULL,
    Nota_servicio TEXT NOT NULL,
    FOREIGN KEY (DNI_Cliente) REFERENCES Clientes(DNI)
);


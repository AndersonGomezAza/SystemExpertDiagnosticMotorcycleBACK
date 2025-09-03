-- =========================================================
-- CREACIÓN DE BASE DE DATOS
-- =========================================================

-- BASE DE DATOS PARA POSTGRESQL
CREATE DATABASE MotosDiagnostic;
USE DATABASE MotosDiagnostic;

-- =========================================================
-- TABLA: Rol
-- =========================================================
CREATE TABLE Rol (
    id_rol SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,     -- Ej: Admin, Mecánico, Cliente
    descripcion VARCHAR(255)
);

-- =========================================================
-- TABLA: Usuario
-- =========================================================
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,    -- Contraseña en hash
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultimo_login TIMESTAMP,
    id_rol INT NOT NULL,
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol)
);

-- =========================================================
-- TABLA: Motocicleta
-- =========================================================
CREATE TABLE Motocicleta (
    id_moto SERIAL PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT,
    cilindraje VARCHAR(20),
    tipo_motor VARCHAR(20),                 -- 2T, 4T, eléctrico
    combustible VARCHAR(20),                -- gasolina, eléctrica, híbrida
    placa VARCHAR(6),
    color VARCHAR(20),
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- =========================================================
-- TABLA: Sintoma
-- =========================================================
CREATE TABLE Sintoma (
    id_sintoma SERIAL PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    categoria VARCHAR(50)                   -- eléctrico, motor, frenos, etc.
);

-- =========================================================
-- TABLA: Falla
-- =========================================================
CREATE TABLE Falla (
    id_falla SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    nivel_gravedad VARCHAR(10) NOT NULL CHECK (nivel_gravedad IN ('Bajo', 'Medio', 'Alto', 'Crítico'))
);

-- =========================================================
-- TABLA: Causa
-- =========================================================
CREATE TABLE Causa (
    id_causa SERIAL PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL
);

-- =========================================================
-- TABLA: Solucion
-- =========================================================
CREATE TABLE Solucion (
    id_solucion SERIAL PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    tiempo_estimado VARCHAR(50),
    costo_estimado DECIMAL(10,2)
);

-- =========================================================
-- TABLA: Diagnostico
-- =========================================================
CREATE TABLE Diagnostico (
    id_diagnostico SERIAL PRIMARY KEY,
    id_moto INT NOT NULL,
    id_sintoma INT,
    id_falla INT,
    id_causa INT,
    id_solucion INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) DEFAULT 'pendiente',   -- pendiente, confirmado, solucionado
    FOREIGN KEY (id_moto) REFERENCES Motocicleta(id_moto),
    FOREIGN KEY (id_sintoma) REFERENCES Sintoma(id_sintoma),
    FOREIGN KEY (id_falla) REFERENCES Falla(id_falla),
    FOREIGN KEY (id_causa) REFERENCES Causa(id_causa),
    FOREIGN KEY (id_solucion) REFERENCES Solucion(id_solucion)
);

-- =========================================================
-- TABLA: Regla
-- =========================================================
CREATE TABLE Regla (
    id_regla SERIAL PRIMARY KEY,
    condicion TEXT NOT NULL,   -- Ej: "SI no enciende Y batería sin voltaje"
    accion TEXT NOT NULL       -- Ej: "Falla: Batería descargada → Solución: Cargar batería"
);

-- =========================================================
-- TABLA: Relacion_Regla
-- =========================================================
CREATE TABLE Relacion_Regla (
    id_relacion SERIAL PRIMARY KEY,
    id_regla INT NOT NULL,
    id_sintoma INT,
    id_falla INT,
    id_solucion INT,
    FOREIGN KEY (id_regla) REFERENCES Regla(id_regla),
    FOREIGN KEY (id_sintoma) REFERENCES Sintoma(id_sintoma),
    FOREIGN KEY (id_falla) REFERENCES Falla(id_falla),
    FOREIGN KEY (id_solucion) REFERENCES Solucion(id_solucion)
);

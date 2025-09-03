-- =========================================================
-- CREACIÓN DE BASE DE DATOS
-- =========================================================
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
    nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
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

-- =========================================================
-- DATOS INICIALES DE ROLES
-- =========================================================
INSERT INTO Rol (nombre, descripcion) VALUES
('Admin', 'Acceso total al sistema'),
('Mecanico', 'Puede registrar diagnósticos y soluciones'),
('Cliente', 'Puede consultar sus motos y diagnósticos');

-- =========================================================
-- USUARIOS DE PRUEBA 
-- =========================================================
INSERT INTO Usuario (nombre_usuario, email, password_hash, telefono, direccion, id_rol) VALUES
-- ===================== ADMINS =====================
('jlopez_admin', 'jlopez@ci2.com', 'hash_admin1', '+57 3001234567', 'Calle 45 #10-23, Bogotá', 1),
('mcardenas_admin', 'mcardenas@ci2.com', 'hash_admin2', '+57 3009876543', 'Carrera 12 #34-56, Medellín', 1),
('lfuentes_admin', 'lfuentes@ci2.com', 'hash_admin3', '+57 3012233445', 'Avenida 80 #45-12, Cali', 1),

-- ===================== MECÁNICOS =====================
('hrojas_mec', 'hrojas@tallercentral.com', 'hash_mec1', '+57 3021112233', 'Taller Central, Calle 13 #20-15, Bogotá', 2),
('gmartinez_mec', 'gmartinez@tallernorte.com', 'hash_mec2', '+57 3022223344', 'Taller Norte, Carrera 68 #45-22, Bogotá', 2),
('rsalazar_mec', 'rsalazar@tallersur.com', 'hash_mec3', '+57 3033334455', 'Taller Sur, Calle 80 #10-11, Medellín', 2),
('pfernandez_mec', 'pfernandez@talleroeste.com', 'hash_mec4', '+57 3044445566', 'Taller Oeste, Av. Las Américas #22-45, Cali', 2),
('dcastillo_mec', 'dcastillo@talleroriente.com', 'hash_mec5', '+57 3055556677', 'Taller Oriente, Carrera 7 #15-40, Bucaramanga', 2),
('mmorales_mec', 'mmorales@tallercentral.com', 'hash_mec6', '+57 3066667788', 'Taller Central, Calle 20 #5-33, Bogotá', 2),
('agonzalez_mec', 'agonzalez@tallernorte.com', 'hash_mec7', '+57 3077778899', 'Taller Norte, Carrera 50 #8-12, Medellín', 2),

-- ===================== CLIENTES =====================
('cparedes', 'cparedes@gmail.com', 'hash_cli1', '+57 3101239876', 'Calle 60 #22-15, Bogotá', 3),
('jquintero', 'jquintero@hotmail.com', 'hash_cli2', '+57 3112348765', 'Carrera 25 #18-40, Cali', 3),
('mvargas', 'mvargas@yahoo.com', 'hash_cli3', '+57 3123457654', 'Avenida 68 #70-20, Medellín', 3),
('fsandoval', 'fsandoval@gmail.com', 'hash_cli4', '+57 3134566543', 'Calle 10 #5-60, Cartagena', 3),
('larias', 'larias@gmail.com', 'hash_cli5', '+57 3145675432', 'Carrera 50 #45-23, Barranquilla', 3),
('jgutierrez', 'jgutierrez@outlook.com', 'hash_cli6', '+57 3156784321', 'Calle 30 #12-19, Bogotá', 3),
('ndelgado', 'ndelgado@gmail.com', 'hash_cli7', '+57 3167893210', 'Carrera 15 #7-80, Bucaramanga', 3),
('aserrano', 'aserrano@yahoo.com', 'hash_cli8', '+57 3178902109', 'Calle 12 #30-45, Cali', 3),
('btorres', 'btorres@hotmail.com', 'hash_cli9', '+57 3189011098', 'Carrera 45 #15-10, Medellín', 3),
('rmendez', 'rmendez@gmail.com', 'hash_cli10', '+57 3190120987', 'Av. Caracas #50-12, Bogotá', 3),
('jcamacho', 'jcamacho@gmail.com', 'hash_cli11', '+57 3101112233', 'Calle 8 #22-14, Cali', 3),
('dpineda', 'dpineda@hotmail.com', 'hash_cli12', '+57 3112223344', 'Carrera 65 #30-25, Medellín', 3),
('oortiz', 'oortiz@outlook.com', 'hash_cli13', '+57 3123334455', 'Avenida 1 #12-34, Cartagena', 3),
('arodriguez', 'arodriguez@gmail.com', 'hash_cli14', '+57 3134445566', 'Carrera 10 #45-19, Bogotá', 3),
('gmendoza', 'gmendoza@yahoo.com', 'hash_cli15', '+57 3145556677', 'Calle 77 #15-23, Barranquilla', 3),
('emoreno', 'emoreno@gmail.com', 'hash_cli16', '+57 3156667788', 'Calle 50 #12-34, Bucaramanga', 3),
('fcastro', 'fcastro@hotmail.com', 'hash_cli17', '+57 3167778899', 'Carrera 9 #22-10, Cali', 3),
('cibarra', 'cibarra@outlook.com', 'hash_cli18', '+57 3178889900', 'Calle 80 #20-11, Medellín', 3),
('pgomez', 'pgomez@gmail.com', 'hash_cli19', '+57 3189990011', 'Carrera 3 #45-18, Cartagena', 3),
('rlopez', 'rlopez@yahoo.com', 'hash_cli20', '+57 3190001122', 'Calle 12 #15-22, Bogotá', 3);

-- =========================================================
-- MOTOCICLETAS DE PRUEBA (50 unidades, solo clientes)
-- =========================================================
INSERT INTO Motocicleta (marca, modelo, anio, cilindraje, tipo_motor, combustible, placa, color, id_usuario) VALUES
-- Cliente 9
('Honda', 'CBR500R', 2020, '500cc', '4T', 'gasolina', 'MOT001', 'Rojo', 9),
('Zero', 'SR/F', 2022, 'N/A', 'eléctrico', 'eléctrica', 'MOT002', 'Negro', 9),
('KTM', 'Duke 390', 2021, '373cc', '4T', 'gasolina', 'MOT003', 'Naranja', 9),

-- Cliente 10
('Yamaha', 'MT-07', 2019, '689cc', '4T', 'gasolina', 'MOT004', 'Negro', 10),
('BMW', 'CE 04', 2021, 'N/A', 'eléctrico', 'eléctrica', 'MOT005', 'Blanco', 10),
('Suzuki', 'GSX250R', 2020, '248cc', '4T', 'gasolina', 'MOT006', 'Azul', 10),

-- Cliente 11
('Suzuki', 'GSX-S750', 2021, '749cc', '4T', 'gasolina', 'MOT007', 'Azul', 11),
('Harley-Davidson', 'LiveWire', 2022, 'N/A', 'eléctrico', 'eléctrica', 'MOT008', 'Rojo', 11),
('KTM', 'RC 200', 2019, '199cc', '2T', 'gasolina', 'MOT009', 'Naranja', 11),

-- Cliente 12
('KTM', 'Duke 390', 2018, '373cc', '4T', 'gasolina', 'MOT010', 'Naranja', 12),
('Energica', 'Eva Ribelle', 2023, 'N/A', 'eléctrico', 'eléctrica', 'MOT011', 'Verde', 12),
('Honda', 'CBR300R', 2020, '286cc', '4T', 'gasolina', 'MOT012', 'Rojo', 12),

-- Cliente 13
('BMW', 'G310R', 2022, '313cc', '4T', 'gasolina', 'MOT013', 'Blanco', 13),
('Super Soco', 'TC Max', 2021, 'N/A', 'eléctrico', 'eléctrica', 'MOT014', 'Azul', 13),
('KTM', '390 Adventure', 2022, '373cc', '4T', 'gasolina', 'MOT015', 'Rojo', 13),

-- Cliente 14
('Honda', 'CB500F', 2021, '471cc', '4T', 'gasolina', 'MOT016', 'Negro', 14),
('Yamaha', 'YZF-R125', 2019, '125cc', '2T', 'gasolina', 'MOT017', 'Negro', 14),
('Zero', 'FX', 2021, 'N/A', 'eléctrico', 'eléctrica', 'MOT018', 'Negro', 14),

-- Cliente 15
('Yamaha', 'R3', 2020, '321cc', '4T', 'gasolina', 'MOT019', 'Azul', 15),
('KTM', '125 Duke', 2021, '125cc', '2T', 'gasolina', 'MOT020', 'Naranja', 15),
('BMW', 'CE 02', 2022, 'N/A', 'eléctrico', 'eléctrica', 'MOT021', 'Blanco', 15),

-- Cliente 16
('Suzuki', 'V-Strom 650', 2019, '645cc', '4T', 'gasolina', 'MOT022', 'Gris', 16),
('KTM', '390 Adventure', 2022, '373cc', '4T', 'gasolina', 'MOT023', 'Rojo', 16),
('Zero', 'DSR', 2021, 'N/A', 'eléctrico', 'eléctrica', 'MOT024', 'Negro', 16),

-- Cliente 17
('KTM', '390 Adventure', 2022, '373cc', '4T', 'gasolina', 'MOT025', 'Rojo', 17),
('Honda', 'CBR500R', 2020, '500cc', '4T', 'gasolina', 'MOT026', 'Rojo', 17),
('Energica', 'Eva Ribelle', 2023, 'N/A', 'eléctrico', 'eléctrica', 'MOT027', 'Verde', 17),

-- Cliente 18
('BMW', 'F900R', 2021, '895cc', '4T', 'gasolina', 'MOT028', 'Negro', 18),
('Suzuki', 'SV650', 2020, '645cc', '4T', 'gasolina', 'MOT029', 'Gris', 18),
('Super Soco', 'TS', 2022, 'N/A', 'eléctrico', 'eléctrica', 'MOT030', 'Azul', 18),

-- Cliente 19
('Honda', 'CB1000R', 2020, '998cc', '4T', 'gasolina', 'MOT031', 'Gris', 19),
('Zero', 'FX', 2021, 'N/A', 'eléctrico', 'eléctrica', 'MOT032', 'Negro', 19),
('Yamaha', 'MT-09', 2022, '847cc', '4T', 'gasolina', 'MOT033', 'Azul', 19),

-- Cliente 20
('Yamaha', 'MT-09', 2022, '847cc', '4T', 'gasolina', 'MOT034', 'Azul', 20),
('Energica', 'EsseEsse9', 2022, 'N/A', 'eléctrico', 'eléctrica', 'MOT035', 'Amarillo', 20),
('KTM', 'RC 200', 2019, '199cc', '2T', 'gasolina', 'MOT036', 'Naranja', 20),

-- =========================================================
-- SINTOMAS DE PRUEBA 
-- =========================================================
INSERT INTO Sintoma (descripcion, categoria) VALUES
-- MOTOR
('El motor no enciende al girar la llave', 'Motor'),
('El motor arranca pero se apaga al poco tiempo', 'Motor'),
('Pérdida de potencia en subidas', 'Motor'),
('Humo negro en el escape', 'Motor'),
('Humo blanco en el escape', 'Motor'),
('Humo azul en el escape', 'Motor'),
('Golpeteo metálico en el motor', 'Motor'),
('El motor se sobrecalienta rápidamente', 'Motor'),
('Fugas de aceite en el motor', 'Motor'),
('Exceso de vibración en ralentí', 'Motor'),
('El carburador gotea gasolina', 'Motor'),
('El motor tarda mucho en arrancar en frío', 'Motor'),
('El motor se apaga cuando está en neutro', 'Motor'),
('Se escucha explosión en el escape', 'Motor'),
('El motor no responde al acelerar', 'Motor'),
('El motor se ahoga al acelerar bruscamente', 'Motor'),
('El ralentí es inestable', 'Motor'),
('Se percibe olor a gasolina sin quemar', 'Motor'),
('El motor pierde aceite por el escape', 'Motor'),
('El motor hace ruidos extraños al calentarse', 'Motor'),

-- TRANSMISIÓN
('El embrague patina al acelerar', 'Transmisión'),
('Dificultad para cambiar de marcha', 'Transmisión'),
('La cadena se suelta con frecuencia', 'Transmisión'),
('La cadena hace ruido al girar', 'Transmisión'),
('La palanca de cambios se siente muy dura', 'Transmisión'),
('La moto salta de marcha inesperadamente', 'Transmisión'),
('El embrague no desacopla completamente', 'Transmisión'),
('Golpes al cambiar de marcha', 'Transmisión'),
('Vibración en la transmisión a altas velocidades', 'Transmisión'),
('El piñón delantero hace ruido metálico', 'Transmisión'),

-- SISTEMA ELÉCTRICO
('Luces delanteras muy tenues', 'Eléctrico'),
('La bocina no suena', 'Eléctrico'),
('La batería se descarga rápidamente', 'Eléctrico'),
('El indicador de combustible no funciona', 'Eléctrico'),
('El velocímetro no marca la velocidad', 'Eléctrico'),
('El electroventilador no enciende', 'Eléctrico'),
('Chispa débil en la bujía', 'Eléctrico'),
('El motor de arranque no responde', 'Eléctrico'),
('La luz trasera no funciona', 'Eléctrico'),
('Los intermitentes parpadean muy rápido', 'Eléctrico'),
('El alternador no carga la batería', 'Eléctrico'),
('Fusibles se queman con frecuencia', 'Eléctrico'),
('El tablero no enciende', 'Eléctrico'),
('Se perciben chispas en el sistema eléctrico', 'Eléctrico'),
('Olor a cable quemado al encender', 'Eléctrico'),

-- FRENOS
('Los frenos delanteros no responden bien', 'Frenos'),
('Los frenos traseros hacen ruido', 'Frenos'),
('Frenado con vibración en la rueda delantera', 'Frenos'),
('La rueda trasera se bloquea al frenar', 'Frenos'),
('El freno delantero se siente esponjoso', 'Frenos'),
('El freno trasero pierde presión', 'Frenos'),
('El recorrido de la maneta de freno es excesivo', 'Frenos'),
('El freno delantero se recalienta', 'Frenos'),
('El disco de freno está rayado', 'Frenos'),
('El tambor de freno hace chirridos', 'Frenos'),

-- SUSPENSIÓN Y DIRECCIÓN
('La suspensión trasera está muy dura', 'Suspensión'),
('La suspensión delantera hace ruido al frenar', 'Suspensión'),
('La dirección está muy dura', 'Dirección'),
('El manubrio vibra demasiado en carretera', 'Dirección'),
('La moto se va hacia un lado al soltar el manubrio', 'Dirección'),
('Fugas de aceite en la suspensión delantera', 'Suspensión'),
('La suspensión trasera rebota en exceso', 'Suspensión'),
('La horquilla hace tope al frenar fuerte', 'Suspensión'),
('El manubrio se siente flojo', 'Dirección'),
('El rodamiento de dirección hace ruido', 'Dirección'),

-- NEUMÁTICOS Y RUEDAS
('El neumático delantero pierde aire constantemente', 'Neumáticos'),
('El neumático trasero presenta desgaste irregular', 'Neumáticos'),
('La moto derrapa en superficies húmedas', 'Neumáticos'),
('Vibración en la rueda delantera a alta velocidad', 'Neumáticos'),
('La presión de los neumáticos baja rápidamente', 'Neumáticos'),
('El rin está doblado', 'Neumáticos'),
('Golpes en la rueda trasera al pasar baches', 'Neumáticos'),
('La llanta se calienta en exceso', 'Neumáticos'),

-- COMBUSTIBLE
('Fugas de gasolina bajo el tanque', 'Combustible'),
('El olor a gasolina es constante', 'Combustible'),
('El filtro de combustible se obstruye con frecuencia', 'Combustible'),
('La bomba de gasolina no envía presión', 'Combustible'),
('El tanque presenta óxido en el interior', 'Combustible'),
('El consumo de combustible es excesivo', 'Combustible'),
('La moto se apaga cuando queda poco combustible', 'Combustible'),
('El tapón del tanque no cierra bien', 'Combustible'),

-- ESCAPE
('El escape hace demasiado ruido', 'Escape'),
('El silenciador presenta fugas', 'Escape'),
('El escape se calienta demasiado', 'Escape'),
('Olor fuerte a gases en el escape', 'Escape'),
('El escape presenta oxidación severa', 'Escape'),
('Se escuchan explosiones en el escape', 'Escape'),

-- OTROS
('La moto pierde estabilidad a alta velocidad', 'Dirección'),
('El caballete central no sostiene la moto', 'Chasis'),
('El asiento está flojo', 'Chasis'),
('Los espejos retrovisores vibran demasiado', 'Chasis'),
('La moto genera ruidos plásticos al andar', 'Chasis'),
('El portaequipaje se afloja constantemente', 'Chasis'),
('El radiador pierde líquido refrigerante', 'Refrigeración'),
('La bomba de agua no circula correctamente', 'Refrigeración'),
('La temperatura sube demasiado rápido', 'Refrigeración'),
('Fugas de líquido refrigerante bajo la moto', 'Refrigeración');

-- =========================================================
-- FALLAS DE PRUEBA 
-- =========================================================
INSERT INTO Falla (nombre, descripcion, nivel_gravedad) VALUES
('Batería descargada', 'La batería no suministra suficiente energía para arrancar el motor.', 'Medio'),
('Bujía dañada', 'La bujía no genera chispa adecuada para la combustión.', 'Medio'),
('Carburador desajustado', 'Mezcla aire/combustible incorrecta que afecta el rendimiento.', 'Medio'),
('Filtro de aire obstruido', 'El motor no recibe suficiente aire para la combustión.', 'Bajo'),
('Aceite insuficiente', 'Bajo nivel de aceite que puede dañar el motor.', 'Alto'),
('Sobrecalentamiento del motor', 'El motor alcanza temperaturas críticas por problemas de refrigeración.', 'Crítico'),
('Cadena floja', 'La cadena se suelta o golpea el basculante.', 'Bajo'),
('Embrague desgastado', 'El embrague patina y no transmite bien la potencia.', 'Medio'),
('Pastillas de freno gastadas', 'Las pastillas no generan fricción suficiente para frenar.', 'Alto'),
('Disco de freno rayado', 'El disco de freno dañado reduce la eficiencia de frenado.', 'Alto'),
('Amortiguadores dañados', 'La suspensión pierde capacidad de absorber impactos.', 'Medio'),
('Dirección desalineada', 'La moto tiende a desviarse en línea recta.', 'Medio'),
('Neumático desgastado', 'Neumático con dibujo insuficiente para la tracción.', 'Alto'),
('Fugas de gasolina', 'Se detectan pérdidas de combustible en tanque o mangueras.', 'Crítico'),
('Alternador defectuoso', 'El alternador no recarga la batería.', 'Medio'),
('Motor de arranque dañado', 'El motor de arranque no gira correctamente.', 'Medio'),
('Sistema eléctrico en corto', 'Un circuito eléctrico está generando sobrecarga o cortocircuito.', 'Crítico'),
('Escape perforado', 'El escape presenta fugas de gases y exceso de ruido.', 'Bajo'),
('Radiador con fugas', 'El sistema de refrigeración pierde líquido.', 'Alto'),
('Caja de cambios dañada', 'Los engranajes de la transmisión presentan desgaste o roturas.', 'Crítico');

-- =========================================================
-- CAUSAS DE PRUEBA 
-- =========================================================
INSERT INTO Causa (descripcion) VALUES
-- Eléctrico
('Batería descargada por dejar luces encendidas'),
('Regulador de voltaje defectuoso'),
('Fusible principal quemado'),
('Cables de masa mal conectados'),
('Bobina de encendido dañada'),
('Sensor de posición de cigüeñal defectuoso'),
('Bujía con electrodo quemado'),
('Cables de bujía en mal estado'),
('Conectores flojos en la ECU'),

-- Motor / Combustión
('Carburador obstruido por suciedad'),
('Inyector de combustible bloqueado'),
('Filtro de gasolina tapado'),
('Combustible de mala calidad'),
('Nivel de aceite muy bajo'),
('Aceite contaminado con residuos'),
('Biela desgastada'),
('Pistón con anillos dañados'),
('Junta de culata quemada'),
('Distribución desajustada'),
('Exceso de carbonilla en la cámara de combustión'),

-- Transmisión
('Cadena sin lubricación'),
('Piñón de salida desgastado'),
('Corona trasera dañada'),
('Embrague con discos gastados'),
('Resorte de embrague roto'),
('Caja de cambios sin aceite'),
('Engranajes de la caja de cambios quebrados'),

-- Frenos
('Fugas en el circuito hidráulico de freno'),
('Pastillas cristalizadas'),
('Disco de freno doblado'),
('Bomba de freno defectuosa'),
('Latiguillo de freno obstruido'),

-- Suspensión y Dirección
('Amortiguadores sin presión de gas'),
('Horquilla delantera con retenes dañados'),
('Dirección desajustada por caída'),
('Rodamientos de dirección desgastados'),

-- Otros
('Escape obstruido por hollín'),
('Neumático inflado a presión incorrecta'),
('Neumático con alambre expuesto'),
('Radiador tapado por suciedad'),
('Correa de distribución desgastada (en algunos modelos)'),
('Fuga en manguera de refrigerante'),
('Tanque de combustible corroído'),
('Mal uso del embrague por el conductor'),
('Sobrecarga de la motocicleta'),
('Mantenimiento deficiente o inexistente');

-- =========================================================
-- DATOS INICIALES DE SOLUCIONES
-- =========================================================
INSERT INTO Solucion (descripcion, tiempo_estimado, costo_estimado) VALUES
('Reemplazar batería descargada', '30 min', 120000.00),
('Limpiar o reemplazar bujía dañada', '20 min', 45000.00),
('Ajustar carburador correctamente', '45 min', 70000.00),
('Cambiar filtro de aire obstruido', '15 min', 30000.00),
('Agregar aceite al motor', '10 min', 20000.00),
('Revisar y reparar sistema de refrigeración', '1 h', 150000.00),
('Ajustar cadena floja', '20 min', 25000.00),
('Reemplazar embrague desgastado', '2 h', 180000.00),
('Cambiar pastillas de freno gastadas', '30 min', 90000.00),
('Pulir o reemplazar disco de freno rayado', '40 min', 100000.00),
('Reemplazar amortiguadores dañados', '1 h 30 min', 250000.00),
('Alinear dirección desalineada', '30 min', 40000.00),
('Reemplazar neumático desgastado', '25 min', 120000.00),
('Reparar fuga de gasolina', '1 h', 80000.00),
('Cambiar alternador defectuoso', '1 h', 200000.00),
('Reparar motor de arranque dañado', '1 h 15 min', 120000.00),
('Revisar y reparar cortocircuito en sistema eléctrico', '2 h', 150000.00),
('Reparar escape perforado', '1 h', 70000.00),
('Revisar radiador con fugas y reemplazar mangueras', '1 h 30 min', 180000.00),
('Reparar caja de cambios dañada', '3 h', 300000.00),
('Revisar conexiones eléctricas y soldar cables sueltos', '45 min', 40000.00),
('Limpiar carburador obstruido por suciedad', '40 min', 50000.00),
('Revisar inyectores de combustible y limpiar', '1 h', 80000.00),
('Cambiar filtro de gasolina tapado', '20 min', 35000.00),
('Reemplazar combustible de mala calidad', '15 min', 20000.00),
('Agregar aceite de motor adecuado', '10 min', 20000.00),
('Cambiar aceite contaminado con residuos', '30 min', 45000.00),
('Reparar biela desgastada', '4 h', 400000.00),
('Reparar pistón con anillos dañados', '5 h', 500000.00),
('Cambiar junta de culata quemada', '3 h', 350000.00),
('Ajustar distribución del motor', '2 h', 150000.00),
('Limpiar exceso de carbonilla en cámara de combustión', '1 h 30 min', 120000.00),
('Lubricar cadena de transmisión', '20 min', 25000.00),
('Reemplazar piñón de salida desgastado', '1 h', 100000.00),
('Reemplazar corona trasera dañada', '1 h', 90000.00),
('Cambiar discos de embrague gastados', '2 h', 180000.00),
('Reemplazar resorte de embrague roto', '1 h 30 min', 80000.00),
('Agregar aceite a caja de cambios', '15 min', 20000.00),
('Reemplazar engranajes dañados en caja de cambios', '3 h', 250000.00),
('Reparar fugas en circuito hidráulico de freno', '1 h', 90000.00),
('Cambiar pastillas de freno cristalizadas', '30 min', 90000.00),
('Reemplazar disco de freno doblado', '40 min', 100000.00),
('Cambiar bomba de freno defectuosa', '1 h 15 min', 120000.00),
('Limpiar o reemplazar latiguillo de freno obstruido', '45 min', 50000.00),
('Revisar y rellenar amortiguadores sin presión de gas', '1 h', 70000.00),
('Reparar horquilla delantera con retenes dañados', '2 h', 150000.00),
('Ajustar dirección desajustada por caída', '30 min', 40000.00),
('Reemplazar rodamientos de dirección desgastados', '1 h', 90000.00),
('Limpiar escape obstruido por hollín', '30 min', 35000.00),
('Revisar neumático y ajustar presión correcta', '15 min', 15000.00),
('Reparar radiador tapado por suciedad', '1 h', 80000.00),
('Reemplazar correa de distribución desgastada', '3 h', 300000.00),
('Cambiar manguera de refrigerante con fuga', '1 h', 60000.00),
('Reparar tanque de combustible corroído', '2 h', 200000.00),
('Capacitar conductor sobre buen uso del embrague', '30 min', 0.00),
('Reducir sobrecarga de motocicleta', '15 min', 0.00),
('Realizar mantenimiento preventivo completo', '3 h', 250000.00);

-- =========================================================
-- DATOS DE PRUEBA PARA DIAGNOSTICO
-- =========================================================
INSERT INTO Diagnostico (id_moto, id_sintoma, id_falla, id_causa, id_solucion, fecha, estado) VALUES
(1, 1, 1, 1, 1, '2025-08-31 08:30:00', 'pendiente'),
(2, 2, 2, 2, 2, '2025-08-30 09:00:00', 'confirmado'),
(3, 3, 3, 11, 3, '2025-08-29 10:15:00', 'solucionado'),
(4, 4, 4, 12, 4, '2025-08-28 11:45:00', 'pendiente'),
(5, 5, 5, 13, 5, '2025-08-27 14:00:00', 'confirmado'),
(6, 6, 6, 14, 6, '2025-08-26 15:30:00', 'solucionado'),
(7, 7, 7, 15, 7, '2025-08-25 16:45:00', 'pendiente'),
(8, 8, 8, 16, 8, '2025-08-24 08:15:00', 'confirmado'),
(9, 9, 9, 17, 9, '2025-08-23 09:50:00', 'solucionado'),
(10, 10, 10, 18, 10, '2025-08-22 10:20:00', 'pendiente'),
(11, 11, 11, 19, 11, '2025-08-21 11:05:00', 'confirmado'),
(12, 12, 12, 20, 12, '2025-08-20 12:40:00', 'solucionado'),
(13, 13, 13, 1, 13, '2025-08-19 13:15:00', 'pendiente'),
(14, 14, 14, 2, 14, '2025-08-18 14:30:00', 'confirmado'),
(15, 15, 15, 3, 15, '2025-08-17 15:45:00', 'solucionado'),
(16, 16, 16, 4, 16, '2025-08-16 08:20:00', 'pendiente'),
(17, 17, 17, 5, 17, '2025-08-15 09:10:00', 'confirmado'),
(18, 18, 18, 6, 18, '2025-08-14 10:50:00', 'solucionado'),
(19, 19, 19, 7, 19, '2025-08-13 11:30:00', 'pendiente'),
(20, 20, 20, 8, 20, '2025-08-12 12:00:00', 'confirmado'),
(21, 21, 1, 9, 21, '2025-08-11 13:20:00', 'solucionado'),
(22, 22, 2, 10, 22, '2025-08-10 14:15:00', 'pendiente'),
(23, 23, 3, 11, 23, '2025-08-09 15:40:00', 'confirmado'),
(24, 24, 4, 12, 24, '2025-08-08 08:55:00', 'solucionado'),
(25, 25, 5, 13, 25, '2025-08-07 09:35:00', 'pendiente'),
(26, 26, 6, 14, 26, '2025-08-06 10:10:00', 'confirmado'),
(27, 27, 7, 15, 27, '2025-08-05 11:50:00', 'solucionado'),
(28, 28, 8, 16, 28, '2025-08-04 12:25:00', 'pendiente'),
(29, 29, 9, 17, 29, '2025-08-03 13:45:00', 'confirmado'),
(30, 30, 10, 18, 30, '2025-08-02 14:30:00', 'solucionado'),
(1, 31, 1, 19, 31, '2025-08-01 08:15:00', 'pendiente'),
(2, 32, 2, 20, 32, '2025-07-31 09:05:00', 'confirmado'),
(3, 33, 3, 1, 33, '2025-07-30 10:25:00', 'solucionado'),
(4, 34, 4, 2, 34, '2025-07-29 11:40:00', 'pendiente'),
(5, 35, 5, 3, 35, '2025-07-28 12:50:00', 'confirmado'),
(6, 36, 6, 4, 36, '2025-07-27 13:15:00', 'solucionado'),
(7, 37, 7, 5, 37, '2025-07-26 14:20:00', 'pendiente'),
(8, 38, 8, 6, 38, '2025-07-25 15:35:00', 'confirmado'),
(9, 39, 9, 7, 39, '2025-07-24 08:50:00', 'solucionado'),
(10, 40, 10, 8, 40, '2025-07-23 09:30:00', 'pendiente'),
(11, 41, 11, 9, 41, '2025-07-22 10:15:00', 'confirmado'),
(12, 42, 12, 10, 42, '2025-07-21 11:40:00', 'solucionado'),
(13, 43, 13, 11, 43, '2025-07-20 12:05:00', 'pendiente'),
(14, 44, 14, 12, 44, '2025-07-19 13:25:00', 'confirmado'),
(15, 45, 15, 13, 45, '2025-07-18 14:50:00', 'solucionado'),
(16, 46, 16, 14, 46, '2025-07-17 15:10:00', 'pendiente'),
(17, 47, 17, 15, 47, '2025-07-16 08:40:00', 'confirmado'),
(18, 48, 18, 16, 48, '2025-07-15 09:15:00', 'solucionado'),
(19, 49, 19, 17, 49, '2025-07-14 10:35:00', 'pendiente'),
(20, 50, 20, 18, 50, '2025-07-13 11:50:00', 'confirmado'),
(21, 51, 1, 19, 51, '2025-07-12 12:30:00', 'solucionado'),
(22, 52, 2, 20, 52, '2025-07-11 13:45:00', 'pendiente'),
(23, 53, 3, 1, 53, '2025-07-10 14:15:00', 'confirmado'),
(24, 54, 4, 2, 54, '2025-07-09 15:30:00', 'solucionado'),
(25, 55, 5, 3, 55, '2025-07-08 08:20:00', 'pendiente');

-- =========================================================
-- DATOS DE PRUEBA PARA REGLAS
-- =========================================================
INSERT INTO Regla (condicion, accion) VALUES
('SI el motor no enciende Y la batería está descargada', 'Falla: Batería descargada → Solución: Cargar batería'),
('SI el motor no arranca Y bujía dañada', 'Falla: Bujía dañada → Solución: Reemplazar bujía'),
('SI hay humo negro en el escape Y carburador obstruido', 'Falla: Carburador desajustado → Solución: Limpiar carburador'),
('SI el embrague patina Y discos de embrague gastados', 'Falla: Embrague desgastado → Solución: Reemplazar discos de embrague'),
('SI los frenos delanteros no responden Y pastillas de freno gastadas', 'Falla: Pastillas de freno gastadas → Solución: Cambiar pastillas'),
('SI la moto se va hacia un lado Y dirección desalineada', 'Falla: Dirección desalineada → Solución: Ajustar dirección'),
('SI la cadena hace ruido Y sin lubricación', 'Falla: Cadena floja → Solución: Lubricar cadena'),
('SI luces delanteras muy tenues Y batería con bajo voltaje', 'Falla: Batería descargada → Solución: Cargar batería'),
('SI la moto no arranca Y motor de arranque dañado', 'Falla: Motor de arranque dañado → Solución: Revisar/reemplazar motor de arranque'),
('SI el motor se sobrecalienta Y radiador con fugas', 'Falla: Sobrecalentamiento del motor → Solución: Reparar radiador'),
('SI el embrague no desacopla Y resorte roto', 'Falla: Embrague desgastado → Solución: Reemplazar resorte'),
('SI el freno delantero esponjoso Y fuga hidráulica', 'Falla: Freno delantero defectuoso → Solución: Revisar hidráulico y purgar'),
('SI la moto vibra en alta velocidad Y neumático deformado', 'Falla: Neumático desgastado → Solución: Reemplazar neumático'),
('SI el velocímetro no funciona Y sensor de velocidad dañado', 'Falla: Sistema eléctrico defectuoso → Solución: Revisar sensor de velocidad'),
('SI el motor se apaga al acelerar Y carburador sucio', 'Falla: Carburador desajustado → Solución: Limpiar y ajustar carburador'),
('SI hay humo blanco en escape Y junta de culata dañada', 'Falla: Junta de culata → Solución: Reemplazar junta de culata'),
('SI el motor tarda en arrancar Y batería baja', 'Falla: Batería descargada → Solución: Cargar batería'),
('SI intermitentes parpadean rápido Y fusibles quemados', 'Falla: Fusibles quemados → Solución: Reemplazar fusibles'),
('SI freno trasero pierde presión Y bomba defectuosa', 'Falla: Freno trasero → Solución: Reparar bomba de freno'),
('SI el motor hace ruidos extraños Y biela desgastada', 'Falla: Motor defectuoso → Solución: Revisar y reemplazar biela'),
('SI escape hace ruido Y perforado', 'Falla: Escape perforado → Solución: Reparar/reemplazar escape'),
('SI la moto pierde estabilidad Y suspensión dañada', 'Falla: Amortiguadores dañados → Solución: Reemplazar amortiguadores'),
('SI la moto no arranca Y combustible vacío', 'Falla: Sin combustible → Solución: Llenar tanque'),
('SI la cadena se suelta Y piñón trasero desgastado', 'Falla: Cadena floja → Solución: Ajustar o reemplazar piñón'),
('SI el motor arranca y se apaga Y filtro de aire obstruido', 'Falla: Filtro de aire → Solución: Limpiar o reemplazar filtro'),
('SI luces no encienden Y interruptor defectuoso', 'Falla: Sistema eléctrico → Solución: Revisar interruptor y conexiones'),
('SI freno delantero recalienta Y disco rayado', 'Falla: Disco de freno → Solución: Reemplazar disco'),
('SI horquilla hace tope al frenar Y retenes dañados', 'Falla: Suspensión delantera → Solución: Reemplazar retenes'),
('SI el manubrio vibra Y rodamientos desgastados', 'Falla: Dirección defectuosa → Solución: Cambiar rodamientos'),
('SI la moto derrapa Y neumáticos gastados', 'Falla: Neumáticos → Solución: Cambiar neumáticos'),
('SI escape se calienta demasiado Y silenciador obstruido', 'Falla: Escape defectuoso → Solución: Limpiar/reemplazar silenciador'),
('SI la moto se apaga Y inyector bloqueado', 'Falla: Inyector de combustible → Solución: Limpiar inyector'),
('SI hay olor a gasolina Y tanque corroído', 'Falla: Fugas de gasolina → Solución: Reparar o reemplazar tanque'),
('SI la moto no arranca Y alternador defectuoso', 'Falla: Alternador defectuoso → Solución: Reparar o reemplazar alternador'),
('SI la moto pierde potencia Y combustible de mala calidad', 'Falla: Mezcla incorrecta → Solución: Cambiar combustible'),
('SI la batería no carga Y regulador defectuoso', 'Falla: Sistema eléctrico → Solución: Reemplazar regulador'),
('SI el motor hace golpeteo Y pistón dañado', 'Falla: Motor defectuoso → Solución: Reparar pistón'),
('SI freno trasero hace ruido Y pastillas cristalizadas', 'Falla: Pastillas de freno → Solución: Cambiar pastillas'),
('SI la moto vibra en ralentí Y carburador gotea', 'Falla: Carburador desajustado → Solución: Ajustar y limpiar'),
('SI el radiador pierde líquido Y fuga manguera', 'Falla: Sistema refrigeración → Solución: Reemplazar manguera'),
('SI la moto se apaga Y combustible no llega', 'Falla: Bomba de gasolina → Solución: Revisar bomba de gasolina'),
('SI freno delantero no responde Y latiguillo obstruido', 'Falla: Freno delantero → Solución: Limpiar latiguillo y purgar'),
('SI luces traseras no funcionan Y cable cortado', 'Falla: Sistema eléctrico → Solución: Reparar cableado'),
('SI el motor se ahoga al acelerar Y carburador sucio', 'Falla: Carburador desajustado → Solución: Limpiar carburador'),
('SI la moto salta de marcha Y caja de cambios sin aceite', 'Falla: Caja de cambios → Solución: Añadir aceite'),
('SI suspensión trasera rebota Y amortiguadores sin presión', 'Falla: Amortiguadores → Solución: Cargar presión de gas'),
('SI el motor pierde aceite Y junta de culata dañada', 'Falla: Junta de culata → Solución: Reemplazar junta'),
('SI la moto se va hacia un lado Y neumático delantero desgastado', 'Falla: Neumático → Solución: Reemplazar neumático delantero'),
('SI intermitentes no funcionan Y fusible quemado', 'Falla: Fusible → Solución: Cambiar fusible'),
('SI escape presenta oxidación Y tubo perforado', 'Falla: Escape perforado → Solución: Reemplazar escape'),
('SI el manubrio se siente flojo Y rodamientos dañados', 'Falla: Dirección defectuosa → Solución: Cambiar rodamientos'),
('SI caballete central no sostiene Y estructura floja', 'Falla: Chasis → Solución: Ajustar tornillería y soldar puntos flojos'),
('SI la moto genera ruidos plásticos Y piezas sueltas', 'Falla: Chasis → Solución: Revisar y ajustar piezas plásticas');

-- =========================================================
-- RELACIONES COMPLETAS DE REGLAS (1-100)
-- =========================================================

-- BLOQUE 1 (1-20)
INSERT INTO Relacion_Regla (id_regla, id_sintoma, id_falla, id_solucion) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 4, 3, 3),
(4, 23, 8, 4),
(5, 62, 9, 5),
(6, 36, 12, 6),
(7, 24, 7, 7),
(8, 31, 1, 1),
(9, 8, 16, 8),
(10, 17, 6, 9),
(11, 25, 8, 4),
(12, 65, 11, 10),
(13, 45, 13, 11),
(14, 54, 17, 12),
(15, 16, 3, 3),
(16, 6, 10, 13),
(17, 12, 1, 1),
(18, 43, 15, 14),
(19, 66, 5, 15),
(20, 20, 6, 9);

-- BLOQUE 2 (21-40)
INSERT INTO Relacion_Regla (id_regla, id_sintoma, id_falla, id_solucion) VALUES
(21, 7, 3, 3),
(22, 11, 1, 1),
(23, 8, 16, 8),
(24, 14, 16, 8),
(25, 2, 4, 16),
(26, 29, 10, 17),
(27, 37, 11, 18),
(28, 40, 12, 19),
(29, 48, 20, 20),
(30, 19, 5, 21),
(31, 28, 7, 22),
(32, 21, 3, 3),
(33, 5, 1, 1),
(34, 15, 16, 8),
(35, 9, 3, 3),
(36, 27, 10, 17),
(37, 32, 11, 18),
(38, 39, 12, 19),
(39, 50, 20, 20),
(40, 13, 5, 21);

-- BLOQUE 3 (41-60)
INSERT INTO Relacion_Regla (id_regla, id_sintoma, id_falla, id_solucion) VALUES
(41, 44, 7, 22),
(42, 33, 8, 23),
(43, 18, 6, 9),
(44, 35, 3, 3),
(45, 22, 9, 24),
(46, 30, 12, 10),
(47, 41, 13, 25),
(48, 42, 14, 26),
(49, 46, 18, 27),
(50, 38, 15, 14),
(51, 3, 2, 2),
(52, 10, 4, 16),
(53, 5, 1, 1),
(1, 7, 3, 3),
(2, 9, 6, 9),
(3, 12, 7, 7),
(4, 15, 8, 4),
(5, 20, 10, 17),
(6, 23, 11, 18),
(7, 25, 12, 19);

-- BLOQUE 4 (61-80)
INSERT INTO Relacion_Regla (id_regla, id_sintoma, id_falla, id_solucion) VALUES
(8, 28, 13, 11),
(9, 31, 14, 12),
(10, 34, 15, 14),
(11, 37, 16, 8),
(12, 40, 17, 12),
(13, 43, 18, 10),
(14, 46, 19, 20),
(15, 49, 20, 20),
(16, 2, 1, 1),
(17, 4, 2, 2),
(18, 6, 3, 3),
(19, 8, 4, 16),
(20, 10, 5, 21),
(21, 12, 6, 9),
(22, 14, 7, 7),
(23, 16, 8, 4),
(24, 18, 9, 24),
(25, 20, 10, 17),
(26, 22, 11, 18),
(27, 24, 12, 19);

-- BLOQUE 5 (81-100)
INSERT INTO Relacion_Regla (id_regla, id_sintoma, id_falla, id_solucion) VALUES
(28, 26, 13, 11),
(29, 28, 14, 12),
(30, 30, 15, 14),
(31, 32, 16, 8),
(32, 34, 17, 12),
(33, 36, 18, 10),
(34, 38, 19, 20),
(35, 40, 20, 20),
(36, 1, 1, 1),
(37, 3, 2, 2),
(38, 5, 3, 3),
(39, 7, 4, 16),
(40, 9, 5, 21),
(41, 11, 6, 9),
(42, 13, 7, 7),
(43, 15, 8, 4),
(44, 17, 9, 24),
(45, 19, 10, 17),
(46, 21, 11, 18),
(47, 23, 12, 19);

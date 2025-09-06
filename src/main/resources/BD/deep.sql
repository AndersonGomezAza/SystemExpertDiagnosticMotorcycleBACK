-- =========================================================
-- DATOS DE PRUEBA PARA TABLA: Rol
-- =========================================================
INSERT INTO Rol (nombre, descripcion) VALUES
('Admin', 'Usuario con privilegios completos, puede gestionar roles, usuarios y reglas del sistema experto'),
('Mecánico', 'Encargado de diagnosticar y registrar fallas, causas y soluciones en las motos'),
('Cliente', 'Usuario que reporta síntomas o problemas en su motocicleta');

-- =========================================================
-- DATOS DE PRUEBA PARA TABLA: Usuario
-- =========================================================

INSERT INTO Usuario (nombre_usuario, email, password_hash, telefono, direccion) VALUES
-- Admins
('carlos', 'carlos.admin@example.com', '$2a$10$9Dg6XbEDp3G8Qy7XvsgX9uVYf0SiyR8Mbqp6NbhX9qOEzT9lsd6Uq', '3001234567', 'Cra 10 #25-30, Bogotá'),
('laura', 'laura.admin@example.com', '$2a$10$6sYzKnD5kpld9o9bbqEnEuhGGLgAibdWWJ8K9gMFX2i4dcpt0KX8a', '3109876543', 'Cl 45 #12-50, Medellín'),

-- Mecánicos
('juan', 'juan.mecanico@example.com', '$2a$10$d4QnQjVJ2FkBJS.4pUDoN..DckxEx6hMUPI1eB2CNVZ7V9o2MzLPa', '3125554433', 'Cl 20 #15-10, Cali'),
('sandra', 'sandra.mecanico@example.com', '$2a$10$zT9Up39Q9yLyb3gYBpXhEOBtwk0oK0DQqQMuIouAKDJKhYECWB1vK', '3004442211', 'Cra 30 #40-22, Barranquilla'),

-- Clientes
('andres', 'andres.perez@example.com', '$2a$10$clientehash1', '3011234567', 'Cra 15 #20-33, Bogotá'),
('maria', 'maria.gomez@example.com', '$2a$10$clientehash2', '3029876543', 'Cl 50 #30-45, Medellín'),
('jose', 'jose.rodriguez@example.com', '$2a$10$clientehash3', '3201122334', 'Cra 18 #5-21, Cali'),
('angela', 'angela.martinez@example.com', '$2a$10$clientehash4', '3214455667', 'Cl 70 #44-32, Bucaramanga'),
('diego', 'diego.suarez@example.com', '$2a$10$clientehash5', '3152233445', 'Cra 22 #33-10, Bogotá'),
('paola', 'paola.ramirez@example.com', '$2a$10$clientehash6', '3008765432', 'Cl 14 #12-60, Cali'),
('esteban', 'esteban.castillo@example.com', '$2a$10$clientehash7', '3113344556', 'Cra 5 #40-80, Medellín'),
('silvia', 'silvia.fernandez@example.com', '$2a$10$clientehash8', '3181122334', 'Cl 100 #20-22, Bogotá'),
('oscar', 'oscar.rios@example.com', '$2a$10$clientehash9', '3175566778', 'Cra 8 #9-44, Barranquilla'),
('adriana', 'adriana.mendoza@example.com', '$2a$10$clientehash10', '3126677889', 'Cl 55 #17-21, Cartagena'),
('julian', 'julian.torres@example.com', '$2a$10$clientehash11', '3191239876', 'Cra 40 #50-10, Bogotá'),
('veronica', 'veronica.lopez@example.com', '$2a$10$clientehash12', '3144455667', 'Cl 11 #8-22, Cali'),
('felipe', 'felipe.ariza@example.com', '$2a$10$clientehash13', '3169988776', 'Cra 21 #30-70, Medellín'),
('carolina', 'carolina.moreno@example.com', '$2a$10$clientehash14', '3206677885', 'Cl 14 #44-60, Bogotá'),
('miguel', 'miguel.santos@example.com', '$2a$10$clientehash15', '3015566777', 'Cra 12 #17-33, Cali'),
('johana', 'johana.vargas@example.com', '$2a$10$clientehash16', '3027788990', 'Cl 33 #21-88, Medellín'),
('ricardo', 'ricardo.marin@example.com', '$2a$10$clientehash17', '3103344552', 'Cra 90 #70-50, Barranquilla'),
('valentina', 'valentina.ospina@example.com', '$2a$10$clientehash18', '3225566774', 'Cl 77 #12-44, Bogotá'),
('sergio', 'sergio.herrera@example.com', '$2a$10$clientehash19', '3119988774', 'Cra 60 #22-30, Cartagena'),
('monica', 'monica.palacios@example.com', '$2a$10$clientehash20', '3156677882', 'Cl 40 #15-10, Cali'),
('daniel', 'daniel.cortes@example.com', '$2a$10$clientehash21', '3131122334', 'Cra 14 #44-50, Medellín'),
('luisa', 'luisa.peña@example.com', '$2a$10$clientehash22', '3174455661', 'Cl 11 #50-60, Bogotá'),
('cristian', 'cristian.guzman@example.com', '$2a$10$clientehash23', '3002211334', 'Cra 33 #21-40, Cali'),
('diana', 'diana.rivera@example.com', '$2a$10$clientehash24', '3129988771', 'Cl 20 #5-12, Bucaramanga'),
('nicolas', 'nicolas.leon@example.com', '$2a$10$clientehash25', '3215566771', 'Cra 12 #60-40, Bogotá'),
('isabel', 'isabel.restrepo@example.com', '$2a$10$clientehash26', '3103344558', 'Cl 33 #70-12, Cali'),
('hugo', 'hugo.vera@example.com', '$2a$10$clientehash27', '3196677881', 'Cra 88 #11-33, Medellín'),
('sandra', 'sandra.cardenas@example.com', '$2a$10$clientehash28', '3024455663', 'Cl 50 #30-22, Bogotá'),
('pedro', 'pedro.salazar@example.com', '$2a$10$clientehash29', '3161122336', 'Cra 5 #77-50, Barranquilla'),
('yolanda', 'yolanda.morales@example.com', '$2a$10$clientehash30', '3187788991', 'Cl 20 #15-80, Cali'),
('jorge', 'jorge.castro@example.com', '$2a$10$clientehash31', '3145566778', 'Cra 12 #33-10, Bogotá'),
('lina', 'lina.murillo@example.com', '$2a$10$clientehash32', '3152233448', 'Cl 66 #10-90, Medellín'),
('osvaldo', 'osvaldo.niño@example.com', '$2a$10$clientehash33', '3171122336', 'Cra 88 #21-12, Cali'),
('patricia', 'patricia.beltran@example.com', '$2a$10$clientehash34', '3196677880', 'Cl 15 #44-22, Bogotá'),
('camilo', 'camilo.gallego@example.com', '$2a$10$clientehash35', '3013344557', 'Cra 10 #33-50, Cartagena'),
('melisa', 'melisa.forero@example.com', '$2a$10$clientehash36', '3125566778', 'Cl 40 #20-88, Bucaramanga'),
('roberto', 'roberto.villalba@example.com', '$2a$10$clientehash37', '3107788993', 'Cra 77 #50-33, Bogotá'),
('natalia', 'natalia.briceno@example.com', '$2a$10$clientehash38', '3202233446', 'Cl 88 #60-21, Cali'),
('edwin', 'edwin.cuellar@example.com', '$2a$10$clientehash39', '3224455664', 'Cra 15 #20-60, Medellín'),
('fabiola', 'fabiola.perez@example.com', '$2a$10$clientehash40', '3199988773', 'Cl 99 #12-33, Barranquilla'),
('andrea', 'andrea.hoyos@example.com', '$2a$10$clientehash41', '3181122337', 'Cra 30 #77-22, Bogotá'),
('tomas', 'tomas.lizcano@example.com', '$2a$10$clientehash42', '3166677884', 'Cl 55 #90-33, Cali'),
('karla', 'karla.cardenas@example.com', '$2a$10$clientehash43', '3151122335', 'Cra 60 #14-22, Medellín'),
('german', 'german.mejia@example.com', '$2a$10$clientehash44', '3174455662', 'Cl 44 #77-10, Bogotá'),
('susana', 'susana.rojas@example.com', '$2a$10$clientehash45', '3017788994', 'Cra 40 #88-22, Cali'),
('alex', 'alex.hurtado@example.com', '$2a$10$clientehash46', '3122233445', 'Cl 20 #66-11, Medellín'),
('marina', 'marina.acevedo@example.com', '$2a$10$clientehash47', '3149988775', 'Cra 22 #14-55, Bogotá'),
('cesar', 'cesar.quintero@example.com', '$2a$10$clientehash48', '3207788996', 'Cl 99 #22-70, Cartagena');

-- =========================================================
-- TABLA INTERMEDIA ENTRE Usuario Y Roles 
-- =========================================================
INSERT INTO Usuario_Rol (id_usuario, id_rol) VALUES
(1, 1),
(2, 1),

-- Mecánicos
(3, 2),
(4, 2),

-- Clientes
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3);

-- =========================================================
-- DATOS DE PRUEBA PARA TABLA: Motocicleta
-- =========================================================

INSERT INTO Motocicleta (marca, modelo, anio, cilindraje, tipo_motor, combustible, placa, color, id_usuario) VALUES
('Yamaha', 'FZ25', 2021, '250cc', '4T', 'gasolina', 'ABC123', 'Negro', 5),
('Honda', 'CB190R', 2020, '190cc', '4T', 'gasolina', 'BCD234', 'Rojo', 6),
('Suzuki', 'Gixxer 250', 2022, '250cc', '4T', 'gasolina', 'CDE345', 'Azul', 7),
('Bajaj', 'Pulsar NS200', 2021, '200cc', '4T', 'gasolina', 'DEF456', 'Gris', 8),
('AKT', 'NKD 125', 2019, '125cc', '4T', 'gasolina', 'EFG567', 'Blanco', 9),
('Yamaha', 'XMAX 300', 2021, '300cc', '4T', 'gasolina', 'FGH678', 'Negro', 10),
('KTM', 'Duke 390', 2022, '390cc', '4T', 'gasolina', 'GHI789', 'Naranja', 11),
('Honda', 'XR150L', 2020, '150cc', '4T', 'gasolina', 'HIJ890', 'Rojo', 12),
('Suzuki', 'V-Strom 650', 2021, '650cc', '4T', 'gasolina', 'IJK901', 'Amarillo', 13),
('Bajaj', 'Dominar 400', 2022, '400cc', '4T', 'gasolina', 'JKL012', 'Verde', 14),
('Yamaha', 'R3', 2019, '321cc', '4T', 'gasolina', 'KLM123', 'Azul', 15),
('Honda', 'CB500X', 2021, '500cc', '4T', 'gasolina', 'LMN234', 'Negro', 16),
('Suzuki', 'GN125', 2018, '125cc', '4T', 'gasolina', 'MNO345', 'Plata', 17),
('Bajaj', 'Discover 150', 2019, '150cc', '4T', 'gasolina', 'NOP456', 'Rojo', 18),
('Kawasaki', 'Z650', 2022, '650cc', '4T', 'gasolina', 'OPQ567', 'Verde', 19),
('AKT', 'Dynamic 125', 2020, '125cc', '2T', 'gasolina', 'PQR678', 'Amarillo', 20),
('Honda', 'CBR500R', 2021, '500cc', '4T', 'gasolina', 'QRS789', 'Blanco', 21),
('Yamaha', 'NMAX 155', 2019, '155cc', '4T', 'gasolina', 'RST890', 'Negro', 22),
('KTM', 'Adventure 390', 2022, '390cc', '4T', 'gasolina', 'STU901', 'Naranja', 23),
('Suzuki', 'Burgman 200', 2021, '200cc', '4T', 'gasolina', 'TUV012', 'Gris', 24),
('Honda', 'CB110', 2018, '110cc', '4T', 'gasolina', 'UVW123', 'Rojo', 25),
('Bajaj', 'Boxer CT100', 2020, '100cc', '4T', 'gasolina', 'VWX234', 'Negro', 26),
('Yamaha', 'Crypton 110', 2019, '110cc', '4T', 'gasolina', 'WXY345', 'Azul', 27),
('Honda', 'PCX 150', 2021, '150cc', '4T', 'híbrida', 'XYZ456', 'Gris', 28),
('Kawasaki', 'Ninja 400', 2022, '400cc', '4T', 'gasolina', 'YZA567', 'Verde', 29),
('Suzuki', 'AX4 125', 2018, '125cc', '4T', 'gasolina', 'ZAB678', 'Negro', 30),
('AKT', 'TTR 200', 2020, '200cc', '4T', 'gasolina', 'ABC789', 'Rojo', 31),
('Honda', 'XR190L', 2021, '190cc', '4T', 'gasolina', 'BCD890', 'Blanco', 32),
('Yamaha', 'MT-03', 2022, '321cc', '4T', 'gasolina', 'CDE901', 'Negro', 33),
('Bajaj', 'Avenger 220', 2019, '220cc', '4T', 'gasolina', 'DEF012', 'Azul', 34),
('KTM', 'RC 200', 2020, '200cc', '4T', 'gasolina', 'EFG123', 'Naranja', 35),
('Honda', 'Wave 110', 2018, '110cc', '4T', 'gasolina', 'FGH234', 'Plata', 36),
('Suzuki', 'GSX250R', 2021, '250cc', '4T', 'gasolina', 'GHI345', 'Azul', 37),
('AKT', 'NKD 150', 2019, '150cc', '4T', 'gasolina', 'HIJ456', 'Rojo', 38),
('Bajaj', 'Pulsar RS200', 2021, '200cc', '4T', 'gasolina', 'IJK567', 'Amarillo', 39),
('Yamaha', 'Tracer 700', 2022, '700cc', '4T', 'gasolina', 'JKL678', 'Negro', 40),
('Honda', 'Forza 300', 2019, '300cc', '4T', 'gasolina', 'KLM789', 'Blanco', 41),
('Suzuki', 'Hayabusa', 2021, '1340cc', '4T', 'gasolina', 'LMN890', 'Negro', 42),
('Kawasaki', 'Versys 650', 2020, '650cc', '4T', 'gasolina', 'MNO901', 'Verde', 43),
('AKT', 'Special 110', 2018, '110cc', '2T', 'gasolina', 'NOP012', 'Rojo', 44),
('Honda', 'Elite 125', 2019, '125cc', '4T', 'eléctrica', 'OPQ123', 'Gris', 45),
('Yamaha', 'Aerox 155', 2021, '155cc', '4T', 'gasolina', 'PQR234', 'Azul', 46),
('Suzuki', 'Access 125', 2020, '125cc', '4T', 'gasolina', 'QRS345', 'Rojo', 47),
('Bajaj', 'Platina 100', 2019, '100cc', '4T', 'gasolina', 'RST456', 'Negro', 48),
('Honda', 'Monkey 125', 2022, '125cc', '4T', 'gasolina', 'STU567', 'Amarillo', 49),
('Kawasaki', 'Z900', 2021, '948cc', '4T', 'gasolina', 'TUV678', 'Verde', 50);

-- =========================================================
-- DATOS DE PRUEBA PARA TABLA: Sintoma
-- =========================================================

INSERT INTO Sintoma (descripcion, categoria) VALUES
-- MOTOR
('La moto pierde potencia al acelerar', 'motor'),
('Humo negro en el escape', 'motor'),
('Humo blanco constante', 'motor'),
('Consumo excesivo de aceite', 'motor'),
('Golpeteo metálico al encender', 'motor'),
('Vibraciones inusuales en ralentí', 'motor'),
('La moto se apaga al detenerse', 'motor'),
('Fugas de aceite en el motor', 'motor'),
('Ralentí inestable', 'motor'),
('Sobrecalentamiento frecuente', 'motor'),

-- ELÉCTRICO
('La moto no enciende con el botón de arranque', 'eléctrico'),
('La batería se descarga rápidamente', 'eléctrico'),
('Las luces delanteras parpadean', 'eléctrico'),
('El tablero digital no enciende', 'eléctrico'),
('Fusibles se queman con frecuencia', 'eléctrico'),
('Claxon no funciona', 'eléctrico'),
('Direccionales no encienden', 'eléctrico'),
('Faro principal muy tenue', 'eléctrico'),
('Interruptor de encendido defectuoso', 'eléctrico'),
('El motor de arranque no responde', 'eléctrico'),

-- FRENOS
('El freno delantero hace ruido al frenar', 'frenos'),
('El freno trasero se siente esponjoso', 'frenos'),
('Pastillas de freno desgastadas', 'frenos'),
('Pérdida de líquido de frenos', 'frenos'),
('La moto se desliza al frenar', 'frenos'),
('El freno delantero se bloquea', 'frenos'),
('Palanca de freno muy dura', 'frenos'),
('El recorrido del freno es excesivo', 'frenos'),
('El freno trasero no responde bien', 'frenos'),
('Vibración en la rueda al frenar', 'frenos'),

-- TRANSMISIÓN
('La cadena hace ruido al rodar', 'transmisión'),
('Dificultad para cambiar de marcha', 'transmisión'),
('El embrague patina', 'transmisión'),
('Desgaste excesivo en los piñones', 'transmisión'),
('Golpe al meter primera marcha', 'transmisión'),
('La palanca de cambios se traba', 'transmisión'),

-- SUSPENSIÓN
('La suspensión delantera se hunde demasiado', 'suspensión'),
('Pérdida de aceite en los amortiguadores', 'suspensión'),
('La moto rebota demasiado en baches', 'suspensión'),
('Sonido metálico en la suspensión trasera', 'suspensión'),

-- LLANTAS
('Desgaste irregular en la llanta delantera', 'llantas'),
('La llanta trasera pierde aire rápidamente', 'llantas'),
('Vibraciones al superar 80 km/h', 'llantas'),
('Pinchazos frecuentes en la rueda trasera', 'llantas'),

-- ESCAPE
('Escape suena más fuerte de lo normal', 'escape'),
('Olor a gasolina cruda en el escape', 'escape'),
('El silenciador presenta fugas', 'escape'),

-- GENERAL
('La moto se apaga repentinamente en marcha', 'general'),
('Consumo de combustible más alto de lo normal', 'general'),
('La moto tarda en encender en frío', 'general'),
('Ruidos extraños al girar el manillar', 'general'),
('La moto pierde estabilidad en curvas', 'general');

-- =========================================================
-- DATOS DE PRUEBA PARA TABLA: Falla
-- =========================================================

INSERT INTO Falla (nombre, descripcion, nivel_gravedad) VALUES
-- MOTOR
('Bujía defectuosa', 'La bujía no genera chispa adecuada para la combustión', 'Medio'),
('Falla en carburador', 'El carburador está obstruido o desajustado', 'Medio'),
('Sobrecalentamiento del motor', 'Temperatura excesiva que puede dañar componentes internos', 'Alto'),
('Pistón dañado', 'Desgaste o rotura del pistón que reduce la compresión', 'Crítico'),
('Fuga de aceite', 'Pérdida de lubricante por juntas o sellos defectuosos', 'Medio'),
('Ralentí inestable', 'El motor no mantiene las revoluciones mínimas', 'Bajo'),
('Cadena de distribución desgastada', 'Genera ruidos y riesgo de rotura', 'Crítico'),
('Filtro de aire obstruido', 'Reduce el flujo de aire y el rendimiento del motor', 'Bajo'),
('Falla en válvulas', 'Mal ajuste o daño en válvulas de admisión/escape', 'Alto'),
('Junta de culata dañada', 'Provoca fugas de compresión y sobrecalentamiento', 'Crítico'),

-- ELÉCTRICO
('Batería descargada', 'La batería no retiene carga suficiente', 'Medio'),
('Alternador defectuoso', 'No carga correctamente la batería en marcha', 'Alto'),
('Regulador de voltaje dañado', 'Provoca sobrecarga eléctrica o bajo voltaje', 'Alto'),
('Cables sueltos o corroídos', 'Generan falsos contactos y fallos intermitentes', 'Bajo'),
('Fusible quemado', 'Protección eléctrica interrumpida en el sistema', 'Bajo'),
('Motor de arranque defectuoso', 'El motor no enciende al girar la llave', 'Alto'),
('Corto circuito en luces', 'Provoca apagado total de la iluminación', 'Medio'),
('Interruptor de encendido dañado', 'Impide el arranque eléctrico de la moto', 'Medio'),
('Sensor de temperatura defectuoso', 'Registra valores erróneos que afectan la ECU', 'Bajo'),
('Fallo en CDI/ECU', 'Unidad de control electrónico dañada', 'Crítico'),

-- FRENOS
('Pastillas de freno desgastadas', 'Generan ruido y pérdida de eficiencia', 'Medio'),
('Disco de freno deformado', 'Produce vibración y reduce la frenada', 'Alto'),
('Pérdida de líquido de frenos', 'Reduce la presión hidráulica de frenado', 'Crítico'),
('Caliper atascado', 'Reduce el movimiento de las pastillas de freno', 'Alto'),
('Bomba de freno defectuosa', 'No genera presión suficiente en el sistema', 'Crítico'),
('Freno trasero desajustado', 'Menor capacidad de frenada en la rueda trasera', 'Bajo'),
('Cable de freno roto', 'Impide la transmisión de fuerza en frenos mecánicos', 'Alto'),
('ABS defectuoso', 'El sistema antibloqueo no funciona correctamente', 'Crítico'),
('Disco rayado', 'Reduce eficiencia de frenado y aumenta desgaste', 'Medio'),
('Palanca de freno floja', 'Afecta la respuesta del frenado', 'Bajo'),

-- TRANSMISIÓN
('Cadena floja o desgastada', 'Provoca ruidos y riesgo de ruptura', 'Alto'),
('Piñón desgastado', 'Transmisión ineficiente de la fuerza', 'Medio'),
('Embrague patinando', 'No transfiere la potencia correctamente', 'Alto'),
('Caja de cambios defectuosa', 'Dificulta el cambio de marchas', 'Crítico'),
('Palanca de cambios dañada', 'Impide realizar cambios de marcha', 'Medio'),
('Rodamientos de transmisión dañados', 'Provocan ruidos y vibraciones', 'Alto'),

-- SUSPENSIÓN
('Amortiguador trasero con fuga', 'Pérdida de aceite hidráulico en la suspensión', 'Alto'),
('Horquilla delantera dañada', 'Pérdida de estabilidad y control en la conducción', 'Crítico'),
('Resorte de suspensión vencido', 'Reduce la capacidad de absorción de impactos', 'Medio'),
('Soporte de suspensión roto', 'Riesgo de pérdida de control total', 'Crítico'),

-- LLANTAS
('Llanta desgastada', 'Menor adherencia y riesgo de accidente', 'Alto'),
('Llanta con pinchazo', 'Pérdida de aire inmediata o lenta', 'Medio'),
('Desgaste irregular de llantas', 'Afecta la estabilidad en curvas', 'Medio'),
('Llanta cristalizada', 'Pierde elasticidad y agarre', 'Bajo'),

-- ESCAPE
('Escape roto', 'Genera ruido excesivo y pérdida de potencia', 'Medio'),
('Fuga en múltiple de escape', 'Provoca pérdida de compresión', 'Alto'),
('Silenciador suelto', 'Genera vibraciones y ruido metálico', 'Bajo'),

-- GENERAL
('Pérdida de estabilidad en curva', 'Moto se siente inestable al inclinarse', 'Alto'),
('Consumo excesivo de combustible', 'El motor gasta más gasolina de lo normal', 'Medio'),
('Apagado repentino en marcha', 'El motor se apaga sin previo aviso', 'Crítico'),
('Ruidos extraños en dirección', 'Sonidos metálicos al girar el manubrio', 'Medio');

-- =========================================================
-- DATOS DE PRUEBA PARA TABLA: Causa
-- =========================================================

INSERT INTO Causa (descripcion) VALUES
('Bujía en mal estado o desgastada'),
('Filtro de aire obstruido por suciedad'),
('Carburador desajustado o sucio'),
('Aceite de motor degradado'),
('Nivel de aceite bajo'),
('Juntas del motor deterioradas'),
('Sobrecalentamiento por falta de refrigerante'),
('Pistón rayado o con desgaste excesivo'),
('Cadena de distribución floja o rota'),
('Válvulas mal calibradas'),
('Batería descargada o dañada'),
('Alternador defectuoso'),
('Regulador de voltaje en mal estado'),
('Fusibles quemados'),
('Conexiones eléctricas sulfatadas o sueltas'),
('Motor de arranque defectuoso'),
('Interruptor de encendido dañado'),
('Sensor de temperatura averiado'),
('CDI/ECU con fallo interno'),
('Cableado en corto circuito'),
('Pastillas de freno desgastadas'),
('Disco de freno rayado o deformado'),
('Bomba de freno sin presión'),
('Fugas en el sistema de frenos'),
('Caliper atascado por falta de lubricación'),
('Nivel bajo de líquido de frenos'),
('Sistema ABS defectuoso'),
('Llanta desgastada o cristalizada'),
('Llanta con baja presión de aire'),
('Pinchazo por clavo u objeto cortante'),
('Desgaste irregular por mala alineación'),
('Amortiguador trasero con fuga de aceite'),
('Horquilla delantera dañada'),
('Resorte de suspensión vencido'),
('Soportes de suspensión agrietados'),
('Cadena floja o sin lubricación'),
('Piñones desgastados'),
('Embrague con discos dañados'),
('Caja de cambios con engranajes rotos'),
('Palanca de cambios desajustada'),
('Rodamientos de transmisión en mal estado'),
('Escape roto o silenciador suelto'),
('Fugas en múltiple de escape'),
('Combustible contaminado'),
('Carburante de baja calidad'),
('Mantenimiento deficiente'),
('Uso excesivo de la motocicleta sin revisiones'),
('Exposición prolongada a la intemperie'),
('Manipulación inadecuada del conductor');

-- =========================================================
-- DATOS DE PRUEBA PARA TABLA: Solucion
-- =========================================================

INSERT INTO Solucion (descripcion, tiempo_estimado, costo_estimado) VALUES
('Reemplazo de bujía', '30 minutos', 35000.00),
('Limpieza o cambio de filtro de aire', '20 minutos', 25000.00),
('Ajuste y limpieza de carburador', '1 hora', 80000.00),
('Cambio de aceite y filtro', '40 minutos', 70000.00),
('Reemplazo de juntas del motor', '3 horas', 250000.00),
('Reparación de pistón y cilindro', '5 horas', 600000.00),
('Ajuste de válvulas', '2 horas', 150000.00),
('Cambio de cadena de distribución', '4 horas', 500000.00),
('Recarga o reemplazo de batería', '30 minutos', 150000.00),
('Cambio de alternador', '2 horas', 400000.00),
('Reemplazo de regulador de voltaje', '1 hora', 180000.00),
('Cambio de fusibles eléctricos', '15 minutos', 10000.00),
('Reparación de conexiones eléctricas', '1 hora', 60000.00),
('Cambio de motor de arranque', '2 horas', 350000.00),
('Reemplazo de interruptor de encendido', '40 minutos', 120000.00),
('Cambio de sensor de temperatura', '30 minutos', 80000.00),
('Reparación o cambio de ECU/CDI', '3 horas', 700000.00),
('Reemplazo de pastillas de freno', '45 minutos', 90000.00),
('Rectificación o cambio de disco de freno', '2 horas', 250000.00),
('Cambio de bomba de freno', '1.5 horas', 200000.00),
('Purgado y relleno de líquido de frenos', '40 minutos', 60000.00),
('Lubricación y ajuste de caliper', '1 hora', 70000.00),
('Reparación de sistema ABS', '3 horas', 550000.00),
('Cambio de llanta delantera', '30 minutos', 180000.00),
('Cambio de llanta trasera', '40 minutos', 200000.00),
('Parche o reparación de pinchazo', '20 minutos', 20000.00),
('Alineación de llantas', '1 hora', 70000.00),
('Cambio de amortiguador trasero', '1.5 horas', 250000.00),
('Reemplazo de retenedores de horquilla', '2 horas', 220000.00),
('Cambio de resortes de suspensión', '1 hora', 150000.00),
('Soldadura o cambio de soporte de suspensión', '2 horas', 180000.00),
('Lubricación y ajuste de cadena', '20 minutos', 30000.00),
('Reemplazo de kit de arrastre (cadena y piñones)', '1.5 horas', 280000.00),
('Cambio de discos de embrague', '2 horas', 350000.00),
('Reparación de caja de cambios', '5 horas', 800000.00),
('Ajuste de palanca de cambios', '30 minutos', 40000.00),
('Cambio de rodamientos de transmisión', '3 horas', 400000.00),
('Reparación de escape o silenciador', '1 hora', 120000.00),
('Cambio de múltiple de escape', '2 horas', 300000.00),
('Drenado de tanque y reemplazo de combustible', '1 hora', 60000.00),
('Uso de aditivo limpiador de inyectores', '30 minutos', 40000.00),
('Servicio de mantenimiento general', '2 horas', 150000.00),
('Cambio de aceite de suspensión', '1.5 horas', 180000.00),
('Revisión y apriete de tornillería', '30 minutos', 20000.00),
('Reparación de cableado eléctrico', '2 horas', 100000.00),
('Revisión de sistema de carga eléctrica', '1.5 horas', 90000.00),
('Balanceo de llantas', '40 minutos', 50000.00),
('Cambio de bujes en suspensión', '1.5 horas', 120000.00),
('Revisión de dirección y ajuste de rodamientos', '1 hora', 110000.00),
('Diagnóstico electrónico completo', '1 hora', 130000.00);

-- =========================================================
-- DATOS REALISTAS PARA TABLA: Diagnostico
-- =========================================================

INSERT INTO Diagnostico (id_moto, estado) VALUES
(1, 'pendiente'),    -- 1
(2, 'confirmado'),   -- 2
(3, 'solucionado'),  -- 3
(4, 'pendiente'),    -- 4
(5, 'confirmado'),   -- 5
(6, 'solucionado'),  -- 6
(7, 'pendiente'),    -- 7
(8, 'confirmado'),   -- 8
(9, 'solucionado'),  -- 9
(10, 'pendiente'),   -- 10
(11, 'confirmado'),  -- 11
(12, 'solucionado'), -- 12
(13, 'pendiente'),   -- 13
(14, 'confirmado'),  -- 14
(15, 'solucionado'), -- 15
(16, 'pendiente'),   -- 16
(17, 'confirmado'),  -- 17
(18, 'solucionado'), -- 18
(19, 'pendiente'),   -- 19
(20, 'confirmado');  -- 20

-- =========================================================
-- DATOS DE PRUEBA PARA TABLAS INTERMEDIAS
-- =========================================================

INSERT INTO Diagnostico_Sintoma (id_diagnostico,id_sintoma) VALUES
(1, 1), (2, 1), (3, 1),   -- Moto no arranca
(4, 5), (5, 5), (6, 5),   -- Motor pierde potencia
(7, 8), (8, 8), (9, 8),   -- Moto se apaga en marcha
(10, 15), (11, 15), (12, 15), -- Frenos no responden
(13, 20), (14, 20), (15, 20), -- Vibraciones
(16, 25), (17, 25), (18, 25), -- Ruidos en motor
(19, 30), (20, 30);           -- Dirección inestable

INSERT INTO Diagnostico_Falla (id_diagnostico,id_Falla) VALUES
(1, 1), (2, 2), (3, 3),
(4, 4), (5, 5), (6, 6),
(7, 7), (8, 8), (9, 9),
(10, 10), (11, 11), (12, 12),
(13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18),
(19, 19), (20, 20);

INSERT INTO Diagnostico_Causa (id_diagnostico,id_Causa) VALUES
(1, 1), (2, 3), (3, 11),
(4, 2), (5, 5), (6, 8),
(7, 14), (8, 13), (9, 19),
(10, 21), (11, 24), (12, 26),
(13, 28), (14, 31), (15, 37),
(16, 10), (17, 9), (18, 43),
(19, 34), (20, 41);

INSERT INTO Diagnostico_Solucion (id_diagnostico,id_Solucion) VALUES
(1, 1), (2, 3), (3, 9),
(4, 2), (5, 4), (6, 6),
(7, 12), (8, 11), (9, 17),
(10, 18), (11, 20), (12, 23),
(13, 24), (14, 27), (15, 32),
(16, 7), (17, 8), (18, 40),
(19, 30), (20, 36);

-- =========================================================
-- DATOS DE PRUEBA PARA TABLA: Regla
-- =========================================================

INSERT INTO Regla (condicion, accion) VALUES
-- Encendido
('SI la moto no enciende Y la bujía está dañada', 'Falla: Sistema de encendido → Solución: Reemplazar bujía'),
('SI la moto no enciende Y la batería no tiene carga', 'Falla: Sistema eléctrico → Solución: Recargar o cambiar batería'),
('SI la moto no enciende Y el carburador está sucio', 'Falla: Alimentación de combustible → Solución: Limpieza de carburador'),

-- Pérdida de potencia
('SI el motor pierde potencia Y el filtro de aire está obstruido', 'Falla: Admisión deficiente → Solución: Cambiar o limpiar filtro de aire'),
('SI el motor pierde potencia Y el nivel de aceite está bajo', 'Falla: Lubricación insuficiente → Solución: Cambio de aceite y filtro'),
('SI el motor pierde potencia Y el pistón está desgastado', 'Falla: Compresión baja → Solución: Reparación de pistón y cilindro'),

-- Moto se apaga en marcha
('SI la moto se apaga en marcha Y el fusible está quemado', 'Falla: Sistema eléctrico → Solución: Reemplazo de fusibles'),
('SI la moto se apaga en marcha Y el regulador de voltaje falla', 'Falla: Sobrecarga eléctrica → Solución: Cambiar regulador de voltaje'),
('SI la moto se apaga en marcha Y la ECU está dañada', 'Falla: Control electrónico → Solución: Reemplazo de ECU'),

-- Frenos
('SI los frenos no responden Y las pastillas están desgastadas', 'Falla: Sistema de frenos → Solución: Cambio de pastillas de freno'),
('SI los frenos no responden Y hay fuga de líquido', 'Falla: Sistema hidráulico → Solución: Reparar fugas y purgar sistema'),
('SI los frenos no responden Y el ABS falla', 'Falla: Sistema ABS → Solución: Reparar o reemplazar ABS'),

-- Vibraciones
('SI la moto vibra mucho Y la llanta está desinflada', 'Falla: Neumático dañado → Solución: Inflar o cambiar llanta'),
('SI la moto vibra mucho Y la cadena está floja', 'Falla: Transmisión secundaria → Solución: Ajustar o cambiar kit de arrastre'),
('SI la moto vibra mucho Y las llantas están desalineadas', 'Falla: Alineación defectuosa → Solución: Alinear neumáticos'),

-- Ruidos extraños
('SI el motor hace ruido metálico Y las válvulas están desajustadas', 'Falla: Tren de válvulas → Solución: Ajuste de válvulas'),
('SI el motor hace ruido metálico Y la cadena de distribución está floja', 'Falla: Distribución → Solución: Cambiar cadena de distribución'),
('SI el motor hace ruido de escape Y el múltiple está roto', 'Falla: Sistema de escape → Solución: Reemplazo de múltiple de escape'),

-- Dirección y suspensión
('SI la dirección es inestable Y el resorte de suspensión está vencido', 'Falla: Suspensión delantera → Solución: Cambiar resortes'),
('SI la dirección es inestable Y los rodamientos están dañados', 'Falla: Dirección → Solución: Reemplazo de rodamientos'),
('SI la dirección es inestable Y la horquilla tiene fuga de aceite', 'Falla: Suspensión → Solución: Cambio de retenedores de horquilla'),

-- Embrague y transmisión
('SI el motor acelera pero no avanza Y el embrague patina', 'Falla: Embrague → Solución: Cambiar discos de embrague'),
('SI los cambios entran con dificultad Y la palanca está desajustada', 'Falla: Caja de cambios → Solución: Ajuste de palanca de cambios'),
('SI los cambios generan ruido Y los engranajes están dañados', 'Falla: Caja de cambios → Solución: Reparación de caja'),

-- Sistema eléctrico avanzado
('SI las luces parpadean Y el alternador no carga', 'Falla: Generación eléctrica → Solución: Cambiar alternador'),
('SI la moto presenta fallos eléctricos Y hay cables sulfatados', 'Falla: Conexiones eléctricas → Solución: Limpieza y cambio de cableado'),
('SI no enciende el tablero Y el interruptor está dañado', 'Falla: Sistema de encendido → Solución: Reemplazo de switch de encendido'),

-- Combustible
('SI el motor falla al acelerar Y la gasolina está contaminada', 'Falla: Alimentación de combustible → Solución: Drenar tanque y cambiar combustible'),
('SI el motor falla al acelerar Y los inyectores están sucios', 'Falla: Inyección → Solución: Uso de aditivo limpiador de inyectores'),
('SI el motor falla al acelerar Y se usa gasolina de baja calidad', 'Falla: Combustible defectuoso → Solución: Uso de combustible premium recomendado');

-- =========================================================
-- DATOS DE PRUEBA PARA TABLA: Relacion_Regla
-- =========================================================

INSERT INTO Relacion_Regla (id_regla, id_sintoma, id_falla, id_solucion) VALUES
-- Moto no enciende
(1, 1, 1, 1),   -- No enciende → Sistema de encendido → Reemplazo de bujía
(2, 1, 3, 9),   -- No enciende → Sistema eléctrico → Recarga o cambio de batería
(3, 1, 2, 3),   -- No enciende → Alimentación de combustible → Limpieza carburador

-- Motor pierde potencia
(4, 5, 4, 2),   -- Pierde potencia → Admisión deficiente → Cambio de filtro de aire
(5, 5, 5, 4),   -- Pierde potencia → Lubricación insuficiente → Cambio de aceite
(6, 5, 6, 6),   -- Pierde potencia → Compresión baja → Reparación de pistón

-- Moto se apaga en marcha
(7, 8, 7, 12),  -- Se apaga en marcha → Fusible quemado → Cambio de fusibles
(8, 8, 8, 11),  -- Se apaga en marcha → Regulador dañado → Reemplazo regulador
(9, 8, 9, 17),  -- Se apaga en marcha → ECU dañada → Cambio ECU

-- Frenos no responden
(10, 15, 10, 18), -- Frenos débiles → Pastillas gastadas → Cambio de pastillas
(11, 15, 11, 20), -- Frenos débiles → Fuga líquido → Purgado sistema
(12, 15, 12, 23), -- Frenos débiles → ABS defectuoso → Reparación ABS

-- Vibraciones excesivas
(13, 20, 13, 24), -- Vibra → Llanta desinflada → Cambio de llanta
(14, 20, 15, 32), -- Vibra → Cadena floja → Cambio kit de arrastre
(15, 20, 14, 27), -- Vibra → Llantas desalineadas → Alineación neumáticos

-- Ruidos en el motor
(16, 25, 16, 7),  -- Ruidos metálicos → Válvulas desajustadas → Ajuste de válvulas
(17, 25, 17, 8),  -- Ruidos metálicos → Cadena distribución floja → Cambio cadena
(18, 25, 18, 40), -- Ruidos escape → Fuga múltiple escape → Reemplazo múltiple

-- Dirección inestable
(19, 30, 19, 30), -- Dirección floja → Resorte vencido → Cambio resortes
(20, 30, 20, 36); -- Dirección floja → Rodamientos dañados → Reparación transmisión

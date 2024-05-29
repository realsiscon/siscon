-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  actividad
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO actividad (id_actividad, id_Proyecto, nombre_actividad, sec_actividad, estado_actividad, descripcion, fecha_ini, fecha_fin, duracion, id_grupo, id_modulo, contratista, precio_unitario, cantidad, precio_mano_obra, forma_pago, costo_mano_obra, costo_material, costo_maquinaria, unidad, estado, sec, fecha_alta, usr_alta, id_empresa) VALUES (1, 1, 'actividad 1', 1, 0, 'prueba de registro', '2023-07-14', '2023-07-19', 0, 1, 2, 2, 5, 8, 96, 2, 525, 63, 78, 6, 1, 1, '2023-07-13 08:50:32.05', 0, 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Almacen
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Almacen (id_Almacen, Nombre_Almacen, ubicacion, es_principal, id_encargado, direccion, telefono_1, telefono_2, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (1, 'Almacen Principal', 'ubicacion1', 1, 1, 'Direccion 1', '7896543', '6254654', 1, 1, 0, '2023-07-05 19:36:45.597', 1)
GO
INSERT INTO Almacen (id_Almacen, Nombre_Almacen, ubicacion, es_principal, id_encargado, direccion, telefono_1, telefono_2, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (1, 'Almacen Principal', 'ubicacion del principal', 1, 1, 'ubicacion del principal', '7896543', '6254654', 1, 2, 1, '2023-08-26 10:59:56.77', 0)
GO
INSERT INTO Almacen (id_Almacen, Nombre_Almacen, ubicacion, es_principal, id_encargado, direccion, telefono_1, telefono_2, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (2, 'Almacen 2', 'ubicacion 2', 0, 7, 'Direccion 2', '7896543', '6254654', 1, 1, 1, '2023-07-05 19:36:45.597', 1)
GO
INSERT INTO Almacen (id_Almacen, Nombre_Almacen, ubicacion, es_principal, id_encargado, direccion, telefono_1, telefono_2, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (3, 'Almacen 3', 'ubicacion 33333', 0, 18, 'ubicacion 33333', '7896543', '6254654', 1, 3, 0, '2023-12-21 16:21:09.4', 0)
GO
INSERT INTO Almacen (id_Almacen, Nombre_Almacen, ubicacion, es_principal, id_encargado, direccion, telefono_1, telefono_2, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (3, 'Almacen 3', 'ubicacion tres 3', 0, 15, 'ubicacion tres 3', '7896543', '6254654', 1, 4, 1, '2023-12-21 16:32:59.92', 0)
GO
INSERT INTO Almacen (id_Almacen, Nombre_Almacen, ubicacion, es_principal, id_encargado, direccion, telefono_1, telefono_2, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (4, 'almacen 4', 'direccion 4', 0, 24, 'direccion 4', '12445345', '23434543', 1, 1, 0, '2023-08-22 15:40:25.467', 0)
GO
INSERT INTO Almacen (id_Almacen, Nombre_Almacen, ubicacion, es_principal, id_encargado, direccion, telefono_1, telefono_2, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (5, 'ALMACEN SENKATA', 'PREDIO DE SENKATA', 0, 5, 'PREDIO DE SENKATA', '65066022', '76372562', 1, 1, 1, '2024-01-16 19:27:03.447', 0)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Almacen_Producto
-- Date:   28/05/2024 09:35 p. m.

-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Area
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'Administracion', 0, 1, '2016-01-26 16:04:32.767', '2024-01-23 17:51:48.21', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'Administraciones', 1, 2, '2024-01-23 17:51:48.21', NULL, NULL, NULL)
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'Contabilidad', 0, 1, '2016-01-26 16:04:32.767', '2024-01-23 17:49:18.61', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'Contabilidades', 1, 2, '2024-01-16 19:10:14.46', NULL, NULL, NULL)
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'Contabilidad', 1, 3, '2024-01-23 17:49:18.61', NULL, NULL, NULL)
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 'DEPARTAMENTO DE INGENIERIA', 1, 1, '2016-01-26 16:04:32.767', NULL, NULL, NULL)
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 'OBRAS', 0, 1, '2016-01-26 16:04:32.767', '2024-01-16 19:05:15.553', NULL, '')
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (5, 'SERVICIOS PETROLEROS', 0, 1, '2016-01-26 16:04:32.767', '2024-01-16 19:05:27.35', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (5, 'SERVICIOS PETROLEROS', 1, 2, '2024-01-16 19:05:27.353', NULL, NULL, NULL)
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (6, 'LOGISTICA Y COMPRAS', 0, 1, '2016-01-26 16:04:32.767', '2016-01-26 20:51:38.9', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (6, 'LOGISTICA Y COMPRAS_', 1, 2, '2016-01-26 20:51:38.9', NULL, NULL, NULL)
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (7, 'ssssssssssssssss', 0, 1, '2016-01-26 20:51:46.13', '2016-01-26 20:52:05.27', NULL, 'si')
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (8, 'eeeeeeeeeeeggggggggggggg', 0, 1, '2016-01-26 20:51:53.413', '2024-01-16 19:04:45.097', NULL, '')
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (9, 'Mantenimientos', 1, 1, '2016-02-25 19:12:41.287', NULL, NULL, NULL)
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (10, 'sfsssf', 1, 1, '2016-04-28 20:29:32.79', NULL, NULL, NULL)
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (11, 'ffff', 0, 1, '2016-04-28 20:29:57.1', '2024-01-16 19:05:07.76', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (11, 'ffff', 1, 2, '2024-01-16 19:05:07.76', NULL, NULL, NULL)
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (12, 'sdfdsfdsfsd', 0, 1, '2016-04-28 22:12:01.437', '2024-01-16 19:04:55.55', NULL, '')
GO
INSERT INTO Area (ID_Area, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (13, 'kjhkdfsd', 0, 1, '2023-07-19 13:40:10.967', '2024-01-16 19:05:01.733', NULL, '')
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Area_Cargo
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Area_Cargo (ID_Area, ID_cargo, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 1, 0, '2015-12-30 15:40:51.663', NULL, NULL, NULL)
GO
INSERT INTO Area_Cargo (ID_Area, ID_cargo, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 2, 0, '2015-12-30 15:40:51.663', NULL, NULL, NULL)
GO
INSERT INTO Area_Cargo (ID_Area, ID_cargo, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 3, 0, '2015-12-30 15:40:51.663', NULL, NULL, NULL)
GO
INSERT INTO Area_Cargo (ID_Area, ID_cargo, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 1, 0, '2015-12-30 15:40:51.663', NULL, NULL, NULL)
GO
INSERT INTO Area_Cargo (ID_Area, ID_cargo, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 2, 0, '2015-12-30 15:40:51.663', NULL, NULL, NULL)
GO
INSERT INTO Area_Cargo (ID_Area, ID_cargo, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 1, 0, '2015-12-30 15:40:51.663', NULL, NULL, NULL)
GO
INSERT INTO Area_Cargo (ID_Area, ID_cargo, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 1, 0, '2015-12-30 15:40:51.663', NULL, NULL, NULL)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Autorizadores
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Autorizadores (Cod_Autorizacion, Cod_Prioridad, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 1, 0, '2015-12-30 15:44:34.543', NULL, NULL, NULL)
GO
INSERT INTO Autorizadores (Cod_Autorizacion, Cod_Prioridad, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 2, 0, '2015-12-30 15:44:34.543', NULL, NULL, NULL)
GO
INSERT INTO Autorizadores (Cod_Autorizacion, Cod_Prioridad, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 3, 0, '2015-12-30 15:44:34.543', NULL, NULL, NULL)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Cargo
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'Gerente de Ingenieria', 0, 1, '2016-01-26 20:54:07.813', '2023-12-19 09:06:34.417', NULL, '')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'Gerente de Ingenieria_', 0, 2, '2016-01-26 21:27:22.163', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'Gerente de Ingenieria_', 0, 3, '2023-12-11 16:18:36.14', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'Gerente de Ingenieria', 0, 4, '2023-12-19 09:06:34.417', '2023-12-19 09:09:01.493', NULL, '')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'Gerente de Ingenieria2', 1, 5, '2023-12-19 09:09:01.493', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'Encargada de Contabilidad', 0, 1, '2016-01-26 20:54:07.847', '2023-12-11 16:24:16.32', NULL, '')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'Encargada de Contabilidad', 0, 2, '2023-12-11 16:23:32.157', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'Encargada de Contabilidad', 1, 3, '2023-12-11 16:23:32.68', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 'Gerente General', 0, 1, '2016-01-26 20:54:07.847', '2023-12-11 16:50:14.24', NULL, '')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 'Gerente General', 0, 2, '2016-04-28 21:06:14.52', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 'Gerente General', 1, 3, '2023-12-11 16:26:34.477', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 'Gerente Administrativo', 1, 1, '2016-01-26 20:54:07.847', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (5, 'Coordinador de Proyectos', 0, 1, '2016-01-26 20:54:07.847', '2023-12-18 14:25:13.01', NULL, '')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (5, 'Coordinador de Proyectos2', 1, 2, '2023-12-18 14:25:13.01', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (6, 'Director de Obras', 1, 1, '2016-01-26 20:54:07.847', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (7, 'Ing. De Diseño', 0, 1, '2016-01-26 20:54:07.85', '2024-01-16 18:52:20.403', 1, 'prueba 3')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (8, 'Auxiliar Contable', 1, 1, '2016-01-26 20:54:07.85', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (9, 'Secretaria', 1, 1, '2016-01-26 20:54:07.85', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (10, 'Encargado de Almacenes y Activos Fijos', 1, 1, '2016-01-26 20:54:07.85', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (11, 'Coordinadora de Seguridad', 1, 1, '2016-01-26 20:54:07.85', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (12, 'Residente de Obra', 1, 1, '2016-01-26 20:54:07.85', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (13, 'Ing. Ambiental', 1, 1, '2016-01-26 20:54:07.85', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (14, 'Recursos Humanos', 1, 1, '2016-01-26 20:54:07.85', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (15, 'Encargado de Sistemas', 1, 1, '2016-01-26 20:54:07.85', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (16, 'Responsable Ambiental', 0, 1, '2016-01-26 20:54:07.85', '2023-12-12 08:59:52.59', NULL, 'para pruebas')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (16, 'Responsable Ambiental2', 1, 2, '2023-12-12 08:59:36.917', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (17, 'Jefe de Logistica y Abastecimiento', 0, 1, '2016-01-26 20:54:07.85', '2024-01-16 18:51:33.25', 1, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (17, 'Almacenero', 1, 2, '2024-01-16 18:51:33.25', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (18, 'Encargado de Compras', 1, 1, '2016-01-26 20:54:07.85', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (19, 'Encargado de Mantenimiento de Vehiculos', 1, 1, '2016-01-26 20:54:07.85', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (20, 'sdasdasdasda', 0, 1, '2016-01-26 21:27:30.233', '2023-12-11 17:14:07.947', NULL, '')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (21, 'Encargado de Mantenimiento', 1, 1, '2016-02-25 19:12:26.03', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (22, 'ssssssss', 0, 1, '2016-04-28 20:29:27.657', '2023-12-11 16:50:32.807', NULL, '')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (23, 'eweeeeeeee', 1, 1, '2016-04-28 22:11:54.65', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (24, 'Limpieza', 1, 1, '2023-07-04 09:35:06.87', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (25, 'nuevo_cargo', 0, 1, '2023-12-11 17:16:03.19', '2023-12-11 17:39:55.197', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (26, 'cargoooooo', 0, 1, '2023-12-11 17:30:50.49', '2023-12-11 17:31:22.067', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (27, 'nuevo_cargo', 0, 1, '2023-12-12 15:08:41.98', '2023-12-12 16:19:57.04', NULL, 'eliminacion')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (28, 'holaa', 0, 1, '2023-12-12 16:21:09.707', '2023-12-12 16:23:36.27', NULL, 'cargo falso')
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (29, 'prueba nueva', 1, 1, '2023-12-18 11:50:12.897', NULL, NULL, NULL)
GO
INSERT INTO Cargo (ID_cargo, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (30, 'Coordinador de Proyectos2', 0, 1, '2023-12-18 14:18:29.427', '2024-01-16 18:29:30.13', 1, 'prueba 2')
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  cliente
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO cliente (id_cliente, Nombre_cliente, tipo_persona, Nro_Doc, direccion, telefono, mail, estado, sec, fecha_alta, usr_alta, id_empresa) VALUES (1, 'Fernando sandagorda', 1, '5400100SC', 'av banzer', '76078058', 'ferfsc@gmail.com', 1, 1, '2023-07-05 18:39:12.373', 1, 1)
GO
INSERT INTO cliente (id_cliente, Nombre_cliente, tipo_persona, Nro_Doc, direccion, telefono, mail, estado, sec, fecha_alta, usr_alta, id_empresa) VALUES (2, 'Cliente 2', 1, '5400100SC', 'av banzer', '76078058', 'ferfsc@gmail.com', 1, 1, '2023-07-05 18:39:12.373', 1, 1)
GO
INSERT INTO cliente (id_cliente, Nombre_cliente, tipo_persona, Nro_Doc, direccion, telefono, mail, estado, sec, fecha_alta, usr_alta, id_empresa) VALUES (3, 'Cliente 3', 1, '5400100SC', 'av banzer', '76078058', 'ferfsc@gmail.com', 1, 1, '2023-07-05 18:39:12.373', 1, 1)
GO
INSERT INTO cliente (id_cliente, Nombre_cliente, tipo_persona, Nro_Doc, direccion, telefono, mail, estado, sec, fecha_alta, usr_alta, id_empresa) VALUES (4, 'Cliente 4', 1, '5400100SC', 'av banzer', '76078058', 'ferfsc@gmail.com', 1, 1, '2023-07-05 18:39:12.373', 1, 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  contratista
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO contratista (id_contratista, Nombre_contratista, Nro_Doc, direccion, telefono, especialidad, Codigo_banco, nro_cuenta, tipo_seguro, nro_seguro, emite_factura, mail, estado, sec, fecha_alta, usr_alta, id_empresa) VALUES (1, 'JUAN PEREZ 1', '54987321', 'DIRECCION 1', '796521321', 'ESPECIALIDAD 1', '1', '21321325', 1, '321321', 1, '', 1, 1, '2023-07-11 12:03:18.22', 1, 1)
GO
INSERT INTO contratista (id_contratista, Nombre_contratista, Nro_Doc, direccion, telefono, especialidad, Codigo_banco, nro_cuenta, tipo_seguro, nro_seguro, emite_factura, mail, estado, sec, fecha_alta, usr_alta, id_empresa) VALUES (2, 'JUAN PEREZ 12', '54987321', 'DIRECCION 1', '796521321', 'ESPECIALIDAD 2', '1', '21321325', 1, '321321', 1, '', 1, 1, '2023-07-11 12:03:18.22', 1, 1)
GO
INSERT INTO contratista (id_contratista, Nombre_contratista, Nro_Doc, direccion, telefono, especialidad, Codigo_banco, nro_cuenta, tipo_seguro, nro_seguro, emite_factura, mail, estado, sec, fecha_alta, usr_alta, id_empresa) VALUES (3, 'JUAN CORREA 12', '54987321', 'DIRECCION 1', '796521321', 'ESPECIALIDAD 2', '1', '21321325', 1, '321321', 1, '', 1, 1, '2023-07-11 12:03:18.22', 1, 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Detalle_Autorizadores
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Detalle_Autorizadores (Cod_Detalle_Autorizadores, Cod_Autorizacion, Secuencia, Cod_Persona, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 1, 1, 0, 0, '2016-05-11 19:30:01.643', NULL, NULL, NULL)
GO
INSERT INTO Detalle_Autorizadores (Cod_Detalle_Autorizadores, Cod_Autorizacion, Secuencia, Cod_Persona, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 1, 2, 27, 0, '2016-05-11 19:30:01.643', NULL, NULL, NULL)
GO
INSERT INTO Detalle_Autorizadores (Cod_Detalle_Autorizadores, Cod_Autorizacion, Secuencia, Cod_Persona, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 1, 3, 3, 0, '2016-05-11 19:30:01.643', NULL, NULL, NULL)
GO
INSERT INTO Detalle_Autorizadores (Cod_Detalle_Autorizadores, Cod_Autorizacion, Secuencia, Cod_Persona, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 1, 4, 23, 0, '2016-05-11 19:30:01.643', NULL, NULL, NULL)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Detalle_Solicitud
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Detalle_Solicitud (ID_Solicitud, Cod_Material, Cod_Unidad, Item, Cantidad, id_actividad, id_empresa, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 4, 1, 1, 4, 1, 1, 1, '2023-09-13 16:09:35.737', NULL, NULL, NULL)
GO
INSERT INTO Detalle_Solicitud (ID_Solicitud, Cod_Material, Cod_Unidad, Item, Cantidad, id_actividad, id_empresa, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 5, 5, 1, 9, 1, 1, 1, '2023-11-29 09:06:42.837', NULL, NULL, NULL)
GO
INSERT INTO Detalle_Solicitud (ID_Solicitud, Cod_Material, Cod_Unidad, Item, Cantidad, id_actividad, id_empresa, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 7, 6, 2, 43, 1, 1, 1, '2023-11-29 09:06:42.84', NULL, NULL, NULL)
GO
INSERT INTO Detalle_Solicitud (ID_Solicitud, Cod_Material, Cod_Unidad, Item, Cantidad, id_actividad, id_empresa, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 13, 14, 1, 4, 1, 1, 1, '2023-12-27 09:24:24.543', NULL, NULL, NULL)
GO
INSERT INTO Detalle_Solicitud (ID_Solicitud, Cod_Material, Cod_Unidad, Item, Cantidad, id_actividad, id_empresa, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 5, 2, 2, 12, 1, 1, 1, '2024-01-19 17:33:34.917', NULL, NULL, NULL)
GO
INSERT INTO Detalle_Solicitud (ID_Solicitud, Cod_Material, Cod_Unidad, Item, Cantidad, id_actividad, id_empresa, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 52, 4, 1, 100, 1, 1, 1, '2024-01-19 17:33:34.913', NULL, NULL, NULL)
GO
INSERT INTO Detalle_Solicitud (ID_Solicitud, Cod_Material, Cod_Unidad, Item, Cantidad, id_actividad, id_empresa, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (5, 119, 12, 1, 10, 1, 1, 1, '2024-01-24 14:45:51.947', NULL, NULL, NULL)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  empresa
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO empresa (id_empresa, nombre, estado, observacion, sec, fecha_alta, usr_alta) VALUES (1, 'CORVIC', 1, 'Alta de Empresa', 1, '2023-06-21 18:45:09.57', 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  fases
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO fases (id_fase, id_proyecto, nombre, sec_proyecto, estado, duracion_total, id_encargago, observacion, sec, fecha_alta, usr_alta, id_empresa) VALUES (1, 1, 'fase 1', 0, 0, 0, 6, 'prueba', 1, '2023-06-27 11:05:24.97', 0, 1)
GO
INSERT INTO fases (id_fase, id_proyecto, nombre, sec_proyecto, estado, duracion_total, id_encargago, observacion, sec, fecha_alta, usr_alta, id_empresa) VALUES (2, 1, 'actividad 1', 0, 1, 0, 0, '', 1, '2023-07-12 16:18:21.557', 0, 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  grupo
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO grupo (id_grupo, NombreGrupo, id_proyecto, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (1, 'grupo 1', 3, 1, 1, 1, '2023-07-04 12:01:15.3', 0)
GO
INSERT INTO grupo (id_grupo, NombreGrupo, id_proyecto, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (2, 'columnas', 40, 1, 1, 1, '2024-01-16 20:33:11.447', 0)
GO
INSERT INTO grupo (id_grupo, NombreGrupo, id_proyecto, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (3, 'columnas', 40, 1, 1, 1, '2024-01-16 20:33:11.953', 0)
GO
INSERT INTO grupo (id_grupo, NombreGrupo, id_proyecto, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (4, 'pisos', 40, 1, 1, 1, '2024-01-16 20:33:30.853', 0)
GO
INSERT INTO grupo (id_grupo, NombreGrupo, id_proyecto, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (5, 'techos', 40, 1, 1, 1, '2024-01-16 20:33:50.603', 0)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Lugar_Entrega
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'BOYUIBE', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'CAMIRI_2', 0, 2, '2016-01-11 20:16:45.8', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'CAMIRI', 9, 1, '2016-01-11 20:14:10.29', '2016-01-11 20:16:45.72', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 'CARAPARI', 9, 1, '2016-01-11 20:14:10.29', '2016-01-11 20:17:30.363', NULL, '')
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 'CHARAGUA', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (5, 'COMARAPA', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (6, 'EYTI', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (7, 'HITO VILLAZON', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (8, 'IPATI', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (9, 'IPITA', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (10, 'LA ENCONADA', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (11, 'LA GAIBA', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (12, 'LA HERRADURA', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (13, 'LA PAZ', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (14, 'LAS PETAS', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (15, 'LLIQUIMUNI', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (16, 'LOS TRONCOS', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (17, 'MAIRANA', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (18, 'MORO MORO', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (19, 'MUTUN', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (20, 'PUERTO SUAREZ', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (21, 'QUIRUSILLAS', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (22, 'ROBORE ', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (23, 'SAIPINA', 0, 1, '2016-01-11 20:14:10.29', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (24, 'SAN ANTONIO DE LOMERIO', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (25, 'SAN JAVIER', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (26, 'SAN JOSE DE CHIQUITOS', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (27, 'SAN PEDRO ', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (28, 'SAN RAFAEL', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (29, 'SANTA ROSA DE LA MINA', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (30, 'SANTA ROSA DEL SARA', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (31, 'VALLEGRANDE', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (32, 'YACUIBA', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (33, 'YEYU', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (34, 'YOTAU', 0, 1, '2016-01-11 20:14:10.293', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (35, 'sssssssssss', 0, 1, '2016-01-16 20:11:02.167', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (36, 'gdgdfg', 0, 1, '2016-04-28 20:27:31.563', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (37, 'sdsd', 0, 1, '2016-04-28 21:09:06.01', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (38, 'wwwwwtttt', 0, 1, '2016-04-28 21:12:42.953', NULL, NULL, NULL)
GO
INSERT INTO Lugar_Entrega (ID_Lugar, Nombre_Lugar, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (39, 'eeeeeeeeeeeeeeeeeeee', 0, 1, '2016-04-28 22:09:20.867', NULL, NULL, NULL)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Material
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (0, 117, 'Acero Estructural', 9, 7,66, 1, 5000, 335755,38, 1, 1, '2024-01-16 19:54:04.517', NULL, NULL, NULL, 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (0, 118, 'ACERO ESTRUCTURAL', 9, 7,66, 1, 5000, 400000, 1, 1, '2024-01-16 20:17:31.573', NULL, NULL, NULL, 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (0, 119, 'ACERO ESTRUCTURAL', 9, 7,66, 1, 5000, 400000, 1, 1, '2024-01-16 20:17:34.64', NULL, NULL, NULL, 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 1, 'ACCESORIOS E-40 DEV2"', 1, 3, 1, 10, 4, 0, 1, '2023-07-01', NULL, NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 2, 'ACCESORIOS PLOMERIA TANQUE', 1, 3, 1, 10, 4, 0, 1, '2023-07-01', NULL, NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 3, 'ACEITE DE LINAZA', 1, 3, 1, 10, 4, 0, 1, '2023-07-01', NULL, NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 4, 'ACERO ESTRUCTURAL', 1, 3, 1, 10, 4, 0, 1, '2023-07-01', NULL, NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 4, 'ACERO ESTRUCTURAL2', 1, 3, 1, 10, 4, 1, 2, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 5, 'ACERO ESTRUCTURAL IMPORTADO', 1, 3, 1, 10, 4, 0, 1, '2023-07-01', '2023-07-27 09:18:32.777', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 5, 'ACERO ESTRUCTURAL IMPORTADO', 1, 3, 1, 10, 9, 1, 2, '2023-07-27 09:18:32.777', NULL, NULL, NULL, 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 6, 'ACERO PARA POSTESADO', 1, 3, 1, 10, 4, 0, 1, '2023-07-01', '2023-07-26 18:41:10.273', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 6, 'ACERO PARA POSTESADO', 1, 4, 1, 10, 4, 1, 2, '2023-07-26 18:41:10.277', NULL, NULL, NULL, 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 7, 'ACOMETIDA DE AGUA POTABLE', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 8, 'ADITIVO MEJORAMIENTO DE ADHERENCIA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 9, 'ADITIVO SUPERFLUIDIFICANTE', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 10, 'ADOBITO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 11, 'AGREGADO 3/4" PARA TSD', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 12, 'AGREGADO 3/4" PARA TSS', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 13, 'AGREGADO 3/8" PARA TSD', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 14, 'AGUA NO POTABLE', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 15, 'AGUA POTABLE', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 16, 'AGUA POTABLE ACIDA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 17, 'AGUA POTABLE ALCALINA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 18, 'AGUARRAS', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 19, 'ALAMBRE AWG Nº 14', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 20, 'ALAMBRE DE AMARRE', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 21, 'ALAMBRE DE CU AISL. AWG 6 THW-75 C-600V', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 22, 'ALAMBRE GALVANIZADO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 23, 'ALAMBRE NEGRO DE AMARRE', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 24, 'ALQUITRAN', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 25, 'ANCLAJE COMPLETO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 26, 'APOYO DE NEOPRENO COMPUESTO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 27, 'ARENA COMUN', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 28, 'ARENA FINA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 29, 'ARENA PARA SELLADO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 30, 'ARENILLA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 31, 'AS BUILTY DATA BOOK', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 32, 'ASFALTO DILUIDO P/TRAT. SUPERFICIAL', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 33, 'ASFALTO DILUIDO PARA IMPRIMACION', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 34, 'BACHA INOX', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 35, 'BARRA DE ACERO CORRUGADO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 36, 'BARRA DE CU DE 40 mm2', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 37, 'BASE DE DUCHA 0.75x0.75 (FIBRA)', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 38, 'BISAGRA DOBLE 4"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 39, 'BISAGRAS DE 4"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 40, 'BOMBA DE 0.75 HP', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 41, 'BRAZO MECANICO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 42, 'BROCHA DE 4 PLG', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 43, 'CABLE UNIPOLAR 95 mm2', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 44, 'CABLE AISLADO 3x10 mm', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 45, 'CABLE AISLADO 3x2.54 mm', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 46, 'CABLE AISLADO 3x4 mm2', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 47, 'CABLE AISLADO 3x6 mm2', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 48, 'CABLE DE CU AISL. BIPOLAR AWG 2x10', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 49, 'CABLE DESNUDO 35 mm2', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 50, 'CABLE UNIPOLAR 12 AWG', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 51, 'CAJA DE MEDIDOR TRIF.', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 52, 'CAJA PLASTICA CIRCULAR', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 53, 'CAJA PLASTICA RECTANGULAR', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 54, 'CAJA RECEPTORA PVC P/DESAGUE 6"x20 cm', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 55, 'CALAMINA ONDULADA N.33', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 56, 'CALAMINA PLANA GALVANIZADA # 28', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 57, 'CAMARA DESGRASADORA 6"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 58, 'CAMARA PARA REGISTRO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 59, 'CAMARA SINFONADA PVC 6x6"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 60, 'CANALETA DE CALAMINA N.26', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 61, 'CAÑERIA PVC 1/2" TRICAPA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 62, 'CAÑERIA PVC 3/4" TRICAPA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 63, 'CARTON ASFALTICO 2mm', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 64, 'CEMENTO BLANCO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 65, 'CEMENTO PORTLAND', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 66, 'CERAMICA ESMALTADA (PISO)', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 67, 'CHAPA ANTIPANICO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 68, 'CHAPA INTERIOR (DE EMBUTIR TIPO PAPAIZ)', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 69, 'CHICOTILLO PLASTICO 1/2 x 1/2 x30 cm', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 70, 'CHICOTILLO RIGIDO 1/2 x 1/2 x30 cm', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 71, 'CINTA AISLANTE DE 10 YARDAS', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 72, 'CLAVO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 73, 'CLAVO DE CONSTRUCCION DE 3"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 74, 'CLAVOS DE CALAMINA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 75, 'CODO DE LUZ DE 5/8"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 76, 'CODO PVC 45 CA 1/2"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 77, 'CODO PVC 45 P/DESAGUE 3"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 78, 'CODO PVC 45 P/DESAGUE 4"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 79, 'COLA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 80, 'CONDUIT PVC D= 5/8"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 81, 'CONDUIT PVC D= 1"', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 82, 'CORTINA ARROLLABLE C/ TAPA ROLL', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 83, 'DEFENSA LATERAL', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 84, 'DELINEADORES PVC D=3", L=1.00 M', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 85, 'DESMOVILIZACION', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 86, 'DETONADOR', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 87, 'DINAMITA (80%)', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 88, 'DISEÑOS CIVILES Y ARQUITECTONICOS APROBADO P/ CONST.', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 89, 'DRY WALL MURO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 90, 'DUCHA METALICA LORENZETTI', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 91, 'ELECTRODO E-6012', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 92, 'ESPEJO DE 4mm PARA BAÑO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 93, 'ESTACAS DE MADERA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 94, 'ESTUCO BEDOYA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 95, 'ESTUCO PANDO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 96, 'EXTINGUIDOR', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 97, 'FIERRO CORRUGADO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 98, 'FOCO INCADESCENTE DE 75w', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 99, 'FULMINANTE', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 100, 'GABINETE CONTRA INCENDIO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 101, 'GAVIONES TIPO CAJON', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 102, 'GLOBULOS DE VIDRIO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 103, 'GRAVA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 104, 'GRAVA NATURAL', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 105, 'GRIFERIA', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 106, 'GRIFERIA DE LAVAMANOS SENCILLO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 107, 'GRIFERIA DE LUJO P/ LAVAMANOS', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 108, 'GRIFERIA LAVAPLATOS', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 109, 'GRIFERIA PRESS MATIC PARA BAÑO', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 110, 'GUIA DE SEGURIDAD', 1, 3, 1, 10, 4, 0, 1, '2023-07-01', NULL, NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 110, 'GUIA DE SEGURIDAD_', 1, 3, 1, 10, 4, 1, 2, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 111, 'yyyyyyyyyyyyyyyy', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 112, 'sdsdsd', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 113, 'wwwwww', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 114, 'gggggeeeee', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 115, 'rtrterteterte', 1, 3, 1, 10, 4, 1, 1, '2023-07-01', NULL, NULL, 'NULL', 1)
GO
INSERT INTO Material (id_proyecto, Cod_Material, Nombre_Material, Unidad, precio_unitario, id_grupo, stock_minimo, Cant_presupuestada, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 116, 'material 1', 3, 10, 1, 9, 85, 1, 1, '2023-07-17 13:59:33.647', NULL, NULL, NULL, 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  modulo
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO modulo (id_modulo, Nombremodulo, id_proyecto, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (1, 'modulo 1', 4, 1, 1, 0, '2023-07-05 09:06:50.153', 0)
GO
INSERT INTO modulo (id_modulo, Nombremodulo, id_proyecto, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (2, 'Mdulo 2', 1, 1, 1, 1, '2023-07-11 11:16:51.023', 0)
GO
INSERT INTO modulo (id_modulo, Nombremodulo, id_proyecto, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (3, 'Modulo 3', 1, 1, 1, 1, '2023-07-11 11:17:07.58', 0)
GO
INSERT INTO modulo (id_modulo, Nombremodulo, id_proyecto, id_empresa, sec, estado, fecha_alta, usr_alta) VALUES (4, 'esterilizacion', 40, 1, 1, 1, '2024-01-16 20:34:15.833', 0)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Observaciones
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'P/ SER ENTREGADO EN LLIQUIMUNI', 0, 2, '2016-01-13 22:24:45.893', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'PARA SER ENTREGADO EN LLIQUIMUNI', 9, 1, '2016-01-13 22:04:31.217', '2016-01-13 22:24:45.893', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'MATERIAL FRAGIL', 0, 1, '2016-01-13 22:04:31.217', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 'NO ALMACENAR MAS DE 5 PIEZAS ENCIMA', 0, 1, '2016-01-13 22:04:31.217', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 'TRANSPORTAR SIGUIENDO LAS INSTRUCCIONES EN LA ', 0, 1, '2016-01-13 22:04:31.217', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (5, 'NO VOLCAR EL CAJON', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (6, 'ENTREGAR EN ALMACENES COMARAPA', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (7, 'UTILIZAR EMBALAJE IMPERMEABLE', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (8, 'SOLO POR VIA AEREA', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (9, 'EL TRASLADO DEBE SER HECHO SOLO DE NOCHE', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (10, 'DEBERA SER ENTREGADO BAJO SUPERVISION SANITARIA', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (11, 'PARA EL PROYECTO ASFALTADO CALLES COMARAPA', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (12, 'EVITAR LOS RAYOS DEL SOL EN FORMA DIRECTA', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (13, 'DESECHOS PELIGROSOS', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (14, 'VERIFICAR LAS CANTIDADES EN EL DESTINO', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (15, 'EVITAR LA HUMEDAD EN EL ENTORNO', 0, 1, '2016-01-13 22:04:31.22', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (16, 'dddddddddd', 0, 2, '2016-01-16 20:34:07.157', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (16, 'ssssssssssss', 9, 1, '2016-01-16 20:33:49.5', '2016-01-16 20:34:07.157', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (17, 'dsdsd', 0, 1, '2016-04-28 20:30:03.59', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (18, 'fffff', 0, 1, '2016-04-28 21:04:27.873', NULL, NULL, NULL)
GO
INSERT INTO Observaciones (Cod_Observaciones, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (19, 'jjjjjjjjj', 0, 1, '2016-04-28 22:10:15.367', NULL, NULL, NULL)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  OpcionesMenu
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (0, 'Menu', NULL, '', NULL, NULL, NULL, 1, 0, '#')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (1, 'Solicitud', 0, '#', 'grupoOver.gif', NULL, NULL, 1, 0, '#')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (2, 'Solicitud de Compra', 1, 'frmSolicitudCompra.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmSolicitudCompra.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (3, 'Autorizar', 0, '#', 'grupoOver.gif', NULL, NULL, 1, 0, '#')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (4, 'Autorizar Solicitud', 3, 'AutorizarSolicitud.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'AutorizarSolicitud.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (5, 'Parametros', 0, '#', 'grupoOver.gif', NULL, NULL, 1, 0, '#')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (6, 'Proyectos', 5, 'frmBusquedaProyecto.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmBusquedaProyecto.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (7, 'Lugares Entrega', 5, 'frmLugarEntrega.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmLugarEntrega.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (8, 'Unidad', 5, 'frmUnidad.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmUnidad.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (9, 'Material', 5, 'frmProyecto_Material.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmProyecto_Material.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (10, 'Observaciones', 5, 'frmObservaciones.aspx', 'grupoOver.gif', NULL, NULL, 0, 0, 'frmObservaciones.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (11, 'Administracion', 0, '#', 'grupoOver.gif', NULL, NULL, 1, 0, '#')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (12, 'Personal', 11, 'frmPersonalx.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmPersonalx.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (13, 'Cargo', 11, 'frmCargos.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmCargos.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (14, 'Area', 11, 'frmArea.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmArea.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (15, 'Usuario', 11, 'frmUsuarios.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmUsuarios.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (17, 'Opcion Menu', 11, 'frmOpcion.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmOpcion.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (18, 'Asignar Menu', 11, 'frmUsuarioOpcion.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmUsuarioOpcion.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (19, 'Fases', 5, 'Fases.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'Fases.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (20, 'Grupos', 5, 'frmGrupo.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmGrupo.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (21, 'Modulo', 5, 'frmModulo.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmModulo.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (22, 'Almacen', 0, '#', 'grupoOver.gif', NULL, NULL, 1, 0, '#')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (23, 'Registro de Almacen', 22, 'frmAlmacen.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmAlmacen.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (24, 'Ingresos Almacen', 22, 'IngresoMaterial.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'IngresoMaterial.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (25, 'Traspaso de Almacen', 22, 'TraspasoAlmacen.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'TraspasoAlmacen.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (26, 'Salida de Almacen', 22, 'SalidasAlmacen.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'SalidasAlmacen.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (27, 'Reportes', 0, '#', 'grupoOver.gif', NULL, NULL, 1, 0, '#')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (28, 'Reporte Personal', 27, 'ReportePersonal.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'ReportePersonal.aspx')
GO
INSERT INTO OpcionesMenu (idOpcion, textoOpcion, idOpcionPadre, pantalla, imagen1, imagen2, imagenOver, valido, mostrar, pantallaNueva) VALUES (29, 'Clientes', 5, 'frmCliente.aspx', 'grupoOver.gif', NULL, NULL, 1, 0, 'frmCliente.aspx')
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Personal
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 'Pablo', 'Lazarte', 'Ribera', '', '', '71339877', 'pablo.lazarte@caminosrl.com', 1, 4, '1978-03-11', 0, 1, '2016-01-09 10:51:28.063', '2016-02-25 19:44:05.797', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 'Administrador', 'ADM', 'ADM', '', '', '72602314', 'solicitudcompra@caminosrl.com', 21, 1, '1978-03-11', 1, 2, '2016-02-25 19:44:05.797', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, 'Fatima Andrea', 'Mariscal', 'Ruiz', '', '', '', 'fatima.mariscal@caminosrl.com', 2, 2, '1985-10-13', 0, 1, '2016-01-09 10:51:28.063', '2016-02-24 21:16:49.807', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, 'Fatima Andrea', 'Mariscal', 'Ruiz', '&nbsp;;', '654324', '&nbsp;', 'fatima.mariscal@caminosrl.com', 2, 2, '1985-10-13', 0, 2, '2016-02-24 21:16:49.81', '2023-12-19 08:43:59.23', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, 'Fatima Andrea2', 'Mariscal2', 'Ruiz2', '&nbsp;;', '654324', '98754332', 'fatima.mariscal@caminosrl.com', 2, 2, '1985-10-13', 0, 3, '2023-12-19 08:43:59.42', '2023-12-19 08:45:34.483', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, 'Fatima Andrea22', 'Mariscal22', 'Ruiz22', '&nbsp;;', '654324', '98754332', 'fatima.mariscal@caminosrl.com', 2, 2, '1985-10-13', 0, 4, '2023-12-19 08:45:34.693', '2023-12-19 08:58:36.8', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, 'Fatima Andrea222', 'Mariscal223', 'Ruiz223', '34234234', '654324', '98754332', 'fatima.mariscal@caminosrl.com', 2, 2, '1985-10-13', 0, 5, '2023-12-19 08:58:36.993', '2023-12-19 09:05:40.393', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, 'Fatima Andrea', 'Mariscal', 'Ruiz', '34234234', '654324', '98754332', 'fatima.mariscal@caminosrl.com', 2, 2, '1985-10-13', 0, 6, '2023-12-19 09:05:40.537', '2024-01-16 18:18:33.487', 1, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, 'Fatima Andrea', 'Mariscal', 'Ruiz', '34234234', '654324', '98754332', 'bvillafuerte@corvic.com.bo', 2, 2, '1985-10-13', 0, 7, '2024-01-16 18:18:33.54', '2024-01-16 18:21:26.397', 1, 'prueba 1', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (3, 'Rory Marcelo', 'Villegas ', 'Villarroel', '', '', '72156721', 'marcelo.villegas@caminosrl.com', 3, 1, '1956-06-23', 0, 1, '2016-01-09 10:51:28.063', '2023-12-19 08:50:54.05', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (3, 'Rory Marcelo2', 'Villegas 2', 'Villarroel2', '', '', '72156721', 'marcelo.villegas@caminosrl.com', 3, 1, '1956-06-23', 0, 2, '2023-12-19 08:50:54.227', '2024-01-16 18:26:11.867', 1, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (3, 'Blanca Margareth', 'Villafuerte', 'Cuadros', 'La hacienda 2 calle tamarindo #13', '3427944', '76372562', 'bvillafuerte@corvic.com.bo', 4, 1, '1956-06-23', 1, 3, '2024-01-16 18:26:11.87', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (4, 'Monica Isabel', 'Villarroel', 'Mogrovejo', '', '', '', 'monica.villarroel@caminosrl.com', 4, 2, '1900-01-01', 0, 1, '2016-01-09 10:51:28.063', '2016-04-28 21:06:21.36', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (4, 'Monica Isabel', 'Villarroel', 'Mogrovejo', '&nbsp;sds', '&nbsp;', '&nbsp;', 'monica.villarroel@caminosrl.com', 4, 2, '1900-01-01', 0, 2, '2016-04-28 21:06:21.36', '2024-01-16 18:26:39.377', 1, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (4, 'Monica Isabel', 'Villarroel', 'Mogrovejo', '0987408917340981', '&nbsp;', '&nbspaosuggfn', '2983749283421', 4, 2, '1900-01-01', 0, 3, '2024-01-16 18:26:39.38', '2024-01-16 18:49:45.023', 1, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (4, 'Rodrigo Donato', 'Villafuerte', 'Cuadros', 'Cond. Sevilla las terrazas', '3427944', '77666181', 'rvillafuerte@corvic.com.bo', 17, 6, '1995-03-31', 1, 4, '2024-01-16 18:49:45.027', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (5, 'Mario Marcelo', 'Prada', 'Robles', '', '', '72129957', 'mario.prada@caminosrl.com', 5, 5, '1986-04-02', 0, 1, '2016-01-09 10:51:28.063', '2024-01-16 18:51:00.113', 1, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (5, 'Jonathan', 'Perez ', 'Pedraza', 'Cond. las brisas #34', '3445269', '62062506', 'bvillafuerte@equimport.com.bo', 18, 6, '1986-04-02', 0, 2, '2024-01-16 18:51:00.117', '2024-01-16 18:51:44.27', 1, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (5, 'Jonathan', 'Perez ', 'Pedraza', 'Cond. las brisas #34', '3445269', '62062506', 'bvillafuerte@equimport.com.bo', 17, 6, '1986-04-02', 0, 3, '2024-01-16 18:51:44.273', '2024-01-16 19:13:59.3', 1, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (5, 'Jonathan', 'Perez ', 'Pedraza', 'Cond. las brisas #34', '3445269', '62062506', 'bvillafuerte@equimport.com.bo', 17, 6, '1986-04-02', 1, 4, '2024-01-16 19:13:59.3', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (6, 'Daniel', 'Sandagorda', 'Boza', '', '', '72134095', 'daniel.sandagorda@caminosrl.com', 6, 5, '1970-08-21', 0, 1, '2016-01-09 10:51:28.063', '2023-12-18 17:56:52.29', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (6, 'Daniel', 'Sandagorda999', 'Boza', '', '', '72134095', 'daniel.sandagorda@caminosrl.com', 6, 5, '1970-08-21', 1, 2, '2023-12-18 17:56:52.427', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (7, 'Marco Ariel', 'Zurita', 'Diaz', '', '', '72618718', 'ariel.zurita@caminosrl.com', 7, 4, '1986-02-22', 0, 1, '2016-01-09 10:51:28.063', '2023-12-18 17:56:40.82', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (7, 'Marco Ariel', 'Zurita', 'Diaz', '', '', '72618720', 'ariel.zurita@caminosrl.com', 7, 4, '1986-02-22', 1, 2, '2023-12-18 17:56:40.96', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (8, 'Daysi', 'Soto', 'Jimenez', '', '', '', 'daysi.soto@caminosrl.com', 8, 2, '1987-12-03', 1, 1, '2016-01-09 10:51:28.063', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (9, 'Carolay', 'Duval', 'Flores', '', '', '72165517', 'carolay.duval@caminosrl.com', 9, 2, '1982-01-19', 1, 1, '2016-01-09 10:51:28.063', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (10, 'Eberth', 'Encinas', 'Barriga', '', '', '72125825', 'eberth.encinas@caminosrl.com', 10, 6, '1986-11-19', 0, 1, '2016-01-09 10:51:28.063', '2023-12-18 17:55:22.537', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (10, 'Eberth6', 'Encinas', 'Barriga', '', '', '72125825', 'eberth.encinas@caminosrl.com', 10, 6, '1986-11-19', 1, 2, '2023-12-18 17:55:51.3', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (11, 'Monica  ', 'Zambrana', 'Espinoza', '', '', '72134036', 'monica.zambrana@caminosrl.com', 11, 6, '1989-04-06', 1, 1, '2016-01-09 10:51:28.063', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (12, 'Alejandro', 'Arteaga', 'Camacho', '', '', '71343255', 'alejandro.arteaga@caminosrl.com', 12, 6, '1989-01-13', 1, 1, '2016-01-09 10:51:28.063', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (13, 'Yuly', 'Villarroel', 'Gonzales', '', '', '', 'yuly.villarroel@caminosrl.com', 13, 4, '1988-08-15', 1, 1, '2016-01-09 10:51:28.067', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (14, 'Eber ', 'Coca', 'Guerra', '', '', '71345684', 'eber.coca@caminosrl.com', 12, 5, '1990-04-19', 1, 1, '2016-01-09 10:51:28.067', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (15, 'Sofía', 'Córdova', 'Soto', '', '', '72135601', 'sofia.cordova@caminosrl.com', 14, 2, '1969-11-27', 1, 1, '2016-01-09 10:51:28.067', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (16, 'Mauricio', 'Córdova', 'Melgar', '', '', '73183235', 'mauricio.cordova@caminosrl.com', 12, 5, '1983-06-14', 0, 1, '2016-01-09 10:51:28.067', '2023-12-18 18:08:29.837', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (16, 'Mauricio', 'Córdova2', 'Melgar', '', '', '73183235', 'mauricio.cordova@caminosrl.com', 12, 5, '1983-06-14', 1, 2, '2023-12-18 18:08:30.037', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (17, 'Erwin Marcelo', 'Sandagorda', 'Canedo', '', '', '72602134', 'marcelo.sandagorda@caminosrl.com', 15, 3, '1985-06-11', 1, 1, '2016-01-09 10:51:28.067', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (18, 'Freddy  ', 'Sandagorda', 'Canedo', '', '', '71312725', 'freddy.sandagorda@caminosrl.com', 5, 6, '1980-11-29', 0, 1, '2016-01-09 10:51:28.067', '2023-12-18 18:01:54.28', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (18, 'Freddy  2', 'Sandagorda', 'Canedo', '', '', '71312725', 'freddy.sandagorda@caminosrl.com', 5, 6, '1980-11-29', 1, 2, '2023-12-18 18:01:54.467', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (19, 'Edwin', 'Rojas', '', '', '', '71339728', 'edwin.rojas@caminosrl.com', 16, 4, '1900-01-01', 0, 1, '2016-01-09 10:51:28.067', '2023-12-18 17:12:43.03', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (19, 'Edwin', 'Rojas', '', '', '', '7896543', 'edwin.rojas@caminosrl.com', 16, 4, '1900-01-01', 0, 2, '2023-12-18 17:12:34.29', '2023-12-19 08:39:39.207', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (19, 'Edwin2', 'Rojas', '', '', '', '7896543', 'edwin.rojas@caminosrl.com', 16, 4, '1900-01-01', 1, 3, '2023-12-19 08:39:39.39', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (20, 'Walter', 'Villarroel', '', '', '', '', 'walter.villarroel@caminosrl.com', 13, 4, '1900-01-01', 1, 1, '2016-01-09 10:51:28.067', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (21, 'Ricardo Adrian', 'Marquez', 'Duran', '', '', '', 'ricardo.marquez@caminosrl.com', 7, 4, '1900-01-01', 1, 1, '2016-01-09 10:51:28.067', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (22, 'Analia', 'Quinteros', 'Vargas', '', '', '71012059', 'analia.quinteros@caminosrl.com', 7, 4, '1900-01-01', 1, 1, '2016-01-09 10:51:28.067', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (23, 'Edson', 'Lora', 'Villagomez', '', '', '68922980', 'edson.lora@caminosrl.com', 17, 6, '1900-01-01', 1, 1, '2016-01-09 10:51:28.067', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (24, 'Eduardo', 'Zabala', '', '', '', '71313257', 'eduardo.zabala@caminosrl.com', 18, 6, '1900-01-01', 1, 1, '2016-01-09 10:51:28.067', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (25, 'Diego', 'Garcia', '', '', '', '71035122', 'diego.garcia@caminosrl.com', 19, 1, '1900-01-01', 0, 1, '2016-01-09 10:51:28.067', '2023-12-18 17:44:20.21', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (25, 'Diego', 'Garcia', '', '', '', '71035121', 'diego.garcia@caminosrl.com', 19, 1, '1900-01-01', 0, 2, '2023-12-18 17:40:56.193', '2023-12-18 17:44:20.21', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (25, 'Diego2', 'Garcia2', '', '', '', '71035120', 'diego.garcia@caminosrl.com', 19, 1, '1900-01-01', 1, 3, '2023-12-18 17:44:28.533', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (26, 'asdasd', 'asdasd', 'asdasdasd', 'dasdas', '123123', '123123', 'dasdadasd', 3, 3, '2000-01-01', 0, 1, '2016-02-25 20:02:30.097', '2016-02-25 20:04:44.733', NULL, 'por q me da la gana', 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (27, 'Pablo', 'Lazarte', 'Rivera', '', '', '70111111', 'pablo.lazarte@caminosrl.com', 1, 3, '1990-01-01', 1, 1, '2016-02-25 20:06:00.183', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (28, 'asdsad', 'cvhhdfgd', 'fcxzczx', 'fdgdfgfdg', '3223', '435345', 'fdfsd@safd.com', 2, 3, '1982-07-07', 1, 1, '2016-04-28 21:04:56.567', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (29, 'dfsdf', 'sdfsdfsd', 'fsdfsdf', 'dsfsdfsdf', '234234', '23423423', 'fdfdsfsd', 1, 1, '2015-08-08', 1, 1, '2016-04-28 22:11:45.21', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (30, 'nano', 'sandagorda', 'casdas', 'asdasdasdas', '34242', '23434535', 'fer@fafs.com', 5, 2, '1982-06-07', 1, 1, '2023-07-19 12:37:32.157', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (31, 'julio', 'rada', 'prueba', 'donde vive', '', '78945632', 'julio@ssss.com', 24, 9, '2000-01-01', 1, 1, '2023-12-06 11:35:58.537', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (32, 'Bruno Alexis', 'Lazcano', 'Santos', 'Cond. Remanso dos los jardines casa 47a', '3427944', '62199810', 'brlazca@hotmai.com', 10, 6, '1998-03-12', 1, 1, '2023-12-11 15:49:25.09', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (33, 'WEF', 'WEF', 'WFG2G', '2EFE', '23122', '131212', 'GWEFGRWRG', 1, 1, '1996-10-18', 1, 1, '2023-12-11 16:29:46.43', NULL, NULL, NULL, 1)
GO
INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (34, 'juan', 'sebastian', 'pedro', 'calle donde viveee', '35248596', '76065466', 'asdasd@zdasa.com', 10, 3, '1999-11-11', 0, 1, '2023-12-18 17:04:08.457', '2023-12-18 17:07:38.797', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Prioridad
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Prioridad (ID_Prioridad, Descripcion, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'Alta', 0, '2015-12-30 15:40:51.833', NULL, NULL, NULL)
GO
INSERT INTO Prioridad (ID_Prioridad, Descripcion, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'Media', 0, '2015-12-30 15:40:51.833', NULL, NULL, NULL)
GO
INSERT INTO Prioridad (ID_Prioridad, Descripcion, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 'Baja', 0, '2015-12-30 15:40:51.833', NULL, NULL, NULL)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  proyecto
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, '114-01', 'EL ESPINO - CHARAGUA', ' ubicacion 1', 1, 1, 1, 1, 0, 1, '2023-07-05 15:25:03.597', '2024-01-16 20:08:28.38', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, '114-01', 'EL ESPINO - CHARAGUA', 'ubicacion 1232342', 2, 1, 5, 3, 0, 2, '2024-01-16 20:07:49.043', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, '114-01', 'EL ESPINO - CHARAGUA', 'ubicacion 1232342', 2, 1, 5, 3, 0, 3, '2024-01-16 20:07:57.157', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, '114-01', 'EL ESPINO - CHARAGUA', 'ubicacion 1232342', 2, 1, 5, 3, 0, 4, '2024-01-16 20:08:02.79', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, '114-01', 'EL ESPINO - CHARAGUA', 'ubicacion 1232342', 2, 1, 5, 3, 0, 5, '2024-01-16 20:08:27.057', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, '114-01', 'EL ESPINO - CHARAGUA', 'ubicacion 1232342', 2, 1, 5, 3, 1, 6, '2024-01-16 20:08:28.42', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, '114-02', 'F.P.S CONT.SIST. M.TUCUMANCILLO', ' ubicacion 2', 1, 1, 1, 1, 0, 1, '2023-07-05 15:25:03.597', '2024-01-23 09:43:21.91', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, '114-02', 'F.P.S CONT.SIST. M.TUCUMANCILLO', 'ubicacion 7777', 1, 1, 1, 1, 0, 2, '2024-01-23 09:36:05.887', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, '114-02', 'F.P.S CONT.SIST. M.TUCUMANCILLO', 'ubicacion 8888', 1, 1, 1, 1, 0, 3, '2024-01-23 09:43:06.783', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, '114-02', 'F.P.S CONT.SIST. M.TUCUMANCILLO', 'ubicacion 8888', 1, 1, 1, 1, 1, 4, '2024-01-23 09:43:22.193', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (3, '114-03', 'SANTA ROSA-NAZARETH, GALILEA, SA', ' ubicacion 3', 1, 1, 1, 1, 0, 1, '2023-07-05 15:25:03.597', '2024-01-23 09:46:42.547', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (3, '114-03', 'SANTA ROSA-NAZARETH, GALILEA, SA', 'ubicacion 666', 1, 1, 1, 1, 0, 2, '2024-01-23 09:47:10.05', '2024-01-23 09:47:27.79', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (3, '114-03', 'SANTA ROSA-NAZARETH, GALILEA, SA', 'ubicacion 777', 1, 1, 1, 1, 0, 3, '2024-01-23 09:47:31.447', '2024-01-23 09:49:06.057', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (3, '114-03', 'SANTA ROSA-NAZARETH, GALILEA, SA', 'ubicacion 888', 1, 1, 1, 1, 0, 4, '2024-01-23 09:49:13.943', '2024-01-23 09:50:47.937', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (3, '114-03', 'SANTA ROSA-NAZARETH, GALILEA, SA', 'ubicacion 999', 1, 1, 1, 1, 0, 5, '2024-01-23 09:50:49.56', '2024-01-23 09:53:52.197', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (3, '114-03', 'SANTA ROSA-NAZARETH, GALILEA, SA', 'ubicacion 10', 1, 1, 1, 1, 1, 6, '2024-01-23 09:53:53.06', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (4, '114-04', 'ALCANTARILLADO SAIPINA-CONCLUSION', ' ubicacion 4', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (5, '114-05', 'MCSDC SAN IGNACIO LAS PETAS', ' ubicacion 5', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (6, '114-06', 'LA LAJITA', ' ubicacion 6', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (7, '114-07', 'MN 01 FG85A', ' ubicacion 7', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (8, '114-08', 'ALCANTARILLADO SANITARIO CONCE', ' ubicacion 8', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (9, '114-09', 'URBANIZACION BLANCA ROSA', ' ubicacion 9', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (10, '114-10', 'ABC PUENTE LIMON - YOTAU SUPERVISION', ' ubicacion 10', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (11, '114-11', 'GTB CONSTRUCCION CAMPAMENTO YEYU', ' ubicacion 11', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (12, '114-12', 'GOB. TESA CONSTRUCCION CARRETERA', ' ubicacion 12', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (13, '114-13', 'GTB CONS. OBRAS C. EN ESTACION', ' ubicacion 13', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (14, '114-14', 'GTB CONSTRUCCION CIVILES EN ES', ' ubicacion 14', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.597', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (15, '114-15', 'FPS MORO MORO LAS ABRAS AMPLIA', ' ubicacion 15', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (16, '114-16', 'AUDING -INTRAESA', ' ubicacion 16', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (17, '114-17', 'ISSA - CAMINO', ' ubicacion 17', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (18, '114-18', 'GOB. TESA CONSTRUCCION CAMINO C', ' ubicacion 18', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (19, '114-19', 'GOB. PAVIMENTO QUIRUSILLA', ' ubicacion 19', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (20, '114-20', 'GTB PROV. COL. GEOMEMBRANA EST. I', ' ubicacion 20', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (21, '114-21', 'COMARAPA MERCADO CAMPESINO', ' ubicacion 21', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (22, '114-22', 'YPFB - PETROANDINA - LIQUIMUNI II -', ' ubicacion 22', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (23, '114-23', 'ABC - SAN PEDRO LA ENCONADA', ' ubicacion 23', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (24, '114-24', 'COMARAPA CTM EST.PAV.RIG.CALLE', ' ubicacion 24', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (25, '114-25', 'FPS SANTA ROSA CONT. SIST. AGUA', ' ubicacion 25', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (26, '114-26', 'SAIPINA CONST. MERCADO MUNICIPAL', ' ubicacion 26', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (27, '114-27', 'POSTRERVALLE PAVIMENTO ARTICULADO', ' ubicacion 27', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (28, '114-28', 'MORO MORO PAVIMENTO CALLES', ' ubicacion 28', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (29, '114-29', 'FPS CONST. SIST. AGUA SANTA MONICA', ' ubicacion 29', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (30, '114-30', 'BYUCKSAM PUENTE BANEGAS', ' ubicacion 30', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (31, '114-31', 'GOB. CONST. DE CANALES DE RIEGO', ' ubicacion 31', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (32, '114-32', 'ABC ESTUDIO TESA MUTUN - PUERTO SUAREZ', ' ubicacion 32', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (33, '114-33', 'FPS SAAVEDRA SIST. AGUA', ' ubicacion 33', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (34, '114-34', 'ABC ESTUDIO TESA MINEROS VILLA', ' ubicacion 34', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (35, '114-35', 'FPS M. MORO CHAÑARA', ' ubicacion 35', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (36, '114-36', 'SAIPINA CONST. COLISEO CHILON', ' ubicacion 36', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (37, '114-37', 'QUIRUSILLA CTM TESA SIST. ALCANTARILLADO', ' ubicacion 37', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (38, '114-38', 'SAIPINA KINDER SANTA ROSA', ' ubicacion 38', 1, 1, 1, 1, 1, 1, '2023-07-05 15:25:03.6', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (39, '1010', 'prueba proy', 'prueba de ubicacion', 1, 2, 3, 2, 0, 1, '2023-07-26 15:19:10.267', '2023-07-26 15:26:12.473', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (39, '10109', 'prueba proyecto', 'prueba de ubicacion', 3, 5, 6, 3, 1, 2, '2023-07-26 15:26:39.563', NULL, NULL, NULL, 1)
GO
INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (40, '311', 'Senkata Hospital Segundo Nivel', 'LA PAZ, EL ALTO, DISTRITO 8 VENTILLA', 3, 6, 8, 5, 1, 1, '2024-01-16 19:28:11.833', NULL, NULL, NULL, 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Solicitud
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Solicitud (ID_Solicitud, ID_Proyecto, usr_Solicitud, id_solicitante, descripcion, id_director, id_empresa, Fecha_Entrega, Estado_Solicitud, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh) VALUES (1, 1, 1, 1, 'prueba de solicitud', 1, 1, '2023-11-16', 'A', 1, 1, '2023-09-13 16:09:31.523', '2023-09-13 16:10:20.747', 1)
GO
INSERT INTO Solicitud (ID_Solicitud, ID_Proyecto, usr_Solicitud, id_solicitante, descripcion, id_director, id_empresa, Fecha_Entrega, Estado_Solicitud, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh) VALUES (2, 1, 1, 1, 'Pedido 2', 1, 1, '2023-12-15', 'A', 1, 1, '2023-11-29 09:06:42.833', '2023-11-29 11:03:31.677', 1)
GO
INSERT INTO Solicitud (ID_Solicitud, ID_Proyecto, usr_Solicitud, id_solicitante, descripcion, id_director, id_empresa, Fecha_Entrega, Estado_Solicitud, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh) VALUES (3, 1, 1, 1, 'prueba 2', 1, 1, '2024-01-13', 'A', 1, 1, '2023-12-27 09:24:24.35', '2024-01-23 16:16:26.117', 1)
GO
INSERT INTO Solicitud (ID_Solicitud, ID_Proyecto, usr_Solicitud, id_solicitante, descripcion, id_director, id_empresa, Fecha_Entrega, Estado_Solicitud, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh) VALUES (4, 1, 1, 1, 'hola como estas pureba 1', 1, 1, '2024-01-26', 'A', 1, 1, '2024-01-19 17:33:34.91', '2024-01-23 16:18:20.733', 1)
GO
INSERT INTO Solicitud (ID_Solicitud, ID_Proyecto, usr_Solicitud, id_solicitante, descripcion, id_director, id_empresa, Fecha_Entrega, Estado_Solicitud, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh) VALUES (5, 1, 1, 1, 'KYKYUGHBLB', 1, 1, '2024-01-24', 'S', 1, 1, '2024-01-24 14:45:51.94', NULL, NULL)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Solicitud_Autorizaciones
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Solicitud_Autorizaciones (Cod_Solicitud, ID_Proyecto, ID_empresa, Cod_Persona, Autorizo, Estado, Fecha_Registro, Fecha_Autorizacion, Observacion, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 1, 1, 1, 'S', 1, '2023-09-13 16:09:39.477', '2023-09-13 16:10:14.297', NULL, NULL, NULL, NULL)
GO
INSERT INTO Solicitud_Autorizaciones (Cod_Solicitud, ID_Proyecto, ID_empresa, Cod_Persona, Autorizo, Estado, Fecha_Registro, Fecha_Autorizacion, Observacion, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 1, 1, 1, 'S', 1, '2023-11-29 09:06:42.84', '2023-11-29 11:03:31.647', NULL, NULL, NULL, NULL)
GO
INSERT INTO Solicitud_Autorizaciones (Cod_Solicitud, ID_Proyecto, ID_empresa, Cod_Persona, Autorizo, Estado, Fecha_Registro, Fecha_Autorizacion, Observacion, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 1, 1, 1, 'S', 1, '2023-12-27 09:24:24.743', '2024-01-23 16:16:25.953', NULL, NULL, NULL, NULL)
GO
INSERT INTO Solicitud_Autorizaciones (Cod_Solicitud, ID_Proyecto, ID_empresa, Cod_Persona, Autorizo, Estado, Fecha_Registro, Fecha_Autorizacion, Observacion, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 1, 1, 1, 'S', 1, '2024-01-19 17:33:34.92', '2024-01-23 16:18:20.577', NULL, NULL, NULL, NULL)
GO
INSERT INTO Solicitud_Autorizaciones (Cod_Solicitud, ID_Proyecto, ID_empresa, Cod_Persona, Autorizo, Estado, Fecha_Registro, Fecha_Autorizacion, Observacion, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (5, 1, 1, 1, 'N', 1, '2024-01-24 14:45:51.95', NULL, NULL, NULL, NULL, NULL)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  tipo_transaccion
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO tipo_transaccion (ID_TipoTransaccion, TipoTransaccion, sigla, Descripcion, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa) VALUES (1, 'Ingreso de Material', 'INGRESO', 'Ingresos al almacen principal de Materiales', 1, 1, '2023-08-24 09:24:26.887', 1, NULL, 1)
GO
INSERT INTO tipo_transaccion (ID_TipoTransaccion, TipoTransaccion, sigla, Descripcion, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa) VALUES (2, 'Salida de Material', 'SALIDA', 'Salidas de almacen de Materiales', 1, 1, '2023-08-24 09:24:26.887', 1, NULL, 1)
GO
INSERT INTO tipo_transaccion (ID_TipoTransaccion, TipoTransaccion, sigla, Descripcion, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa) VALUES (3, 'Traspasos de Materiales', 'TRASPASO', 'Traspasos de almacen a Almacen', 1, 1, '2023-08-24 09:24:26.887', 1, NULL, 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  transaccion
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO transaccion (ID_transaccion, Fecha, tipo_transaccion_ID, Nro_Orden_Origen, Almacen_Origen, Almacen_Destino, Recibe_Material, Descripcion, Importe_Total, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa) VALUES (1, '2023-08-26 09:33:35.473', 1, 12356, 0, 1, 1, 'Prueba de ingresos de almacen', 138, 1, 1, '2023-08-26 09:33:37.003', 1, NULL, 1)
GO
INSERT INTO transaccion (ID_transaccion, Fecha, tipo_transaccion_ID, Nro_Orden_Origen, Almacen_Origen, Almacen_Destino, Recibe_Material, Descripcion, Importe_Total, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa) VALUES (2, '2023-12-22 10:48:25.567', 1, 234234, 0, 1, 1, 'dfsd sfdsdfsdfsd', 54, 1, 1, '2023-12-22 10:48:25.567', 1, NULL, 1)
GO
INSERT INTO transaccion (ID_transaccion, Fecha, tipo_transaccion_ID, Nro_Orden_Origen, Almacen_Origen, Almacen_Destino, Recibe_Material, Descripcion, Importe_Total, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa) VALUES (3, '2023-12-22 10:48:59.79', 1, 0, 0, 0, 1, '', 54, 1, 1, '2023-12-22 10:48:59.79', 1, NULL, 1)
GO
INSERT INTO transaccion (ID_transaccion, Fecha, tipo_transaccion_ID, Nro_Orden_Origen, Almacen_Origen, Almacen_Destino, Recibe_Material, Descripcion, Importe_Total, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa) VALUES (4, '2023-12-22 11:00:24.867', 1, 986532, 0, 1, 1, 'nueva prueba', 224, 1, 1, '2023-12-22 11:00:24.867', 1, NULL, 1)
GO
INSERT INTO transaccion (ID_transaccion, Fecha, tipo_transaccion_ID, Nro_Orden_Origen, Almacen_Origen, Almacen_Destino, Recibe_Material, Descripcion, Importe_Total, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa) VALUES (5, '2023-12-22 16:15:51.693', 3, 345456, 1, 2, 1, 'de principal a 2', 0, 1, 1, '2023-12-22 16:15:51.693', 1, NULL, 1)
GO
INSERT INTO transaccion (ID_transaccion, Fecha, tipo_transaccion_ID, Nro_Orden_Origen, Almacen_Origen, Almacen_Destino, Recibe_Material, Descripcion, Importe_Total, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa) VALUES (6, '2024-01-19 17:43:48.027', 1, 324, 0, 1, 1, 'FACTURA NUMERO 32', 360000, 1, 1, '2024-01-19 17:43:48.027', 1, NULL, 1)
GO
INSERT INTO transaccion (ID_transaccion, Fecha, tipo_transaccion_ID, Nro_Orden_Origen, Almacen_Origen, Almacen_Destino, Recibe_Material, Descripcion, Importe_Total, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa) VALUES (7, '2024-01-19 17:46:12.997', 3, 32, 1, 3, 1, 'UUGIUYBHB', 0, 1, 1, '2024-01-19 17:46:12.997', 1, NULL, 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  transaccion_Detalle
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (1, 5, 4, 12, 3, 36, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (1, 20, 9, 34, 3, 102, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (2, 4, 2, 4, 6, 24, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (2, 11, 4, 5, 6, 30, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (3, 4, 2, 4, 6, 24, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (3, 11, 4, 5, 6, 30, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (4, 4, 3, 34, 5, 170, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (4, 7, 5, 9, 6, 54, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (5, 4, 4, 3, 0, 0, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (5, 16, 12, 5, 0, 0, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (6, 8, 6, 30000, 12, 360000, 1)
GO
INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa) VALUES (7, 118, 3, 43335, 0, 0, 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Unidad
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'BARRA DE 12 mm', 0, 1, '2016-01-13 20:41:04.417', '2016-01-13 20:41:14.303', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'BARRA DE 12 mm_', 0, 2, '2016-01-13 20:41:14.357', '2024-01-23 10:44:44.16', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (1, 'BARRA DE 12 mm', 1, 3, '2024-01-23 10:44:44.463', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'BARRA DE 6 mm', 0, 1, '2016-01-13 20:41:04.44', '2016-01-13 20:43:47.073', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'BARRA DE 6 mm_', 0, 2, '2016-01-13 20:43:47.087', '2024-01-23 10:46:03.267', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (2, 'BARRA DE 6 mm', 1, 3, '2024-01-23 10:46:03.557', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 'BARRA DE 8 mm', 0, 1, '2016-01-13 20:41:04.44', '2016-01-13 20:44:28.383', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (3, 'BARRA DE 8 mm_', 1, 2, '2016-01-13 20:44:29.907', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 'BOLSA ', 0, 1, '2016-01-13 20:41:04.44', '2016-01-13 20:45:54.5', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (4, 'BOLSA_', 1, 2, '2016-01-13 20:45:54.537', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (5, 'DOCENA', 1, 1, '2016-01-13 20:41:04.443', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (6, 'EQUIPO', 1, 1, '2016-01-13 20:41:04.443', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (7, 'GLOBAL', 1, 1, '2016-01-13 20:41:04.443', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (8, 'JUEGO', 1, 1, '2016-01-13 20:41:04.443', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (9, 'Kg', 1, 1, '2016-01-13 20:41:04.443', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (10, 'm.', 0, 1, '2016-01-13 20:41:04.493', '2024-01-23 09:59:51.767', NULL, 'MODIFICACION DE DATOS POR USUARIO')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (10, 'mt', 1, 2, '2024-01-23 09:59:52.07', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (11, 'm2.', 1, 1, '2016-01-13 20:41:04.493', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (12, 'm3.', 1, 1, '2016-01-13 20:41:04.497', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (13, 'PIE 2', 1, 1, '2016-01-13 20:41:04.497', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (14, 'PIE 3', 1, 1, '2016-01-13 20:41:04.497', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (15, 'PIEZA', 1, 1, '2016-01-13 20:41:04.497', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (16, 'ROLLO', 1, 1, '2016-01-13 20:41:04.497', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (17, 'TONELADA', 1, 1, '2016-01-13 20:41:04.497', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (18, 'UNIDAD', 1, 1, '2016-01-13 20:41:04.5', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (19, 'fcvxv', 1, 1, '2016-02-25 19:59:27.223', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (20, 'gggg', 1, 1, '2016-02-25 20:00:33.97', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (21, 'sdsdsd', 1, 1, '2016-04-28 20:29:14.907', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (22, 'asdasdasd', 1, 1, '2016-04-28 21:04:16.667', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (23, 'ggvvs', 1, 1, '2016-04-28 21:33:45.557', NULL, NULL, NULL)
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (24, 'uuuuuuuuuuuuuuu', 0, 1, '2016-04-28 22:09:34.403', '2024-01-16 19:33:39.51', NULL, '')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (25, 'paq', 0, 1, '2024-01-16 19:43:06.837', '2024-01-16 19:43:33.223', NULL, '')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (26, 'paq', 0, 1, '2024-01-16 19:43:07.077', '2024-01-16 19:43:12.537', NULL, '')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (27, 'paq', 0, 1, '2024-01-16 19:43:16.23', '2024-01-16 19:43:26.577', NULL, '')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (28, 'paq', 0, 1, '2024-01-16 19:43:28.747', '2024-01-16 19:43:45.167', NULL, '')
GO
INSERT INTO Unidad (Cod_unidad, Descripcion, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES (29, 'paq', 1, 1, '2024-01-16 19:45:11.11', NULL, NULL, NULL)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  usuario
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (1, 'admin', 'admin', 1, 1, 1, '2016-02-06 10:25:47.73', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (2, 'usr2', 'admin', 2, 1, 1, '2016-02-06 10:25:47.73', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (4, 'usr4', 'admin', 4, 0, 1, '2016-02-06 10:25:47.73', '2024-01-16 19:11:57.45', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (4, 'jalmacen', 'Hola1234*', 4, 1, 2, '2024-01-16 19:11:57.46', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (5, 'usr5', 'admin', 5, 0, 1, '2016-02-06 10:25:47.73', '2024-01-16 20:01:33.387', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (5, 'almacen1', 'pepe12#', 5, 1, 2, '2024-01-16 19:13:43.757', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (5, 'almacen1', 'pepe12', 5, 1, 3, '2024-01-16 19:59:40.2', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (5, 'almacen1', 'PassPruebaCamino', 5, 1, 4, '2024-01-16 20:01:33.393', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (6, 'usr6', 'admin', 6, 0, 1, '2016-02-06 10:25:47.73', '2024-02-01 14:24:16.007', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (6, 'usrdaniel', 'asdasdas', 6, 1, 2, '2024-02-01 14:24:16.413', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (7, 'usr7', 'admin', 7, 0, 1, '2016-02-06 10:25:47.73', '2016-04-28 21:06:06.87', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (7, 'usr7', 'admin', 7, 1, 2, '2016-04-28 21:06:06.87', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (8, 'usredson', 'admin', 23, 1, 1, '2016-02-13 09:29:15.82', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (9, 'freddysc', 'admin', 18, 1, 1, '2016-02-24 21:20:08.997', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (10, 'marcelosc', 'admin', 17, 1, 1, '2016-02-25 21:20:59.093', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (11, 'eencinas', 'admin', 10, 1, 1, '2016-02-25 21:22:12.45', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (12, 'ezabala', 'admin', 24, 0, 1, '2016-02-25 21:23:27.433', '2024-02-01 12:00:49.763', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (12, 'ezabala', 'hola', 24, 0, 2, '2024-02-01 12:00:50.123', '2024-02-01 12:01:21.827', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (12, 'ssss', 'asdasdasd', 12, 1, 3, '2024-02-01 12:01:22.197', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (13, 'dgarcia', 'admin', 25, 1, 1, '2016-02-25 21:23:55.41', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (14, 'plazarte', 'admin', 27, 1, 1, '2016-02-25 21:24:34.827', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (15, 'mvillegas', 'admin', 3, 0, 1, '2016-02-25 21:30:30.623', '2024-02-01 12:01:54.89', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (15, 'bmv', 'hola', 3, 1, 2, '2024-02-01 12:01:55.257', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (16, 'sssssss', 'admin', 25, 1, 1, '2016-04-28 20:29:49.497', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (17, 'ferfsc', '202cb962ac59075b964b07152d234b70', 30, 0, 1, '2023-07-19 13:40:27.907', '2024-02-01 12:02:18.48', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (17, 'ferfsc', 'holaaaaa', 30, 1, 2, '2024-02-01 12:02:18.833', NULL, NULL, NULL, 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (18, 'nano', 'nano', 30, 0, 1, '2023-07-26 09:52:05.443', '2023-07-26 09:56:39.83', NULL, 'MODIFICACION DE DATOS POR USUARIO', 1)
GO
INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) VALUES (18, 'nano', 'hola', 30, 1, 2, '2023-07-26 09:56:39.843', NULL, NULL, NULL, 1)
GO
-- Server: 54.39.13.250\MSSQLSERVER2022
-- Table:  Usuario_Opcion
-- Date:   28/05/2024 09:35 p. m.

INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (0, 9)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (0, 10)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (0, 11)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (0, 12)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (0, 13)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (0, 14)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (1, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (1, 8)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (1, 9)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (1, 10)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (1, 11)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (1, 12)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (1, 13)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (1, 14)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (1, 15)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (2, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (2, 8)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (2, 9)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (2, 10)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (2, 11)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (2, 12)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (2, 13)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (2, 14)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (2, 15)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (3, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (3, 8)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (3, 14)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (3, 15)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (4, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (4, 8)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (4, 14)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (4, 15)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (5, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (5, 4)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (5, 8)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (5, 9)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (5, 10)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (5, 11)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (5, 12)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (5, 13)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (5, 14)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (5, 15)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (6, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (6, 4)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (6, 8)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (6, 9)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (6, 10)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (6, 11)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (6, 12)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (6, 13)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (6, 14)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (6, 15)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (8, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (8, 8)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (8, 9)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (8, 10)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (8, 11)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (8, 12)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (8, 13)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (8, 14)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (8, 15)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (9, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (9, 4)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (9, 8)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (9, 9)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (9, 10)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (9, 11)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (9, 12)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (9, 13)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (9, 14)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (9, 15)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (10, 9)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (10, 10)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (10, 11)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (10, 12)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (10, 13)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (10, 14)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (11, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (12, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (13, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (14, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (15, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (17, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (18, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (19, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (19, 4)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (19, 8)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (19, 15)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (20, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (20, 15)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (21, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (22, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (22, 17)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (23, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (24, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (25, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (26, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (27, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (28, 1)
GO
INSERT INTO Usuario_Opcion (idOpcion, cod_Usuario) VALUES (29, 1)
GO

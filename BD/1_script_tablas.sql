IF OBJECT_ID ('dbo.actividad') IS NOT NULL
	DROP TABLE dbo.actividad
GO

CREATE TABLE dbo.actividad
	(
	id_actividad     INT NOT NULL,
	id_Proyecto      INT NOT NULL,
	nombre_actividad VARCHAR (100) NOT NULL,
	sec_actividad    INT NOT NULL,
	estado_actividad INT NOT NULL,
	descripcion      VARCHAR (600) NULL,
	fecha_ini        DATETIME NOT NULL,
	fecha_fin        DATETIME NOT NULL,
	duracion         DECIMAL (10, 2) NULL,
	id_grupo         INT NOT NULL,
	id_modulo        INT NOT NULL,
	contratista      INT NOT NULL,
	precio_unitario  DECIMAL (10, 2) NULL,
	cantidad         DECIMAL (10, 2) NULL,
	precio_mano_obra DECIMAL (10, 2) NULL,
	forma_pago       INT NOT NULL,
	costo_mano_obra  DECIMAL (10, 2) NULL,
	costo_material   DECIMAL (10, 2) NULL,
	costo_maquinaria DECIMAL (10, 2) NULL,
	unidad           INT NOT NULL,
	estado           INT NOT NULL,
	sec              INT NOT NULL,
	fecha_alta       DATETIME NOT NULL,
	usr_alta         INT NOT NULL,
	id_empresa       INT NOT NULL,
	PRIMARY KEY (id_actividad)
	)
GO

IF OBJECT_ID ('dbo.Almacen') IS NOT NULL
	DROP TABLE dbo.Almacen
GO

CREATE TABLE dbo.Almacen
	(
	id_Almacen     INT NOT NULL,
	Nombre_Almacen VARCHAR (100) NULL,
	ubicacion      VARCHAR (100) NOT NULL,
	es_principal   TINYINT NOT NULL,
	id_encargado   INT NOT NULL,
	direccion      VARCHAR (300) NULL,
	telefono_1     VARCHAR (15) NULL,
	telefono_2     VARCHAR (15) NULL,
	id_empresa     INT NOT NULL,
	sec            INT NOT NULL,
	estado         INT NOT NULL,
	fecha_alta     DATETIME NOT NULL,
	usr_alta       INT NOT NULL,
	PRIMARY KEY (id_Almacen, sec, estado)
	)
GO

IF OBJECT_ID ('dbo.Almacen_Producto') IS NOT NULL
	DROP TABLE dbo.Almacen_Producto
GO

CREATE TABLE dbo.Almacen_Producto
	(
	ID_Almacen_Producto INT NOT NULL,
	Transaccion_ID      INT NOT NULL,
	Almacen_ID          INT NOT NULL,
	Producto_ID         INT NOT NULL,
	Unidad_ID           INT NOT NULL,
	Stock               DECIMAL (10, 2) NOT NULL,
	Fecha_Ingreso       DATETIME NOT NULL,
	sec                 INT NOT NULL,
	Estado              INT NOT NULL,
	id_empresa          INT NOT NULL,
	PRIMARY KEY (ID_Almacen_Producto, sec, Estado, id_empresa)
	)
GO

IF OBJECT_ID ('dbo.Area') IS NOT NULL
	DROP TABLE dbo.Area
GO

CREATE TABLE dbo.Area
	(
	ID_Area        INT NOT NULL,
	Descripcion    VARCHAR (50) NOT NULL,
	Estado         INT NOT NULL,
	Secuencia      INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	Motivo_Desh    VARCHAR (100) NULL,
	PRIMARY KEY (ID_Area, Estado, Secuencia)
	)
GO

IF OBJECT_ID ('dbo.Area_Cargo') IS NOT NULL
	DROP TABLE dbo.Area_Cargo
GO

CREATE TABLE dbo.Area_Cargo
	(
	ID_Area        INT NOT NULL,
	ID_cargo       INT NOT NULL,
	Estado         INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	Motivo_Desh    VARCHAR (100) NULL,
	PRIMARY KEY (ID_Area, ID_cargo)
	)
GO

IF OBJECT_ID ('dbo.Autorizadores') IS NOT NULL
	DROP TABLE dbo.Autorizadores
GO

CREATE TABLE dbo.Autorizadores
	(
	Cod_Autorizacion INT NOT NULL,
	Cod_Prioridad    INT NOT NULL,
	Estado           INT NOT NULL,
	Fecha_Registro   DATETIME NOT NULL,
	Fecha_Desh       DATETIME NULL,
	usr_desh         INT NULL,
	Motivo_Desh      VARCHAR (100) NULL,
	PRIMARY KEY (Cod_Autorizacion)
	)
GO

IF OBJECT_ID ('dbo.Cargo') IS NOT NULL
	DROP TABLE dbo.Cargo
GO

CREATE TABLE dbo.Cargo
	(
	ID_cargo       INT NOT NULL,
	Descripcion    VARCHAR (50) NOT NULL,
	Estado         INT NOT NULL,
	Secuencia      INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	Motivo_Desh    VARCHAR (100) NULL,
	PRIMARY KEY (ID_cargo, Estado, Secuencia)
	)
GO

IF OBJECT_ID ('dbo.cliente') IS NOT NULL
	DROP TABLE dbo.cliente
GO

CREATE TABLE dbo.cliente
	(
	id_cliente     INT NOT NULL,
	Nombre_cliente VARCHAR (100) NOT NULL,
	tipo_persona   TINYINT NOT NULL,
	Nro_Doc        VARCHAR (20) NOT NULL,
	direccion      VARCHAR (100) NOT NULL,
	telefono       VARCHAR (15) NOT NULL,
	mail           VARCHAR (100) NULL,
	estado         INT NOT NULL,
	sec            INT NOT NULL,
	fecha_alta     DATETIME NOT NULL,
	usr_alta       INT NOT NULL,
	id_empresa     INT NOT NULL,
	PRIMARY KEY (id_cliente)
	)
GO

IF OBJECT_ID ('dbo.contratista') IS NOT NULL
	DROP TABLE dbo.contratista
GO

CREATE TABLE dbo.contratista
	(
	id_contratista     INT NOT NULL,
	Nombre_contratista VARCHAR (100) NOT NULL,
	Nro_Doc            VARCHAR (20) NOT NULL,
	direccion          VARCHAR (100) NOT NULL,
	telefono           VARCHAR (15) NOT NULL,
	especialidad       VARCHAR (100) NOT NULL,
	Codigo_banco       VARCHAR (10) NULL,
	nro_cuenta         VARCHAR (25) NULL,
	tipo_seguro        INT NOT NULL,
	nro_seguro         VARCHAR (20) NULL,
	emite_factura      TINYINT NULL,
	mail               VARCHAR (100) NULL,
	estado             INT NOT NULL,
	sec                INT NOT NULL,
	fecha_alta         DATETIME NOT NULL,
	usr_alta           INT NOT NULL,
	id_empresa         INT NOT NULL,
	PRIMARY KEY (id_contratista)
	)
GO

IF OBJECT_ID ('dbo.Detalle_Autorizadores') IS NOT NULL
	DROP TABLE dbo.Detalle_Autorizadores
GO

CREATE TABLE dbo.Detalle_Autorizadores
	(
	Cod_Detalle_Autorizadores INT NOT NULL,
	Cod_Autorizacion          INT NOT NULL,
	Secuencia                 INT NOT NULL,
	Cod_Persona               INT NOT NULL,
	Estado                    INT NOT NULL,
	Fecha_Registro            DATETIME NOT NULL,
	Fecha_Desh                DATETIME NULL,
	usr_desh                  INT NULL,
	Motivo_Desh               VARCHAR (100) NULL,
	PRIMARY KEY (Cod_Detalle_Autorizadores)
	)
GO

IF OBJECT_ID ('dbo.Detalle_Solicitud') IS NOT NULL
	DROP TABLE dbo.Detalle_Solicitud
GO

CREATE TABLE dbo.Detalle_Solicitud
	(
	ID_Solicitud   INT NOT NULL,
	Cod_Material   INT NOT NULL,
	Cod_Unidad     INT NOT NULL,
	Item           INT NOT NULL,
	Cantidad       DECIMAL (10, 2) NOT NULL,
	id_actividad   INT NOT NULL,
	id_empresa     INT NOT NULL,
	Estado         INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	Motivo_Desh    VARCHAR (100) NULL,
	PRIMARY KEY (ID_Solicitud, Cod_Material, Item, Estado, id_empresa)
	)
GO

IF OBJECT_ID ('dbo.empresa') IS NOT NULL
	DROP TABLE dbo.empresa
GO

CREATE TABLE dbo.empresa
	(
	id_empresa  INT NOT NULL,
	nombre      VARCHAR (100) NOT NULL,
	estado      INT NOT NULL,
	observacion VARCHAR (100) NOT NULL,
	sec         INT NOT NULL,
	fecha_alta  DATETIME NOT NULL,
	usr_alta    INT NOT NULL
	)
GO

IF OBJECT_ID ('dbo.fases') IS NOT NULL
	DROP TABLE dbo.fases
GO

CREATE TABLE dbo.fases
	(
	id_fase        INT NOT NULL,
	id_proyecto    INT NOT NULL,
	nombre         VARCHAR (100) NOT NULL,
	sec_proyecto   INT NOT NULL,
	estado         INT NOT NULL,
	duracion_total DECIMAL (10, 2) NULL,
	id_encargago   INT NOT NULL,
	observacion    VARCHAR (100) NOT NULL,
	sec            INT NOT NULL,
	fecha_alta     DATETIME NOT NULL,
	usr_alta       INT NOT NULL,
	id_empresa     INT NOT NULL,
	CONSTRAINT fases_pk PRIMARY KEY (id_fase)
	)
GO

IF OBJECT_ID ('dbo.grupo') IS NOT NULL
	DROP TABLE dbo.grupo
GO

CREATE TABLE dbo.grupo
	(
	id_grupo    INT NOT NULL,
	NombreGrupo VARCHAR (100) NULL,
	id_proyecto INT NOT NULL,
	id_empresa  INT NOT NULL,
	sec         INT NOT NULL,
	estado      INT NOT NULL,
	fecha_alta  DATETIME NOT NULL,
	usr_alta    INT NOT NULL,
	PRIMARY KEY (id_grupo)
	)
GO

IF OBJECT_ID ('dbo.Lugar_Entrega') IS NOT NULL
	DROP TABLE dbo.Lugar_Entrega
GO

CREATE TABLE dbo.Lugar_Entrega
	(
	ID_Lugar       INT NOT NULL,
	Nombre_Lugar   VARCHAR (70) NOT NULL,
	Estado         INT NOT NULL,
	Secuencia      INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	Motivo_Desh    VARCHAR (100) NULL,
	PRIMARY KEY (ID_Lugar, Estado, Secuencia)
	)
GO

IF OBJECT_ID ('dbo.Material') IS NOT NULL
	DROP TABLE dbo.Material
GO

CREATE TABLE dbo.Material
	(
	id_proyecto        INT NOT NULL,
	Cod_Material       INT NOT NULL,
	Nombre_Material    VARCHAR (100) NOT NULL,
	Unidad             INT NOT NULL,
	precio_unitario    DECIMAL (10, 2) NULL,
	id_grupo           INT NOT NULL,
	stock_minimo       DECIMAL (10, 2) NULL,
	Cant_presupuestada DECIMAL (10, 2) NULL,
	Estado             INT NOT NULL,
	Secuencia          INT NOT NULL,
	Fecha_Registro     DATETIME NOT NULL,
	Fecha_Desh         DATETIME NULL,
	usr_desh           INT NULL,
	Motivo_Desh        VARCHAR (100) NULL,
	id_empresa         INT NOT NULL,
	PRIMARY KEY (id_proyecto, Cod_Material, Estado, Secuencia)
	)
GO

IF OBJECT_ID ('dbo.modulo') IS NOT NULL
	DROP TABLE dbo.modulo
GO

CREATE TABLE dbo.modulo
	(
	id_modulo    INT NOT NULL,
	Nombremodulo VARCHAR (100) NULL,
	id_proyecto  INT NOT NULL,
	id_empresa   INT NOT NULL,
	sec          INT NOT NULL,
	estado       INT NOT NULL,
	fecha_alta   DATETIME NOT NULL,
	usr_alta     INT NOT NULL,
	PRIMARY KEY (id_modulo)
	)
GO

IF OBJECT_ID ('dbo.Observaciones') IS NOT NULL
	DROP TABLE dbo.Observaciones
GO

CREATE TABLE dbo.Observaciones
	(
	Cod_Observaciones INT NOT NULL,
	Descripcion       VARCHAR (50) NULL,
	Estado            INT NOT NULL,
	Secuencia         INT NOT NULL,
	Fecha_Registro    DATETIME NOT NULL,
	Fecha_Desh        DATETIME NULL,
	usr_desh          INT NULL,
	Motivo_Desh       VARCHAR (100) NULL,
	PRIMARY KEY (Cod_Observaciones, Estado, Secuencia)
	)
GO

IF OBJECT_ID ('dbo.OpcionesMenu') IS NOT NULL
	DROP TABLE dbo.OpcionesMenu
GO

CREATE TABLE dbo.OpcionesMenu
	(
	idOpcion      INT NOT NULL,
	textoOpcion   VARCHAR (100) NOT NULL,
	idOpcionPadre INT NULL,
	pantalla      VARCHAR (100) NOT NULL,
	imagen1       VARCHAR (100) NULL,
	imagen2       VARCHAR (100) NULL,
	imagenOver    VARCHAR (100) NULL,
	valido        BIT NOT NULL,
	mostrar       BIT NOT NULL,
	pantallaNueva VARCHAR (100) NULL,
	PRIMARY KEY (idOpcion)
	)
GO

IF OBJECT_ID ('dbo.Personal') IS NOT NULL
	DROP TABLE dbo.Personal
GO

CREATE TABLE dbo.Personal
	(
	ID_Personal    INT NOT NULL,
	Nombres        VARCHAR (50) NOT NULL,
	Ap_Paterno     VARCHAR (50) NOT NULL,
	Ap_Materno     VARCHAR (50) NULL,
	Direccion      VARCHAR (100) NULL,
	Tel_Fijo       VARCHAR (15) NULL,
	Tel_Movil      VARCHAR (15) NULL,
	Mail           VARCHAR (50) NULL,
	ID_Cargo       INT NOT NULL,
	ID_Area        INT NOT NULL,
	Fecha_Nac      DATETIME NULL,
	Estado         INT NOT NULL,
	Secuencia      INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	Motivo_Desh    VARCHAR (100) NULL,
	id_empresa     INT CONSTRAINT DF_Personal_id_empresa DEFAULT ((1)) NOT NULL,
	PRIMARY KEY (ID_Personal, Estado, Secuencia)
	)
GO

IF OBJECT_ID ('dbo.Prioridad') IS NOT NULL
	DROP TABLE dbo.Prioridad
GO

CREATE TABLE dbo.Prioridad
	(
	ID_Prioridad   INT NOT NULL,
	Descripcion    VARCHAR (50) NOT NULL,
	Estado         INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	Motivo_Desh    VARCHAR (100) NULL,
	PRIMARY KEY (ID_Prioridad)
	)
GO

IF OBJECT_ID ('dbo.proyecto') IS NOT NULL
	DROP TABLE dbo.proyecto
GO

CREATE TABLE dbo.proyecto
	(
	ID_proyecto    INT NOT NULL,
	Cod_proyecto   VARCHAR (10) NOT NULL,
	Nomb_Proyecto  VARCHAR (100) NOT NULL,
	Ubicacion      VARCHAR (300) NOT NULL,
	Id_cliente     INT NOT NULL,
	Id_Director    INT NOT NULL,
	Id_Fiscal      INT NOT NULL,
	Id_Almacen     INT NOT NULL,
	Estado         INT NOT NULL,
	Secuencia      INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	Motivo_Desh    VARCHAR (100) NULL,
	id_empresa     INT NOT NULL,
	PRIMARY KEY (ID_proyecto, Estado, Secuencia)
	)
GO

IF OBJECT_ID ('dbo.Solicitud') IS NOT NULL
	DROP TABLE dbo.Solicitud
GO

CREATE TABLE dbo.Solicitud
	(
	ID_Solicitud     INT NOT NULL,
	ID_Proyecto      INT NOT NULL,
	usr_Solicitud    INT NOT NULL,
	id_solicitante   INT NOT NULL,
	descripcion      VARCHAR (300) NULL,
	id_director      INT NOT NULL,
	id_empresa       INT NOT NULL,
	Fecha_Entrega    DATETIME NOT NULL,
	Estado_Solicitud CHAR (1) NOT NULL,
	Estado           INT NOT NULL,
	Secuencia        INT NOT NULL,
	Fecha_Registro   DATETIME NOT NULL,
	Fecha_Desh       DATETIME NULL,
	usr_desh         INT NULL,
	PRIMARY KEY (ID_Solicitud, Estado, Secuencia, id_empresa)
	)
GO

IF OBJECT_ID ('dbo.Solicitud_Autorizaciones') IS NOT NULL
	DROP TABLE dbo.Solicitud_Autorizaciones
GO

CREATE TABLE dbo.Solicitud_Autorizaciones
	(
	Cod_Solicitud      INT NOT NULL,
	ID_Proyecto        INT NOT NULL,
	ID_empresa         INT NOT NULL,
	Cod_Persona        INT NOT NULL,
	Autorizo           CHAR (1) NULL,
	Estado             INT NOT NULL,
	Fecha_Registro     DATETIME NOT NULL,
	Fecha_Autorizacion DATETIME NULL,
	Observacion        VARCHAR (500) NULL,
	Fecha_Desh         DATETIME NULL,
	usr_desh           INT NULL,
	Motivo_Desh        VARCHAR (100) NULL,
	CONSTRAINT pk_Solicitud_Autorizaciones PRIMARY KEY (Cod_Solicitud, ID_empresa, Estado)
	)
GO

IF OBJECT_ID ('dbo.tipo_transaccion') IS NOT NULL
	DROP TABLE dbo.tipo_transaccion
GO

CREATE TABLE dbo.tipo_transaccion
	(
	ID_TipoTransaccion INT NOT NULL,
	TipoTransaccion    VARCHAR (100) NOT NULL,
	sigla              VARCHAR (10) NOT NULL,
	Descripcion        VARCHAR (300) NULL,
	estado             INT NOT NULL,
	sec                INT NOT NULL,
	fecha_creacion     DATETIME NOT NULL,
	usr_alta           INT NOT NULL,
	fecha_desh         DATETIME NULL,
	id_empresa         INT NOT NULL,
	PRIMARY KEY (ID_TipoTransaccion, estado, sec, id_empresa)
	)
GO

IF OBJECT_ID ('dbo.transaccion') IS NOT NULL
	DROP TABLE dbo.transaccion
GO

CREATE TABLE dbo.transaccion
	(
	ID_transaccion      INT NOT NULL,
	Fecha               DATETIME NOT NULL,
	tipo_transaccion_ID INT NOT NULL,
	Nro_Orden_Origen    INT NOT NULL,
	Almacen_Origen      INT NULL,
	Almacen_Destino     INT NULL,
	Recibe_Material     INT NULL,
	Descripcion         VARCHAR (200) NOT NULL,
	Importe_Total       DECIMAL (10, 2) NULL,
	estado              INT NOT NULL,
	sec                 INT NOT NULL,
	fecha_creacion      DATETIME NOT NULL,
	usr_alta            INT NOT NULL,
	fecha_desh          DATETIME NULL,
	id_empresa          INT NOT NULL,
	PRIMARY KEY (ID_transaccion, estado, sec, id_empresa)
	)
GO

IF OBJECT_ID ('dbo.transaccion_Detalle') IS NOT NULL
	DROP TABLE dbo.transaccion_Detalle
GO

CREATE TABLE dbo.transaccion_Detalle
	(
	ID_Detalle      INT IDENTITY NOT NULL,
	Transaccion_ID  INT NOT NULL,
	Producto_ID     INT NOT NULL,
	Unidad_ID       INT NOT NULL,
	cantidad        DECIMAL (10, 2) NOT NULL,
	precio_unitario DECIMAL (10, 2) NOT NULL,
	costo_total     DECIMAL (10, 2) NOT NULL,
	id_empresa      INT NOT NULL,
	PRIMARY KEY (ID_Detalle)
	)
GO

IF OBJECT_ID ('dbo.Unidad') IS NOT NULL
	DROP TABLE dbo.Unidad
GO

CREATE TABLE dbo.Unidad
	(
	Cod_unidad     INT NOT NULL,
	Descripcion    VARCHAR (50) NULL,
	Estado         INT NOT NULL,
	Secuencia      INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	Motivo_Desh    VARCHAR (100) NULL,
	PRIMARY KEY (Cod_unidad, Estado, Secuencia)
	)
GO

IF OBJECT_ID ('dbo.usuario') IS NOT NULL
	DROP TABLE dbo.usuario
GO

CREATE TABLE dbo.usuario
	(
	cod_Usuario    INT NOT NULL,
	login          VARCHAR (50) NOT NULL,
	password       VARCHAR (200) NOT NULL,
	ID_Personal    INT NOT NULL,
	Estado         INT NOT NULL,
	Secuencia      INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	Motivo_Desh    VARCHAR (100) NULL,
	id_empresa     INT NULL,
	PRIMARY KEY (cod_Usuario, Estado, Secuencia)
	)
GO

IF OBJECT_ID ('dbo.Usuario_Opcion') IS NOT NULL
	DROP TABLE dbo.Usuario_Opcion
GO

CREATE TABLE dbo.Usuario_Opcion
	(
	idOpcion    INT NOT NULL,
	cod_Usuario INT NOT NULL,
	PRIMARY KEY (idOpcion, cod_Usuario)
	)
GO


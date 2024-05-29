

--if(OBJECT_ID('fases') is not null)
--	drop table fases
--go
--create table fases
--(
--	id_fase int not null,
--	id_proyecto int not null,  -- Proyecto al que pertenece
--	nombre varchar(100) not null,
--	sec_proyecto int not null,
--	estado int not null,
--	duracion_total decimal (10,2),
--	id_encargago int not null,
--	observacion varchar(100) not null,
--	sec int not null,
--	fecha_alta datetime not null,
--	usr_alta int not null,
--	id_empresa int not null
--)
--go
--ALTER TABLE fases ADD CONSTRAINT fases_pk PRIMARY KEY (id_fase)
----ALTER TABLE fases ADD CONSTRAINT FK_proyecto FOREIGN KEY(id_proyecto) REFERENCES proyecto(id_proyecto);
--GO

IF OBJECT_ID ('Solicitud') IS NOT NULL
	DROP TABLE Solicitud
GO

CREATE TABLE Solicitud
	(
	ID_Solicitud   INT NOT NULL,
	ID_Proyecto    INT NOT NULL,
	usr_Solicitud  INT NOT NULL,
	id_solicitante INT NOT NULL,
	descripcion    VARCHAR (300) NULL,
	id_director    INT NOT NULL,
	id_empresa     INT NOT NULL,
	Fecha_Entrega  DATETIME NOT NULL,
	Estado_Solicitud CHAR(1) NOT NULL, --S:Solicitado, A:Autorizado R:Rechazado, 
	Estado         INT NOT NULL,
	Secuencia      INT NOT NULL,
	Fecha_Registro DATETIME NOT NULL,
	Fecha_Desh     DATETIME NULL,
	usr_desh       INT NULL,
	PRIMARY KEY (ID_Solicitud, Estado, Secuencia, id_empresa)
	)
GO

IF OBJECT_ID ('Detalle_Solicitud') IS NOT NULL
	DROP TABLE Detalle_Solicitud
GO

CREATE TABLE Detalle_Solicitud
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


if(OBJECT_ID('grupo') is not null)
	drop table grupo
go
create table grupo
(
	id_grupo int not null,
	NombreGrupo varchar(100),
	id_proyecto int not null,
	id_empresa int not null,
	sec int not null,
	fecha_alta datetime not null,
	usr_alta int not null,	
	primary key(id_grupo)
)

if(OBJECT_ID('actividad') is not null)
	drop table actividad
go
create table actividad
(
	id_actividad int not null,
	id_Proyecto int not null,  -- fase al que pertenece de un proyecto
	nombre varchar(100) not null,
	fecha_ini datetime not null,
	fecha_fin datetime not null,
	duracion decimal (10,2),
	estado int not null,	
	id_encargado int not null,
	avance decimal(18,2) not null,
	detalle varchar(100) not null,
	sec int not null,
	fecha_alta datetime not null,
	usr_alta int not null,
	id_empresa int not null
	--grupo   registrar solo para el proyecto
	--Modulo  registrar solo para el proyecto

)
go
ALTER TABLE actividad ADD CONSTRAINT actividad_pk PRIMARY KEY (id_actividad	)
--ALTER TABLE fases ADD CONSTRAINT FK_proyecto FOREIGN KEY(id_proyecto) REFERENCES proyecto(id_proyecto);
GO

-- Detalle de materiales ... para la obra/proyecto
-- 


if(OBJECT_ID('empresa') is not null)
	drop table empresa
go
create table empresa
(
	id_empresa int not null,
	nombre varchar(100) not null,
	estado int not null,
	observacion varchar(100) not null,
	sec int not null,
	fecha_alta datetime not null,
	usr_alta int not null
)
go

if(OBJECT_ID('area') is not null)
	drop table area
go
create table area
(
	id_area int not null,
	nomb_area varchar(100) not null,
	estado int not null,
	observacion varchar(100) not null,
	sec int not null,
	fecha_alta datetime not null,
	usr_alta int not null,
	id_empresa int not null
)
go

if(OBJECT_ID('cargo') is not null)
	drop table cargo
go
create table cargo
(
	id_cargo int not null,
	desc_cargo varchar(100)not null,
	estado int not null,
	sec int not null,
	fecha_alta datetime not null,
	fecha_desh datetime,
	usr_desh int,
	motivo_Desh varchar(200),
	id_empresa int not null
)
go

if(OBJECT_ID('persona') is not null)
	drop table persona
go
create table persona
(
	id_persona int not null,
	nombres varchar(100) not null,
	apellido_paterno varchar(100) not null,
	apellido_materno varchar(100) not null,
	direccion varchar(200),
	email varchar(100),
	nro_doc varchar(100) not null,	
	correo	varchar(100),
	telefono varchar(10),
	id_cargo int not null,
	id_area int not null,
	fecha_nac smalldatetime not null,
	fecha_alta datetime not null,
	usr_alta int not null,
	estado int not null,
	sec int not null,
	id_empresa int not null
)
go

if(OBJECT_ID('usuarios') is not null)
	drop table usuarios
go
Create table usuarios
(
	id_usuario int not null,
	usuario varchar(10),
	pass	varchar(100) not null,
	id_personal int not null,
	estado  int not null,  -- 1: habilitado, 2: bloqueado
	sec int not null,
	fecha_creacion datetime not null,
	usr_alta int not null,
	id_empresa int not null
)
go

if(OBJECT_ID('tipo_transaccion') is not null)
	drop table tipo_transaccion
go
Create table tipo_transaccion
(
	ID_TipoTransaccion int not null,
	TipoTransaccion varchar(100) not null,
	sigla varchar(10) not null,
	Descripcion varchar(300),
	estado  int not null,  
	sec int not null,
	fecha_creacion datetime not null,
	usr_alta int not null,
	fecha_desh datetime,
	id_empresa int not null,
	primary key(ID_TipoTransaccion, estado ,sec, id_empresa)
)
GO

insert into tipo_transaccion values
(1,'Ingreso de Material','INGRESO','Ingresos al almacen principal de Materiales',1,1,GETDATE(),1,null,1),
(2,'Salida de Material','SALIDA','Salidas de almacen de Materiales',1,1,GETDATE(),1,null,1),
(3,'Traspasos de Materiales','TRASPASO','Traspasos de almacen a Almacen',1,1,GETDATE(),1,null,1)


if(OBJECT_ID('transaccion') is not null)
	drop table transaccion
go
Create table transaccion
(
	ID_transaccion int not null,
	Fecha datetime not null,
	tipo_transaccion_ID int not null, -- 1: Ingreso, 2: Salida, 3: Traspaso
	Nro_Orden_Origen int not null, --de la compra realizada si es origen, si es egreso la solicitud de material
	Almacen_Origen int, -- 0.. si es ingreso al principal
	Almacen_Destino int,
	Recibe_Material int, -- ID del contratista que recibe si es una salida
	Descripcion varchar(200) not null,
	Importe_Total decimal(10,2),
	estado  int not null,  
	sec int not null,
	fecha_creacion datetime not null,
	usr_alta int not null,
	fecha_desh datetime,
	id_empresa int not null,
	primary key(ID_transaccion, estado, sec, id_empresa)
)
go

if(OBJECT_ID('transaccion_Detalle') is not null)
	drop table transaccion_Detalle
go

Create table transaccion_Detalle
(
	ID_Detalle int identity(1,1) not null,
	Transaccion_ID int not null,
	--Almacen_ID int not null,
	Producto_ID int not null,
	Unidad_ID int not null,
	cantidad decimal(10,2) not null,
	precio_unitario decimal(10,2) not null,
	costo_total decimal(10,2) not null,
	id_empresa int not null,
	primary key(ID_Detalle)
)
GO

------------------------------------------------------------------------------------
-- Para Obtener las solicitudes autorizadas.. para las salidas de Almacen de un
-- determinado encarado de almacen
------------------------------------------------------------------------------------

select * from Solicitud

select * from Detalle_Solicitud

select * from Solicitud_Autorizaciones
--delete from Solicitud_Autorizaciones


select  s.ID_Solicitud, s.ID_Proyecto, p.Cod_proyecto, p.Nomb_Proyecto, 
        s.id_solicitante, (sol.Nombres + '' + sol.Ap_Paterno) solicitante,
		p.Id_Almacen, a.Nombre_Almacen, 
		a.id_encargado, (per.Nombres + '' + per.Ap_Paterno) encargado_almacen
		--, *
   from Solicitud s
     inner join proyecto p on p.ID_proyecto = s.ID_Proyecto and p.Estado = 1 and p.id_empresa = 1
	 inner join Almacen a on a.id_Almacen = p.Id_Almacen and a.Estado = 1 and a.id_empresa = 1
	 inner join Personal per on per.ID_Personal = a.id_encargado and per.Estado = 1 and per.id_empresa = 1
	 inner join Personal sol on sol.ID_Personal = s.id_solicitante and sol.Estado = 1 and sol.id_empresa = 1
   where s.Estado_Solicitud = 'A' and s.id_empresa = 1
       and per.ID_Personal = 1

   select * from Detalle_Solicitud 
   where ID_Solicitud = 1

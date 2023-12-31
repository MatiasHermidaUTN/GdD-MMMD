------------------------------------------------------------------------------------------------------------------
------------------------------------------------------ INIT ------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

/*Para seleccionar la BD por defecto*/
USE [GD2C2023]
GO

/*Crear el schema con el nombre del grupo*/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'MMMD')
BEGIN 
	EXEC ('CREATE SCHEMA MMMD')
END
GO

------------------------------------------------------------------------------------------------------------------
------------------------------------------------- BORRAR TABLAS --------------------------------------------------
------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID('MMMD.DetalleAlq', 'U') IS NOT NULL DROP TABLE MMMD.DetalleAlq
IF OBJECT_ID('MMMD.PagoAlquiler', 'U') IS NOT NULL DROP TABLE MMMD.PagoAlquiler
IF OBJECT_ID('MMMD.Alquiler', 'U') IS NOT NULL DROP TABLE MMMD.Alquiler
IF OBJECT_ID('MMMD.Inquilino', 'U') IS NOT NULL DROP TABLE MMMD.Inquilino
IF OBJECT_ID('MMMD.EstadoAlquiler', 'U') IS NOT NULL DROP TABLE MMMD.EstadoAlquiler

IF OBJECT_ID('MMMD.PagoVenta', 'U') IS NOT NULL DROP TABLE MMMD.PagoVenta
IF OBJECT_ID('MMMD.Venta', 'U') IS NOT NULL DROP TABLE MMMD.Venta
IF OBJECT_ID('MMMD.Comprador', 'U') IS NOT NULL DROP TABLE MMMD.Comprador
IF OBJECT_ID('MMMD.MedioDePago', 'U') IS NOT NULL DROP TABLE MMMD.MedioDePago

IF OBJECT_ID('MMMD.Anuncio', 'U') IS NOT NULL DROP TABLE MMMD.Anuncio
IF OBJECT_ID('MMMD.Moneda', 'U') IS NOT NULL DROP TABLE MMMD.Moneda
IF OBJECT_ID('MMMD.TipoOperacion', 'U') IS NOT NULL DROP TABLE MMMD.TipoOperacion
IF OBJECT_ID('MMMD.EstadoAnuncio', 'U') IS NOT NULL DROP TABLE MMMD.EstadoAnuncio
IF OBJECT_ID('MMMD.TipoPeriodo', 'U') IS NOT NULL DROP TABLE MMMD.TipoPeriodo

IF OBJECT_ID('MMMD.Agente', 'U') IS NOT NULL DROP TABLE MMMD.Agente
IF OBJECT_ID('MMMD.Sucursal', 'U') IS NOT NULL DROP TABLE MMMD.Sucursal

IF OBJECT_ID('MMMD.CaracteristicaPorInmueble', 'U') IS NOT NULL DROP TABLE MMMD.CaracteristicaPorInmueble
IF OBJECT_ID('MMMD.CaracteristicaBase', 'U') IS NOT NULL DROP TABLE MMMD.CaracteristicaBase
IF OBJECT_ID('MMMD.Inmueble', 'U') IS NOT NULL DROP TABLE MMMD.Inmueble

IF OBJECT_ID('MMMD.TipoInmueble', 'U') IS NOT NULL DROP TABLE MMMD.TipoInmueble
IF OBJECT_ID('MMMD.CantidadAmbientes', 'U') IS NOT NULL DROP TABLE MMMD.CantidadAmbientes
IF OBJECT_ID('MMMD.DisposicionInmueble', 'U') IS NOT NULL DROP TABLE MMMD.DisposicionInmueble
IF OBJECT_ID('MMMD.EstadoInmueble', 'U') IS NOT NULL DROP TABLE MMMD.EstadoInmueble
IF OBJECT_ID('MMMD.Propietario', 'U') IS NOT NULL DROP TABLE MMMD.Propietario

IF OBJECT_ID('MMMD.Barrio', 'U') IS NOT NULL DROP TABLE MMMD.Barrio
IF OBJECT_ID('MMMD.Localidad', 'U') IS NOT NULL DROP TABLE MMMD.Localidad
IF OBJECT_ID('MMMD.Provincia', 'U') IS NOT NULL DROP TABLE MMMD.Provincia

------------------------------------------------------------------------------------------------------------------
------------------------------------------------- BORRAR PROCS ---------------------------------------------------
------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID('MMMD.Migrar_Comprador') IS NOT NULL DROP procedure MMMD.Migrar_Comprador
IF OBJECT_ID('MMMD.Migrar_Moneda') IS NOT NULL DROP procedure MMMD.Migrar_Moneda
IF OBJECT_ID('MMMD.Migrar_MedioDePago') IS NOT NULL DROP procedure MMMD.Migrar_MedioDePago
IF OBJECT_ID('MMMD.Migrar_Propietario') IS NOT NULL DROP procedure MMMD.Migrar_Propietario
IF OBJECT_ID('MMMD.Migrar_Provincia') IS NOT NULL DROP procedure MMMD.Migrar_Provincia
IF OBJECT_ID('MMMD.Migrar_Localidad') IS NOT NULL DROP procedure MMMD.Migrar_Localidad
IF OBJECT_ID('MMMD.Migrar_Barrio') IS NOT NULL DROP procedure MMMD.Migrar_Barrio
IF OBJECT_ID('MMMD.Migrar_Sucursal') IS NOT NULL DROP procedure MMMD.Migrar_Sucursal
IF OBJECT_ID('MMMD.Migrar_Agente') IS NOT NULL DROP procedure MMMD.Migrar_Agente
IF OBJECT_ID('MMMD.Migrar_DetalleAlq') IS NOT NULL DROP procedure MMMD.Migrar_DetalleAlq
IF OBJECT_ID('MMMD.Migrar_Inquilino') IS NOT NULL DROP procedure MMMD.Migrar_Inquilino
IF OBJECT_ID('MMMD.Migrar_EstadoAlquiler') IS NOT NULL DROP procedure MMMD.Migrar_EstadoAlquiler
IF OBJECT_ID('MMMD.Migrar_Alquiler') IS NOT NULL DROP procedure MMMD.Migrar_Alquiler
IF OBJECT_ID('MMMD.Migrar_CantidadAmbientes') IS NOT NULL DROP procedure MMMD.Migrar_CantidadAmbientes
IF OBJECT_ID('MMMD.Migrar_EstadoInmueble') IS NOT NULL DROP procedure MMMD.Migrar_EstadoInmueble
IF OBJECT_ID('MMMD.Migrar_TipoInmueble') IS NOT NULL DROP procedure MMMD.Migrar_TipoInmueble
IF OBJECT_ID('MMMD.Migrar_DisposicionInmueble') IS NOT NULL DROP procedure MMMD.Migrar_DisposicionInmueble
IF OBJECT_ID('MMMD.Migrar_EstadoAnuncio') IS NOT NULL DROP procedure MMMD.Migrar_EstadoAnuncio
IF OBJECT_ID('MMMD.Migrar_TipoPeriodo') IS NOT NULL DROP procedure MMMD.Migrar_TipoPeriodo
IF OBJECT_ID('MMMD.Migrar_TipoOperacion') IS NOT NULL DROP procedure MMMD.Migrar_TipoOperacion
IF OBJECT_ID('MMMD.Migrar_CaracteristicaBase') IS NOT NULL DROP procedure MMMD.Migrar_CaracteristicaBase
IF OBJECT_ID('MMMD.Migrar_PagoAlquiler') IS NOT NULL DROP procedure MMMD.Migrar_PagoAlquiler
IF OBJECT_ID('MMMD.Migrar_PagoVenta') IS NOT NULL DROP procedure MMMD.Migrar_PagoVenta
IF OBJECT_ID('MMMD.Migrar_Venta') IS NOT NULL DROP procedure MMMD.Migrar_Venta
IF OBJECT_ID('MMMD.Migrar_Anuncio') IS NOT NULL DROP procedure MMMD.Migrar_Anuncio
IF OBJECT_ID('MMMD.Migrar_Inmueble') IS NOT NULL DROP procedure MMMD.Migrar_Inmueble
IF OBJECT_ID('MMMD.Migrar_CaracteristicasPorImueble') IS NOT NULL DROP procedure MMMD.Migrar_CaracteristicasPorImueble

------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- TABLAS -----------------------------------------------------
------------------------------------------------------------------------------------------------------------------

CREATE TABLE [MMMD].[Agente] (
	[AGENTE_CODIGO] numeric(19, 0) NOT NULL IDENTITY PRIMARY KEY,
	[AGENTE_NOMBRE] nvarchar(100) NULL,
	[AGENTE_APELLIDO] nvarchar(100) NULL,
	[AGENTE_DNI] numeric(18, 0) NULL,
	[AGENTE_FECHA_REGISTRO] datetime NULL,
	[AGENTE_TELEFONO] numeric(18, 0) NULL,
	[AGENTE_MAIL] nvarchar(100) NULL,
	[AGENTE_FECHA_NAC] datetime NULL,

	[AGENTE_SUCURSAL_CODIGO] numeric(18, 0) NULL,
)
GO

CREATE TABLE [MMMD].[Sucursal] (
	[SUCURSAL_CODIGO] numeric(18, 0) NOT NULL PRIMARY KEY,
	[SUCURSAL_NOMBRE] nvarchar(100) NULL,
	[SUCURSAL_DIRECCION] nvarchar(100) NULL,
	[SUCURSAL_TELEFONO] nvarchar(100) NULL,

	[SUCURSAL_LOCALIDAD_CODIGO] numeric(18, 0) NULL,
)
GO

CREATE TABLE [MMMD].[Localidad] (
	[LOCALIDAD_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[LOCALIDAD_NOMBRE] nvarchar(100) NULL,

	[LOCALIDAD_PROVINCIA_CODIGO] numeric(18, 0) NULL,
)
GO

CREATE TABLE [MMMD].[Provincia] (
	[PROVINCIA_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[PROVINCIA_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[Barrio] (
	[BARRIO_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[BARRIO_NOMBRE] nvarchar(100) NULL,

	[BARRIO_LOCALIDAD_CODIGO] numeric(18, 0) NULL,
)
GO

CREATE TABLE [MMMD].[Anuncio] (
	[ANUNCIO_CODIGO] numeric(19, 0) NOT NULL PRIMARY KEY,
	[ANUNCIO_FECHA_PUBLICACION] datetime NULL,
	[ANUNCIO_PRECIO_PUBLICADO] numeric(18, 2) NULL,
	[ANUNCIO_COSTO_ANUNCIO] numeric(18, 2) NULL,
	[ANUNCIO_FECHA_FINALIZACION] datetime NULL,

	[ANUNCIO_TIPO_OPERACION] numeric(18, 0) NULL,
	[ANUNCIO_MONEDA] numeric(18, 0) NULL,
	[ANUNCIO_ESTADO] numeric(18, 0) NULL,
	[ANUNCIO_TIPO_PERIODO] numeric(18, 0) NULL,
	[ANUNCIO_AGENTE_CODIGO] numeric(19, 0) NULL,
	[ANUNCIO_INMUEBLE_CODIGO] numeric(18, 0) NULL,
)
GO

CREATE TABLE [MMMD].[TipoOperacion] (
	[OP_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[OP_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[Moneda] (
	[MONEDA_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[MONEDA_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[EstadoAnuncio] (
	[ESTADO_ANUNCIO_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[ESTADO_ANUNCIO_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[TipoPeriodo] (
	[TIPO_PERIODO_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[TIPO_PERIODO_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[Inmueble] (
	[INMUEBLE_CODIGO] numeric(18, 0) NOT NULL PRIMARY KEY,
	[INMUEBLE_NOMBRE] nvarchar(100) NULL,
	[INMUEBLE_DESCRIPCION] nvarchar(100) NULL,
	[INMUEBLE_DIRECCION] nvarchar(100) NULL,
	[INMUEBLE_SUPERFICIETOTAL] numeric(18, 2) NULL,
	[INMUEBLE_ANTIGUEDAD] numeric(18, 0) NULL,
	[INMUEBLE_EXPESAS] numeric(18, 2) NULL,
	[INMUEBLE_ORIENTACION] nvarchar(100) NULL,

	[INMUEBLE_BARRIO] numeric(18, 0) NULL,
	[INMUEBLE_TIPO_INMUEBLE] numeric(18, 0) NULL,
	[INMUEBLE_CANT_AMBIENTES] numeric(18, 0) NULL,
	[INMUEBLE_DISPOSICION] numeric(18, 0) NULL,
	[INMUEBLE_ESTADO] numeric(18, 0) NULL,
	[INMUEBLE_PROPIETARIO_CODIGO] numeric(18, 0) NULL,
)
GO

CREATE TABLE [MMMD].[CaracteristicaBase] (
	[CARACTERISTICA_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[CARACTERISTICA_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[CaracteristicaPorInmueble] (
	[CARACTERISTICA_CODIGO] numeric(18, 0) NOT NULL,
	[INMUEBLE_CODIGO] numeric(18, 0) NOT NULL,
	CONSTRAINT PK_CaracteristicaPorInmueble PRIMARY KEY ([CARACTERISTICA_CODIGO], [INMUEBLE_CODIGO])
)
GO

CREATE TABLE [MMMD].[TipoInmueble] (
	[TIPOINMUEBLE_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[TIPOINMUEBLE_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[CantidadAmbientes] (
	[AMBIENTES_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[AMBIENTES_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[DisposicionInmueble] (
	[DISPOSICION_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[DISPOSICION_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[EstadoInmueble] (
	[ESTADO_INMUEBLE_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[ESTADO_INMUEBLE_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[Propietario] (
	[PROPIETARIO_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[PROPIETARIO_NOMBRE] nvarchar(100) NULL,
	[PROPIETARIO_APELLIDO] nvarchar(100) NULL,
	[PROPIETARIO_DNI] numeric(18, 0) NULL,
	[PROPIETARIO_FECHA_REGISTRO] datetime NULL,
	[PROPIETARIO_TELEFONO] numeric(18, 0) NULL,
	[PROPIETARIO_MAIL] nvarchar(255) NULL,
	[PROPIETARIO_FECHA_NAC] datetime NULL,
)
GO

CREATE TABLE [MMMD].[Venta] (
	[VENTA_CODIGO] numeric(18, 0) NOT NULL PRIMARY KEY,
	[VENTA_FECHA] datetime NULL,
	[VENTA_PRECIO_VENTA] numeric(18, 2) NULL,
	[VENTA_COMISION] numeric(18, 2) NULL,

	[VENTA_MONEDA] numeric(18, 0) NULL,
	[VENTA_ANUNCIO_CODIGO] numeric(19, 0) NULL,
	[VENTA_COMPRADOR_CODIGO] numeric(18, 0) NULL,
)
GO

CREATE TABLE [MMMD].[Comprador] (
	[COMPRADOR_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[COMPRADOR_NOMBRE] nvarchar(100) NULL,
	[COMPRADOR_APELLIDO] nvarchar(100) NULL,
	[COMPRADOR_DNI] numeric(18, 0) NULL,
	[COMPRADOR_FECHA_REGISTRO] datetime NULL,
	[COMPRADOR_TELEFONO] numeric(18, 0) NULL,
	[COMPRADOR_MAIL] nvarchar(100) NULL,
	[COMPRADOR_FECHA_NAC] datetime NULL,
)
GO

CREATE TABLE [MMMD].[PagoVenta] (
	[PAGO_VENTA_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[PAGO_VENTA_IMPORTE] numeric(18, 2) NULL,
	[PAGO_VENTA_COTIZACION] numeric(18, 2) NULL,
	
	[PAGO_VENTA_VENTA_CODIGO] numeric(18, 0) NULL,
	[PAGO_VENTA_MONEDA] numeric(18, 0) NULL,
	[PAGO_VENTA_MEDIO_PAGO] numeric(18, 0) NULL,
)
GO

CREATE TABLE [MMMD].[MedioDePago] (
	[MEDIO_PAGO_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[MEDIO_PAGO_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[Alquiler] (
	[ALQUILER_CODIGO] numeric(18, 0) NOT NULL PRIMARY KEY,
	[ALQUILER_FECHA_INICIO] datetime NULL,
	[ALQUILER_FECHA_FIN] datetime NULL,
	[ALQUILER_CANT_PERIODOS] numeric(18, 0) NULL,
	[ALQUILER_DEPOSITO] numeric(18, 2) NULL,
	[ALQUILER_COMISION] numeric(18, 2) NULL,
	[ALQUILER_GASTOS_AVERIGUA] numeric(18, 2) NULL,
	
	[ALQUILER_ANUNCIO_CODIGO] numeric(19, 0) NULL,
	[ALQUILER_INQUILINO_CODIGO] numeric(18, 0) NULL,
	[ALQUILER_ESTADO] numeric(18, 0) NULL,
)
GO

CREATE TABLE [MMMD].[Inquilino] (
	[INQUILINO_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[INQUILINO_NOMBRE] nvarchar(100) NULL,
	[INQUILINO_APELLIDO] nvarchar(100) NULL,
	[INQUILINO_DNI] numeric(18, 0) NULL,
	[INQUILINO_FECHA_REGISTRO] datetime NULL,
	[INQUILINO_TELEFONO] numeric(18, 0) NULL,
	[INQUILINO_MAIL] nvarchar(100) NULL,
	[INQUILINO_FECHA_NAC] datetime NULL,
)
GO

CREATE TABLE [MMMD].[EstadoAlquiler] (
	[ESTADO_ALQUILER_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[ESTADO_ALQUILER_NOMBRE] nvarchar(100) NULL,
)
GO

CREATE TABLE [MMMD].[DetalleAlq] (
	[DETALLE_ALQ_CODIGO] numeric(18, 0) NOT NULL IDENTITY PRIMARY KEY,
	[DETALLE_ALQ_NRO_PERIODO_INI] numeric(18, 0) NULL,
	[DETALLE_ALQ_NRO_PERIODO_FIN] numeric(18, 0) NULL,
	[DETALLE_ALQ_PRECIO] numeric(18, 2) NULL,
	
	[DETALLE_ALQ_ALQUILER_CODIGO] numeric(18, 0) NULL,
)
GO

CREATE TABLE [MMMD].[PagoAlquiler] (
	[PAGO_ALQUILER_CODIGO] numeric(18, 0) NOT NULL PRIMARY KEY,
	[PAGO_ALQUILER_FECHA] datetime NULL,
	[PAGO_ALQUILER_FECHA_VENCIMIENTO] datetime NULL,
	[PAGO_ALQUILER_NRO_PERIODO] numeric(18, 0) NULL,
	[PAGO_ALQUILER_DESC] nvarchar(100) NULL,
	[PAGO_ALQUILER_FEC_INI] datetime NULL,
	[PAGO_ALQUILER_FEC_FIN] datetime NULL,
	[PAGO_ALQUILER_IMPORTE] numeric(18, 2) NULL,
	
	[PAGO_ALQUILER_ALQUILER_CODIGO] numeric(18, 0) NULL,
	[PAGO_ALQUILER_MEDIO_PAGO] numeric(18, 0) NULL,
)
GO

----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- PROCEDURES -----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE MMMD.Migrar_Comprador AS
BEGIN
	INSERT INTO MMMD.Comprador
		(COMPRADOR_NOMBRE, 
		COMPRADOR_APELLIDO, 
		COMPRADOR_DNI, 
		COMPRADOR_FECHA_REGISTRO,	
		COMPRADOR_TELEFONO,	
		COMPRADOR_MAIL,	
		COMPRADOR_FECHA_NAC)
	SELECT DISTINCT
		m.COMPRADOR_NOMBRE,
		m.COMPRADOR_APELLIDO,
		m.COMPRADOR_DNI,
		m.COMPRADOR_FECHA_REGISTRO,
		m.COMPRADOR_TELEFONO,
		m.COMPRADOR_MAIL,
		m.COMPRADOR_FECHA_NAC
	FROM gd_esquema.Maestra m
	WHERE m.COMPRADOR_APELLIDO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_Moneda AS
BEGIN
	INSERT INTO MMMD.Moneda
	SELECT DISTINCT
		m.ANUNCIO_MONEDA
	FROM gd_esquema.Maestra m
	WHERE m.ANUNCIO_MONEDA IS NOT NULL
	UNION
	SELECT DISTINCT
		m.VENTA_MONEDA
	FROM gd_esquema.Maestra m
	WHERE m.VENTA_MONEDA IS NOT NULL
	UNION
	SELECT DISTINCT
		m.PAGO_VENTA_MONEDA
	FROM gd_esquema.Maestra m
	WHERE m.PAGO_VENTA_MONEDA IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_MedioDePago AS
BEGIN
	INSERT INTO MMMD.MedioDePago
	SELECT DISTINCT
		m.PAGO_ALQUILER_MEDIO_PAGO	
	FROM gd_esquema.Maestra m
	WHERE m.PAGO_ALQUILER_MEDIO_PAGO IS NOT NULL	
	UNION
	SELECT DISTINCT
		m.PAGO_VENTA_MEDIO_PAGO	
	FROM gd_esquema.Maestra m
	WHERE m.PAGO_VENTA_MEDIO_PAGO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_Propietario AS
BEGIN
	INSERT INTO MMMD.Propietario 
		(PROPIETARIO_NOMBRE, 
		PROPIETARIO_APELLIDO, 
		PROPIETARIO_DNI, 
		PROPIETARIO_FECHA_REGISTRO, 
		PROPIETARIO_TELEFONO, 
		PROPIETARIO_MAIL, 
		PROPIETARIO_FECHA_NAC)
	SELECT DISTINCT
		m.PROPIETARIO_NOMBRE,
		m.PROPIETARIO_APELLIDO,
		m.PROPIETARIO_DNI,
		m.PROPIETARIO_FECHA_REGISTRO,
		m.PROPIETARIO_TELEFONO,
		m.PROPIETARIO_MAIL,	
		m.PROPIETARIO_FECHA_NAC
	FROM gd_esquema.Maestra m
	WHERE m.PROPIETARIO_APELLIDO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_Provincia AS
BEGIN
	INSERT INTO MMMD.Provincia 
		(PROVINCIA_NOMBRE)
	SELECT DISTINCT
		m.SUCURSAL_PROVINCIA 
	FROM gd_esquema.Maestra m
	WHERE m.SUCURSAL_PROVINCIA IS NOT NULL
	UNION
	SELECT DISTINCT
		m.INMUEBLE_PROVINCIA
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_PROVINCIA IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_Localidad AS
BEGIN
	INSERT INTO MMMD.Localidad 
		(LOCALIDAD_NOMBRE, 
		LOCALIDAD_PROVINCIA_CODIGO)
	SELECT DISTINCT
		m.SUCURSAL_LOCALIDAD,
		P.PROVINCIA_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.Provincia	P ON P.PROVINCIA_NOMBRE = m.SUCURSAL_PROVINCIA
	WHERE m.SUCURSAL_LOCALIDAD IS NOT NULL
	UNION
	SELECT DISTINCT
		m.INMUEBLE_LOCALIDAD,
		P.PROVINCIA_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.Provincia	P ON P.PROVINCIA_NOMBRE = m.INMUEBLE_PROVINCIA
	WHERE m.INMUEBLE_LOCALIDAD IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_Barrio AS
BEGIN
	INSERT INTO MMMD.Barrio 
		(BARRIO_NOMBRE, 
		BARRIO_LOCALIDAD_CODIGO)
	SELECT DISTINCT
		m.INMUEBLE_BARRIO,
		L.LOCALIDAD_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.Localidad	L ON L.LOCALIDAD_NOMBRE = m.INMUEBLE_LOCALIDAD
	WHERE m.INMUEBLE_BARRIO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_Sucursal AS
BEGIN
	INSERT INTO MMMD.Sucursal 
		(SUCURSAL_CODIGO, 
		SUCURSAL_NOMBRE, 
		SUCURSAL_DIRECCION, 
		SUCURSAL_TELEFONO, 
		SUCURSAL_LOCALIDAD_CODIGO)
	SELECT DISTINCT
		m.SUCURSAL_CODIGO, 
		m.SUCURSAL_NOMBRE, 
		m.SUCURSAL_DIRECCION, 
		m.SUCURSAL_TELEFONO, 
		L.LOCALIDAD_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.Localidad	L ON L.LOCALIDAD_NOMBRE = m.SUCURSAL_LOCALIDAD
	WHERE m.SUCURSAL_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_Agente AS
BEGIN
	INSERT INTO MMMD.Agente
		(AGENTE_NOMBRE,
		AGENTE_APELLIDO,
		AGENTE_DNI,
		AGENTE_FECHA_REGISTRO,
		AGENTE_TELEFONO,
		AGENTE_MAIL,
		AGENTE_FECHA_NAC,
		AGENTE_SUCURSAL_CODIGO)
	SELECT DISTINCT
		m.AGENTE_NOMBRE,
		m.AGENTE_APELLIDO,
		m.AGENTE_DNI,
		m.AGENTE_FECHA_REGISTRO,
		m.AGENTE_TELEFONO,
		m.AGENTE_MAIL,
		m.AGENTE_FECHA_NAC,
		S.SUCURSAL_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.Sucursal S ON S.SUCURSAL_NOMBRE = m.SUCURSAL_NOMBRE
	WHERE m.AGENTE_DNI IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_DetalleAlq AS
BEGIN 
	INSERT INTO MMMD.DetalleAlq 
		(DETALLE_ALQ_ALQUILER_CODIGO,
		DETALLE_ALQ_NRO_PERIODO_INI,
		DETALLE_ALQ_NRO_PERIODO_FIN,
		DETALLE_ALQ_PRECIO)
	SELECT DISTINCT 
		m.ALQUILER_CODIGO,
		m.DETALLE_ALQ_NRO_PERIODO_INI, 
		m.DETALLE_ALQ_NRO_PERIODO_FIN, 
		m.DETALLE_ALQ_PRECIO 
	FROM gd_esquema.Maestra m
	WHERE m.ALQUILER_CODIGO IS NOT NULL
END 
GO

CREATE PROCEDURE MMMD.Migrar_Inquilino AS
BEGIN
	INSERT INTO MMMD.Inquilino
		(INQUILINO_NOMBRE, 
		INQUILINO_APELLIDO, 
		INQUILINO_DNI, 
		INQUILINO_FECHA_REGISTRO, 
		INQUILINO_TELEFONO, 
		INQUILINO_MAIL, 
		INQUILINO_FECHA_NAC)
	SELECT DISTINCT 
		m.INQUILINO_NOMBRE, 
		m.INQUILINO_APELLIDO, 
		m.INQUILINO_DNI, 
		m.INQUILINO_FECHA_REGISTRO, 
		m.INQUILINO_TELEFONO, 
		m.INQUILINO_MAIL, 
		m.INQUILINO_FECHA_NAC
	FROM gd_esquema.Maestra m
	WHERE m.INQUILINO_APELLIDO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_EstadoAlquiler AS 
BEGIN
	INSERT INTO MMMD.EstadoAlquiler
		(ESTADO_ALQUILER_NOMBRE)
	SELECT DISTINCT 
		m.ALQUILER_ESTADO 
	FROM gd_esquema.Maestra m
	WHERE m.ALQUILER_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_Alquiler AS 
BEGIN
	INSERT INTO MMMD.Alquiler 
		(ALQUILER_CODIGO,
		ALQUILER_ANUNCIO_CODIGO, 
		ALQUILER_INQUILINO_CODIGO,
		ALQUILER_CANT_PERIODOS,
		ALQUILER_FECHA_INICIO,
		ALQUILER_FECHA_FIN,
		ALQUILER_DEPOSITO, 
		ALQUILER_COMISION, 
		ALQUILER_GASTOS_AVERIGUA, 
		ALQUILER_ESTADO)
	SELECT DISTINCT 
		m.ALQUILER_CODIGO,
		m.ANUNCIO_CODIGO,
		i.INQUILINO_CODIGO,
		m.ALQUILER_CANT_PERIODOS,
		m.ALQUILER_FECHA_INICIO,
		m.ALQUILER_FECHA_FIN,
		m.ALQUILER_DEPOSITO,
		m.ALQUILER_COMISION,
		m.ALQUILER_GASTOS_AVERIGUA,
		e.ESTADO_ALQUILER_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.Inquilino i ON i.INQUILINO_DNI = m.INQUILINO_DNI 
		and i.INQUILINO_APELLIDO = m.INQUILINO_APELLIDO
		and i.INQUILINO_NOMBRE = m.INQUILINO_NOMBRE
	JOIN MMMD.EstadoAlquiler e ON e.ESTADO_ALQUILER_NOMBRE = m.ALQUILER_ESTADO 
	WHERE m.ALQUILER_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_CantidadAmbientes AS 
BEGIN
	INSERT INTO MMMD.CantidadAmbientes
		(AMBIENTES_NOMBRE)
	SELECT DISTINCT 
		m.INMUEBLE_CANT_AMBIENTES 
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_CANT_AMBIENTES IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_EstadoInmueble AS 
BEGIN
	INSERT INTO MMMD.EstadoInmueble
		(ESTADO_INMUEBLE_NOMBRE)
	SELECT DISTINCT 
		m.INMUEBLE_ESTADO 
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_TipoInmueble AS 
BEGIN
	INSERT INTO MMMD.TipoInmueble
		(TIPOINMUEBLE_NOMBRE)
	SELECT DISTINCT 
		m.INMUEBLE_TIPO_INMUEBLE 
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_TIPO_INMUEBLE IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_DisposicionInmueble AS 
BEGIN
	INSERT INTO MMMD.DisposicionInmueble
		(DISPOSICION_NOMBRE)
	SELECT DISTINCT 
		m.INMUEBLE_DISPOSICION 
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_DISPOSICION IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_EstadoAnuncio AS 
BEGIN
	INSERT INTO MMMD.EstadoAnuncio
		(ESTADO_ANUNCIO_NOMBRE)
	SELECT DISTINCT 
		m.ANUNCIO_ESTADO 
	FROM gd_esquema.Maestra m
	WHERE m.ANUNCIO_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_TipoPeriodo AS 
BEGIN
	INSERT INTO MMMD.TipoPeriodo
		(TIPO_PERIODO_NOMBRE)
	SELECT DISTINCT
		CASE
			WHEN ANUNCIO_TIPO_PERIODO = 'Periodo dia' THEN 'Periodo Dia'
			WHEN ANUNCIO_TIPO_PERIODO = '0' THEN 'N/A'
			ELSE ANUNCIO_TIPO_PERIODO
		END
	FROM gd_esquema.Maestra m
	WHERE m.ANUNCIO_TIPO_PERIODO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_TipoOperacion AS 
BEGIN
	INSERT INTO MMMD.TipoOperacion
		(OP_NOMBRE)
	SELECT DISTINCT 
		m.ANUNCIO_TIPO_OPERACION 
	FROM gd_esquema.Maestra m
	WHERE m.ANUNCIO_TIPO_OPERACION IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_CaracteristicaBase AS 
BEGIN
	INSERT INTO MMMD.CaracteristicaBase
		(CARACTERISTICA_NOMBRE)
	VALUES ('Wifi')

	INSERT INTO MMMD.CaracteristicaBase
		(CARACTERISTICA_NOMBRE)
	VALUES ('Cable')

	INSERT INTO MMMD.CaracteristicaBase
		(CARACTERISTICA_NOMBRE)
	VALUES ('Calefacción')

	INSERT INTO MMMD.CaracteristicaBase
		(CARACTERISTICA_NOMBRE)
	VALUES ('Gas')
END
GO

CREATE PROCEDURE MMMD.Migrar_PagoAlquiler AS
BEGIN
	INSERT INTO MMMD.PagoAlquiler
		(PAGO_ALQUILER_CODIGO,
		PAGO_ALQUILER_FECHA,
		PAGO_ALQUILER_FECHA_VENCIMIENTO,
		PAGO_ALQUILER_NRO_PERIODO,
		PAGO_ALQUILER_DESC,
		PAGO_ALQUILER_FEC_INI,
		PAGO_ALQUILER_FEC_FIN,
		PAGO_ALQUILER_IMPORTE,
		PAGO_ALQUILER_MEDIO_PAGO,
		PAGO_ALQUILER_ALQUILER_CODIGO)
	SELECT DISTINCT
		m.PAGO_ALQUILER_CODIGO,
		m.PAGO_ALQUILER_FECHA,
		m.PAGO_ALQUILER_FECHA_VENCIMIENTO,
		m.PAGO_ALQUILER_NRO_PERIODO,
		m.PAGO_ALQUILER_DESC,
		m.PAGO_ALQUILER_FEC_INI,
		m.PAGO_ALQUILER_FEC_FIN,
		m.PAGO_ALQUILER_IMPORTE,
		p.MEDIO_PAGO_CODIGO,
		m.ALQUILER_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.MedioDePago p ON p.MEDIO_PAGO_NOMBRE = m.PAGO_ALQUILER_MEDIO_PAGO
	WHERE m.PAGO_ALQUILER_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_PagoVenta AS
BEGIN
	INSERT INTO MMMD.PagoVenta
		(PAGO_VENTA_IMPORTE,
		PAGO_VENTA_COTIZACION,
		PAGO_VENTA_MEDIO_PAGO,
		PAGO_VENTA_VENTA_CODIGO,
		PAGO_VENTA_MONEDA)
	SELECT DISTINCT
		m.PAGO_VENTA_IMPORTE,
		m.PAGO_VENTA_COTIZACION,
		p.MEDIO_PAGO_CODIGO,
		m.VENTA_CODIGO,
		d.MONEDA_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.MedioDePago p ON p.MEDIO_PAGO_NOMBRE = m.PAGO_VENTA_MEDIO_PAGO
	JOIN MMMD.Moneda d ON d.MONEDA_NOMBRE = m.PAGO_VENTA_MONEDA
	WHERE m.PAGO_VENTA_IMPORTE IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_Venta AS
BEGIN
	INSERT INTO MMMD.Venta
		(VENTA_CODIGO,
		VENTA_FECHA,
		VENTA_PRECIO_VENTA,
		VENTA_COMISION,
		VENTA_MONEDA,
		VENTA_ANUNCIO_CODIGO,
		VENTA_COMPRADOR_CODIGO)
	SELECT DISTINCT
		m.VENTA_CODIGO,
		m.VENTA_FECHA,
		m.VENTA_PRECIO_VENTA,
		m.VENTA_COMISION,
		d.MONEDA_CODIGO,
		m.ANUNCIO_CODIGO,
		c.COMPRADOR_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.Moneda d ON d.MONEDA_NOMBRE = m.VENTA_MONEDA
	JOIN MMMD.Comprador c ON c.COMPRADOR_DNI = m.COMPRADOR_DNI 
		and c.COMPRADOR_APELLIDO = m.COMPRADOR_APELLIDO
		and c.COMPRADOR_NOMBRE = m.COMPRADOR_NOMBRE
	WHERE m.VENTA_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_Anuncio AS
BEGIN
	INSERT INTO MMMD.Anuncio
		(ANUNCIO_CODIGO,
		ANUNCIO_FECHA_PUBLICACION,
		ANUNCIO_PRECIO_PUBLICADO,
		ANUNCIO_COSTO_ANUNCIO,
		ANUNCIO_FECHA_FINALIZACION,
		ANUNCIO_TIPO_OPERACION,
		ANUNCIO_MONEDA,
		ANUNCIO_ESTADO,
		ANUNCIO_TIPO_PERIODO,
		ANUNCIO_AGENTE_CODIGO,
		ANUNCIO_INMUEBLE_CODIGO)
	SELECT DISTINCT
		m.ANUNCIO_CODIGO,
		m.ANUNCIO_FECHA_PUBLICACION,
		m.ANUNCIO_PRECIO_PUBLICADO,
		m.ANUNCIO_COSTO_ANUNCIO,
		m.ANUNCIO_FECHA_FINALIZACION,
		t.OP_CODIGO,
		d.MONEDA_CODIGO,
		a.ESTADO_ANUNCIO_CODIGO,
		p.TIPO_PERIODO_CODIGO,
		g.AGENTE_CODIGO,
		m.INMUEBLE_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.TipoOperacion t ON m.ANUNCIO_TIPO_OPERACION = t.OP_NOMBRE
	JOIN MMMD.Moneda d ON m.ANUNCIO_MONEDA = d.MONEDA_NOMBRE 
	JOIN MMMD.EstadoAnuncio a ON m.ANUNCIO_ESTADO = a.ESTADO_ANUNCIO_NOMBRE
	left JOIN MMMD.TipoPeriodo p ON p.TIPO_PERIODO_NOMBRE =
		(CASE
			WHEN ANUNCIO_TIPO_PERIODO = 'Periodo dia' THEN 'Periodo Dia'
			WHEN ANUNCIO_TIPO_PERIODO = '0' THEN 'N/A'
			ELSE ANUNCIO_TIPO_PERIODO
		END)
	JOIN MMMD.Agente g ON g.AGENTE_DNI = m.AGENTE_DNI 
		and g.AGENTE_APELLIDO = m.AGENTE_APELLIDO
		and g.AGENTE_NOMBRE = m.AGENTE_NOMBRE
	WHERE m.ANUNCIO_CODIGO IS NOT NULL and m.INMUEBLE_CODIGO is not null
END
GO

CREATE PROCEDURE MMMD.Migrar_Inmueble AS
BEGIN
	INSERT INTO MMMD.Inmueble
		(INMUEBLE_CODIGO,
		INMUEBLE_NOMBRE,
		INMUEBLE_DESCRIPCION,
		INMUEBLE_DIRECCION,
		INMUEBLE_SUPERFICIETOTAL,
		INMUEBLE_ANTIGUEDAD,
		INMUEBLE_EXPESAS,
		INMUEBLE_ORIENTACION,		
		INMUEBLE_BARRIO,
		INMUEBLE_TIPO_INMUEBLE,
		INMUEBLE_CANT_AMBIENTES,
		INMUEBLE_DISPOSICION,
		INMUEBLE_ESTADO,
		INMUEBLE_PROPIETARIO_CODIGO)
	SELECT DISTINCT
		m.INMUEBLE_CODIGO,
		m.INMUEBLE_NOMBRE,
		m.INMUEBLE_DESCRIPCION,
		m.INMUEBLE_DIRECCION,
		m.INMUEBLE_SUPERFICIETOTAL,
		m.INMUEBLE_ANTIGUEDAD,
		m.INMUEBLE_EXPESAS,
		m.INMUEBLE_ORIENTACION,
		b.BARRIO_CODIGO,
		t.TIPOINMUEBLE_CODIGO,
		c.AMBIENTES_CODIGO,
		d.DISPOSICION_CODIGO,
		e.ESTADO_INMUEBLE_CODIGO,
		p.PROPIETARIO_CODIGO
	FROM gd_esquema.Maestra m
	JOIN MMMD.Barrio b ON m.INMUEBLE_BARRIO = b.BARRIO_NOMBRE
	JOIN MMMD.Localidad l ON m.INMUEBLE_LOCALIDAD = l.LOCALIDAD_NOMBRE and b.BARRIO_LOCALIDAD_CODIGO = l.LOCALIDAD_CODIGO
	JOIN MMMD.Provincia prov ON m.INMUEBLE_PROVINCIA = prov.PROVINCIA_NOMBRE and l.LOCALIDAD_PROVINCIA_CODIGO = prov.PROVINCIA_CODIGO
	JOIN MMMD.TipoInmueble t ON m.INMUEBLE_TIPO_INMUEBLE = t.TIPOINMUEBLE_NOMBRE
	JOIN MMMD.CantidadAmbientes c ON m.INMUEBLE_CANT_AMBIENTES = c.AMBIENTES_NOMBRE
	JOIN MMMD.DisposicionInmueble d ON m.INMUEBLE_DISPOSICION = d.DISPOSICION_NOMBRE
	JOIN MMMD.EstadoInmueble e ON m.INMUEBLE_ESTADO = e.ESTADO_INMUEBLE_NOMBRE
	JOIN MMMD.Propietario p ON p.PROPIETARIO_DNI = m.PROPIETARIO_DNI 
		and p.PROPIETARIO_APELLIDO = m.PROPIETARIO_APELLIDO
		and p.PROPIETARIO_NOMBRE = m.PROPIETARIO_NOMBRE
	WHERE m.INMUEBLE_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE MMMD.Migrar_CaracteristicasPorImueble AS
BEGIN
	DECLARE @inmuebleCod numeric(18, 0)
	DECLARE @caracWIFI bit, @caracCABLE bit, @caracCALEFACCION bit, @caracGAS bit
	DECLARE @codWifi numeric(18, 0), @codCable numeric(18, 0), @codCalefaccion numeric(18, 0), @codGas numeric(18, 0)

	select @codWifi = CARACTERISTICA_CODIGO from MMMD.CaracteristicaBase where CARACTERISTICA_NOMBRE = 'Wifi'
	select @codCable = CARACTERISTICA_CODIGO from MMMD.CaracteristicaBase where CARACTERISTICA_NOMBRE = 'Cable'
	select @codCalefaccion = CARACTERISTICA_CODIGO from MMMD.CaracteristicaBase where CARACTERISTICA_NOMBRE = 'Calefacción'
	select @codGas = CARACTERISTICA_CODIGO from MMMD.CaracteristicaBase where CARACTERISTICA_NOMBRE = 'Gas'


	DECLARE inmueble_cursor CURSOR FOR
		SELECT DISTINCT
			m.INMUEBLE_CODIGO,
			m.INMUEBLE_CARACTERISTICA_WIFI,
			m.INMUEBLE_CARACTERISTICA_CABLE,
			m.INMUEBLE_CARACTERISTICA_CALEFACCION,
			m.INMUEBLE_CARACTERISTICA_GAS
		FROM gd_esquema.Maestra m
		where INMUEBLE_CODIGO is not null
		order by INMUEBLE_CODIGO

	OPEN inmueble_cursor
	FETCH NEXT FROM inmueble_cursor INTO @inmuebleCod, @caracWIFI, @caracCABLE, @caracCALEFACCION, @caracGAS

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @caracWIFI = 1
			INSERT INTO CaracteristicaPorInmueble(CARACTERISTICA_CODIGO, INMUEBLE_CODIGO) VALUES (@codWifi, @inmuebleCod)
		IF @caracCABLE = 1
			INSERT INTO CaracteristicaPorInmueble(CARACTERISTICA_CODIGO, INMUEBLE_CODIGO) VALUES (@codCable, @inmuebleCod)
		IF @caracCALEFACCION = 1
			INSERT INTO CaracteristicaPorInmueble(CARACTERISTICA_CODIGO, INMUEBLE_CODIGO) VALUES (@codCalefaccion, @inmuebleCod)
		IF @caracGAS = 1
			INSERT INTO CaracteristicaPorInmueble(CARACTERISTICA_CODIGO, INMUEBLE_CODIGO) VALUES (@codGas, @inmuebleCod)

		FETCH NEXT FROM inmueble_cursor INTO @inmuebleCod, @caracWIFI, @caracCABLE, @caracCALEFACCION, @caracGAS
	END

	CLOSE inmueble_cursor
	DEALLOCATE inmueble_cursor
END
GO

----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------- EXECS --------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

BEGIN TRANSACTION 
	EXEC MMMD.Migrar_Comprador
	EXEC MMMD.Migrar_Moneda
	EXEC MMMD.Migrar_MedioDePago
	EXEC MMMD.Migrar_Propietario
	EXEC MMMD.Migrar_Provincia
	EXEC MMMD.Migrar_Localidad
	EXEC MMMD.Migrar_Barrio
	EXEC MMMD.Migrar_Sucursal
	EXEC MMMD.Migrar_Agente
	EXEC MMMD.Migrar_DetalleAlq
	EXEC MMMD.Migrar_Inquilino
	EXEC MMMD.Migrar_EstadoAlquiler
	EXEC MMMD.Migrar_Alquiler
	EXEC MMMD.Migrar_CantidadAmbientes
	EXEC MMMD.Migrar_EstadoInmueble
	EXEC MMMD.Migrar_TipoInmueble
	EXEC MMMD.Migrar_DisposicionInmueble
	EXEC MMMD.Migrar_EstadoAnuncio
	EXEC MMMD.Migrar_TipoPeriodo
	EXEC MMMD.Migrar_TipoOperacion
	EXEC MMMD.Migrar_CaracteristicaBase
	EXEC MMMD.Migrar_PagoAlquiler
	EXEC MMMD.Migrar_PagoVenta
	EXEC MMMD.Migrar_Venta
	EXEC MMMD.Migrar_Anuncio
	EXEC MMMD.Migrar_Inmueble 
	EXEC MMMD.Migrar_CaracteristicasPorImueble
COMMIT TRANSACTION
GO

----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- CONSTRAINTS ----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

/*FK de sucursal en agente*/
ALTER TABLE [MMMD].[Agente]
ADD CONSTRAINT FK_SucursalCodigo FOREIGN KEY (AGENTE_SUCURSAL_CODIGO)
REFERENCES [MMMD].[Sucursal] (SUCURSAL_CODIGO)
GO

/*FK de localidad en sucursal*/
ALTER TABLE [MMMD].[Sucursal]
ADD CONSTRAINT FK_LocalidadCodigo FOREIGN KEY (SUCURSAL_LOCALIDAD_CODIGO)
REFERENCES [MMMD].[Localidad] (LOCALIDAD_CODIGO)
GO

/*FK de provincia en localidad*/
ALTER TABLE [MMMD].[Localidad]
ADD CONSTRAINT FK_ProvinciaCodigo FOREIGN KEY (LOCALIDAD_PROVINCIA_CODIGO)
REFERENCES [MMMD].[Provincia] (PROVINCIA_CODIGO)
GO

/*FK de localidad en barrio*/
ALTER TABLE [MMMD].[Barrio]
ADD CONSTRAINT FK_LocalidadDeBarrioCodigo FOREIGN KEY (BARRIO_LOCALIDAD_CODIGO)
REFERENCES [MMMD].[Localidad] (LOCALIDAD_CODIGO)
GO

/*Fk de tipo operacion en anuncio*/
ALTER TABLE [MMMD].[Anuncio]
ADD CONSTRAINT FK_TipoOperacionCodigo FOREIGN KEY (ANUNCIO_TIPO_OPERACION)
REFERENCES [MMMD].[TipoOperacion] (OP_CODIGO)
GO

/*Fk de moneda en anuncio*/
ALTER TABLE [MMMD].[Anuncio]
ADD CONSTRAINT FK_MonedaAnuncioCodigo FOREIGN KEY (ANUNCIO_MONEDA)
REFERENCES [MMMD].[Moneda] (MONEDA_CODIGO)
GO

/*Fk de estado anuncio en anuncio*/
ALTER TABLE [MMMD].[Anuncio]
ADD CONSTRAINT FK_EstadoCodigo FOREIGN KEY (ANUNCIO_ESTADO)
REFERENCES [MMMD].[EstadoAnuncio] (ESTADO_ANUNCIO_CODIGO)
GO

/*Fk de tipo tipo periodo en anuncio*/
ALTER TABLE [MMMD].[Anuncio]
ADD CONSTRAINT FK_TipoPeriodoCodigo FOREIGN KEY (ANUNCIO_TIPO_PERIODO)
REFERENCES [MMMD].[TipoPeriodo] (TIPO_PERIODO_CODIGO)
GO

/*Fk de agente en anuncio*/
ALTER TABLE [MMMD].[Anuncio]
ADD CONSTRAINT FK_AgenteCodigo FOREIGN KEY (ANUNCIO_AGENTE_CODIGO)
REFERENCES [MMMD].[Agente] (AGENTE_CODIGO)
GO

/*Fk de inmueble en anuncio*/
ALTER TABLE [MMMD].[Anuncio]
ADD CONSTRAINT FK_InmuebleCodigo FOREIGN KEY (ANUNCIO_INMUEBLE_CODIGO)
REFERENCES [MMMD].[Inmueble] (INMUEBLE_CODIGO)
GO

/*Fk de inmueble en CaracteristicaPorInmueble*/
ALTER TABLE [MMMD].[CaracteristicaPorInmueble]
ADD CONSTRAINT FK_InmuebleCaracteristicaCodigo FOREIGN KEY (INMUEBLE_CODIGO)
REFERENCES [MMMD].[Inmueble] (INMUEBLE_CODIGO)
GO

/*Fk de inmueble en CaracteristicaPorInmueble*/
ALTER TABLE [MMMD].[CaracteristicaPorInmueble]
ADD CONSTRAINT FK_CaracteristicaInmuebleCodigo FOREIGN KEY (CARACTERISTICA_CODIGO)
REFERENCES [MMMD].[CaracteristicaBase] (CARACTERISTICA_CODIGO)
GO

/*Fk de barrio en inmueble*/
ALTER TABLE [MMMD].[Inmueble]
ADD CONSTRAINT FK_BarrioCodigo FOREIGN KEY (INMUEBLE_BARRIO)
REFERENCES [MMMD].[Barrio] (BARRIO_CODIGO)
GO

/*Fk de tipo inmueble en inmueble*/
ALTER TABLE [MMMD].[Inmueble]
ADD CONSTRAINT FK_TipoInmuebleCodigo FOREIGN KEY (INMUEBLE_TIPO_INMUEBLE)
REFERENCES [MMMD].[TipoInmueble] (TIPOINMUEBLE_CODIGO)
GO

/*Fk de cantidad ambientes en inmueble*/
ALTER TABLE [MMMD].[Inmueble]
ADD CONSTRAINT FK_CantAmbientesCodigo FOREIGN KEY (INMUEBLE_CANT_AMBIENTES)
REFERENCES [MMMD].[CantidadAmbientes] (AMBIENTES_CODIGO)
GO

/*Fk de disposicion en inmueble*/
ALTER TABLE [MMMD].[Inmueble]
ADD CONSTRAINT FK_DisposicionCodigo FOREIGN KEY (INMUEBLE_DISPOSICION)
REFERENCES [MMMD].[DisposicionInmueble] (DISPOSICION_CODIGO)
GO

/*Fk de estado inmueble en inmueble*/
ALTER TABLE [MMMD].[Inmueble]
ADD CONSTRAINT FK_EstadoInmuebleCodigo FOREIGN KEY (INMUEBLE_ESTADO)
REFERENCES [MMMD].[EstadoInmueble] (ESTADO_INMUEBLE_CODIGO)
GO

/*Fk de propietario en inmueble*/
ALTER TABLE [MMMD].[Inmueble]
ADD CONSTRAINT FK_PropietarioCodigo FOREIGN KEY (INMUEBLE_PROPIETARIO_CODIGO)
REFERENCES [MMMD].[Propietario] (PROPIETARIO_CODIGO)
GO

/*Fk de moneda en venta*/
ALTER TABLE [MMMD].[Venta]
ADD CONSTRAINT FK_MonedaVentaCodigo FOREIGN KEY (VENTA_MONEDA)
REFERENCES [MMMD].[Moneda] (MONEDA_CODIGO)
GO

/*Fk de anuncio en venta*/
ALTER TABLE [MMMD].[Venta]
ADD CONSTRAINT FK_AnuncioVentaCodigo FOREIGN KEY (VENTA_ANUNCIO_CODIGO)
REFERENCES [MMMD].[Anuncio] (ANUNCIO_CODIGO)
GO

/*Fk de comprador en venta*/
ALTER TABLE [MMMD].[Venta]
ADD CONSTRAINT FK_CompradorCodigo FOREIGN KEY (VENTA_COMPRADOR_CODIGO)
REFERENCES [MMMD].[Comprador] (COMPRADOR_CODIGO)
GO

/*Fk de venta en pago venta*/
ALTER TABLE [MMMD].[PagoVenta]
ADD CONSTRAINT FK_VentaCodigo FOREIGN KEY (PAGO_VENTA_VENTA_CODIGO)
REFERENCES [MMMD].[Venta] (VENTA_CODIGO)
GO

/*Fk de moneda en pago venta*/
ALTER TABLE [MMMD].[PagoVenta]
ADD CONSTRAINT FK_MonedaPagoVentaCodigo FOREIGN KEY (PAGO_VENTA_MONEDA)
REFERENCES [MMMD].[Moneda] (MONEDA_CODIGO)
GO

/*Fk de medio pago en pago venta*/
ALTER TABLE [MMMD].[PagoVenta]
ADD CONSTRAINT FK_MedioPagoPagoVentaCodigo FOREIGN KEY (PAGO_VENTA_MEDIO_PAGO)
REFERENCES [MMMD].[MedioDePago] (MEDIO_PAGO_CODIGO)
GO

/*Fk de anuncio en alquiler*/
ALTER TABLE [MMMD].[Alquiler]
ADD CONSTRAINT FK_AnuncioAlquilerCodigo FOREIGN KEY (ALQUILER_ANUNCIO_CODIGO)
REFERENCES [MMMD].[Anuncio] (ANUNCIO_CODIGO)
GO

/*Fk de anuncio en alquiler*/
ALTER TABLE [MMMD].[Alquiler]
ADD CONSTRAINT FK_InquilinoCodigo FOREIGN KEY (ALQUILER_INQUILINO_CODIGO)
REFERENCES [MMMD].[Inquilino] (INQUILINO_CODIGO)
GO

/*Fk de estado alquiler en alquiler*/
ALTER TABLE [MMMD].[Alquiler]
ADD CONSTRAINT FK_EstadoAlquilerCodigo FOREIGN KEY (ALQUILER_ESTADO)
REFERENCES [MMMD].[EstadoAlquiler] (ESTADO_ALQUILER_CODIGO)
GO

/*Fk de alquiler en detalle alquiler*/
ALTER TABLE [MMMD].[DetalleAlq]
ADD CONSTRAINT FK_AlquilerDetalleCodigo FOREIGN KEY (DETALLE_ALQ_ALQUILER_CODIGO)
REFERENCES [MMMD].[Alquiler] (ALQUILER_CODIGO)
GO

/*Fk de alquiler en pago alquiler*/
ALTER TABLE [MMMD].[PagoAlquiler]
ADD CONSTRAINT FK_AlquilerPagoCodigo FOREIGN KEY (PAGO_ALQUILER_ALQUILER_CODIGO)
REFERENCES [MMMD].[Alquiler] (ALQUILER_CODIGO)
GO

/*Fk de medio de pago en pago alquiler*/
ALTER TABLE [MMMD].[PagoAlquiler]
ADD CONSTRAINT FK_MedioPagoPagoAlquilerCodigo FOREIGN KEY (PAGO_ALQUILER_MEDIO_PAGO)
REFERENCES [MMMD].[MedioDePago] (MEDIO_PAGO_CODIGO)
GO

------------------------------------------------------------------------------------------------------------------
------------------------------------------------- BORRAR PROCS ---------------------------------------------------
------------------------------------------------------------------------------------------------------------------

IF OBJECT_ID('MMMD.Migrar_Comprador') IS NOT NULL DROP procedure MMMD.Migrar_Comprador
IF OBJECT_ID('MMMD.Migrar_Moneda') IS NOT NULL DROP procedure MMMD.Migrar_Moneda
IF OBJECT_ID('MMMD.Migrar_MedioDePago') IS NOT NULL DROP procedure MMMD.Migrar_MedioDePago
IF OBJECT_ID('MMMD.Migrar_Propietario') IS NOT NULL DROP procedure MMMD.Migrar_Propietario
IF OBJECT_ID('MMMD.Migrar_Provincia') IS NOT NULL DROP procedure MMMD.Migrar_Provincia
IF OBJECT_ID('MMMD.Migrar_Localidad') IS NOT NULL DROP procedure MMMD.Migrar_Localidad
IF OBJECT_ID('MMMD.Migrar_Barrio') IS NOT NULL DROP procedure MMMD.Migrar_Barrio
IF OBJECT_ID('MMMD.Migrar_Sucursal') IS NOT NULL DROP procedure MMMD.Migrar_Sucursal
IF OBJECT_ID('MMMD.Migrar_Agente') IS NOT NULL DROP procedure MMMD.Migrar_Agente
IF OBJECT_ID('MMMD.Migrar_DetalleAlq') IS NOT NULL DROP procedure MMMD.Migrar_DetalleAlq
IF OBJECT_ID('MMMD.Migrar_Inquilino') IS NOT NULL DROP procedure MMMD.Migrar_Inquilino
IF OBJECT_ID('MMMD.Migrar_EstadoAlquiler') IS NOT NULL DROP procedure MMMD.Migrar_EstadoAlquiler
IF OBJECT_ID('MMMD.Migrar_Alquiler') IS NOT NULL DROP procedure MMMD.Migrar_Alquiler
IF OBJECT_ID('MMMD.Migrar_CantidadAmbientes') IS NOT NULL DROP procedure MMMD.Migrar_CantidadAmbientes
IF OBJECT_ID('MMMD.Migrar_EstadoInmueble') IS NOT NULL DROP procedure MMMD.Migrar_EstadoInmueble
IF OBJECT_ID('MMMD.Migrar_TipoInmueble') IS NOT NULL DROP procedure MMMD.Migrar_TipoInmueble
IF OBJECT_ID('MMMD.Migrar_DisposicionInmueble') IS NOT NULL DROP procedure MMMD.Migrar_DisposicionInmueble
IF OBJECT_ID('MMMD.Migrar_EstadoAnuncio') IS NOT NULL DROP procedure MMMD.Migrar_EstadoAnuncio
IF OBJECT_ID('MMMD.Migrar_TipoPeriodo') IS NOT NULL DROP procedure MMMD.Migrar_TipoPeriodo
IF OBJECT_ID('MMMD.Migrar_TipoOperacion') IS NOT NULL DROP procedure MMMD.Migrar_TipoOperacion
IF OBJECT_ID('MMMD.Migrar_CaracteristicaBase') IS NOT NULL DROP procedure MMMD.Migrar_CaracteristicaBase
IF OBJECT_ID('MMMD.Migrar_PagoAlquiler') IS NOT NULL DROP procedure MMMD.Migrar_PagoAlquiler
IF OBJECT_ID('MMMD.Migrar_PagoVenta') IS NOT NULL DROP procedure MMMD.Migrar_PagoVenta
IF OBJECT_ID('MMMD.Migrar_Venta') IS NOT NULL DROP procedure MMMD.Migrar_Venta
IF OBJECT_ID('MMMD.Migrar_Anuncio') IS NOT NULL DROP procedure MMMD.Migrar_Anuncio
IF OBJECT_ID('MMMD.Migrar_Inmueble') IS NOT NULL DROP procedure MMMD.Migrar_Inmueble
IF OBJECT_ID('MMMD.Migrar_CaracteristicasPorImueble') IS NOT NULL DROP procedure MMMD.Migrar_CaracteristicasPorImueble
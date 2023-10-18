-- :::::::::::::::::: Catalogos iniciales ::::::::::::::::::

-- Insertar proyectos
INSERT INTO [dbo].[PROYECTO] (NOMBRE) VALUES ('Premia');
INSERT INTO [dbo].[PROYECTO] (NOMBRE) VALUES ('Konmi');
INSERT INTO [dbo].[PROYECTO] (NOMBRE) VALUES ('Yujule');

-- Insertar productos
INSERT INTO [dbo].[PRODUCTO] (DESCRIPCION) VALUES ('Premia Cl�sica');
INSERT INTO [dbo].[PRODUCTO] (DESCRIPCION) VALUES ('Premia Oro');
INSERT INTO [dbo].[PRODUCTO] (DESCRIPCION) VALUES ('Premia Platinum');

-- Insertar tipos de mensajes
INSERT INTO [dbo].[TIPO] (NOMBRE) VALUES ('Mensaje de texto');
INSERT INTO [dbo].[TIPO] (NOMBRE) VALUES ('Correo electr�nico');
INSERT INTO [dbo].[TIPO] (NOMBRE) VALUES ('Mensaje en el estado de cuenta');

-- Insertar tipos de informaci�n
INSERT INTO [dbo].[TIPO_INFORMACION] (NOMBRE) VALUES ('Mensaje de bienvenida');
INSERT INTO [dbo].[TIPO_INFORMACION] (NOMBRE) VALUES ('Mensaje de mora');
INSERT INTO [dbo].[TIPO_INFORMACION] (NOMBRE) VALUES ('Mensaje de promoci�n');

-- :::::::::::::::::: Mensajes ::::::::::::::::::

-- Insertar formatos de mensajes
INSERT INTO [dbo].[FORMATO_MENSAJE] (COD_TIPO, COD_TIPO_INFORMACION, NOMBRE, REMITENTE, ASUNTO)
VALUES ((SELECT COD_TIPO FROM [dbo].[TIPO] WHERE NOMBRE = 'Mensaje de texto'), 
        (SELECT COD_TIPO_INFORMACION FROM [dbo].[TIPO_INFORMACION] WHERE NOMBRE = 'Mensaje de bienvenida'), 
        'Formato 1', 'Remitente 1', 'Asunto 1');
INSERT INTO [dbo].[FORMATO_MENSAJE] (COD_TIPO, COD_TIPO_INFORMACION, NOMBRE, REMITENTE, ASUNTO)
VALUES ((SELECT COD_TIPO FROM [dbo].[TIPO] WHERE NOMBRE = 'Correo electr�nico'), 
		(SELECT COD_TIPO_INFORMACION FROM [dbo].[TIPO_INFORMACION] WHERE NOMBRE = 'Mensaje de mora'), 
		'Formato 2', 'Remitente 2', 'Asunto 2');

-- Insertar el mensaje
INSERT INTO [dbo].[MENSAJE] (COD_FORMATO, PROYECTO, PRODUCTO)
VALUES ((SELECT COD_FORMATO FROM [dbo].[FORMATO_MENSAJE] WHERE NOMBRE = 'Formato 1'), 
        (SELECT PROYECTO FROM [dbo].[PROYECTO] WHERE NOMBRE = 'Premia'), 
        (SELECT PRODUCTO FROM [dbo].[PRODUCTO] WHERE DESCRIPCION = 'Premia Cl�sica'));

---- Insertar registros en PRODUCTO_PROYECTO para el proyecto 'Premia'
INSERT INTO [dbo].[PRODUCTO_PROYECTO] (PROYECTO, PRODUCTO)
VALUES ((SELECT PROYECTO FROM [dbo].[PROYECTO] WHERE NOMBRE = 'Premia'), 
        (SELECT PRODUCTO FROM [dbo].[PRODUCTO] WHERE DESCRIPCION = 'Premia Cl�sica'));

INSERT INTO [dbo].[PRODUCTO_PROYECTO] (PROYECTO, PRODUCTO)
VALUES ((SELECT PROYECTO FROM [dbo].[PROYECTO] WHERE NOMBRE = 'Premia'), 
        (SELECT PRODUCTO FROM [dbo].[PRODUCTO] WHERE DESCRIPCION = 'Premia Oro'));

INSERT INTO [dbo].[PRODUCTO_PROYECTO] (PROYECTO, PRODUCTO)
VALUES ((SELECT PROYECTO FROM [dbo].[PROYECTO] WHERE NOMBRE = 'Premia'), 
        (SELECT PRODUCTO FROM [dbo].[PRODUCTO] WHERE DESCRIPCION = 'Premia Platinum'));

-- ID del formato de mensaje que usaremos
DECLARE @CodFormato INT = (SELECT TOP 1 COD_FORMATO FROM [dbo].[FORMATO_MENSAJE]);

-- Inserta un mensaje para cada producto del proyecto 'Premia'
INSERT INTO [dbo].[MENSAJE] (COD_FORMATO, PROYECTO, PRODUCTO)
SELECT @CodFormato, PROYECTO, PRODUCTO
FROM [dbo].[PRODUCTO_PROYECTO]
WHERE PROYECTO = (SELECT PROYECTO FROM [dbo].[PROYECTO] WHERE NOMBRE = 'Premia');

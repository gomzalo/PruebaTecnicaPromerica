/*
Devuelve el nombre del proyecto y sus productos
correspondientes del proyecto premia cuyo código es 1.
*/
SELECT
	P.NOMBRE AS NombreProyecto,
	PR.DESCRIPCION AS NombreProducto
FROM
	PROYECTO P
INNER JOIN PRODUCTO_PROYECTO PP
	ON P.PROYECTO = PP.PROYECTO
INNER JOIN PRODUCTO PR
	ON PP.PRODUCTO = PR.PRODUCTO
WHERE
	P.PROYECTO = 1;
/*
Devuelve los distintos mensajes que hay,
indicando a qué proyecto y producto pertenecen.
*/
SELECT
	M.COD_MENSAJE AS CodigoMensaje,
	P.NOMBRE AS NombreProyecto,
	PR.DESCRIPCION AS NombreProducto
FROM
	MENSAJE M
INNER JOIN PROYECTO P
	ON M.PROYECTO = P.PROYECTO
INNER JOIN PRODUCTO PR
	ON M.PRODUCTO = PR.PRODUCTO;
/*
Devuelve los distintos mensajes que hay, indicando a
qué proyecto y producto pertenecen. Pero si el mensaje
está en todos los productos de un proyecto, 
en lugar de mostrar cada producto, debe mostrar el nombre del 
proyecto y un solo producto que diga “TODOS”.
*/
SELECT DISTINCT
	P.NOMBRE AS NombreProyecto,
	CASE 
		WHEN 
			(
			SELECT
				COUNT(DISTINCT PRODUCTO)
			FROM
				MENSAJE
			WHERE
				PROYECTO = M.PROYECTO
				AND COD_FORMATO = M.COD_FORMATO
			) = 
			(
			SELECT
				COUNT(DISTINCT PRODUCTO)
			FROM
				PRODUCTO_PROYECTO PP
			WHERE
				PP.PROYECTO = M.PROYECTO
			)
		THEN 'TODOS'
		ELSE PR.DESCRIPCION
	END AS NombreProducto
FROM
	MENSAJE M
INNER JOIN PRODUCTO_PROYECTO PP
	ON M.PROYECTO = PP.PROYECTO
	AND M.PRODUCTO = PP.PRODUCTO
INNER JOIN PROYECTO P
	ON M.PROYECTO = P.PROYECTO
INNER JOIN PRODUCTO PR
	ON M.PRODUCTO = PR.PRODUCTO
GROUP BY
	P.NOMBRE,
	M.PROYECTO,
	M.COD_FORMATO,
	PR.DESCRIPCION;
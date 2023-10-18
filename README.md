# PruebaTecnicaPromerica

Se le da solución a los distintos enunciados de la prueba técnica de Promerica para el puesto de Analista Desarrollador.

Las soluciones se encuentran en la carpeta [Enunciados](<Enunciados>). De igual forma cada solución contiene el enlace a su carpeta correspondiente.

## Tabla de contenido
- [PruebaTecnicaPromerica](#pruebatecnicapromerica)
  - [Tabla de contenido](#tabla-de-contenido)
  - [Instrucciones:](#instrucciones)
  - [Enunciados:](#enunciados)
    - [1 - Página ASPX](#1---página-aspx)
      - [Solución](#solución)
    - [2 - XML](#2---xml)
      - [Solución](#solución-1)


## Instrucciones:

Realice la siguiente prueba generando los scripts / archivos que aplique para cada uno y súbalo a un repositorio GIT en cualquier servicio en la nube. El link deberá ser enviado al correo electrónico de donde recibió la prueba para poderlo descargar y revisar.

## Enunciados:
### 1 - Página ASPX
Escriba el código de una página ASPX que solicite el nombre del usuario, contraseña, y que valide que los campos no vayan vacíos antes de enviar la solicitud al servidor.
#### [Solución](<Enunciados/1>)
    Se creó un proyecto de tipo ASP.NET Web Application (.NET Framework) con el nombre de `PaginaASPX` y se selecciona la plantilla de `Web Forms` para el proyecto.

![Página login](Enunciados/1/img/Application.png)

    Se crea un formulario con los campos solicitados y se agrega un botón para enviar la solicitud al servidor.

    Se agregan mensajes para el usuario en caso de que los campos estén vacíos.

![Página login](Enunciados/1/img/CamposVacios.png)

    Se agrega un mensaje de error en caso de que el usuario o la contraseña sean incorrectos.

![Página login](Enunciados/1/img/CredencialesIncorrectas.png)

    En el caso de que las credenciales sean correctas se redirecciona a la página de contacto.
    Las credenciales correctas son:

- Usuario: `gomzalo`
- Contraseña: `Promerica2023.`

![Página login](Enunciados/1/img/Contacto.png)

    Se agregó un archivo de estilos para darle un mejor aspecto a la página del login.

### 2 - XML
Escriba un documento XML que permita intercambiar información de tarjetas de crédito entre dos sistemas distintos: nombre del sistema, localización, número de tarjeta, ID único de cliente, etc.
#### [Solución](<Enunciados/2>)
    Se creó un archivo XML con el nombre de `TarjetaCredito.xml` con la siguiente estructura:

```xml
<?xml version="1.0" encoding="utf-8"?>
<TarjetaCredito>
  <Sistema>
    <Nombre>Nombre del sistema</Nombre>
    <Localizacion>Localización</Localizacion>
  </Sistema>
  <Tarjeta>
    <Numero>Numero de tarjeta</Numero>
    <Cliente>
      <ID>Id único de cliente</ID>
    </Cliente>
  </Tarjeta>
</TarjetaCredito>
```

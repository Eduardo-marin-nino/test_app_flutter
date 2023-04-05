# test_app_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Creación del proyecto e inicializacion del repositorio en git

se crea el proyecto flutter y iniciamos el repositorio para manejar el control de versiones git para manejar el proyecto iniciado.

# Estructuración del proyecto aplicando clean architecture 

Iniciamos en la estructuración del proyecto manejando una arquitectura modular separando la logica de negocio con la parte IU. Se maneja una carpeta nombrada core en donde se configura todo el themeData para colores, fuentes, etc. En la carpeta core también se maneja los providers en la cual guardamos variables que vayamos a consumir en nuestras interfaces, también manejamos muchas mas funcionalidades como son la configuration de las rutas para Los flujos correspondientes al desarrollo de la app y los servicios para consumir información de bases de datos.

Tenemos la carpeta data en la cual modelamos toda la información que va a contener el proyecto y clases que nos sirven para funciones utilitarias.

GIU encontramos todos las screen que contiene la app y también manejamos plantillas para complementar las screens y widgets que nos son de mucha ayuda.

# Utilización de dependencias

Se instalan dependencias que nos facilitan las tareas para obtener un mejor resultado en nuestro proyecto.

# Unit Testing 

Para las pruebas unitarias de nuestros repositorios o servicios creamos un file que nos permite realizar la prueba unitaria para nuestros metodos funciones o clases de la cual generamos para funciones en general de la aplicación, despues de crear el archivo _test.dart para testear las funciones que funcionen correctamente despues generar los metodos para el testeo corremos el comando flutter test para generar el testeo y saber que todo esta correcto con las implementaciones.

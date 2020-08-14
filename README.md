# GOT 
## Requisitos para el Uso de GOT
* Esta aplicación fue desarrollada para el sistema operativo Linux.
* Se debe de contar con Visual Studio Code.
* Visual Studio debe de contar con las extensiones "C/C++", "CMAKE" y "CMAKE TOOLS"
* Se debe de contar con Mysql y Mysql workbench.
* Finalmente se debe de contar con VIM.

## Instrucciones de Clonación del Repositorio

* En la sección de código se debe selecionar el boton code, para poder clonar el repositorio, se puede hacer de dos formas: descargando el archivo comprimido y descomprimirlo o clonandolo con una herramienta externa, en este caso GitKraken.

![](https://github.com/Jachm11/Spirit-Tower/blob/master/clone.png)

### Clonar con GitKraken
* Si no se cuenta con GitKraken y desea clonar el repositorio por este medio puede instalarlo aqui: [Instalar GitKraken](https://support.gitkraken.com/how-to-install/)
* Se copia el Link de clonación de github, y se dirige a GitKraken a la sección de clonación 

![](https://github.com/Jachm11/Spirit-Tower/blob/master/clone%20git.png)

* Se accede a la opción de clonar, se pega el link y listo!

![](https://github.com/Jachm11/Spirit-Tower/blob/master/clone%202.png)


## Paso para la ejecución del programa

1) Iniciar la base de datos (ejecutar antes de correr el programa).
2) Ejecutar el Cmake y el programa GOT

## Creación de la base de datos 
En primera instancia, se debe ejecutar el comando "sudo mysql" para iniciar la base de datos.

Una vez con el repositorio clonado, se debe abrir "Mysql Workbench" en donde se inicia la sesión en el localHost que se encuentra disponible. 

![](https://github.com/sebas0163/GOT/blob/master/Diagramas/localhost.png)

Dentro del editor, se selecciona la opcion de agregar documentos .sql y se añaden los archivos ("Creacion_base_tablas","GOTprocedures","Asig_ForeingKey") de la carpeta "Querys_BaseDatos".

![](https://github.com/sebas0163/GOT/blob/master/Diagramas/abrir1.png)


![](https://github.com/sebas0163/GOT/blob/master/Diagramas/abrir2.png)

Cada de archivo debe de correrse para crear la base de datos adecuadamente.


![](https://github.com/sebas0163/GOT/blob/master/Diagramas/compilar.png)


## Instrucciones de ejecución de CMAKE 

**Instalacion de cmake**
Para instalar cmake se deben ejcuatar los sigguientes comandos en el terminal 

![](https://github.com/sebas0163/GOT/blob/master/Diagramas/install%20cmake.png)

![](https://github.com/sebas0163/GOT/blob/master/Diagramas/install%20ssl.png)


Despues para poder ejecutar el programa desde el terminal se debe igresar al directorio Requets (copy), la ruta varia dependiendo del usuario, para este caso es la siguiente

![](https://github.com/sebas0163/GOT/blob/master/Diagramas/dir.png)

Posteriormente se compila el programa con los siguientes comandos:

![](https://github.com/sebas0163/GOT/blob/master/Diagramas/cmake.png)

![](https://github.com/sebas0163/GOT/blob/master/Diagramas/make.png)

Finalmente ejecutamos el programa

![](https://github.com/sebas0163/GOT/blob/master/Diagramas/requests.png)


Una vez esto ya se puede interactuar con el programa.

En caso de querer editar el codigo se puede acceder mediante Visual Studio, asegurandose de tener las extensiones mencionadas anteriormente y configurar el buil por medio de la paleta de comandos utilizando cmake: build

La configuraciod de visual debe verse asi:

![](https://github.com/sebas0163/GOT/blob/master/Diagramas/VS.png)

## Instrucciones de Ejecución 
* Al iniciar GOT, se debe de agregar un nombre de usuario y una contraseña, esto va a identificar los datos enviados a la base.
* Posterior se pueden usar los comandos especificados en la Wiki del proyecto, especificamente en la sección de Descripción del proyecto.
* NOTA: GOT befriend puede ser utlizado si existe un repositorio en el la base de datos.

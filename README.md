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

//Imagen de seleccionar archivos 

![](https://github.com/sebas0163/GOT/blob/master/Diagramas/abrir2.png)

Cada de archivo debe de correrse para crear la base de datos adecuadamente.

// Imagen de compilación 


## Instrucciones de ejecución de CMAKE 

Una vez que el repositorio ha sido clonado con éxito se debe de abrir la Carpeta "Request C++ (copy )" con visual Studio y en la paleta de comandos colocar "cmake: build" y ejecutar el programa en VSCode.

//IMAGEN DE LA CARPETA
// IMAGEN PALETA Y PLAY

Una vez esto ya se puede interactuar el programa.

## Instrucciones de Ejecución 
* Al iniciar GOT, se debe de agregar un nombre de usuario y una contraseña, esto va a identificar los datos enviados a la base.
* Posterior se pueden usar los comandos especificados en la Wiki del proyecto, especificamente en la sección de Descripción del proyecto.
* NOTA: GOT befriend puede ser utlizado si existe un repositorio en el la base de datos.

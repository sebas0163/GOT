#crear base de datos
CREATE DATABASE IF NOT EXISTS DataGOT;
 
 
#Se indica a que base se le agregan las tablas
USE DataGOT;
 
#Se crean las tablas sin relación

# tabla documentos 
CREATE TABLE IF NOT EXISTS Documento(
id_docu INT NOT NULL AUTO_INCREMENT,
id_commit VARCHAR(8000),
nombre VARCHAR(200) NOT NULL,
id_repo INT NOT NULL,
orginal TEXT NOT NULL,
diccionario TEXT NOT NULL,
PRIMARY KEY(id_docu)
);

# Tabla repositorios
CREATE TABLE IF NOT EXISTS Repositorios(
id_repo INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(200) NOT NULL,
PRIMARY KEY(id_repo)
);

# Tabla usuarios
CREATE TABLE IF NOT EXISTS Usuarios(
id_usr INT NOT NULL AUTO_INCREMENT,
nombre varchar(100) NOT NULL,
id_repo INT NOT NULL,
PRIMARY KEY(id_usr)
);

# Tabla versiones
CREATE TABLE IF NOT EXISTS Versiones(
id_commit VARCHAR(500) NOT NULL,
commmit_msg TEXT NOT NULL,
id_docu INT NOT NULL,
id_usr INT NOT NULL,
fecha DATE NOT NULL,
datos TEXT NOT NULL,
diccionario TEXT NOT NULL,
PRIMARY KEY(id_commit)
);




 
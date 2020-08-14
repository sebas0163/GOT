# Asignación de referencias a ids

#Base de datos asignada
USE DataGOT;

# Asinación de llave foranea [|:)
# Documento que posee el atributo id_repo y referencia a la tabla Repositorios
ALTER TABLE Documento
ADD CONSTRAINT Documento_id_repo_FK FOREIGN KEY(id_repo)
REFERENCES Repositorio(id_repo);


# Asinación de llave foranea [|:)
# Versiones posee el atributo id_docu que referencia a la tabla documento

ALTER TABLE Versiones
ADD CONSTRAINT Versiones_id_docu_FK FOREIGN KEY(id_docu)
REFERENCES Documento(id_docu);

# Asinación de llave foranea [|:)
# Versiones posee el atributo id_usr que referencia a la tabla usuarios

ALTER TABLE Versiones
ADD CONSTRAINT Versiones_id_usr_FK FOREIGN KEY(id_usr)
REFERENCES Usuario(id_usr);



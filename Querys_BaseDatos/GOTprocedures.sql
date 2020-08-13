
USE DataGOT;
#---procedimiento para init--------------------------
DELIMITER $$

create procedure GOTinit
(
	IN _user VARCHAR(200),
	IN _name VARCHAR(200)
)
begin
    INSERT INTO  Repositorio(nombre)
	values 
	(_name);
    
    SET @id = (SELECT id_repo FROM Repositorio
    WHERE  nombre = _name LIMIT 1) ;
    
    UPDATE Usuario SET id_repo = @id
    WHERE nombre = _user;
    
    
end$$
DELIMITER ;


# -----Procedimiento para trabajar en conjunto------
DELIMITER $$

CREATE PROCEDURE GOTbefriend
(
	IN _user VARCHAR(200),
    IN _nombre VARCHAR(200)
)
begin
	SET @id_rep = (SELECT id_repo FROM Usuario 
    WHERE nombre = _nombre);
    UPDATE Usuario SET id_repo = @id_rep
    WHERE nombre = _user;
end$$
DELIMITER ;


#---procedimiento para commit--------------------------
DELIMITER $$


create procedure GOTcommit
(
	IN _user VARCHAR(200),
	IN _docuName VARCHAR(200),
    IN _commitID VARCHAR(500),
    IN _data TEXT,
    IN _dic TEXT,
    IN _msg TEXT
)
begin
SET @id_rep = (SELECT id_repo FROM Usuario
WHERE nombre = _user);

SET @id_usuario = (SELECT id_usr FROM Usuario WHERE nombre=_user);


IF (SELECT nombre FROM Documento WHERE id_repo = @id_rep AND nombre = _docuName) IS NOT NULL THEN
	SET @id_doc = (SELECT id_docu FROM Documento WHERE id_repo = @id_rep AND nombre = _docuName);
	INSERT INTO Versiones(id_commit,commit_msg,id_docu,id_usr,datos,diccionario)
    VALUES 
    (_commitID,_msg,@id_doc,@id_usuario,_data,_dic);
ELSE
	INSERT INTO Documento(commit_act,nombre,id_repo,original,diccionario)
    VALUES 
    (_commitID, _docuName, @id_rep ,_data,_dic);
    END IF;
	
end$$
DELIMITER ;


#---procedimiento para status de archivo--------------------------
DELIMITER $$

create procedure GOTfileStatus
(
	in _user VARCHAR(200),
	in _docuName VARCHAR(200)
)
begin
	SET @id_rep = (SELECT id_repo FROM Usuario 
    WHERE nombre = _user);
    
    SET @id_doc = (SELECT id_docu FROM Documento 
    WHERE nombre = _docuName AND id_repo = @id_rep);
    
	SELECT * FROM Versiones
    WHERE id_docu = @id_doc ;
    
	#Definir que devuelve
    
end$$
DELIMITER ;


#---procedimiento para status de usuario--------------------------
DELIMITER $$

create procedure GOTuserStatus
(
	in _user VARCHAR(200)
)
begin
	SET @id_rep = (SELECT id_repo FROM Usuario WHERE nombre = _user);
    SELECT * FROM Documento WHERE id_repo = @id_rep;
	#Definir que devuelve

end$$
DELIMITER ;


#---procedimiento para rollback--------------------------
DELIMITER $$

create procedure GOTrollback
(
	in _user VARCHAR(200),
	in _docuName VARCHAR(200),
    in _commit VARCHAR(500)
)
begin
	SET @id_rep = (SELECT id_repo FROM Usuario WHERE nombre=_user);
    SET @id_doc=(SELECT id_docu FROM Documento 
    WHERE nombre = _docuName AND id_repo = @id_rep);
    SELECT datos,diccionario FROM Versiones WHERE id_docu = @id_doc AND id_commit = _commit;

end$$
DELIMITER ;


#---procedimiento para sync/reset--------------------------
DELIMITER $$

create procedure GOTnewestFile
(
	in _user VARCHAR(200),
	in _docuName VARCHAR(200)
)
begin
	SET @id_rep = (SELECT id_repo FROM Usuario WHERE nombre=_user);
    SET @id_doc=(SELECT id_docu FROM Documento 
    WHERE nombre = _docuName AND id_repo = @id_rep);
    SELECT datos,diccionario FROM Versiones 
    WHERE fecha= (SELECT MAX(fecha)FROM Versiones) AND id_docu = @id_doc;
    

end$$
DELIMITER ;




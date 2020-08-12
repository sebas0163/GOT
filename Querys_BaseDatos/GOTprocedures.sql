#---procedimiento para init--------------------------
DELIMITER $$

create procedure GOTinit
(
	in _user VARCHAR(200),
	in _name VARCHAR(200)
)
begin
    INSERT INTO Repositorio(nombre)
	values 
	(_name);
    
    INSERT INTO Usuario(nombre,id_repo)
	Values
    (_user);
	
end$$
DELIMITER ;


#---procedimiento para commit--------------------------
DELIMITER $$

create procedure GOTcommit
(
	in _user VARCHAR(200), 
	in _filename VARCHAR(200),
    in _commitID VARCHAR(500),
    in _data TEXT,
    in _dic TEXT,
    in _msg TEXT
)
begin
	
end$$
DELIMITER ;


#---procedimiento para status de archivo--------------------------
DELIMITER $$

create procedure GOTfileStatus
(
	in _user VARCHAR(200),
	in _filename VARCHAR(200)
)
begin

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

	#Definir que devuelve

end$$
DELIMITER ;


#---procedimiento para rollback--------------------------
DELIMITER $$

create procedure GOTrollback
(
	in _user VARCHAR(200),
	in _filename VARCHAR(200),
    in _commit VARCHAR(500)
)
begin
	
    SELECT * FROM Documento 
    WHERE nombre = _filename AND commit_act = _commit;

end$$
DELIMITER ;


#---procedimiento para sync/reset--------------------------
DELIMITER $$

create procedure GOTnewestFile
(
	in _user VARCHAR(200),
	in _filename VARCHAR(200)
)
begin
	
    SELECT * FROM Documento 
    WHERE nombre = _filename;
    

end$$
DELIMITER ;



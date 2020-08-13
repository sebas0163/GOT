USE DataGOT;
INSERT INTO Usuario(nombre,id_repo)
Values
("maria",1),
("Juan",2);

INSERT INTO Repositorio(nombre)
values 
("repo1"),
("repo2");
INSERT INTO Documento(commit_act,nombre,id_repo,original,diccionario)
VALUES
("holaaaaa", "sebas",1,"0125874","000011"),
("holaaaaa2", "perro",2,"0125554","001011");
INSERT INTO Versiones(id_commit,commit_msg,id_docu,id_usr,datos,diccionario)
VALUES
("holaaaaa","commit1",1,1,"dkcmk2","0.0001"),
("holaaaaa2","commit2",2,1,"dkcmk3","0.00101"),
("holaaaaa3","commit3",2,1,"dkcmk3","0.00101");

call GOTcommit("juan","conejo","fd5vdvvf","014010","101145","mensaje");
select * from Versiones;

DROP database DataGOT;

DROP procedure GOTcommit;

DROP procedure GOTnewestFile;

SELECT * FROM Documento;

SELECT * FROM Versiones;

SELECT * FROM Usuario;

SELECT * FROM Repositorio;

CALL GOTnewestFile ("jose", "letras.txt");

DROP database DataGOT;


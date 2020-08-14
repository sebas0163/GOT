const mysql = require('mysql');

const user = process.argv[2];
const psw  = process.argv[3];

const pool = mysql.createPool({
    connectionLimit: 10,
    password: psw,
    user: user,
    database: 'pruebita',
    host: 'localhost',
    port: '3306'

});

function parseForStatusFile(json) {

    var newJson = JSON.stringify(json);
    var obj  = JSON.parse(newJson);
    var string;
    for (var i=0;i<obj.length;i++) {
        string = string + obj[i].Date + '/' + obj[i].Nombre + '/' + obj[i].Id_commit + '/' + obj[i].commit_msg + "/" + obj[i].Dic + "/" + obj[i].Data + "/";
     }

    return string.slice(0, -1);
    
}

function parseForStatus(json) {

    var newJson = JSON.stringify(json);
    var obj  = JSON.parse(newJson);
    var string;
    for (var i=0;i<obj.length;i++) {
        string = string + obj[i].Nombre + '/'  + obj[i].Dic + "/" + obj[i].Data + "/";
     }

    return string.slice(0, -1);
    
}

function parseForRRS(json) {

    var newJson = JSON.stringify(json);
    var obj  = JSON.parse(newJson);
    var string;
    for (var i=0;i<obj.length;i++) {
        string = string + obj[i].Dic + "/" + obj[i].Data + "/";
     }

    return string.slice(0, -1);
    
}

let GOTdb = {};

GOTdb.all = () => {

    return new Promise((resolve, reject)=> {

        pool.query(`SELECT * FROM juegos`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

GOTdb.one = (id) => {

    return new Promise((resolve, reject)=> {

        pool.query(`SELECT * FROM juegos WHERE id = ?`, [id], (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

//       _________________
//______/Iniciar sesion

GOTdb.iniciar = () => {
    return new Promise((resolve, reject)=> {

        pool.query(`INSERT INTO Usuario (nombre) VALUES (${user})
        WHERE NOT EXISTS(SELECT * FROM Usuario WHERE nombre=${user});`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });
};


//       _________________
//______/ Agregar colaborador

GOTdb.befriend = (name) => {

    return new Promise((resolve, reject)=> {

<<<<<<< Updated upstream
        pool.query(`CALL befriend @${user} @${name};`, (err,results)=>{
=======
        pool.query(`EXEC befriend @${user} @${name};`, (err,results)=>{
>>>>>>> Stashed changes

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

//       _________________
//______/ init <name>

GOTdb.init = (name) => {

    return new Promise((resolve, reject)=> {

        pool.query(`CALL init @${user} @${name};`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

//       _________________
//______/ commit <msg>

GOTdb.commitFile = (filename,commitId,data,dic,msg) => {

    return new Promise((resolve, reject)=> {

<<<<<<< Updated upstream
        pool.query(`CALL commit @${user} @${filename} @${commitId} @${data} @${dic} @${msg};`, (err,results)=>{
=======
        pool.query(`EXEC commit @${user} @${filename} @${commitId} @${data} @${dic} @${msg};`, (err,results)=>{
>>>>>>> Stashed changes

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

//       ____________
//______/ status


GOTdb.userStatus = () => {

    return new Promise((resolve, reject)=> {

<<<<<<< Updated upstream
        pool.query(`CALL userStatus @${user};`, (err,results)=>{
=======
        pool.query(`EXEC userStatus @${user};`, (err,results)=>{
>>>>>>> Stashed changes

            if (err){
                return reject(err);
            }

            let answer = parseForStatus(results);
            return resolve(answer);

        });
    });

};

//       _________________
//______/ status <file>

GOTdb.fileStatus = (filename) => {

    return new Promise((resolve, reject)=> {

<<<<<<< Updated upstream
        pool.query(`CALL fileStatus @${user} @${filename};`, (err,results)=>{
=======
        pool.query(`EXEC fileStatus @${user} @${filename};`, (err,results)=>{
>>>>>>> Stashed changes

            if (err){
                return reject(err);
            }
            let answer = parseForStatusFile(results);
            return resolve(answer);

        });
    });

};

//       _______________________________
//______/ rollback <filename> <commit>

GOTdb.rollback = (filename, commit) => { 

    return new Promise((resolve, reject)=> {

<<<<<<< Updated upstream
        pool.query(`CALL rollback @${user} @${filename} @${commit};`, (err,results)=>{
=======
        pool.query(`EXEC rollback @${user} @${filename} @${commit};`, (err,results)=>{
>>>>>>> Stashed changes

            if (err){
                return reject(err);
            }
            let answer = parseForRRS(results);
            return resolve(answer);

        });
    });

};

//       __________________________
//______/ rest <file> & sync <file>

GOTdb.newestFile = (filename) => {

    return new Promise((resolve, reject)=> {

<<<<<<< Updated upstream
        pool.query(`CALL newestFile @${user} @${filename};`, (err,results)=>{
=======
        pool.query(`EXEC newestFile @${user} @${filename};`, (err,results)=>{
>>>>>>> Stashed changes

            if (err){
                return reject(err);
            }
            let answer = parseForRRS(results);
            return resolve(answer);

        });
    });

};



module.exports = GOTdb;
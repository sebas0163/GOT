const mysql = require('mysql');

const user = process.argv[2];
const psw  = process.argv[3];

const pool = mysql.createPool({
    connectionLimit: 10,
    password: psw,
    user: user,
    database: 'DataGOT',
    host: 'localhost',
    port: '3306'

});

function parseTest(json) {

    var newJson = JSON.stringify(json);
    var obj  = JSON.parse(newJson);
    var string;
    for (var i=0;i<obj.length;i++) {
        string = string + obj[i].id_juego + '/' + obj[i].titulo + '/' + obj[i].año + '/' + obj[i].naciondalidad + "/";
     }

    return string.slice(0, -1); 
}

function parseForStatusFile(json,file) {

    var newJson = JSON.stringify(json);
    var obj  = JSON.parse(newJson);
    var string = "";
    for (var i=0;i<obj[0].length;i++) {
        string = string + obj[0][i].fecha + '/' + file + '/' + obj[0][i].id_commit + '/' + obj[0][i].commit_msg + "/" + obj[0][i].diccionario + "/" + obj[0][i].datos + "/";
     }


    return string.slice(0, -1);
    
}

function parseForStatus(json) {

    var newJson = JSON.stringify(json);
    var obj  = JSON.parse(newJson);
    var string = "";
    for (var i=0;i<obj[0].length;i++) {
        string = string + obj[0][i].nombre + '/'  + obj[0][i].diccionario + "/" + obj[0][i].datos + "/";
     }

    //return obj[0]; 
    return string.slice(0, -1);
    
}

function parseForRRS(json) {

    var newJson = JSON.stringify(json);
    var obj  = JSON.parse(newJson);
    var string = "";
    for (var i=0;i<obj[0].length;i++) {
        string = string + obj[0][i].diccionario + "/" + obj[0][i].datos + "/";
     }

    //return obj;
    return string.slice(0, -1);
    
}

let GOTdb = {};

GOTdb.all = () => {

    return new Promise((resolve, reject)=> {

        pool.query(`SELECT * FROM Usuario`, (err,results)=>{

            if (err){
                return reject(err);
            }
            //let answer = parseTest(results);
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

        pool.query(`CALL GOTlogmein ("${user}")`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });
};


//       ______________________
//______/ Agregar colaborador

GOTdb.befriend = (name) => {

    return new Promise((resolve, reject)=> {

        pool.query(`CALL GOTbefriend ("${user}", "${name}");`, (err,results)=>{

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

        pool.query(`CALL GOTinit ("${user}", "${name}");`, (err,results)=>{

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

        pool.query(`CALL GOTcommit ("${user}", "${filename}", "${commitId}", "${data}", "${dic}", "${msg}");`, (err,results)=>{

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

        pool.query(`CALL GOTuserStatus ("${user}");`, (err,results)=>{

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

        pool.query(`CALL GOTfileStatus ("${user}" ,"${filename}");`, (err,results)=>{

            if (err){
                return reject(err);
            }
            let answer = parseForStatusFile(results,filename);
            return resolve(answer);

        });
    });

};

//       _______________________________
//______/ rollback <filename> <commit>

GOTdb.rollback = (filename, commit) => { 

    return new Promise((resolve, reject)=> {

        pool.query(`CALL GOTrollback ("${user}", "${filename}", "${commit}");`, (err,results)=>{

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

        pool.query(`CALL GOTnewestFile ("${user}", "${filename}");`, (err,results)=>{

            if (err){
                return reject(err);
            }
            let answer = parseForRRS(results);
            return resolve(answer);

        });
    });

};



module.exports = GOTdb;
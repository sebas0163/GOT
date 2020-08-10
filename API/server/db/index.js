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
//______/ init <name>

GOTdb.init = (name) => {

    return new Promise((resolve, reject)=> {

        pool.query(`EXEC init @${user} @${name};`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

//       _________________
//______/ commit <msg>

GOTdb.commitFile = (filename,data,dic,msg) => {

    return new Promise((resolve, reject)=> {

        pool.query(`exec commit @${user} @${filename} @${data} @${dic} @${msg};`, (err,results)=>{

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

        pool.query(`exec userStatus @${user};`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

//       _________________
//______/ status <file>

GOTdb.fileStatus = (filename) => {

    return new Promise((resolve, reject)=> {

        pool.query(`exec fileStatus @${user} @${filename};`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

//       _________________
//______/  rollback <filename> <commit>

GOTdb.rollback = (filename, commit) => { 

    return new Promise((resolve, reject)=> {

        pool.query(`exec rollback @${user} @${filename} @${commit};`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

//       __________________________
//______/ rest <file> & sync <file>

GOTdb.newestFile = (filename) => {

    return new Promise((resolve, reject)=> {

        pool.query(`exec syncFile @${user} @${filename};`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};



module.exports = GOTdb;
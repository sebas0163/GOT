const mysql = require('mysql');

const user = 'jose';

const pool = mysql.createPool({
    connectionLimit: 10,
    password: 'jose',
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

GOTdb.init = (name) => {

    return new Promise((resolve, reject)=> {

        pool.query(`exec init @${user} @${name};`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};


GOTdb.commitFile = (filename,data,dic, msg) => {

    return new Promise((resolve, reject)=> {

        pool.query(`exec commit @${user} @${filename} @${data} @${dic} @${msg};`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

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


GOTdb.rollback = (filename, commit) => {  // Creo que se puede reciclar para reset <file>

    return new Promise((resolve, reject)=> {

        pool.query(`exec rollback @${user} @${filename} @${commit};`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

GOTdb.syncFile = (filename) => {

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
const mysql = require('mysql');

const pool = mysql.createPool({
    connectionLimit: 10,
    password: 'jose',
    user: 'jose',
    database: 'pruebita',
    host: 'localhost',
    port: '3306'

});

let josedb = {};

josedb.all = () => {

    return new Promise((resolve, reject)=> {

        pool.query(`SELECT * FROM juegos`, (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

josedb.one = (id) => {

    return new Promise((resolve, reject)=> {

        pool.query(`SELECT * FROM juegos WHERE id = ?`, [id], (err,results)=>{

            if (err){
                return reject(err);
            }

            return resolve(results);

        });
    });

};

module.exports = josedb;
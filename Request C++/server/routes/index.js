const express = require('express');
const db = require('../db');

const router = express.Router();


//TEST
router.get('/', async (req,res,next) =>{

    try{
        let results = await db.all();
        res.status(200).json(results);

    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }

});

//TEST
router.get('/no/:id', async (req,res,next) =>{

    try{
        let results = await db.one(req.params.id);
        res.json(results);

    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }

});



//       _________
//______/ login

router.post('/logmein', async (req,res,next) =>{

    try{
        let results = await db.iniciar();
        res.status(200).json(results);

    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }

});


//       ____________________
//______/ 

router.post('/befriend/:name', async (req,res,next) =>{

    try{
        let results = await db.befriend(req.params.name);
        res.status(200).json(results);

    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }

});


//       ____________________
//______/ Create a new repo

router.post('/init/:name', async (req,res,next) =>{

    try{
        let results = await db.init(req.params.name);
        res.status(200).json(results);
        //res.send(req.params.name)

    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }

});



//       _____________________________
//______/Commit (one file at a time)

router.post('/commit/:filename/:commitId/:data/:dic/:msg', async (req,res,next) =>{

    try{
        let results = await db.commitFile(req.params.filename,req.params.commitId,req.params.data,req.params.dic,req.params.msg);
        res.status(200).json(results);

    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }

});




//       _________________________________
//______/ Status on last commit, all files

router.get('/status', async (req,res,next) =>{

    try{
        let results = await db.userStatus();
        res.status(200).json(results);

    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }

});



//       ________________________________
//______/ Status on one file, all commits

router.get('/status/:filename', async (req,res,next) =>{

    try{
        let results = await db.fileStatus(req.params.filename);
        res.status(200).json(results);

    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }

});



//       _____________________________
//______/ Rollback, brings the file up to a specific commit

router.get('/rollback/:filename/:commit', async (req,res,next) =>{

    try{
        let results = await db.rollback(req.params.filename,req.params.commit);
        res.status(200).json(results);

    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }

});


//       __________________________________________________
//______/ Brings the newest version of a file (rest n sync)

router.get('/newest/:filename', async (req,res,next) =>{

    try{
        let results = await db.newestFile(req.params.filename);
        res.status(200).json(results);

    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }

});



module.exports = router;
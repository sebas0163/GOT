const express = require ('express');
const apiRouter = require('./routes');


const app = express();

app.use(express.json());

app.use('/GOT/api',apiRouter);

app.listen(process.env.PORT || '3000', () =>{

    //console.log(process.argv[2]);
    //console.log(process.argv[3]);
    console.log(`server is running on port: ${process.env.PORT || '3000'}`);

} );
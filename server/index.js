//IMPORT FROM PACKAGES


const express = require('express');
const mongoose = require("mongoose");

//IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth');

//INIT

const app = express();
const PORT = 3000;
const DB = "mongodb+srv://rohitrk9693:Robthebob!@2788@cluster0.olie6zc.mongodb.net/?retryWrites=true&w=majority";
//middleware
//client ->middleware -> server->client

app.use(authRouter);



//creating api
//http://<youripaddress>/hello-world

//get,put post, delete, update



//connections
mongoose.connect(DB).then(() =>{
    console.log('Connection Successful');
}).catch((e) => {
    console.log(e);
});
app.listen(PORT,() =>{
    console.log(`Server is running on port ${PORT}`)

})
//IMPORT FROM PACKAGES


const express = require('express');
const mongoose = require("mongoose");

//IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth');

//INIT

const app = express();
const PORT = 3000;


const password = "Robthebob!@2788";

// Encode special characters in the password
const encodedPassword = encodeURIComponent(password);
const DB = `mongodb+srv://rohitrk9693:${encodedPassword}@cluster0.olie6zc.mongodb.net/myFirstDatabase?retryWrites=true&w=majority`;

//middleware
//client ->middleware -> server->client

app.use(express.json());
app.use(authRouter);



//creating api
//http://<youripaddress>/hello-world

//get,put post, delete, update



//connections
console.log('Before connecting to MongoDB');
 mongoose.connect(DB, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
}).then(() => {
  console.log('MongoDB Connection Successful');
}).catch((e) => {
  console.error('MongoDB Connection Failed:', e.message);
});

  
app.listen(PORT,() =>{
    console.log(`Server is running on port ${PORT}`)

})
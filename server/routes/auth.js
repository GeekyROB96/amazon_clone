const express = require("express");

const User = require("../models/user");

const authRouter = express.Router();

authRouter.post('/api/signup', async (req,res) =>{

    //get data from client

    const {name,email,password} = req.body;

    const existingUser =  await User.findOne({email});
    if(existingUser){
        return res.json({msg : "User with same email already exists!"});
    }
    //post data in database


    //return data to user
});

module.exports = authRouter;
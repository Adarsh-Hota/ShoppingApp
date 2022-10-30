const express = require('express');
const mongoose = require('mongoose');

const authRouter = require('./routes/auth.js');
const CLUSTER_URL = require('./secrets.js');

const PORT = 3000;
const app = express();

//Connecting to the MongoDB cluster
mongoose.connect(CLUSTER_URL)
    .then(() => {
        console.log('Connection successful');
    })
    .catch(() => {
        console.log(e);
    })

//middleware
app.use(express.json());
app.use(authRouter);

//listening to local host at given port
app.listen(PORT, '0.0.0.0', () => {
    console.log(`express application running at ${PORT}`)
});
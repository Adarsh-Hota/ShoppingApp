const express = require('express');
const mongoose = require('mongoose');

const adminRouter = require('./routes/admin.js');
const authRouter = require('./routes/auth.js');
const { CLUSTER_URL } = require('./secrets.js');

const PORT = 3000;
const app = express();

//Connecting to the MongoDB cluster
mongoose.connect(CLUSTER_URL)
    .then(() => {
        console.log('Connection successful');
    })
    .catch((e) => {
        console.log(e);
    })

//middlewares
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//listening to local host at given port
app.listen(PORT, '0.0.0.0', () => {
    console.log(`express application running at ${PORT}`)
});
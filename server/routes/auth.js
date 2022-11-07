const express = require('express');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');

const User = require('../models/userSchema');
const { PRIVATE_KEY } = require('../secrets');
const checkTokenValid = require('../middlewares/checkTokenValid');


const authRouter = express.Router();

//api for signing up
authRouter
    .post('/auth/signUp', async (req, res) => {
        try {
            const { name, email, password } = req.body;

            const existingUser = await User.findOne({ email });
            if (existingUser) {
                return res
                    .status(400)
                    .json({ msg: 'User with same email already exists' });
            }

            const hashedPassword = await bcryptjs.hash(password, 9);
            let user = new User({
                name: name,
                email: email,
                password: hashedPassword,
            });

            user = await user.save();
            return res
                .status(200)
                .json({ user: user });

        } catch (error) {
            return res
                .status(500)
                .json({ error: error.message })
        }

    })

//api for signing in
authRouter
    .post('/auth/signIn', async (req, res) => {
        try {
            const { email, password } = req.body;

            const user = await User.findOne({ email: email });
            if (!user) {
                return res
                    .status(400)
                    .json({ msg: 'Entered email doesn\'t exist' });
            }

            const isMatch = await bcryptjs.compare(password, user.password);
            if (!isMatch) {
                return res
                    .status(400)
                    .json({ msg: 'Incorrect password' });
            }

            const token = jwt.sign({ id: user._id }, PRIVATE_KEY);
            return res
                .status(200)
                .json({ token: token, ...user._doc });

        } catch (error) {
            return res
                .status(500)
                .json({ error: error.message })
        }

    })

//api for getting user details 
authRouter.get('/', checkTokenValid, async (req, res) => {
    try {
        const user = await User.findById(req.userId);
        return res
            .status(200)
            .json({
                ...user._doc,
                token: req.token,
            })
    } catch (error) {
        return res
            .status(500)
            .json({ error: error.message })
    }
})

module.exports = authRouter;

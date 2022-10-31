const express = require('express');
const authRouter = express.Router();
const bcryptjs = require('bcryptjs');

const User = require('../models/user');


authRouter
    .post('/auth/signup', async (req, res) => {
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

module.exports = authRouter;

const jwt = require('jsonwebtoken');

const UserModel = require('../models/userSchema');
const { PRIVATE_KEY } = require('../secrets');


const checkIsAdmin = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) {
            return res
                .status(401)
                .json({
                    msg: 'No auth token, access denied'
                });
        }

        const decodedToken = jwt.verify(token, PRIVATE_KEY);
        if (!decodedToken) {
            return res
                .status(401)
                .json({
                    msg: 'Token verification failed, authorization denied'
                });
        }

        const user = await UserModel.findById(decodedToken.id);
        if (user.type != 'admin') {
            return res
                .status(401)
                .json({ msg: 'Non-Admins not allowed'})
        }

        req.userId = decodedToken.id;
        req.token = token;
        next();
    } catch (error) {
        return res
            .status(500)
            .json({ error: error.message })
    }
}

module.exports = checkIsAdmin;
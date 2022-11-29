const express = require('express');

const checkTokenValid = require('../middlewares/checkTokenValid');
const ProductModel = require('../models/productSchema');

const userRouter = express.Router();

//API for getting products of a specific category
userRouter.get('/user/getCategoryProducts', checkTokenValid, async (req, res) => {
    try {
        const category = req.query.category;
        const products = await ProductModel.find({
            category: category
        });

        res
            .status(200)
            .json({
                products: products,
            })

    } catch (error) {
        return res
            .status(500)
            .json({ error: error.message })

    }
})

module.exports = userRouter;
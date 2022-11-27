const express = require('express');

const checkIsAdmin = require('../middlewares/adminMiddleware');
const ProductModel = require('../models/productSchema');
const UserModel = require('../models/userSchema');

const adminRouter = express.Router();

//api for selling product
adminRouter.post('/admin/sellProduct', checkIsAdmin, async (req, res) => {
    try {
        const {
            name: name,
            description: description,
            images: imagesUrlList,
            quantity: quantity,
            price: price,
            category: category
        } = req.body;
        let product = new ProductModel({
            name: name,
            description: description,
            images: imagesUrlList,
            quantity: quantity,
            price: price,
            category: category,
        })
        product = await product.save();
        res
            .status(200)
            .json({ product: product })
    } catch (error) {
        return res
            .status(500)
            .json({ error: error.message })
    }
})

//API for getting products
adminRouter.get('/admin/getProducts', checkIsAdmin, async (req, res) => {
    try {
        const products = await ProductModel.find({});
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

module.exports = adminRouter;
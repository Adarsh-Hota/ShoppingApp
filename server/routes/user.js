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

//API for getting products based on the search query
userRouter.get('/user/getSearchProducts/search/:searchQuery', checkTokenValid, async (req, res) => {
    try {
        const searchQuery = req.params.searchQuery;
        const products = await ProductModel.find({
            name: { $regex: searchQuery, $options: "i" }
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

//API for rating the product by the user
userRouter.post('/user/addRating', checkTokenValid, async (req, res) => {
    try {
        const { productId: productId, rating: rating } = req.body;
        let product = await ProductModel.findById(productId);

        //remove the old user rating, if it exists
        let ratingArray = product.rating;
        for (let i = 0; i < ratingArray.length; i++) {
            if (ratingArray[i]['userId'] == req.userId) {
                ratingArray.splice(i, 1);
                break;
            }
        }

        //add the new user rating
        newUserRating = {
            'userId': req.userId,
            'rating': rating,
        }
        ratingArray.push(newUserRating);
        product.rating = ratingArray;
        product = await product.save();

        //send the response
        res
            .status(200)
            .json({
                'product': product,
            })

    } catch (error) {
        return res
            .status(500)
            .json({ error: error.message })

    }
})

//API for getting the deal of the day product
userRouter.get('/user/dealOfTheDay', checkTokenValid, async (req, res) => {
    try {
        let productsList = await ProductModel.find({});

        let sortedProductsList = productsList.sort((productOne, productTwo) => {
            let productOneSum = 0;
            let productOneAvg = 0;
            for (let i = 0; i < productOne.rating.length; i++) {
                productOneSum += productOne.rating[i].rating;
            }
            if (productOne.rating.length == 0) {
                productOneAvg = 0;
            } else {
                productOneAvg = productOneSum / productOne.rating.length;
            }

            let productTwoSum = 0;
            let productTwoAvg = 0;
            for (let i = 0; i < productTwo.rating.length; i++) {
                productTwoSum += productTwo.rating[i].rating;
            }
            if (productTwo.rating.length == 0) {
                productTwoAvg = 0;
            } else {
                productTwoAvg = productTwoSum / productTwo.rating.length;
            }

            return productOneAvg < productTwoAvg ? 1 : -1;
        })

        return res
            .status(200)
            .json({
                'product': sortedProductsList[0]
            })
    } catch (error) {
        return res
            .status(500)
            .json({ error: error.message })

    }
})

module.exports = userRouter;
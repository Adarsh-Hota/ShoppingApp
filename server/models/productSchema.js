const mongoose = require("mongoose");
const ratingSchema = require("./ratingSchema");

const productSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    description: {
        required: true,
        type: String,
        trim: true,
    },
    images: [
        {
            type: String,
            required: true,
        }
    ],
    quantity: {
        type: Number,
        required: true,
    },
    price: {
        type: Number,
        required: true,
    },
    category: {
        required: true,
        type: String,
        trim: true,
    },
    rating: [
        {
            type: ratingSchema,
        }
    ],
});

const ProductModel = mongoose.model("products", productSchema);
module.exports = ProductModel;

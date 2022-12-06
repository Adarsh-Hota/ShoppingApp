const mongoose = require("mongoose");

const ratingSchema = mongoose.Schema({
    userId: {
        required: true,
        type: String,
        trim: true,
    },
    rating: {
        required: true,
        type: Number,
        trim: true,
    },
});

module.exports = ratingSchema;

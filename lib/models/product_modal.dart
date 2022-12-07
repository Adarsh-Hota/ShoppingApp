import 'dart:convert';

import 'package:your_shop_app/models/rating_modal.dart';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<dynamic> images;
  final String category;
  final double price;
  String? id;
  final List<RatingModal>? ratingsList;

  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    this.ratingsList,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'rating': ratingsList,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['_id'] ?? '',
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        quantity: map['quantity'].toDouble() ?? 0.0,
        images: map['images'] ?? [],
        category: map['category'] ?? '',
        price: map['price'].toDouble() ?? 0.0,
        ratingsList: map['rating'] != null
            ? List<RatingModal>.from(
                map['rating'].map(
                  (ratingMapObject) => RatingModal.fromMap(ratingMapObject),
                ),
              )
            : []);
  }

  String toJson() {
    return json.encode(
      toMap(),
    );
  }

  factory Product.fromJson(String map) {
    return Product.fromMap(
      json.decode(map),
    );
  }
}

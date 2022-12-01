import 'package:flutter/material.dart';
import 'package:your_shop_app/features/search/widgets/stars_section.dart';
import 'package:your_shop_app/models/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;

  const SearchedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: [
          Image.network(
            product.images[0],
            height: 135,
            width: 135,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    product.name,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  child: StarsSection(
                    rating: 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  child: Text(
                    '\$ ${product.price}',
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  child: Text(
                    'Eligible for FREE shipping',
                    maxLines: 2,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  child: Text(
                    'In Stock',
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:your_shop_app/features/product_details/screens/product_details_screen.dart';
import 'package:your_shop_app/features/search/widgets/stars_section.dart';
import 'package:your_shop_app/models/product_modal.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;

  const SearchedProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  void navigateToProductDetailsScreen(
    BuildContext context,
    Product currentProduct,
  ) {
    Navigator.pushNamed(
      context,
      ProductDetailsScreen.routeName,
      arguments: {
        'product': currentProduct,
      },
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    double avgProductRating = 0;
    double totalRating = 0;
    for (int i = 0; i < product.ratingsList!.length; i++) {
      totalRating = totalRating + product.ratingsList![i].rating;
    }
    if (totalRating == 0) {
      avgProductRating = 0;
    } else {
      avgProductRating = totalRating / product.ratingsList!.length;
    }
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  child: StarsSection(
                    rating: avgProductRating,
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
                GestureDetector(
                  onTap: () => navigateToProductDetailsScreen(
                    context,
                    product,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                      top: 5,
                      right: 8,
                      bottom: 0,
                    ),
                    child: Text(
                      'Go to details',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:your_shop_app/common/widgets/custom_button.dart';
import 'package:your_shop_app/constants/global_variables.dart';
import 'package:your_shop_app/features/product_details/services/rating_service.dart';
import 'package:your_shop_app/features/search/screens/search_screen.dart';
import 'package:your_shop_app/models/product_modal.dart';
import 'package:your_shop_app/providers/user_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = 'product-details';
  final Product product;

  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final RatingServices ratingServices = RatingServices();

  double avgProductRating = 0;
  double userRating = 0;

  @override
  void initState() {
    super.initState();

    final user = Provider.of<UserProvider>(context, listen: false).getUser;
    double totalRating = 0;
    for (int i = 0; i < widget.product.ratingsList!.length; i++) {
      totalRating = totalRating + widget.product.ratingsList![i].rating;
      print(user.id);
      print(widget.product.ratingsList![i].userId);
      if (widget.product.ratingsList![i].userId == user.id) {
        userRating = widget.product.ratingsList![i].rating;
      }
    }
    if (totalRating == 0) {
      avgProductRating = 0;
    } else {
      avgProductRating = totalRating / widget.product.ratingsList!.length;
    }
  }

  void navigateToSearchScreen(BuildContext context, String searchQuery) {
    Navigator.pushNamed(
      context,
      SearchScreen.routeName,
      arguments: {
        'searchQuery': searchQuery,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: (searchQuery) =>
                          navigateToSearchScreen(context, searchQuery),
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1),
                        ),
                        hintText: 'Search Amazon.in',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 42,
                color: Colors.transparent,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: RatingBarIndicator(
                  direction: Axis.horizontal,
                  itemCount: 5,
                  rating: avgProductRating,
                  itemSize: 15,
                  itemBuilder: (context, _) {
                    return const Icon(
                      Icons.star,
                      color: GlobalVariables.secondaryColor,
                    );
                  },
                ),
              ),
              CarouselSlider(
                items: widget.product.images
                    .map(
                      (imageLink) => Image.network(
                        imageLink,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 2 / 5,
                        fit: BoxFit.cover,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height * 2 / 5,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: Colors.black12,
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    const Flexible(
                      flex: 3,
                      child: Text(
                        'Deal Price : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        '\$${widget.product.price}',
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 4,
                      child: RatingBar.builder(
                        initialRating: userRating,
                        minRating: 1,
                        itemSize: 30,
                        allowHalfRating: true,
                        itemBuilder: (context, _) {
                          return const Icon(
                            Icons.star,
                            color: GlobalVariables.secondaryColor,
                          );
                        },
                        onRatingUpdate: (double rating) {
                          ratingServices.addRating(
                            context: context,
                            product: widget.product,
                            rating: rating,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(widget.product.description),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomButton(
                  text: 'Buy Now',
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomButton(
                  text: 'Add to Cart',
                  onTap: () {},
                  buttonColor: const Color.fromRGBO(
                    254,
                    216,
                    19,
                    1,
                  ),
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

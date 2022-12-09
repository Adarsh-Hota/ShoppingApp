import 'package:flutter/material.dart';
import 'package:your_shop_app/features/home/services/home_services.dart';
import 'package:your_shop_app/features/product_details/screens/product_details_screen.dart';
import 'package:your_shop_app/models/product_modal.dart';

class DealOfTheDayBox extends StatefulWidget {
  const DealOfTheDayBox({Key? key}) : super(key: key);

  @override
  State<DealOfTheDayBox> createState() => _DealOfTheDayBoxState();
}

class _DealOfTheDayBoxState extends State<DealOfTheDayBox> {
  final HomeServices homeServices = HomeServices();
  Product? product;

  @override
  void initState() {
    super.initState();
    getDealOfTheDayInfo();
  }

  Future<void> getDealOfTheDayInfo() async {
    product = await homeServices.getDealOfTheDay(context: context);
    setState(() {});
  }

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
    return product == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : product!.name.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 15,
                    ),
                    child: const Text(
                      'Deal of the day',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                    width: MediaQuery.of(context).size.width * 7 / 8,
                  ),
                  GestureDetector(
                    onTap: () => navigateToProductDetailsScreen(
                      context,
                      product!,
                    ),
                    child: Image.network(
                      product!.images[0],
                      height: 235,
                      width: MediaQuery.of(context).size.width * 7 / 8,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 5,
                    ),
                    child: Text(
                      '\$ ${product!.price}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 5,
                    ),
                    child: Text(
                      product!.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: SizedBox(
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product!.images.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () => navigateToProductDetailsScreen(
                              context,
                              product!,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 3,
                              ),
                              child: Image.network(
                                product!.images[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(8),
                    child: Text(
                      'See all deals',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.cyan[800],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              );
  }
}

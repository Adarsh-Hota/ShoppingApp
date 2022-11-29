import 'package:flutter/material.dart';
import 'package:your_shop_app/common/widgets/single_product.dart';
import 'package:your_shop_app/constants/global_variables.dart';
import 'package:your_shop_app/features/home/services/home_services.dart';
import 'package:your_shop_app/models/product.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category_deals_screen';
  final String category;

  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? categoryProductsList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    getCategoryProducts();
  }

  Future<void> getCategoryProducts() async {
    categoryProductsList = await homeServices.getCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.category,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: categoryProductsList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Keep shopping for ${widget.category}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: categoryProductsList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      Product productItem = categoryProductsList![index];
                      return SizedBox(
                        height: 400,
                        width: 250,
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleProduct(
                                src: productItem.images[0],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                top: 0,
                                right: 8,
                                bottom: 0,
                              ),
                              child: Text(
                                productItem.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

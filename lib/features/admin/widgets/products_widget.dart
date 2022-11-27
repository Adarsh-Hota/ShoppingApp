import 'package:flutter/material.dart';
import 'package:your_shop_app/common/widgets/single_product.dart';
import 'package:your_shop_app/features/admin/services/admin_services.dart';
import 'package:your_shop_app/models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final AdminServices adminServices = AdminServices();
  List<Product>? productsList;

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    productsList = await adminServices.getProducts(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return productsList == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 10,
              right: 8,
            ),
            child: GridView.builder(
              itemCount: productsList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                Product productItem = productsList![index];
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
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                productItem.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}

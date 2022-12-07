import 'package:flutter/material.dart';

import 'package:your_shop_app/constants/global_variables.dart';
import 'package:your_shop_app/features/home/widgets/address_box.dart';
import 'package:your_shop_app/features/search/services/search_services.dart';
import 'package:your_shop_app/features/search/widgets/searched_products.dart';
import 'package:your_shop_app/models/product_modal.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/searchScreen';
  final String searchQuery;

  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? searchProductsList;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    getSearchProducts();
  }

  Future<void> getSearchProducts() async {
    searchProductsList = await searchServices.getSearchProducts(
      context: context,
      searchQuery: widget.searchQuery,
    );
    setState(() {});
  }

  Future<void> searchProducts(String productName) async {
    searchProductsList = await searchServices.getSearchProducts(
      context: context,
      searchQuery: productName,
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
                      onFieldSubmitted: (productName) =>
                          searchProducts(productName),
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
      body: searchProductsList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const AddressBox(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: searchProductsList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product productItem = searchProductsList![index];
                      return SearchedProduct(
                        product: productItem,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

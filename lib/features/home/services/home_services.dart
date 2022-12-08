import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:your_shop_app/constants/response_handling.dart';
import 'package:your_shop_app/constants/secrets.dart';
import 'package:your_shop_app/constants/utils.dart';
import 'package:your_shop_app/models/product_modal.dart';
import 'package:your_shop_app/providers/user_provider.dart';

class HomeServices {
  Future<List<Product>> getCategoryProducts({
    required BuildContext context,
    required String category,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> products = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$myIpUrl/user/getCategoryProducts?category=$category'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.getUser.token,
        },
      );

      responseHandler(
        response: res,
        context: context,
        onSuccess: () {
          List<dynamic> productsList = jsonDecode(res.body)['products'];
          for (var i = 0; i < productsList.length; i++) {
            products.add(
              Product.fromJson(
                jsonEncode(productsList[i]),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(
        context: context,
        text: e.toString(),
      );
    }

    return products;
  }

  Future<Product> getDealOfTheDay({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Product product = Product(
      name: '',
      description: '',
      quantity: 0.0,
      images: [],
      category: '',
      price: 0.0,
    );
    try {
      http.Response res = await http.get(
        Uri.parse('$myIpUrl/user/dealOfTheDay'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.getUser.token,
        },
      );
      product = jsonDecode(res.body)['product'];

      responseHandler(
        response: res,
        context: context,
        onSuccess: () {},
      );

      return product;
    } catch (e) {
      showSnackBar(
        context: context,
        text: e.toString(),
      );
    }
    return product;
  }
}

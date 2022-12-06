import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:your_shop_app/constants/response_handling.dart';
import 'package:your_shop_app/constants/secrets.dart';
import 'package:your_shop_app/constants/utils.dart';
import 'package:your_shop_app/models/product.dart';
import 'package:your_shop_app/providers/user_provider.dart';

class RatingServices {
  Future<void> addRating({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    try {
      http.Response res = await http.post(
        Uri.parse('$myIpUrl/user/addRating'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.getUser.token,
        },
        body: jsonEncode(
          {
            'productId': product.id,
            'rating': rating,
          },
        ),
      );

      responseHandler(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackBar(
        context: context,
        text: e.toString(),
      );
    }

    return;
  }
}

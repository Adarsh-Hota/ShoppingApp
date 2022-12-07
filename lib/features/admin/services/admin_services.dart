import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:your_shop_app/constants/response_handling.dart';

import 'package:your_shop_app/constants/secrets.dart';
import 'package:your_shop_app/constants/utils.dart';
import 'package:your_shop_app/models/product_modal.dart';
import 'package:your_shop_app/providers/user_provider.dart';

class AdminServices {
  Future<void> sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic(
        cloudinaryAccountCloudName,
        cloudinaryAccountUploadPresetName,
      );
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            resourceType: CloudinaryResourceType.Image,
            folder: name,
          ),
        );
        imageUrls.add(response.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );

      http.Response res = await http.post(
        Uri.parse('$myIpUrl/admin/sellProduct'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.getUser.token,
        },
        body: product.toJson(),
      );

      responseHandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context: context,
            text: 'Product added successfully',
          );
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(
        context: context,
        text: e.toString(),
      );
    }
  }

  Future<List<Product>> getProducts(
    BuildContext context,
  ) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> products = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$myIpUrl/admin/getProducts'),
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
}

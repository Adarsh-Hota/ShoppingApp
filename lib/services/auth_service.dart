import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:your_shop_app/constants/response_handling.dart';
import 'package:your_shop_app/constants/secrets.dart';
import 'package:your_shop_app/constants/utils.dart';

import 'package:your_shop_app/models/user.dart';

class AuthService {
  Future<void> userSignUp(
    BuildContext context,
    String name,
    String email,
    String password, {
    String id = '',
    String address = '',
    String type = '',
    String token = '',
  }) async {
    try {
      User user = User(
        id: id,
        name: name,
        email: email,
        password: password,
        address: address,
        type: type,
        token: token,
      );

      Uri signUpUri = Uri.parse(myIpUrl);
      http.Response res = await http.post(
        Uri.parse('$signUpUri/auth/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: user.toJson(),
      );

      responseHandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context: context,
            text: 'Account created successfully!',
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context: context,
        text: e.toString(),
      );
    }
  }
}

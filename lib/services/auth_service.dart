import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:your_shop_app/constants/response_handling.dart';
import 'package:your_shop_app/constants/secrets.dart';
import 'package:your_shop_app/constants/utils.dart';
import 'package:your_shop_app/features/home/screens/home_screen.dart';
import 'package:your_shop_app/models/user.dart';
import 'package:your_shop_app/providers/user_provider.dart';

class AuthService {
  Future<void> userSignUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
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

      Uri signUpUri = Uri.parse('$myIpUrl/auth/signUp');
      http.Response res = await http.post(
        signUpUri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: user.toJson(),
      );

      responseHandler(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(
            context: context,
            text: 'Account created successfully!',
          );

          await userSignIn(
            context: context,
            email: email,
            password: password,
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

  Future<void> userSignIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      Uri signInUri = Uri.parse('$myIpUrl/auth/signIn');
      http.Response res = await http.post(
        signInUri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      responseHandler(
        response: res,
        context: context,
        onSuccess: () async {
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(
            'x-auth-token',
            jsonDecode(res.body)['token'],
          );
          showSnackBar(
            context: context,
            text: 'Sign in successful',
          );
          await Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
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

  Future<void> getUserDetails({
    required BuildContext context,
  }) async {
    try {
      //Check if token already exists or not
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        return;
      }

      //If token exists, check its validity and get response
      Uri userDetailsUri = Uri.parse(myIpUrl);
      http.Response userResponse = await http.get(
        userDetailsUri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
      );

      //If response is right then set user provider value
      if (userResponse.statusCode == 200) {
        Provider.of<UserProvider>(context, listen: false)
            .setUser(userResponse.body);
      }

      //At the end, if token exists, userProvider user value would be set and not, if it doesn't
      return;
    } catch (e) {
      showSnackBar(
        context: context,
        text: e.toString(),
      );
    }
  }
}

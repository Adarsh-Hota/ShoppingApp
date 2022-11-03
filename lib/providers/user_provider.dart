import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    email: '',
    id: '',
    name: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );

  User get getUser {
    return _user;
  }

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}

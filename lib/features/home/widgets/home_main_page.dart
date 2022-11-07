import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_shop_app/providers/user_provider.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getUser;
    return Center(
      child: Text(user.toJson()),
    );
  }
}

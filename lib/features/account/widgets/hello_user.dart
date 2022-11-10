import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_shop_app/constants/global_variables.dart';
import 'package:your_shop_app/providers/user_provider.dart';

class HelloUser extends StatelessWidget {
  const HelloUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String userName = Provider.of<UserProvider>(context).getUser.name;

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 8,
          bottom: 8,
        ),
        child: Row(
          children: [
            Text(
              'Hello, ',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              userName,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

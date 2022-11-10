import 'package:flutter/material.dart';
import 'package:your_shop_app/constants/global_variables.dart';

class AccountAppBAr extends StatelessWidget {
  const AccountAppBAr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: GlobalVariables.appBarGradient,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/amazon_in.png',
              width: 120,
              height: 45,
              color: Colors.black,
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.notifications_outlined),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
            ],
          )
        ],
      ),
    );
  }
}

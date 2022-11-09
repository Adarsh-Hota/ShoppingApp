import 'package:flutter/material.dart';
import 'package:your_shop_app/constants/global_variables.dart';
import 'package:your_shop_app/features/account/widgets/account_category_buttons.dart';
import 'package:your_shop_app/features/account/widgets/hello_user.dart';
import 'package:your_shop_app/features/account/widgets/user_orders_section.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HelloUser(),
        const SizedBox(
          height: 15,
        ),
        const AccountCategoryButtons(),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 18,
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: SizedBox(
            height: 320,
            child: UserOrders(),
          ),
        ),
      ],
    );
  }
}

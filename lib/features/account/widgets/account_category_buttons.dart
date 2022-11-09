import 'package:flutter/material.dart';
import 'package:your_shop_app/features/account/widgets/category_button.dart';

class AccountCategoryButtons extends StatefulWidget {
  const AccountCategoryButtons({Key? key}) : super(key: key);

  @override
  State<AccountCategoryButtons> createState() => _AccountCategoryButtonsState();
}

class _AccountCategoryButtonsState extends State<AccountCategoryButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CategoryButton(text: 'Your Orders', onTap: () {}),
              const SizedBox(
                width: 10,
              ),
              CategoryButton(text: 'Turn Seller', onTap: () {}),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              CategoryButton(text: 'Log Out', onTap: () {}),
              const SizedBox(
                width: 10,
              ),
              CategoryButton(text: 'Your Wish List', onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

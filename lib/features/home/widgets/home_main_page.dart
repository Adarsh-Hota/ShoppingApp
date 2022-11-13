import 'package:flutter/material.dart';
import 'package:your_shop_app/features/home/widgets/address_box.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AddressBox(),
      ],
    );
  }
}

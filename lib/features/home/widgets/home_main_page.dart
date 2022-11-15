import 'package:flutter/material.dart';
import 'package:your_shop_app/features/home/widgets/address_box.dart';
import 'package:your_shop_app/features/home/widgets/carousel_image_box.dart';
import 'package:your_shop_app/features/home/widgets/top_categories_box.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AddressBox(),
        SizedBox(
          height: 10,
        ),
        TopCategoriesBox(),
        SizedBox(
          height: 10,
        ),
        CarouselImageBox(),
      ],
    );
  }
}

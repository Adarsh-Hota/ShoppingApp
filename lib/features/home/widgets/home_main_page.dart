import 'package:flutter/material.dart';
import 'package:your_shop_app/features/home/widgets/address_box.dart';
import 'package:your_shop_app/features/home/widgets/carousel_image_box.dart';
import 'package:your_shop_app/features/home/widgets/deal_of_the_day_box.dart';
import 'package:your_shop_app/features/home/widgets/top_categories_box.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AddressBox(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: TopCategoriesBox()),
              SliverToBoxAdapter(child: CarouselImageBox()),
              SliverToBoxAdapter(child: DealOfTheDayBox()),
            ],
          ),
        ),
      ],
    );
  }
}

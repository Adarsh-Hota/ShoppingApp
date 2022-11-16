import 'package:flutter/material.dart';
import 'package:your_shop_app/features/home/widgets/address_box.dart';
import 'package:your_shop_app/features/home/widgets/carousel_image_box.dart';
import 'package:your_shop_app/features/home/widgets/deal_of_the_day_box.dart';
import 'package:your_shop_app/features/home/widgets/images_box.dart';
import 'package:your_shop_app/features/home/widgets/top_categories_box.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddressBox(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: TopCategoriesBox()),
              const SliverToBoxAdapter(child: CarouselImageBox()),
              const SliverToBoxAdapter(child: DealOfTheDayBox()),
              const SliverToBoxAdapter(child: ImagesBox()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'See all deals',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.cyan[800],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
